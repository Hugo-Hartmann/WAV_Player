import numpy as np
import matplotlib.pyplot as plt

N = 2048

def gen_coef(N):

    coef = []
    for i in range(int(N/2)):
        coef.append(np.exp(-1j*2*np.pi*i/N))

    for i in range(len(coef)):
        real, imag = np.real(coef[i]), np.imag(coef[i])
        real, imag = int(real*32768), int(imag*32768)
        if(real==32768):
            real = 32767
        if(imag==32768):
            imag = 32767
        coef[i] = [real, imag]

    return coef

def arrange_addr(i, n):
    i_copy = i
    addr = 0
    inc = 2**(n-1)
    for k in range(n):
        if(i_copy%2**(k+1)>0):
            addr += inc
            i_copy = i_copy - i_copy%2**(k+1)
        inc = inc/2

    return int(addr)

def my_sat(A):
    if(A>32767):
        return 32767
    elif(A<-32768):
        return -32768
    else:
        return A

def my_round(A):
    return int(A/32768)

def c_add(A, B):
    A_2, B_2 = [0, 0], [0, 0]
    A_2[0], A_2[1] = int(A[0]/2), int(A[1]/2)
    B_2[0], B_2[1] = int(B[0]/2), int(B[1]/2)

    return [A_2[0]+B_2[0], A_2[1]+B_2[1]]

def c_sub(A, B):
    A_2, B_2 = [0, 0], [0, 0]
    A_2[0], A_2[1] = int(A[0]/2), int(A[1]/2)
    B_2[0], B_2[1] = int(B[0]/2), int(B[1]/2)

    return [A_2[0]-B_2[0], A_2[1]-B_2[1]]


def c_mult(A, B):
    p_real_real = A[0]*B[0]
    p_imag_imag = A[1]*B[1]
    p_real_imag = A[0]*B[1]
    p_imag_real = A[1]*B[0]

    s_real = p_real_real - p_imag_imag
    s_imag = p_real_imag + p_imag_real

    return [my_sat(my_round(s_real)), my_sat(my_round(s_imag))]

def fft_ual(A, B, coef):
    return c_add(A, B), c_mult(c_sub(A, B), coef)

def my_fft(vec):

    N = len(vec)
    n = int(np.log2(N))-1
    res = []

    coefs = gen_coef(N)

    for i in range(N):
        res.append([vec[i], 0])

    inc_addrA = (2**(n+1))+1
    inc_addrB = 2**(n+1)
    inc_addrC = 0.5

    for i in range(n, -1, -1):
        inc_addrA = int((inc_addrA-1)/2+1)
        inc_addrB = int(inc_addrB/2)
        inc_addrC = int(inc_addrC*2)

        addrA = 0
        addrB = inc_addrB
        addrC = 0

        while(addrB<N):
            #print("addr", addrA, addrB, addrC)
            #print("data", res[addrA], res[addrB], coefs[addrC])
            res[addrA], res[addrB] = fft_ual(res[addrA], res[addrB], coefs[addrC])
            #print(res[addrA], res[addrB])

            if(i==0 or (addrA)%(2**i)==(2**i)-1):
                addrA   = addrA + inc_addrA
                addrC   = 0
            else:
                addrA   = addrA + 1
                addrC   = addrC + inc_addrC

            addrB   = addrA + inc_addrB

    res_arranged = [0 for i in range(N)]

    for i in range(N):
        res_arranged[arrange_addr(i, n+1)] = res[i][0]+1j*res[i][1]

    return res_arranged

fig, axs = plt.subplots(2)

for k in range(40):
    N = 2048
    vec = []
    for i in range(N):
        vec.append(32768*np.cos(k*2*np.pi*i/44100))

    for i in range(N):
        vec[i] = int(vec[i])
        if(vec[i]==32768):
            vec[i] = 32767

    #vec = [1000, -32000, 30000, 8915, 1000, 600, -8000, 500]

    vec = np.array(vec)
    fft_out = np.absolute(np.fft.fft(vec/N))
    my_fft_out = np.absolute(my_fft(vec))

    print(k, fft_out[0], fft_out[1])
    axs[0].plot(np.arange(N), fft_out)
    axs[1].plot(np.arange(N), np.array(my_fft_out))

plt.show()


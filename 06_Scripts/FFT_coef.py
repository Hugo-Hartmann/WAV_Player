import numpy as np

N = 2048

fichier = "FFT_" + str(N) + ".coe"

coef = []
for i in range(int(N/2)):
    coef.append(np.exp(-1j*2*np.pi*i/N))

for i in range(len(coef)):
    real, imag = np.real(coef[i]), np.imag(coef[i])
    real, imag = int(real*32768), int(imag*32768)
    if(i<2 or i>1021):
        print(i, real, imag)
    if(real==32768):
        real = 32767
    if(imag==32768):
        imag = 32767
    if(real<0):
        real = 65536 + real
    if(imag<0):
        imag = 65536 + imag
    data = int(real*65536+imag)
    coef[i] = data

f=open(fichier, 'w')

f.write("memory_initialization_radix=10;\nmemory_initialization_vector=\n")

for i in range(len(coef)):
    if(i<len(coef)-1):
        f.write(str(int(coef[i])) + ",\n")
    else:
        f.write(str(int(coef[i])) + ";")

f.close()
import numpy as np

vec = []
for i in range(2048):
    vec.append(32768*np.cos(1000*2*np.pi*i/44100))

vec[-1] = 32767

for i in range(2048):
    vec[i] = int(vec[i])
    if(vec[i]==32768):
        vec[i] = 32767

vec = np.array(vec)
fft_out = np.absolute(np.fft.fft(vec/2048))

for i in range(80):
    print(fft_out[i])

f=open("FFT_test.coe", 'w')

f.write("memory_initialization_radix=10;\nmemory_initialization_vector=\n")

for i in range(len(vec)):
    if(i<len(vec)-1):
        f.write(str(int(vec[i])) + ",\n")
    else:
        f.write(str(int(vec[i])) + ";")

f.close()
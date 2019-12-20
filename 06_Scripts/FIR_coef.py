import numpy as np
import scipy.signal as fir

FMIN = 20
FMAX = 60

fichier = "FIR_" + str(FMIN) + "_" + str(FMAX) + ".coe"

filtre = np.array(fir.firwin(2047, [FMIN/22050, FMAX/22050], pass_zero=False))
cmax = max(filtre)
cmin = abs(min(filtre))
if(cmin>cmax):
    cmax = cmin
coef = 1

while(cmax < 16383):
    coef = coef*2
    cmax = cmax*2

index = np.log2(coef)
print(index+15, index)

for i in range(len(filtre)):
    filtre[i] = int(round(filtre[i]*coef, 0))

f=open(fichier, 'w')

f.write("memory_initialization_radix=10;\nmemory_initialization_vector=\n")

print(max(filtre))

for i in range(1024):
    if(i<1023):
        f.write(str(int(filtre[i])) + ",\n")
    else:
        f.write(str(int(filtre[i])) + ";")

f.close()
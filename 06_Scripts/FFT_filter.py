import numpy as np
import scipy.signal as fir

FBAND = [int(22050/i) for i in range(1, 17)]
FBAND[0] = 22049
N = 512

fichier = "FFT_Filter_coef.coe"
lines = ["memory_initialization_radix=10;\n", "memory_initialization_vector=\n"]


for F in FBAND:
    filtre = np.array(fir.firwin(N-1, F/22050, pass_zero=True))
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

    print(max(filtre))

    for i in range(int(N/2)):
        lines.append(str(int(filtre[i])) + ",\n")

lines[-1] = lines[-1][:-2] + ";"

f=open(fichier, 'w')

f.writelines(lines)

f.close()
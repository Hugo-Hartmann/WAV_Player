import numpy as np


fichier = "EQ_coef.coe"

ratio = np.sqrt(np.sqrt(2))
coefs = []
power = -3
for i in range(7):
    coefs.append(2**power)
    if(i!=6):
        coefs.append(2**power*ratio)
        coefs.append(2**power*ratio**2)
        coefs.append(2**power*ratio**3)
    power += 1

for i in range(len(coefs)):
    coefs[i] = int(round(coefs[i]*32768/8, 0))

f=open(fichier, 'w')

f.write("memory_initialization_radix=10;\nmemory_initialization_vector=\n")

for i in range(len(coefs)):
    if(i<len(coefs)-1):
        f.write(str(int(coefs[i])) + ",\n")
    else:
        f.write(str(int(coefs[i])) + ";")

f.close()
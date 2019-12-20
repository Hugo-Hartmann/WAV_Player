import numpy as np

f=open("VU_map.txt", 'w')

VU = 65535
i = 31
while(i>0):
    if(i==31):
        f.write("if(accu_map>" + str(int(VU)) + ") then\n\
    VU_level(" + str(i) + ") <= '1';")
    else:
        f.write("\nelsif(accu_map>" + str(int(VU)) + ") then\n\
    VU_level(" + str(i) + ") <= '1';")
    VU = VU/np.sqrt(2)
    i-=1

f.close()
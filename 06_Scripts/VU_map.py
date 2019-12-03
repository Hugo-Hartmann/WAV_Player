import numpy as np

f=open("VU_map.txt", 'w')

VU = 262143
i = 63
while(i>0):
    if(i==63):
        f.write("if(conv_in>" + str(int(VU)) + ") then\n\
    conv_out    <= std_logic_vector(to_unsigned(" + str(i) + ", 6));")
    else:
        f.write("\nelsif(conv_in>" + str(int(VU)) + ") then\n\
    conv_out    <= std_logic_vector(to_unsigned(" + str(i) + ", 6));")
    VU = VU/np.sqrt(np.sqrt(np.sqrt(2)))
    i-=1

f.close()
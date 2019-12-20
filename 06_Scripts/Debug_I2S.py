import serial
import sys
import os.path
import matplotlib.pyplot as plt

## Parameters
COMPORT = 'COM5'


ser = serial.Serial(
    port=COMPORT,
    baudrate=3686400,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    timeout=1,
    bytesize=serial.EIGHTBITS
)

bin = []
i=0
cmd = 0
try:
    while(i<1000*2):
        cmd = ser.read(1)
        if(cmd):
            i = i+1
            bin.append(cmd)

except:
    ser.close()

ser.close()

x = []
y1 = []
y2 = []
for i in range(int(len(bin)/2)-2):
    x.append(i)
    data1 = int.from_bytes(bin[i*2] + bin[i*2+1], byteorder='big', signed=True)
    data2 = int.from_bytes(bin[i*2+1] + bin[i*2+2], byteorder='big', signed=True)
    y1.append(data1)
    y2.append(data2)

plt.plot(x, y1)
plt.plot(x, y2)
plt.show()
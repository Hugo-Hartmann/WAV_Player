import serial
import sys
import os.path
import time

## Parameters
COMPORT = 'COM5'
PACKET_BURST_SIZE = 22050 # 1 second of 8-bit song sampled at 22050 Hz

## Progress bar
def progress_bar(i, N):
    char = "-♫"
    total = int(round(i/N*100, 0))
    line = "\r"
    for j in range(1, 101):
        if(total>=j):
            line += char[j%2]
        else:
            break
            line += " "
    #line += " %i" % total + "%"
    sys.stdout.write(line)
    sys.stdout.flush()

## Check inputs
try:
    fichier = str(sys.argv[1])
except:
    print("\nMissing arguments.")
    sys.exit()

## Parse file
f=open(fichier, 'rb')
b1, b2, b3, b4 = 0, 0, 0, 0
flag = True
while(flag):
    try:
        b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
        if(b1==100 and b2==97 and b3==116 and b4==97):
            flag=False
    except:
        print("Wrong file format (1).")
        sys.exit()

b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
file_size = b4*16777216+b3*65536+b2*256+b1
bin = f.read()
f.close()

## Check file size
#if(len(bin)==file_size):
#    print("Correct file format.")
#else:
#    print("Wrong file format (2).")
#    sys.exit(0)

bin_light = []
for i in range(len(bin)):
    if(i%2==1):
        data = bin[i]
        if(data>127):
            data = data - 128
        else:
            data = data + 128
        bin_light.append(data)

bin=bin_light

## Open the serial
ser = serial.Serial(
    port=COMPORT,
    baudrate=3686400,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    timeout=1,
    bytesize=serial.EIGHTBITS
)

i=0
cmd = 0
while(True):
    cmd = ser.read()
    if(cmd):
        #print("Sending packet.")
        k = (i+PACKET_BURST_SIZE)%len(bin)
        if(k!=i+PACKET_BURST_SIZE):
            print("\nEnd of song ! (Looping...)")
            ser.write(bytearray(bin[i:len(bin)]))
            ser.write(bytearray(bin[0:k]))
            i = k
        else:
            ser.write(bytearray(bin[i:i+PACKET_BURST_SIZE]))
            i = i+PACKET_BURST_SIZE
        progress_bar(i, len(bin))
        #print("Done.")
        cmd = 0
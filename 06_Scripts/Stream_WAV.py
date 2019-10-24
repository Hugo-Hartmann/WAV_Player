import serial
import sys
import os.path

## Parameters
COMPORT = 'COM5'

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
        print("Wrong file format.")

b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
b1, b2, b3, b4 = b2, b3, b4, int(bytearray(f.read(1))[0])
file_size = b4*16777216+b3*65536+b2*256+b1
bin = f.read()
f.close()

## Check file size
if(len(bin)==file_size):
    print("Correct file format.")
else:
    print("Wrong file format.")
    sys.exit(0)

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
        print("Sending packet.")
        k = (i+110250)%file_size
        if(k!=i+110250):
            print("End of song !")
            ser.write(bytearray(bin[i:file_size]))
            ser.write(bytearray(bin[0:k]))
            i = k
        else:
            ser.write(bytearray(bin[i:i+110250]))
            i = i+110250
        print("Done.")
        cmd = 0

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

def gen_bin(forme):
    bin = []
    f = 1102
    period = 22050/f
    A = 20
    for i in range(22050*100):
        if(i%period<period/2):
            bin.append(A+128)
        else:
            bin.append(-1*A+128)
    
    return bin

## Check inputs
try:
    forme = str(sys.argv[1])
except:
    print("\nMissing arguments.")
    sys.exit()

## Open the serial
ser = serial.Serial(
    port=COMPORT,
    baudrate=3686400,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    timeout=1,
    bytesize=serial.EIGHTBITS
)

bin = gen_bin(forme)
file_size   = len(bin)

i=0
cmd = 0
try:
    while(True):
        cmd = ser.read()
        if(cmd):
            #print("Sending packet.")
            k = (i+PACKET_BURST_SIZE)%file_size
            if(k!=i+PACKET_BURST_SIZE):
                print("\nEnd of song ! (Looping...)")
                ser.write(bytearray(bin[i:file_size]))
                ser.write(bytearray(bin[0:k]))
                i = k
            else:
                ser.write(bytearray(bin[i:i+PACKET_BURST_SIZE]))
                i = i+PACKET_BURST_SIZE
            progress_bar(i, file_size)
            #print("Done.")
            cmd = 0

except:
    bin = [128 for i in range(file_size)]
    sent = 0
    while(sent<2):
        cmd = ser.read()
        if(cmd):
            #print("Sending packet.")
            k = (i+PACKET_BURST_SIZE)%file_size
            if(k!=i+PACKET_BURST_SIZE):
                print("\nEnd of song ! (Looping...)")
                ser.write(bytearray(bin[i:file_size]))
                ser.write(bytearray(bin[0:k]))
                sent += 1
                i = k
            else:
                ser.write(bytearray(bin[i:i+PACKET_BURST_SIZE]))
                sent += 1
                i = i+PACKET_BURST_SIZE
            progress_bar(i, file_size)
            #print("Done.")
            cmd = 0

ser.close()
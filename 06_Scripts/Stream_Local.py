import serial
import sys
import os.path
import time
import sounddevice as sd
import numpy as np

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

Fs = 22050 # Hz
duration = 5 # second

sd.default.samplerate = Fs
sd.default.channels = 1
sd.default.device = 2

def bin_convert(record):
    bin = [0 for i in range(len(record))]
    for i in range(len(record)):
        bin[i] = int(record[i][0]*128)
        if(bin[i]>127):
            bin[i] = 127
        if(bin[i]<-128):
            bin[i] = -128
        bin[i] = bin[i] + 128

    return bin


## Check file size
#if(len(bin)==file_size):
#    print("Correct file format.")
#else:
#    print("Wrong file format (2).")
#    sys.exit(0)

## Open the serial
ser = serial.Serial(
    port=COMPORT,
    baudrate=3686400,
    parity=serial.PARITY_EVEN,
    stopbits=serial.STOPBITS_ONE,
    timeout=1,
    bytesize=serial.EIGHTBITS
)


record = [[0] for i in range(22050)]
bin2 = [0 for i in range(22050)]
bin = [0 for i in range(22050)]

record = sd.rec(int(duration * Fs))
bin = bin_convert(record)
file_size = len(bin)

print(bin)

i=0
cmd = 0
try:
    while(True):
        cmd = ser.read()
        if(cmd):
            k = (i+PACKET_BURST_SIZE)%file_size
            if(k!=i+PACKET_BURST_SIZE):
                ser.write(bytearray(bin[i:file_size]))
                ser.write(bytearray(bin[0:k]))
                i = k
            else:
                ser.write(bytearray(bin[i:i+PACKET_BURST_SIZE]))
                i = i+PACKET_BURST_SIZE
            cmd = 0

except:
    bin = [128 for i in range(file_size)]
    sent = 0
    while(sent<2):
        cmd = ser.read()
        if(cmd):
            ser.write(bytearray(bin))
            sent += 1
            cmd = 0

ser.close()

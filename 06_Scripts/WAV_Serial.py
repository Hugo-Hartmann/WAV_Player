#############################
### Python code for handling Serial link
### Created     2020-01-07
### Last update 2020-01-07
### Author      Hugo HARTMANN
#############################

## Library imports
import serial
import serial.tools.list_ports
import numpy as np

## Functions

# Detect COM ports
def serial_detect():
    ports = list(serial.tools.list_ports.comports())
    port_list = []
    for p in ports:
        name = str(p)
        name = name.split()
        name = name[-1]     # Select last word (should be (COMXX))
        name = name[1:-1]   # Delete brackets around (COMXX)
        port_list.append(name)
    
    return port_list

# Open the serial
def serial_open(COMPORT):

    try:
        ser = serial.Serial(
            port=COMPORT,
            baudrate=3686400,
            parity=serial.PARITY_EVEN,
            stopbits=serial.STOPBITS_ONE,
            timeout=1,
            bytesize=serial.EIGHTBITS
        )
        return ser, 0

    except:
        return None, 1

# Close the serial
def serial_close(ser):

    try:
        ser.close()
    except:
        pass

    return 0

# Write FFT samping rate
def serial_wr_FFT_sampling(ser, rate):

    cmd = [0] # FFT selection

    try:
        nb = int(rate)
        if(nb>=1 and nb<=256):
            cmd.append(nb-1)
            ser.write(bytearray(cmd))
            return 0
        else:
            return 1

    except ValueError:
        return 1

    except:
        return 2

# Write volume configuration
def serial_wr_volume(ser, volume):
    pass

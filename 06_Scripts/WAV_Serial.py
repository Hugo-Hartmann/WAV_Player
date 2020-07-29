#############################
### Python code for handling Serial link
### Created     2020-01-07
### Last update 2020-07-29
### Author      Hugo HARTMANN
#############################

## Library imports
import serial
import serial.tools.list_ports
import numpy as np
from threading import Thread
from WAV_Config_Constants import *
import threading
import time
import sys

# Monitor serial inputs
class SerialMonitor(Thread):

    def __init__(self, serial, GUI):
        Thread.__init__(self)
        self._stop_event = threading.Event()
        self.serial = serial
        self.GUI = GUI
        self.WAV_tab = np.arange(1280)
        self.FFT_tab = np.arange(1024)
        self.synced = False
        self.running = True

    def check_header(self, header):
        if(header[0]==header[1] and header[1]==header[2] and header[2]==header[3] and header[3]==header[4] and header[4]==header[5] and header[5]==header[6] and header[0]==170):
            return True
        else:
            return False

    def sync_with_header(self):
        self.serial.ser.reset_input_buffer() # Clear buffer to get most recent data directly
        header = [0, 0, 0, 0, 0, 0, 0]
        while(self.running and self.serial.opened):
            cmd = self.serial.ser.read(1)
            if(cmd!=b''):
                header = [cmd[0]] + header[0:6]
                if(self.check_header(header)):
                    self.synced = True
                    print("Successfully synced!")
                    return 1

        print("Synchronisation ended.")
        return 0

    def get_data(self):
        WAV_data = self.serial.ser.read(1280)
        FFT_data = self.serial.ser.read(2048)
        header = self.serial.ser.read(7)
        
        if(self.check_header(header)==False):
            print("Sync lost!")
            self.synced = False
            return 0

        else:
            for i in range(1280):
                self.WAV_tab[i] = WAV_data[i]
            for i in range(1024):
                self.FFT_tab[i] = FFT_data[2*i]+FFT_data[2*i+1]*256
            return 1

    def run(self):
        while(self.running):
            try:
                if(self.serial.opened): # Check is a serial port is opened
                    if(self.synced==False):
                        self.sync_with_header()
                    else:
                        self.GUI.update_plot(self.WAV_tab, self.FFT_tab)
                    
                    self.get_data()
                else:
                    time.sleep(0.1)

            except:
                self.synced = False
                print("Unexpected error:", sys.exc_info())
                time.sleep(0.1)

    def stop(self):
        self.running = False
        self._stop_event.set()

class SerialPort():

## Functions

    # init
    def __init__(self):
        self.ser = None
        self.ser_monitor = None
        self.opened = False

    def set_ser_monitor(self, ser_monitor):
        self.ser_monitor = ser_monitor

    # Detect COM ports
    def serial_detect(self):
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
    def serial_open(self, COMPORT):

        try:
            self.ser = serial.Serial(
                port=COMPORT,
                baudrate=3686400,
                parity=serial.PARITY_EVEN,
                stopbits=serial.STOPBITS_ONE,
                timeout=1,
                bytesize=serial.EIGHTBITS,
            )

            self.ser.set_buffer_size(rx_size = 20000, tx_size = 20000) #overfit buffer size to expected data burst size
            self.opened = True

            return 0

        except:
            return 1
    
    # Close the serial
    def serial_close(self):

        try:
            self.opened = False
            self.ser.close()
            self.ser = None

        except:
            pass

        return 0

    # Write volume configuration
    def serial_wr_volume(self, level, index):

        if(self.opened):

            # Currently sets both channels
            # Add 0 MSB of level (16 bits sent, only 5 LSBs used)

            cmd_right = [C_RIGHT_CHANNEL+C_EQUALIZER+index, 0]
            cmd_left = [C_LEFT_CHANNEL+C_EQUALIZER+index, 0]

            nb = int(level)
            if(nb>=0 and nb<=24):
                cmd_right.append(level)
                cmd_left.append(level)
                self.ser.write(bytearray(cmd_right))
                self.ser.write(bytearray(cmd_left))
                return 0
            else:
                return 1

        else:
            return 2

    # Write channel selection
    def serial_wr_sw(self, index):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_SWITCH, 0]
            cmd_left = [C_LEFT_CHANNEL+C_SWITCH, 0]

            cmd_right.append(index)
            cmd_left.append(index)
            self.ser.write(bytearray(cmd_right))
            self.ser.write(bytearray(cmd_left))
            return 0

        else:
            return 2
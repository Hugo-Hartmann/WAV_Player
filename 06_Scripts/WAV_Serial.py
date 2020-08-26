#############################
### Python code for handling Serial link
### Created     2020-01-07
### Last update 2020-08-26
### Author      Hugo HARTMANN
#############################

## Library imports
import serial
import serial.tools.list_ports
import numpy as np
from threading import Thread
from WAV_Config_Constants import *
from PyQt5.QtCore import pyqtSignal, QThread
import threading
import time
import sys
import copy

# Monitor serial inputs
class SerialMonitor(QThread):

    UpdateOSC = pyqtSignal(list)
    UpdateVU = pyqtSignal(list)

    def __init__(self, serial, GUI):
        QThread.__init__(self)
        self._stop_event = threading.Event()
        self.serial = serial
        self.GUI = GUI
        self.WAV_tab = np.arange(1280)
        self.FFT_tab = np.arange(1024)
        self.VU_tab = np.arange(11)
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
        VU_data = self.serial.ser.read(11)
        header = self.serial.ser.read(7)
        
        if(self.check_header(header)==False):
            print("Sync lost! Received :", header)
            self.synced = False
            return 0

        else:
            for i in range(1280):
                self.WAV_tab[i] = WAV_data[i]
            for i in range(1024):
                self.FFT_tab[i] = FFT_data[2*i]+FFT_data[2*i+1]*256
            for i in range(11):
                self.VU_tab[i] = VU_data[10-i]
            return 1

    def run(self):
        while(self.running):
            try:
                if(self.serial.opened): # Check is a serial port is opened
                    if(self.synced==False):
                        self.sync_with_header()
                    else:
                        #start = time.time_ns()
                        self.UpdateOSC.emit([copy.deepcopy(self.WAV_tab), copy.deepcopy(self.FFT_tab)])
                        self.UpdateVU.emit([copy.deepcopy(self.VU_tab)])
                        #self.GUI.update_OSC(self.WAV_tab, self.FFT_tab)
                        #self.GUI.update_VU(self.VU_tab)
                        #print((time.time_ns()-start)/1000000)

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
            self.ser_monitor.GUI.load_config()

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

    def serial_write(self, cmd):
        #print("sent cmd :", cmd)
        self.ser.write(bytearray(cmd))

    # Write volume configuration
    def serial_wr_EQ_level(self, level, index):

        if(self.opened):

            # Currently sets both channels
            # Add 0 MSB of level (16 bits sent, only 5 LSBs used)

            cmd_right = [C_RIGHT_CHANNEL+C_EQUALIZER_LEVEL+index, 0]
            cmd_left = [C_LEFT_CHANNEL+C_EQUALIZER_LEVEL+index, 0]

            nb = int(level)
            if(nb>=0 and nb<=24):
                cmd_right.append(level)
                cmd_left.append(level)
                self.serial_write(cmd_right)
                self.serial_write(cmd_left)
                return 0
            else:
                return 1

        else:
            return 2

    # Write volume configuration
    def serial_wr_EQ_sel(self, sel, index):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_EQUALIZER_SEL+index, 0]
            cmd_left = [C_LEFT_CHANNEL+C_EQUALIZER_SEL+index, 0]

            if(sel):
                enable = 1
            else:
                enable = 0

            cmd_right.append(enable)
            cmd_left.append(enable)
            self.serial_write(cmd_right)
            self.serial_write(cmd_left)
            return 0

        else:
            return 2

    # Write channel selection
    def serial_wr_SW(self, index):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_SWITCH, 0]
            cmd_left = [C_LEFT_CHANNEL+C_SWITCH, 0]

            cmd_right.append(index)
            cmd_left.append(index)
            self.serial_write(cmd_right)
            self.serial_write(cmd_left)
            return 0

        else:
            return 2

    # Write FFT Sampling rate config
    def serial_wr_FFT_sampling(self, end_point, sampling_point):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_FFT_SAMPLING]
            cmd_left = [C_LEFT_CHANNEL+C_FFT_SAMPLING]

            cmd_right.append(end_point)
            cmd_right.append(sampling_point)
            cmd_left.append(end_point)
            cmd_left.append(sampling_point)
            self.serial_write(cmd_right)
            self.serial_write(cmd_left)
            return 0

        else:
            return 2

    # Write FFT Sampling rate config
    def serial_wr_FFT_rounds_nb(self, nb_round):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_FFT_ROUND_NB, 0]
            cmd_left = [C_LEFT_CHANNEL+C_FFT_ROUND_NB, 0]

            cmd_right.append(nb_round)
            cmd_left.append(nb_round)
            self.serial_write(cmd_right)
            self.serial_write(cmd_left)
            return 0

        else:
            return 2

    # Write NRM Sampling rate config
    def serial_wr_NRM_rounds_nb(self, nb_round):

        if(self.opened):

            # Currently sets both channels

            cmd_right = [C_RIGHT_CHANNEL+C_NRM_ROUND_NB, 0]
            cmd_left = [C_LEFT_CHANNEL+C_NRM_ROUND_NB, 0]

            cmd_right.append(nb_round)
            cmd_left.append(nb_round)
            self.serial_write(cmd_right)
            self.serial_write(cmd_left)
            return 0

        else:
            return 2
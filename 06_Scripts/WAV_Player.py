#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-07-25
### Author      Hugo HARTMANN
#############################

## Library imports
import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow, QVBoxLayout, QHBoxLayout, QPushButton, QWidget, QComboBox, QSlider
from PyQt5.QtCore import Qt
from WAV_Serial import *
from WAV_Plot import *
from WAV_Utils import *
from functools import partial

class VuSlider(QSlider):
    
    def __init__(self, *args, **kwargs):
        super(QSlider, self).__init__(*args, **kwargs)
        
        self.setTickInterval(1)
        self.setRange(0, 15)
        self.setSingleStep(1)
        self.setPageStep(1)
        self.setTickPosition(QSlider.TicksBothSides)

class MainWindow(QMainWindow):

    def __init__(self, serial, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.setWindowTitle("WAV Player")
        self.resize(500, 800)
        self.serial = serial


        ################################
        ## Port COM Area
        ################################
        COM_lbl = QLabel("Serial")
        COM_lbl.setAlignment(Qt.AlignCenter)

        COM_lyt_btn = QHBoxLayout()
        
        COM_combobox = QComboBox()
        
        COM_connect_btn = QPushButton("Connect")
        COM_refresh_btn = QPushButton("Refresh")
        
        COM_lyt_btn.addWidget(COM_refresh_btn)
        COM_lyt_btn.addWidget(COM_connect_btn)
        
        COM_status_lbl = QLabel("")
        COM_status_lbl.setAlignment(Qt.AlignCenter)
        
        COM_lyt = QVBoxLayout()
        COM_lyt.addWidget(COM_lbl)
        COM_lyt.addWidget(COM_combobox)
        COM_lyt.addLayout(COM_lyt_btn)
        COM_lyt.addWidget(COM_status_lbl)
        
        p_refresh_COM = partial(refresh_COM, serial, COM_combobox)
        p_connect_COM = partial(connect_COM, serial, COM_combobox, COM_status_lbl)
        
        COM_refresh_btn.clicked.connect(p_refresh_COM)
        COM_connect_btn.clicked.connect(p_connect_COM)
        
        p_refresh_COM()

        ################################
        ## Equalizer Area
        ################################
        EQ_lyt = QHBoxLayout()
        
        EQ_input_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band0_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band1_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band2_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band3_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band4_sld = VuSlider(orientation=Qt.Vertical)
        EQ_band5_sld = VuSlider(orientation=Qt.Vertical)
        EQ_output_sld = VuSlider(orientation=Qt.Vertical)
        
        EQ_lyt.addWidget(EQ_input_sld)
        EQ_lyt.addWidget(EQ_band0_sld)
        EQ_lyt.addWidget(EQ_band1_sld)
        EQ_lyt.addWidget(EQ_band2_sld)
        EQ_lyt.addWidget(EQ_band3_sld)
        EQ_lyt.addWidget(EQ_band4_sld)
        EQ_lyt.addWidget(EQ_band5_sld)
        EQ_lyt.addWidget(EQ_output_sld)

        ################################
        ## Main Area
        ################################
        self.PLT_canvas = MplCanvas(self, width=5, height=4, dpi=100)
        self._plot_ref = None
        PLT_lyt = QHBoxLayout()
        PLT_lyt.addWidget(self.PLT_canvas)
        self.update_plot(np.arange(1280))
        self.show()

        ################################
        ## Main Area
        ################################
        MAIN_lyt = QVBoxLayout()
        UTIL_lyt = QHBoxLayout()
        UTIL_lyt.addLayout(COM_lyt)
        UTIL_lyt.addLayout(EQ_lyt)
        MAIN_lyt.addLayout(PLT_lyt)
        MAIN_lyt.addLayout(UTIL_lyt)

        MAIN_widget = QWidget()
        MAIN_widget.setLayout(MAIN_lyt)
        self.setCentralWidget(MAIN_widget)


    def update_plot(self, WAV_data):
        if self._plot_ref is None:
            plot_refs = self.PLT_canvas.axes.plot(np.arange(1280), WAV_data, 'r')
            self._plot_ref = plot_refs[0]
        else:
            self._plot_ref.set_ydata(WAV_data)

        self.PLT_canvas.draw()

    def closeEvent(self, event):
        self.serial.serial_close()

################################
## Main App
################################

## Create Serial Port handler
serial = SerialPort()

## App creation (GUI)
app = QApplication([])

## Window creation
window = MainWindow(serial)
window.show()

## Serial Monitor
serial_monitor = SerialMonitor(serial, window)
serial.set_ser_monitor(serial_monitor)

## app mainloop
app.exec_()
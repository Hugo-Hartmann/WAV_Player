#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-07-29
### Author      Hugo HARTMANN
#############################

## Library imports
import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow, QVBoxLayout, QHBoxLayout, QPushButton, QWidget, QComboBox, QSlider, QRadioButton
from PyQt5.QtCore import Qt
from WAV_Serial import *
from WAV_Plot import *
from WAV_Utils import *
from functools import partial

class VuSlider(QSlider):
    
    def __init__(self, *args, **kwargs):
        super(QSlider, self).__init__(*args, **kwargs)
        
        self.setTickInterval(1)
        self.setRange(0, 24)
        self.setSingleStep(1)
        self.setPageStep(1)
        self.setTickPosition(QSlider.TicksBothSides)
        self.setValue(12)

class MainWindow(QMainWindow):

    def __init__(self, serial, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.setWindowTitle("WAV Player")
        self.resize(1200, 800)
        self.serial = serial
        self.slider_num = 8

        ################################
        ## Port COM Area
        ################################
        COM_lbl = QLabel("Serial")
        COM_lbl.setAlignment(Qt.AlignCenter)

        COM_lyt_btn = QHBoxLayout()

        COM_combobox = QComboBox()

        COM_connect_btn = QPushButton("Connect")
        COM_refresh_btn = QPushButton("Refresh")
        COM_close_btn = QPushButton("Close")
        COM_close_btn.setEnabled(False)

        COM_lyt_btn.addWidget(COM_refresh_btn)
        COM_lyt_btn.addWidget(COM_connect_btn)
        COM_lyt_btn.addWidget(COM_close_btn)

        COM_status_lbl = QLabel("")
        COM_status_lbl.setAlignment(Qt.AlignCenter)

        COM_lyt = QVBoxLayout()
        COM_lyt.addWidget(COM_lbl)
        COM_lyt.addWidget(COM_combobox)
        COM_lyt.addLayout(COM_lyt_btn)
        COM_lyt.addWidget(COM_status_lbl)

        p_refresh_COM = partial(refresh_COM, self.serial, COM_combobox)
        p_connect_COM = partial(connect_COM, self.serial, COM_combobox, COM_status_lbl, COM_close_btn)
        p_close_COM = partial(close_COM, self.serial, COM_status_lbl, COM_close_btn)

        COM_refresh_btn.clicked.connect(p_refresh_COM)
        COM_connect_btn.clicked.connect(p_connect_COM)
        COM_close_btn.clicked.connect(p_close_COM)

        p_refresh_COM()

        ################################
        ## Channel select Area
        ################################
        SW_lyt = QVBoxLayout()

        SW_btn_labels = ["Input", "Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6", "Output"]
        SW_buttons = [None for i in range(8)]
        p_SW_buttons = [None for i in range(8)]

        for i in range(len(SW_buttons)):
            SW_buttons[i] = QRadioButton(text=SW_btn_labels[i])
            SW_lyt.addWidget(SW_buttons[i])
            p_SW_buttons[i] = partial(update_SW, self.serial, i)
            SW_buttons[i].pressed.connect(p_SW_buttons[i])

        ################################
        ## Equalizer Area
        ################################
        EQ_lyt = QHBoxLayout()

        EQ_sliders = [None for i in range(self.slider_num)]
        p_EQ_sliders = [None for i in range(self.slider_num)]

        for i in range(self.slider_num):
            EQ_sliders[i] = VuSlider(orientation=Qt.Vertical)
            EQ_lyt.addWidget(EQ_sliders[i])
            p_EQ_sliders[i] = partial(update_EQ, self.serial, EQ_sliders[i], i)
            EQ_sliders[i].valueChanged.connect(p_EQ_sliders[i])

        ################################
        ## Graph Area
        ################################
        self.PLT_canvas = MplCanvas(self, width=5, height=4, dpi=100)
        self._plot_ref = None
        PLT_lyt = QHBoxLayout()
        PLT_lyt.addWidget(self.PLT_canvas)
        self.update_plot(np.arange(1280), np.arange(1024))
        self.show()

        ################################
        ## Main Area
        ################################
        MAIN_lyt = QVBoxLayout()
        UTIL_lyt = QHBoxLayout()
        UTIL_lyt.addLayout(COM_lyt)
        UTIL_lyt.addLayout(EQ_lyt)
        GRAPH_lyt = QHBoxLayout()
        GRAPH_lyt.addLayout(PLT_lyt)
        GRAPH_lyt.addLayout(SW_lyt)
        MAIN_lyt.addLayout(GRAPH_lyt)
        MAIN_lyt.addLayout(UTIL_lyt)

        MAIN_widget = QWidget()
        MAIN_widget.setLayout(MAIN_lyt)
        self.setCentralWidget(MAIN_widget)


    def update_plot(self, WAV_data, FFT_data):
        if self._plot_ref is None:
            plot_WAV = self.PLT_canvas.axes[0].plot(np.arange(1280), [0]*1280,  'r')
            plot_FFT = self.PLT_canvas.axes[1].plot(np.arange(1024), [0]*1024, 'r')
            self._plot_ref = [plot_WAV[0], plot_FFT[0]]
        else:
            self._plot_ref[0].set_ydata(WAV_data)
            self._plot_ref[1].set_ydata(FFT_data)

        self.PLT_canvas.draw()

    def closeEvent(self, event):
        self.serial.serial_close()
        self.serial.ser_monitor.stop()

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
serial_monitor.start()
serial.set_ser_monitor(serial_monitor)

## app mainloop
app.exec_()
#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-07-31
### Author      Hugo HARTMANN
#############################

## Library imports
import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow, QVBoxLayout, QHBoxLayout, QPushButton, QWidget, QComboBox, QSlider, QRadioButton, QCheckBox, QGridLayout, QSizePolicy
from PyQt5.QtCore import Qt
from WAV_Serial import *
from WAV_Plot import *
from WAV_Utils import *
from functools import partial

class VuSlider(QSlider):

    def __init__(self, *args, **kwargs):
        super(QSlider, self).__init__(*args, **kwargs)
        
        self.sld_style = """
        QSlider {
            min-height: 270px;
            max-height: 270px;
            min-width: 50px;
            max-width: 50px;
            }
        
        QSlider::groove:vertical {
            border: 0px solid tranparent;
            background: transparent;
            height: 270px;
            width: 600px;
            margin: 2px 0;
            }
         
        QSlider::handle:vertical {
            background: #505050;
            border: 1px solid #5c5c5c;
            width: 15px;
            height: 8px;
            margin: -2px 0; /* handle is placed by default on the contents rect of the groove. Expand outside the groove */
            border-radius: 50px;
            }"""

        self.setStyleSheet(self.sld_style)
        self.setRange(0, 24)
        self.setSingleStep(1)
        self.setPageStep(1)
        self.setValue(12)

class ComPortWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(ComPortWidget, self).__init__(*args, **kwargs)
        self.serial = serial

        self.lbl = QLabel("Serial")
        self.lbl.setAlignment(Qt.AlignCenter)

        self.lyt = QGridLayout()

        self.combobox = QComboBox()

        self.connect_btn = QPushButton("Connect")
        self.refresh_btn = QPushButton("Refresh")
        self.close_btn = QPushButton("Close")
        self.close_btn.setEnabled(False)

        self.status_lbl = QLabel("")
        self.status_lbl.setAlignment(Qt.AlignCenter)

        self.lyt.addWidget(self.lbl, 0, 0, 1, 3)
        self.lyt.addWidget(self.combobox, 1, 0, 1, 3)
        self.lyt.addWidget(self.refresh_btn, 2, 0)
        self.lyt.addWidget(self.connect_btn, 2, 1)
        self.lyt.addWidget(self.close_btn, 2, 2)
        self.lyt.addWidget(self.status_lbl, 3, 0, 1, 3)

        self.p_refresh = partial(refresh_COM, self.serial, self.combobox)
        self.p_connect = partial(connect_COM, self.serial, self.combobox, self.status_lbl, self.close_btn)
        self.p_close = partial(close_COM, self.serial, self.status_lbl, self.close_btn)

        self.refresh_btn.clicked.connect(self.p_refresh)
        self.connect_btn.clicked.connect(self.p_connect)
        self.close_btn.clicked.connect(self.p_close)

        self.p_refresh()

class BandSelectWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(BandSelectWidget, self).__init__(*args, **kwargs)
        self.serial = serial

        self.lyt = QGridLayout()

        self.btn_labels = ["Input", "Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6", "Output"]
        self.buttons = [None for i in range(8)]
        self.p_buttons = [None for i in range(8)]

        for i in range(len(self.buttons)):
            self.buttons[i] = QRadioButton(text=self.btn_labels[i])
            self.lyt.addWidget(self.buttons[i], i, 0)
            self.p_buttons[i] = partial(update_SW, self.serial, i)
            self.buttons[i].pressed.connect(self.p_buttons[i])

        self.buttons[0].setChecked(True)

class EqualizerWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(EqualizerWidget, self).__init__(*args, **kwargs)
        self.serial = serial
        self.busy = False

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)
        self.lyt.setHorizontalSpacing(8)

        self.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed));
        self.setFixedSize(470, 310);

        self.bars = BarCanvas()
        self.bars.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed));
        self.bars.setFixedSize(450, 270);

        self.sliders = [None for i in range(8)]
        self.p_sliders = [None for i in range(8)]

        self.lyt.addWidget(self.bars, 0, 1, 1, 8)
        self.lyt.setAlignment(self.bars, Qt.AlignCenter)

        for i in range(8):
            self.sliders[i] = VuSlider(orientation=Qt.Vertical)
            self.lyt.addWidget(self.sliders[i], 0, i+1, 1, 1)
            self.lyt.setAlignment(self.sliders[i], Qt.AlignCenter)
            self.p_sliders[i] = partial(update_EQ_lvl, self.serial, self.sliders[i], i)
            self.sliders[i].valueChanged.connect(self.p_sliders[i])

        self.buttons = [None for i in range(6)]
        self.p_buttons = [None for i in range(6)]

        for i in range(6):
            self.buttons[i] = QCheckBox()
            self.buttons[i].setCheckState(True)
            self.buttons[i].setTristate(False)
            self.lyt.addWidget(self.buttons[i], 1, i+2)
            self.lyt.setAlignment(self.buttons[i], Qt.AlignCenter)
            self.p_buttons[i] = partial(update_EQ_sel, self.serial, self.buttons[i], i)
            self.buttons[i].stateChanged.connect(self.p_buttons[i])

    def update_VU(self, data):
        self.busy = True
        self.bars.update_data(data)
        self.busy = False

class OscilloscopeWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(OscilloscopeWidget, self).__init__(*args, **kwargs)
        self.serial = serial

        self.lyt = QGridLayout()

        self.PLT_canvas = DualPlotCanvas(self, width=5, height=4, dpi=100)
        self.lyt.addWidget(self.PLT_canvas, 0, 0)

        # Create radio buttons to select band
        self.SW_Menu = BandSelectWidget(self.serial)

        self.lyt.addLayout(self.SW_Menu.lyt, 0, 1)

    def update_OSC(self, data_top, data_bot):
        self.PLT_canvas.update_data(data_top, data_bot)

class MainWindow(QMainWindow):

    def __init__(self, serial, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)

        self.setWindowTitle("WAV Player")
        self.resize(800, 600)
        self.serial = serial

        ## Port COM
        self.COM_Port = ComPortWidget(self.serial);

        ## Equalizer
        self.Equalizer_Bloc = EqualizerWidget(self.serial)

        ## Oscilloscope
        self.Oscilloscope_bloc = OscilloscopeWidget(self.serial)

        ## Main Area
        self.lyt = QGridLayout()
        self.lyt.addLayout(self.Oscilloscope_bloc.lyt, 0, 0, 1, 2)
        self.lyt.addLayout(self.COM_Port.lyt, 1, 0)
        self.lyt.addWidget(self.Equalizer_Bloc, 1, 1)

        self.widget = QWidget()
        self.widget.setLayout(self.lyt)
        self.setCentralWidget(self.widget)

    def update_VU(self, data):
        if(self.Equalizer_Bloc.busy):
            print("Skipped VU display")
        else:
            self.Equalizer_Bloc.update_VU(data)

    def update_OSC(self, data_top, data_bot):
        self.Oscilloscope_bloc.update_OSC(data_top, data_bot)

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
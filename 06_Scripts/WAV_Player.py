#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-08-04
### Author      Hugo HARTMANN
#############################

## Library imports
import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow, QVBoxLayout, QHBoxLayout, QPushButton, QWidget, QComboBox, QSlider, QRadioButton, QCheckBox, QGridLayout, QSizePolicy, QProgressBar
from PyQt5.QtCore import Qt
from WAV_Serial import *
from WAV_Plot import *
from WAV_Utils import *
from functools import partial
import matplotlib.pyplot as plt

class VuBar(QProgressBar):

    def __init__(self, *args, **kwargs):
        super(QProgressBar, self).__init__(*args, **kwargs)

        self.my_cmap = [0 for i in range(33)]
        self.gen_cmap()

        self.vubar_style = """
        QProgressBar {
            border: 1px solid transparent;
            min-height: 270px;
            max-height: 270px;
            min-width: 50px;
            max-width: 50px;
            background-color: #F0F0F0;
            }

        QProgressBar::chunk {
            border: 0px solid black;
            background: QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1
        """

        self.setStyleSheet(self.vubar_style + ");}")
        self.setRange(0, 31)
        self.setOrientation(Qt.Vertical)
        self.setTextVisible(False)

    def gen_cmap(self):
        # Generate Custom cmap
        plot = plt.scatter(np.arange(33), [i for i in range(33)], cmap="magma_r", c=np.arange(33), marker='.', s=5)
        colors = []
        for i in range(33):
            colors.append(plot.to_rgba(i)[:-1])
            color = [hex(int(colors[i][0]*255))[2:], hex(int(colors[i][1]*255))[2:], hex(int(colors[i][2]*255))[2:]]
            for k in range(3):
                if(len(color[k])==1):
                    color[k] = "0" + str(color[k])

            self.my_cmap[i] = "#" + str(color[0]) + str(color[1]) + str(color[2])

    def update_value(self, value):
        self.setValue(value)

        # Update Stylesheet for nice cmap :)
        val = value
        if(val==0):
            val = 1
        idx = np.arange(0, 1, 1/(val))
        for i in range(val):
            idx[i] = round(idx[i], 2)
        text = ""
        for i in range(val):
           text = text + ", stop: " + str(idx[i]) + " " + self.my_cmap[val-i]

        text = text + ", stop: 1 " + self.my_cmap[0] + ");}"
        self.setStyleSheet(self.vubar_style + text)

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

class FFTWidget(QWidget):
    def __init__(self, serial, oscillo, *args, **kwargs):
        super(FFTWidget, self).__init__(*args, **kwargs)
        self.serial = serial
        self.oscillo = oscillo

        self.lbl_main = QLabel("FFT")
        self.lbl_main.setAlignment(Qt.AlignCenter)

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)

        self.sampling_sld = QSlider()
        self.sampling_sld.setRange(0, 30)
        self.sampling_sld.setSingleStep(1)
        self.sampling_sld.setPageStep(1)
        self.sampling_sld.setValue(6)

        self.lbl_lvl = QLabel("")

        self.lyt.addWidget(self.lbl_main, 0, 0)
        self.lyt.addWidget(self.lbl_lvl, 1, 1)
        self.lyt.addWidget(self.sampling_sld, 1, 0)

        self.p_update_FFT_sampling = partial(update_FFT_sampling, self.serial, self.sampling_sld)
        self.p_update_FFT_level = partial(self.update_FFT_level, self.lbl_lvl, self.sampling_sld)

        self.sampling_sld.valueChanged.connect(self.p_update_FFT_level)
        self.p_update_FFT_level()

    def update_FFT_level(self, lbl, sld):
        zoom = (sld.value()+2)/2
        txt = "Zoom x" + str(zoom)
        lbl.setText(txt)

        # Update legend scale of FFT plot
        self.oscillo.update_scale(zoom)

        # Update level via serial port
        self.p_update_FFT_sampling()

    def load_config(self):
        self.p_update_FFT_sampling()

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

    def auto_connect(self):
        auto_connect(self.serial, self.combobox, self.status_lbl, self.close_btn)

class BandSelectWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(BandSelectWidget, self).__init__(*args, **kwargs)
        self.serial = serial

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)

        self.btn_labels = ["Input", "Band 1", "Band 2", "Band 3", "Band 4", "Band 5", "Band 6", "Band 7", "Band 8", "Band 9", "Output"]
        self.buttons = [None for i in range(11)]
        self.p_buttons = [None for i in range(11)]

        for i in range(len(self.buttons)):
            self.buttons[i] = QRadioButton(text=self.btn_labels[i])
            self.lyt.addWidget(self.buttons[i], i, 0)
            self.p_buttons[i] = partial(update_SW, self.serial, i)
            self.buttons[i].pressed.connect(self.p_buttons[i])

        self.buttons[0].setChecked(True)

    def load_config(self):
        for i in range(len(self.buttons)):
            if(self.buttons[i].isChecked()):
                self.p_buttons[i]()

class EqualizerWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(EqualizerWidget, self).__init__(*args, **kwargs)
        self.serial = serial
        self.busy = False
        self.nb_bar = 11

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)
        self.lyt.setHorizontalSpacing(8)

        #self.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed));
        #self.setFixedSize(640, 310);

        self.sliders = [None for i in range(self.nb_bar)]
        self.p_sliders = [None for i in range(self.nb_bar)]
        self.vubars = [None for i in range(self.nb_bar)]

        for i in range(self.nb_bar):
            self.vubars[i] = VuBar()
            self.lyt.addWidget(self.vubars[i], 0, i+1, 1, 1)
            self.lyt.setAlignment(self.vubars[i], Qt.AlignCenter)

            self.sliders[i] = VuSlider(orientation=Qt.Vertical)
            self.lyt.addWidget(self.sliders[i], 0, i+1, 1, 1)
            self.lyt.setAlignment(self.sliders[i], Qt.AlignCenter)
            self.p_sliders[i] = partial(update_EQ_lvl, self.serial, self.sliders[i], i)
            self.sliders[i].valueChanged.connect(self.p_sliders[i])

        self.buttons = [None for i in range(self.nb_bar-2)]
        self.p_buttons = [None for i in range(self.nb_bar-2)]

        for i in range(self.nb_bar-2):
            self.buttons[i] = QCheckBox()
            self.buttons[i].setCheckState(True)
            self.buttons[i].setTristate(False)
            self.lyt.addWidget(self.buttons[i], 1, i+2, Qt.AlignHCenter)
            self.p_buttons[i] = partial(update_EQ_sel, self.serial, self.buttons[i], i)
            self.buttons[i].stateChanged.connect(self.p_buttons[i])

    def load_config(self):
        for i in range(len(self.buttons)):
            self.p_buttons[i]()

        for i in range(len(self.sliders)):
            self.p_sliders[i]()

    def update_VU(self, data):
        self.busy = True
        for i in range(self.nb_bar):
            self.vubars[i].update_value(data[i])
        self.busy = False

class OscilloscopeWidget(QWidget):
    def __init__(self, serial, *args, **kwargs):
        super(OscilloscopeWidget, self).__init__(*args, **kwargs)
        self.serial = serial

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)

        # Oscilloscope and FFT
        self.graphs = DualPlotCanvas(self, width=5, height=4, dpi=100)
        self.graphs.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed));
        self.graphs.setFixedSize(1300, 550);
        self.lyt.addWidget(self.graphs, 0, 0)
        self.lyt.setAlignment(self.graphs, Qt.AlignCenter)

        # Legend for FFT plot
        self.legendgraphs = LegendPlotCanvas(self, width=5, height=4, dpi=100)
        self.legendgraphs.setSizePolicy(QSizePolicy(QSizePolicy.Fixed, QSizePolicy.Fixed));
        self.legendgraphs.setFixedSize(1352, 40);
        self.lyt.addWidget(self.legendgraphs, 1, 0)

        # Create radio buttons to select band
        self.SW_Menu = BandSelectWidget(self.serial)

        self.lyt.addWidget(self.SW_Menu, 0, 1)

    def update_scale(self, level):
        Fmax = 22000

        Fmax = 22000/level

        self.legendgraphs.update_scale(Fmax);

    def load_config(self):
        self.SW_Menu.load_config()

    def update_OSC(self, data_top, data_bot):
        self.graphs.update_data(data_top, data_bot)

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

        ## FFT
        self.FFT_Bloc = FFTWidget(self.serial, self.Oscilloscope_bloc)

        ## Main Area
        self.lyt = QGridLayout()
        self.lyt.addWidget(self.Oscilloscope_bloc, 0, 0, 1, 3)
        self.lyt.setAlignment(self.Oscilloscope_bloc, Qt.AlignCenter)
        self.lyt.addLayout(self.COM_Port.lyt, 1, 0)
        self.lyt.addWidget(self.Equalizer_Bloc, 1, 2)
        self.lyt.addWidget(self.FFT_Bloc, 1, 1)

        self.widget = QWidget()
        self.widget.setLayout(self.lyt)
        self.setCentralWidget(self.widget)

    def auto_connect(self):
        self.COM_Port.auto_connect()

    def load_config(self):
        self.serial.ser_monitor.UpdateOSC.connect(self.update_OSC)
        self.serial.ser_monitor.UpdateVU.connect(self.update_VU)
        self.Equalizer_Bloc.load_config()
        self.Oscilloscope_bloc.load_config()
        self.FFT_Bloc.load_config()

    def update_VU(self, data):
        if(self.Equalizer_Bloc.busy):
            print("Skipped VU display")
        else:
            self.Equalizer_Bloc.update_VU(data[0])

    def update_OSC(self, data):
        self.Oscilloscope_bloc.update_OSC(data[0], data[1])

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
#window.showMaximized()

## Serial Monitor
serial_monitor = SerialMonitor(serial, window)
serial_monitor.start()
serial.set_ser_monitor(serial_monitor)

## App try to auto connect to existing com ports
window.auto_connect()

## app mainloop
app.exec_()
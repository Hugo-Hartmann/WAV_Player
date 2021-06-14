#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-08-26
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

class FFTSlider(QWidget):

    def __init__(self, sld_range, sld_start, QGrad, *args, **kwargs):
        super(FFTSlider, self).__init__(*args, **kwargs)

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)

        self.sld_style = """
        QSlider {
            background-color:transparent;
            min-height: 270px;
            max-height: 270px;
            min-width: 50px;
            max-width: 50px;
            }

        QSlider::groove:vertical {
            border: 2px solid """ + QGrad + """;
            background-color:transparent;
            height: 270px;
            width: 30px;
            margin: 2px 0;
            }

        QSlider::handle:vertical {
            background: #505050;
            border: 1px solid #5c5c5c;
            width: 50px;
            height: 8px;
            margin: -2px 0; /* handle is placed by default on the contents rect of the groove. Expand outside the groove */
            border-radius: 50px;
            }"""

        self.setStyleSheet(self.sld_style)

        self.sld = QSlider()
        self.sld.setRange(0, sld_range)
        self.sld.setSingleStep(1)
        self.sld.setPageStep(1)
        self.sld.setValue(sld_start)

        self.lbl = QLabel("")

        self.lyt.addWidget(self.lbl, 0, 1)
        self.lyt.addWidget(self.sld, 0, 0)


class VuBar(QProgressBar):

    def __init__(self, style="magma_r", *args, **kwargs):
        super(QProgressBar, self).__init__(*args, **kwargs)

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
            
        """

        self.setStyleSheet(self.vubar_style + "}")
        self.setRange(0, 31)
        self.setOrientation(Qt.Vertical)
        self.setTextVisible(False)

        self.my_cmap = gen_cmap(33, style)

    def update_value(self, value):
        self.setValue(value)

        # Update Stylesheet for nice cmap :)
        text = "background:"  + gen_QLinearGradient(33, self.my_cmap, value) + ";}"
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
    def __init__(self, serial, oscillo, style="magma_r", *args, **kwargs):
        super(FFTWidget, self).__init__(*args, **kwargs)
        self.serial = serial
        self.oscillo = oscillo

        self.lbl_main = QLabel("FFT")
        self.lbl_main.setAlignment(Qt.AlignCenter)

        self.lyt = QGridLayout()
        self.setLayout(self.lyt)

        self.my_cmap = gen_cmap(33, style)
        self.QGrad = gen_QLinearGradient(33, self.my_cmap, 32)

        self.sampling_sld = FFTSlider(15, 3, self.QGrad)
        self.rounds_sld = FFTSlider(10, 10, self.QGrad)

        self.lyt.addWidget(self.lbl_main, 0, 0, 1, 2)
        self.lyt.addWidget(self.sampling_sld, 1, 0)
        self.lyt.addWidget(self.rounds_sld, 1, 1)

        self.sampling_sld.sld.valueChanged.connect(self.update_FFT_level)
        self.rounds_sld.sld.valueChanged.connect(self.update_FFT_nb_points)

        self.update_FFT_level()
        self.update_FFT_nb_points()

    def update_FFT_nb_points(self):

        N = 2**(self.rounds_sld.sld.value())

        # Update legend scale of FFT plot
        self.oscillo.update_nb_points(N)

        # Update level via serial port
        update_FFT_rounds_nb(self.serial, self.rounds_sld.sld, self.rounds_sld.lbl)

    def update_FFT_level(self):

        level = self.sampling_sld.sld.value()+1

        # Update legend scale of FFT plot
        self.oscillo.update_scale(level)

        # Update level via serial port
        update_FFT_sampling(self.serial, level, self.sampling_sld.lbl)

    def load_config(self):
        self.update_FFT_level()

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
        for i in range(self.nb_bar):
            self.vubars[i].update_value(data[i])

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

    def update_nb_points(self, N):
        self.graphs.update_nb_points(N);

    def update_scale(self, level):
        Fmax = 22000

        Fmax = 22000/level

        self.legendgraphs.update_scale(Fmax)

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
        self.oscBusy = False
        self.sliderBusy = False

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
        if(not self.sliderBusy):
            self.sliderBusy = True
            self.Equalizer_Bloc.update_VU(data[0])
            self.sliderBusy = False

    def update_OSC(self, data):
        if(not self.oscBusy):
            self.oscBusy = True
            self.Oscilloscope_bloc.update_OSC(data[0], data[1])
            self.oscBusy = False

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
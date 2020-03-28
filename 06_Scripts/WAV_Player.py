#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-03-28
### Author      Hugo HARTMANN
#############################

## Library imports
import sys
from PyQt5.QtWidgets import QApplication, QLabel, QMainWindow, QVBoxLayout, QHBoxLayout, QPushButton, QWidget, QComboBox, QSlider
from PyQt5.QtCore import Qt
from WAV_Serial import *
from WAV_Utils import *
from functools import partial

class MainWindow(QMainWindow):

    def __init__(self, *args, **kwargs):
        super(MainWindow, self).__init__(*args, **kwargs)
        
        self.setWindowTitle("WAV Player")
        self.resize(400, 300)
        
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
        
        COM_widget = QWidget()
        COM_widget.setLayout(COM_lyt)
        self.setCentralWidget(COM_widget)
        
        p_refresh_COM = partial(refresh_COM, COM_combobox)
        p_connect_COM = partial(connect_COM, COM_combobox, COM_status_lbl)
        
        COM_refresh_btn.clicked.connect(p_refresh_COM)
        COM_connect_btn.clicked.connect(p_connect_COM)
        
        p_refresh_COM()

        ################################
        ## Equalizer Area
        ################################
        #EQ_lyt = QHBoxLayout()
        #EQ_input_sld = QSlider(orientation=Qt.Vertical)
        #EQ_input_sld.setTickInterval(1)
        #EQ_input_sld.setSingleStep(10)
        #EQ_input_sld.setTickPosition(QSlider.TicksBothSides)
        #EQ_lyt.addWidget(EQ_input_sld)
        #EQ_widget = QWidget()
        #EQ_widget.setLayout(EQ_lyt)
        #self.setCentralWidget(EQ_widget)
        #EQ_band1_sld = QSlider(orientation=Vertical)
        #EQ_band2_sld = QSlider(orientation=Vertical)
        #EQ_band3_sld = QSlider(orientation=Vertical)
        #EQ_band4_sld = QSlider(orientation=Vertical)
        #EQ_band5_sld = QSlider(orientation=Vertical)
        #EQ_band6_sld = QSlider(orientation=Vertical)
        #EQ_output_sld = QSlider(orientation=Vertical)

################################
## Main
################################

## App creation (GUI)
app = QApplication([])

## Window creation
window = MainWindow()
window.show()

## app mainloop
app.exec_()
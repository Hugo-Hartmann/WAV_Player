#############################
### Python Utility function for GUI
### Created     2020-02-29
### Last update 2020-02-29
### Author      Hugo HARTMANN
#############################

## Library imports
from WAV_Serial import *

################################
## Port COM Area
################################

# Refresh port COM list
def refresh_COM(combo_COM):

    # Clear list
    while(combo_COM.count()>0):
        combo_COM.removeItem(combo_COM.count()-1)

    # Get current COM ports available
    port_list = serial_detect()

    # Add COM ports to combobox
    for COM_port in port_list:
        combo_COM.addItem(COM_port)
    
    try:
        combo_COM.setCurrentIndex(0) # If port list not empty, select 1st one in text box

    except:
        pass

# Connect Serial to port COM
def connect_COM(combo_COM, lbl_status_COM, FONT):

    COMPORT = combo_COM.currentText()

    serial_close()
    fail = serial_open(COMPORT)

    if(fail):
        lbl_status_COM.setText("<font color='Red'>Failed!</font>")
    else:
        lbl_status_COM.setText("<font color='Green'>Connected!</font>")

################################
## FFT Zoom
################################

# Configure FFT Zoom level
def write_FFT_zoom(btn_connect_COM, slider_FFT, lbl_status_FFT, FONT):

    zoom = slider_FFT.get() # Get field value
    zoom = int(round(float(zoom), 0))
    fail = serial_wr_FFT_sampling(zoom)
    
    if(fail):
        lbl_status_FFT.configure(text="Serial not connected!", font=(FONT, 10), foreground="red")
        btn_connect_COM.flash()
    else:
        lbl_status_FFT.configure(text="Done.", font=(FONT, 10), foreground="green")

def update_zoom_level(lbl_level_FFT, FONT, zoom):

    zoom = int(round(float(zoom), 0))

    lbl_level_FFT.configure(text=str(zoom), font=(FONT, 10))
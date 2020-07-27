#############################
### Python Utility function for GUI
### Created     2020-02-29
### Last update 2020-07-27
### Author      Hugo HARTMANN
#############################

################################
## Port COM Area
################################

# Refresh port COM list
def refresh_COM(serial, combo_COM):

    # Clear list
    while(combo_COM.count()>0):
        combo_COM.removeItem(combo_COM.count()-1)

    # Get current COM ports available
    port_list = serial.serial_detect()

    # Add COM ports to combobox
    for COM_port in port_list:
        combo_COM.addItem(COM_port)
    
    try:
        combo_COM.setCurrentIndex(0) # If port list not empty, select 1st one in text box

    except:
        pass

# Connect Serial to port COM
def connect_COM(serial, combo_COM, lbl_status_COM, COM_close_btn):

    COMPORT = combo_COM.currentText()

    serial.serial_close()
    fail = serial.serial_open(COMPORT)

    if(fail):
        lbl_status_COM.setText("<font color='Red'>Failed!</font>")
    else:
        lbl_status_COM.setText("<font color='Green'>Connected!</font>")
        COM_close_btn.setEnabled(True)

# Close Serial port
def close_COM(serial, lbl_status_COM, COM_close_btn):

    serial.serial_close()
    COM_close_btn.setEnabled(False)

    lbl_status_COM.setText("<font color='Green'></font>")

################################
## Equalizer Area
################################

def update_EQ(serial, EQ_sld, index):
    level = EQ_sld.value()

    serial.serial_wr_volume(level, index)
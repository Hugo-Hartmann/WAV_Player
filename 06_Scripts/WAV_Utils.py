#############################
### Python Utility function for GUI
### Created     2020-02-29
### Last update 2020-07-25
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
def connect_COM(serial, combo_COM, lbl_status_COM, FONT):

    COMPORT = combo_COM.currentText()

    serial.serial_close()
    fail = serial.serial_open(COMPORT)

    if(fail):
        lbl_status_COM.setText("<font color='Red'>Failed!</font>")
    else:
        lbl_status_COM.setText("<font color='Green'>Connected!</font>")

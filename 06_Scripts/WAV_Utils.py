#############################
### Python Utility function for GUI
### Created     2020-02-29
### Last update 2020-08-04
### Author      Hugo HARTMANN
#############################

## Library imports
import matplotlib.pyplot as plt
import numpy as np

################################
## Util Area
################################

def gen_cmap(N, style):
    # Generate Custom cmap

    my_cmap = [0 for i in range(N)]
    plot = plt.scatter(np.arange(N), [i for i in range(N)], cmap=style, c=np.arange(N), marker='.', s=5)
    colors = []
    for i in range(N):
        colors.append(plot.to_rgba(i)[:-1])
        color = [hex(int(colors[i][0]*255))[2:], hex(int(colors[i][1]*255))[2:], hex(int(colors[i][2]*255))[2:]]
        for k in range(3):
            if(len(color[k])==1):
                color[k] = "0" + str(color[k])

        my_cmap[i] = "#" + str(color[0]) + str(color[1]) + str(color[2])

    return my_cmap

def gen_QLinearGradient(N, cmap, val):
    # Generate QlinearGradient object based on cmap

    if(val==0):
        val = 1
    idx = np.arange(0, 1, 1/(val))
    for i in range(val):
        idx[i] = round(idx[i], 2)
    text = "QLinearGradient( x1: 0, y1: 0, x2: 0, y2: 1"
    for i in range(val):
       text = text + ", stop: " + str(idx[i]) + " " + cmap[val-i]

    text = text + ", stop: 1 " + cmap[0] + ")"

    return text

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

# Auto connect to available port COM
def auto_connect(serial, combo_COM, lbl_status_COM, COM_close_btn):
    refresh_COM(serial, combo_COM)

    for i in range(combo_COM.count()):
        combo_COM.setCurrentIndex(i)
        if(serial.opened==False):
            connect_COM(serial, combo_COM, lbl_status_COM, COM_close_btn)


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

def update_EQ_lvl(serial, EQ_sld, index):
    level = EQ_sld.value()

    serial.serial_wr_EQ_level(level, index)

def update_EQ_sel(serial, EQ_btn, index):
    sel = EQ_btn.checkState()

    serial.serial_wr_EQ_sel(sel, index+1)

################################
## Channel select Area
################################

def update_SW(serial, index):
    serial.serial_wr_SW(index)

################################
## FFT Area
################################

def update_FFT_sampling(serial, level, lbl_lvl):

    txt = "Zoom x" + str(level)
    lbl_lvl.setText(txt)

    if(level==int(level)):
        end_point       = int(level-1)
        sampling_point  = 0
    else:
        end_point       = int((level*2)-1)
        sampling_point  = int(end_point/2)

    serial.serial_wr_FFT_sampling(end_point, sampling_point)

def update_FFT_rounds_nb(serial, rounds_sld, rounds_lbl):
    nb_rounds = 2**(rounds_sld.value()+1)

    rounds_lbl.setText(str(nb_rounds) + " points")

    serial.serial_wr_FFT_rounds_nb(rounds_sld.value()+1)
    serial.serial_wr_NRM_rounds_nb(rounds_sld.value()+1)
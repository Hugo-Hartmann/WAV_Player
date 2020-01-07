#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-01-07
### Author      Hugo HARTMANN
#############################

## Library imports
from tkinter import *
from tkinter.ttk import *
from WAV_Serial import *

## Global parameters
FONT = "Arial Bold"

## Serial initialization
ser = None

## Window creation (GUI)
window = Tk()
window.title("WAV Player")
window.geometry('800x600')

################################
## Port COM Area
################################

group_COM = LabelFrame(window)
group_COM.grid(column=0, row=0)

# Refresh port COM list
def refresh_COM():

    global combo_COM

    combo_COM.set('') # Clear the text field
    port_list = serial_detect()
    combo_COM['values'] = port_list # Set new port list
    
    try:
        combo_COM.current(0) # If port list not empty, select 1st one in text box

    except:
        pass

# Connect Serial to port COM
def connect_COM():

    global combo_COM
    global lbl_status_COM
    global ser

    COMPORT = combo_COM.get()

    serial_close(ser)
    ser, fail = serial_open(COMPORT)

    if(fail):
        lbl_status_COM.configure(text="Failed!", font=(FONT, 10), foreground="red")
    else:
        lbl_status_COM.configure(text="Connected!", font=(FONT, 10), foreground="green")

# Label port COM
lbl_title_COM = Label(group_COM, text="Serial port ", font=(FONT, 10))
lbl_title_COM.grid(column=0, row=0, columnspan=2)

# Port select
combo_COM = Combobox(group_COM)
refresh_COM()
combo_COM.grid(column=0, row=1, columnspan=2)

# Refresh port list button
btn_refresh_COM = Button(group_COM, text="Refresh", command=refresh_COM)
btn_refresh_COM.grid(column=0, row=2, sticky=W)

# Connect to port button
btn_connect_COM = Button(group_COM, text="Connect", command=connect_COM)
btn_connect_COM.grid(column=1, row=2, sticky=W)

# Label status (Connected)
lbl_status_COM = Label(group_COM, text="", font=(FONT, 10))
lbl_status_COM.grid(column=0, row=3, columnspan=2)

################################
## FFT Zoom
################################

group_FFT = LabelFrame(window)
group_FFT.grid(column=0, row=1)

# Configure FFT Zoom level
def write_FFT_zoom():

    global txt_FFT
    global ser
    global lbl_status_FFT

    zoom = txt_FFT.get() # Get field value
    fail = serial_wr_FFT_sampling(ser, zoom)
    
    if(fail==1):
        lbl_status_FFT.configure(text="Uncorrect value!", font=(FONT, 10), foreground="red")
    elif(fail==2):
        lbl_status_FFT.configure(text="Serial not connected!", font=(FONT, 10), foreground="red")
    else:
        lbl_status_FFT.configure(text="Done.", font=(FONT, 10), foreground="green")


# Label FFT Zoom selection
lbl_title_FFT = Label(group_FFT, text="FFT Zoom", font=(FONT, 10))
lbl_title_FFT.grid(column=0, row=0, columnspan=2)

# Zoom text field
txt_FFT = Entry(group_FFT, width=10, text="1")
txt_FFT.grid(column=0, row=1, sticky=W)

# Set Zoom level button
btn_set_FFT = Button(group_FFT, text="Set", command=write_FFT_zoom, width=10)
btn_set_FFT.grid(column=1, row=1, sticky=W)

# Status text for Zoom
lbl_status_FFT = Label(group_FFT, text="", font=(FONT, 10))
lbl_status_FFT.grid(column=0, row=2, columnspan=2)


## Window mainloop
window.mainloop()
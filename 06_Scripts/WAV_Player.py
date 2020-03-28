#############################
### Python GUI for WAV Player
### Created     2020-01-07
### Last update 2020-02-29
### Author      Hugo HARTMANN
#############################

## Library imports
from tkinter import *
from tkinter.ttk import *
from WAV_Serial import *
from WAV_Utils import *
from functools import partial

## Global parameters
FONT = "Arial Bold"

## Window creation (GUI)
window = Tk()
window.title("WAV Player")
window.geometry('800x600')

################################
## Port COM Area
################################

group_COM = LabelFrame(window)
group_COM.grid(column=0, row=0)

# Label port COM
lbl_title_COM = Label(group_COM, text="Serial port ", font=(FONT, 10))
lbl_title_COM.grid(column=0, row=0, columnspan=2)

# Port select
combo_COM = Combobox(group_COM)
combo_COM.grid(column=0, row=1, columnspan=2)

# Label status (Connected)
lbl_status_COM = Label(group_COM, text="", font=(FONT, 10))
lbl_status_COM.grid(column=0, row=3, columnspan=2)

# Refresh port list button
btn_refresh_COM = Button(group_COM, text="Refresh")
btn_refresh_COM.grid(column=0, row=2, sticky=W)

# Connect to port button
btn_connect_COM = Button(group_COM, text="Connect")
btn_connect_COM.grid(column=1, row=2, sticky=W)

# Partial function definitions
p_refresh_COM = partial(refresh_COM, combo_COM)
p_connect_COM = partial(connect_COM, combo_COM, lbl_status_COM, FONT)

# Configure commands
btn_refresh_COM.configure(command=p_refresh_COM)
btn_connect_COM.configure(command=p_connect_COM)

# Initialize COM list
p_refresh_COM()

################################
## FFT Zoom
################################

group_FFT = LabelFrame(window)
group_FFT.grid(column=0, row=1)

# Label FFT Zoom selection
lbl_title_FFT = Label(group_FFT, text="FFT Zoom", font=(FONT, 10))
lbl_title_FFT.grid(column=0, row=0, columnspan=2)

# Label FFT Zoom level
lbl_level_FFT = Label(group_FFT, text="1", font=(FONT, 10))
lbl_level_FFT.grid(column=0, row=1, columnspan=1)

# Zoom text field
slider_FFT = Scale(group_FFT, from_=1, to=50, orient='horizontal')
slider_FFT.grid(column=0, row=2, sticky=W)

# Set Zoom level button
btn_set_FFT = Button(group_FFT, text="Set", width=10)
btn_set_FFT.grid(column=1, row=2, sticky=W)

# Status text for Zoom
lbl_status_FFT = Label(group_FFT, text="", font=(FONT, 10))
lbl_status_FFT.grid(column=0, row=3, columnspan=2)

# Partial function definitions
p_update_zoom_level = partial(update_zoom_level, lbl_level_FFT, FONT) # zoom will be directly passed from the scale
p_write_FFT_zoom = partial(write_FFT_zoom, slider_FFT, lbl_status_FFT, FONT)

# Configure commands
slider_FFT.configure(command=p_update_zoom_level)
btn_set_FFT.configure(command=p_write_FFT_zoom)

################################
## Main
################################

def on_closing():
    window.destroy()
    serial_close()
    print("Finished.")

## Window mainloop
window.protocol("WM_DELETE_WINDOW", on_closing)
window.mainloop()
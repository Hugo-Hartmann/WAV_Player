# In ModelSim
# do compil_VHDL.do

# Compile all files used in the ./../../02_Source/ folder in lib_VHDL library situated in libs/

# COMMENT THIS LINE BEFORE FIRST USE
vdel -lib  ./libs/lib_VHDL -all

vlib ./libs/lib_VHDL

vmap lib_VHDL ./libs/lib_VHDL

# Package
vcom -work lib_VHDL ./../../02_Source/TYPE_Pkg.vhd

# Utility
vcom -work lib_VHDL ./../../02_Source/Multiplier.vhd

# VGA
vcom -work lib_VHDL ./../../02_Source/VGA_Pkg.vhd
vcom -work lib_VHDL ./../../02_Source/VGA_controller.vhd
vcom -work lib_VHDL ./../../02_Source/VGA_interface.vhd

# FIR filters
vcom -work lib_VHDL ./../../02_Source/FIR_filter.vhd
vcom -work lib_VHDL ./../../02_Source/FIR_interface.vhd

# VU_metre
vcom -work lib_VHDL ./../../02_Source/VU_metre.vhd

# EQ
vcom -work lib_VHDL ./../../02_Source/EQ_volume_ctrl.vhd
vcom -work lib_VHDL ./../../02_Source/EQ_stage.vhd

# FFT
vcom -work lib_VHDL ./../../02_Source/FFT_FIFO.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_Adder.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_Multiplier.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_UAL.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_FSM.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_Wrapper.vhd

# I2S
vcom -work lib_VHDL ./../../02_Source/I2S_Emitter.vhd
vcom -work lib_VHDL ./../../02_Source/I2S_Receiver.vhd
vcom -work lib_VHDL ./../../02_Source/I2S_Wrapper.vhd
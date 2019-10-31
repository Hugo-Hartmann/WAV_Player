# In ModelSim
# do compil_VHDL.do

# Compile all files used in the ./../../02_Source/ folder in lib_VHDL library situated in libs/

# COMMENT THIS LINE BEFORE FIRST USE
vdel -lib  ./libs/lib_VHDL -all

vlib ./libs/lib_VHDL

vmap lib_VHDL ./libs/lib_VHDL

# VGA
vcom -work lib_VHDL ./../../02_Source/VGA_Pkg.vhd
vcom -work lib_VHDL ./../../02_Source/VGA_controller.vhd
vcom -work lib_VHDL ./../../02_Source/VGA_RAM_interface.vhd

# FIR filters
vcom -work lib_VHDL ./../../02_Source/Multiplier.vhd
vcom -work lib_VHDL ./../../02_Source/FIR_filter.vhd
vcom -work lib_VHDL ./../../02_Source/FIR_interface.vhd
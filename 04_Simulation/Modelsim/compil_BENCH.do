# In ModelSim
# do compil_BENCH.do

# Compile all files used in the ./../../03_Tests/ folder in lib_BENCH library situated in libs/

# COMMENT THIS LINE BEFORE FIRST USE
vdel -lib  ./libs/lib_BENCH -all

vlib ./libs/lib_BENCH

vmap lib_BENCH ./libs/lib_BENCH 

# Stimuli for VGA_RAM interface
vcom -work lib_BENCH ./../../03_Tests/VGA_RAM_wrapper.vhd

# Stimuli for FFT_UAL
vcom -work lib_BENCH ./../../03_Tests/FFT_UAL_tb.vhd

# Stimuli for I2S_Wrapper
vcom -work lib_BENCH ./../../03_Tests/I2S_Wrapper_tb.vhd
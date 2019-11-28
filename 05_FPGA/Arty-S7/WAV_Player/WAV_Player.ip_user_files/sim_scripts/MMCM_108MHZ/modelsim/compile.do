vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../ipstatic" \
"C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../ipstatic" \
"../../../../WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ_clk_wiz.v" \
"../../../../WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ.v" \

vlog -work xil_defaultlib \
"glbl.v"


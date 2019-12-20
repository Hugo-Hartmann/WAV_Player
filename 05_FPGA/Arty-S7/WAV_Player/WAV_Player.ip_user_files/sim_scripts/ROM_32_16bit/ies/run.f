-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/dist_mem_gen_v8_0_12 \
  "../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../WAV_Player.srcs/sources_1/ip/ROM_32_16bit/sim/ROM_32_16bit.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


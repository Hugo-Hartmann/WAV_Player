-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../bd/EQ/ip/EQ_EQ_stage_0_0/sim/EQ_EQ_stage_0_0.vhd" \
  "../../../bd/EQ/sim/EQ.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


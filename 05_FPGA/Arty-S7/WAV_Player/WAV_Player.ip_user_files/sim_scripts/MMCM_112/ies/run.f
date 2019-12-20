-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx2/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../WAV_Player.srcs/sources_1/ip/MMCM_112/MMCM_112_clk_wiz.v" \
  "../../../../WAV_Player.srcs/sources_1/ip/MMCM_112/MMCM_112.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib


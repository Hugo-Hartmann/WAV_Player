# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param xicom.use_bs_reader 1
set_msg_config  -id {Synth 8-3331}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -suppress 
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/wt [current_project]
set_property parent.project_path C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part_repo_paths {C:/Users/hhartmann/Downloads/vivado-boards-master/vivado-boards-master/new/board_files} [current_project]
set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_20_60.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_60_250.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_250_1500.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_1500_4000.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_4000_7000.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FIR_coe/FIR_7000_11024.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/EQ_coef.coe
add_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_512.coe
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/WAV_Player_synth_1/WAV_Player.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/WAV_Player_synth_1/WAV_Player.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/RAM_Wrapper_synth_1/RAM_Wrapper.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/RAM_Wrapper_synth_1/RAM_Wrapper.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_stage_synth_1/EQ_stage.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_stage_synth_1/EQ_stage.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp]
add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp]
read_vhdl -library lib_VHDL {
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/TYPE_Pkg.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/TOP_Arty.vhd
}
read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ.xdc]
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_8bit/BRAM_2048_8bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_8bit/BRAM_2048_8bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_22050_8bit/RAM_22050_8bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_22050_8bit/RAM_22050_8bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FFT_SQRT/FFT_SQRT.xci

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_256_32bit/ROM_256_32bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_256_32bit/ROM_256_32bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_32bit/BRAM_512_32bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_32bit/BRAM_512_32bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_16bit/BRAM_512_16bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_16bit/BRAM_512_16bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/Contraintes_Arty.xdc
set_property used_in_implementation false [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/Contraintes_Arty.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top TOP -part xc7s50csga324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef TOP.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file TOP_utilization_synth.rpt -pb TOP_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

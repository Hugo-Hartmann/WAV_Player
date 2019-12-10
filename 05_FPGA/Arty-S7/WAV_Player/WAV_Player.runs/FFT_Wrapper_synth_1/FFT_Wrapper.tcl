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
set_msg_config  -id {Synth 8-3331}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -suppress 
set_param project.vivado.isBlockSynthRun true
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
read_vhdl -library xil_defaultlib {
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_Adder.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_FIFO.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_FSM.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_Multiplier.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_RAM_Wrapper.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_UAL.vhd
  C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/FFT_Wrapper.vhd
}
read_vhdl -library lib_VHDL C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/Multiplier.vhd
read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_256_32bit/ROM_256_32bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_256_32bit/ROM_256_32bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_32bit/BRAM_512_32bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_32bit/BRAM_512_32bit_ooc.xdc]

read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_16bit/BRAM_512_16bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_16bit/BRAM_512_16bit_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top FFT_Wrapper -part xc7s50csga324-1 -mode out_of_context

rename_ref -prefix_all FFT_Wrapper_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef FFT_Wrapper.dcp
create_report "FFT_Wrapper_synth_1_synth_report_utilization_0" "report_utilization -file FFT_Wrapper_utilization_synth.rpt -pb FFT_Wrapper_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

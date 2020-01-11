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
set_property webtalk.parent_dir C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/wt [current_project]
set_property parent.project_path C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library lib_VHDL {
  C:/Users/hugoh/Documents/GitHub/WAV_Player/02_Source/FIR_filter.vhd
  C:/Users/hugoh/Documents/GitHub/WAV_Player/02_Source/FIR_interface.vhd
  C:/Users/hugoh/Documents/GitHub/WAV_Player/02_Source/TYPE_Pkg.vhd
}
read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu_s43/Accu_s43.xci

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_s16_s16/Multiplier_s16_s16.xci

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5_ooc.xdc]

read_ip -quiet C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_16bit/RAM_2048_16bit.xci
set_property used_in_implementation false [get_files -all c:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_16bit/RAM_2048_16bit_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc -mode out_of_context C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/FIR_interface/new/FIR_interface_ooc.xdc
set_property used_in_implementation false [get_files C:/Users/hugoh/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/FIR_interface/new/FIR_interface_ooc.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top FIR_interface -part xc7s50csga324-1 -mode out_of_context

rename_ref -prefix_all FIR_interface_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef FIR_interface.dcp
create_report "FIR_interface_synth_1_synth_report_utilization_0" "report_utilization -file FIR_interface_utilization_synth.rpt -pb FIR_interface_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]

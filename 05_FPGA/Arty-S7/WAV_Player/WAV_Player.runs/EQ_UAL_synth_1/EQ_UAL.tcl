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
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config  -id {Synth 8-3331}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -suppress 
set_param project.vivado.isBlockSynthRun true
create_project -in_memory -part xc7s50csga324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/wt [current_project]
set_property parent.project_path C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
set_property ip_output_repo c:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library lib_VHDL C:/Users/Hugo/Documents/GitHub/WAV_Player/02_Source/TYPE_Pkg.vhd
read_vhdl -library xil_defaultlib C:/Users/Hugo/Documents/GitHub/WAV_Player/02_Source/EQ/EQ_UAL.vhd
read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_u16_s19/Multiplier_u16_s19.xci

read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit.xci
set_property used_in_implementation false [get_files -all c:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc -mode out_of_context C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_UAL/new/EQ_UAL_ooc.xdc
set_property used_in_implementation false [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_UAL/new/EQ_UAL_ooc.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top EQ_UAL -part xc7s50csga324-1 -mode out_of_context

rename_ref -prefix_all EQ_UAL_

# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef EQ_UAL.dcp
create_report "EQ_UAL_synth_1_synth_report_utilization_0" "report_utilization -file EQ_UAL_utilization_synth.rpt -pb EQ_UAL_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
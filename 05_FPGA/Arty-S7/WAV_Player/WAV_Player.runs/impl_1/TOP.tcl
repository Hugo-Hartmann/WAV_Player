# 
# Report generation script generated by Vivado
# 

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
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
set_msg_config  -id {Synth 8-3331}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -suppress 
set_msg_config  -id {Vivado 12-4473}  -string {{ERROR: [Vivado 12-4473] Detected error while running simulation. Please correct the issue and retry this operation.}}  -suppress 
set_msg_config  -id {USF-XSim-62}  -string {{ERROR: [USF-XSim-62] 'compile' step failed with error(s). Please check the Tcl console output or 'C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.sim/sim_1/behav/xsim/xvhdl.log' file for more information.}}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7s50csga324-1
  set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/wt [current_project]
  set_property parent.project_path C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.xpr [current_project]
  set_property ip_output_repo C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/synth_1/TOP.dcp
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM/MMCM.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_112/MMCM_112.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_4096_8bit/RAM_4096_8bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu_u20/Accu_u20.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FIFO_16bit_1024/FIFO_16bit_1024.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FIFO_8bit_2048/FIFO_8bit_2048.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FIFO_32bit/FIFO_32bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_8bit/BRAM_2048_8bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_u16_s19/Multiplier_u16_s19.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_7/ROM_1024_16bit_7.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_6/ROM_1024_16bit_6.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu_s43/Accu_s43.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_s16_s16/Multiplier_s16_s16.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_8/ROM_1024_16bit_8.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_16bit/RAM_2048_16bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/NRM_SQRT/NRM_SQRT.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_s16_s16/Multiplier_s16_s16.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_32bit/BRAM_2048_32bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_16bit_NRM/RAM_2048_16bit_NRM.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu_s41/Accu_s41.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Multiplier_s16_s16/Multiplier_s16_s16.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_512_16bit/RAM_512_16bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_16x256_16bit/ROM_16x256_16bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FFT_FIFO/FFT_FIFO.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu11/Accu11.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/Accu10/Accu10.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_32bit/ROM_1024_32bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_32bit/BRAM_2048_32bit.xci
  read_ip -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_16bit/BRAM_2048_16bit.xci
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/I2S_Wrapper_synth_1/I2S_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/I2S_Wrapper_synth_1/I2S_Wrapper.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/PSH_Driver_synth_1/PSH_Driver.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/PSH_Driver_synth_1/PSH_Driver.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Audio_Interface_synth_1/Audio_Interface.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Audio_Interface_synth_1/Audio_Interface.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_Wrapper_synth_1/EQ_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_Wrapper_synth_1/EQ_Wrapper.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/CHN_Config_RAM_synth_1/CHN_Config_RAM.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/CHN_Config_RAM_synth_1/CHN_Config_RAM.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/NRM_Wrapper_synth_1/NRM_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/NRM_Wrapper_synth_1/NRM_Wrapper.dcp]
  add_files -quiet C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp]
  read_xdc -mode out_of_context C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_stage/new/EQ_stage_ooc.xdc
  read_xdc -mode out_of_context C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_FSM/new/EQ_FSM_ooc.xdc
  read_xdc -mode out_of_context C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_UAL/new/EQ_UAL_ooc.xdc
  read_xdc C:/Users/Hugo/Documents/GitHub/WAV_Player/02_Source/Contraintes_Arty.xdc
  read_xdc -mode out_of_context -ref I2S_Wrapper C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/I2S_Wrapper/new/I2S_Wrapper_ooc.xdc
  read_xdc -mode out_of_context -ref VU_metre C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/VU_metre/new/VU_metre_ooc.xdc
  read_xdc -mode out_of_context -ref PSH_Driver C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/PSH_Driver/new/PSH_Driver_ooc.xdc
  read_xdc -mode out_of_context -ref Audio_Interface C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/Audio_Interface/new/Audio_Interface_ooc.xdc
  read_xdc -mode out_of_context -ref VGA_interface C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/VGA_interface/new/VGA_interface_ooc.xdc
  read_xdc -mode out_of_context -ref UART_Wrapper C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/UART_Wrapper/new/UART_Wrapper_ooc.xdc
  read_xdc -mode out_of_context -ref Hearbeat C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/Hearbeat/new/Hearbeat_ooc.xdc
  read_xdc -mode out_of_context -ref VGA_Controller C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/VGA_Controller/new/VGA_Controller_ooc.xdc
  read_xdc -mode out_of_context -ref EQ_Wrapper C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/EQ_Wrapper/new/EQ_Wrapper_ooc.xdc
  read_xdc -mode out_of_context -ref CHN_Config_RAM C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/CHN_Config_RAM/new/CHN_Config_RAM_ooc.xdc
  read_xdc -mode out_of_context -ref FIR_interface C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/FIR_interface/new/FIR_interface_ooc.xdc
  read_xdc -mode out_of_context -ref NRM_Wrapper C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/NRM_Wrapper/new/NRM_Wrapper_ooc.xdc
  read_xdc -mode out_of_context -ref FFT_Wrapper C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/FFT_Wrapper/new/FFT_Wrapper_ooc.xdc
  link_design -top TOP -part xc7s50csga324-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force TOP_opt.dcp
  create_report "impl_1_opt_report_drc_0" "report_drc -file TOP_drc_opted.rpt -pb TOP_drc_opted.pb -rpx TOP_drc_opted.rpx"
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  if { [llength [get_debug_cores -quiet] ] > 0 }  { 
    implement_debug_core 
  } 
  place_design 
  write_checkpoint -force TOP_placed.dcp
  create_report "impl_1_place_report_io_0" "report_io -file TOP_io_placed.rpt"
  create_report "impl_1_place_report_utilization_0" "report_utilization -file TOP_utilization_placed.rpt -pb TOP_utilization_placed.pb"
  create_report "impl_1_place_report_control_sets_0" "report_control_sets -verbose -file TOP_control_sets_placed.rpt"
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force TOP_routed.dcp
  create_report "impl_1_route_report_drc_0" "report_drc -file TOP_drc_routed.rpt -pb TOP_drc_routed.pb -rpx TOP_drc_routed.rpx"
  create_report "impl_1_route_report_methodology_0" "report_methodology -file TOP_methodology_drc_routed.rpt -pb TOP_methodology_drc_routed.pb -rpx TOP_methodology_drc_routed.rpx"
  create_report "impl_1_route_report_power_0" "report_power -file TOP_power_routed.rpt -pb TOP_power_summary_routed.pb -rpx TOP_power_routed.rpx"
  create_report "impl_1_route_report_route_status_0" "report_route_status -file TOP_route_status.rpt -pb TOP_route_status.pb"
  create_report "impl_1_route_report_timing_summary_0" "report_timing_summary -max_paths 10 -file TOP_timing_summary_routed.rpt -pb TOP_timing_summary_routed.pb -rpx TOP_timing_summary_routed.rpx -warn_on_violation "
  create_report "impl_1_route_report_incremental_reuse_0" "report_incremental_reuse -file TOP_incremental_reuse_routed.rpt"
  create_report "impl_1_route_report_clock_utilization_0" "report_clock_utilization -file TOP_clock_utilization_routed.rpt"
  create_report "impl_1_route_report_bus_skew_0" "report_bus_skew -warn_on_violation -file TOP_bus_skew_routed.rpt -pb TOP_bus_skew_routed.pb -rpx TOP_bus_skew_routed.rpx"
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force TOP_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force TOP.mmi }
  write_bitstream -force TOP.bit -bin_file
  catch {write_debug_probes -quiet -force TOP}
  catch {file copy -force TOP.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}


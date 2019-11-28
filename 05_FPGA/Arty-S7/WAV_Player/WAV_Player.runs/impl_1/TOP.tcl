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

set_msg_config  -id {Synth 8-3331}  -suppress 
set_msg_config  -id {Constraints 18-5210}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  create_project -in_memory -part xc7s50csga324-1
  set_property board_part_repo_paths {C:/Users/hhartmann/Downloads/vivado-boards-master/vivado-boards-master/new/board_files} [current_project]
  set_property board_part digilentinc.com:arty-s7-50:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/wt [current_project]
  set_property parent.project_path C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.xpr [current_project]
  set_property ip_output_repo C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/synth_1/TOP.dcp
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/MMCM_108MHZ/MMCM_108MHZ.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_2048_8bit/BRAM_2048_8bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_22050_8bit/RAM_22050_8bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_32_16bit/ROM_32_16bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/FFT_SQRT/FFT_SQRT.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_256_32bit/ROM_256_32bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_32bit/BRAM_512_32bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/BRAM_512_16bit/BRAM_512_16bit.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_4/ROM_1024_16bit_4.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_3/ROM_1024_16bit_3.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_2/ROM_1024_16bit_2.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_1/ROM_1024_16bit_1.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_0/ROM_1024_16bit_0.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/ROM_1024_16bit_5/ROM_1024_16bit_5.xci
  read_ip -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.srcs/sources_1/ip/RAM_2048_8bit/RAM_2048_8bit.xci
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_Controller_synth_1/VGA_Controller.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/WAV_Player_synth_1/WAV_Player.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/WAV_Player_synth_1/WAV_Player.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VGA_interface_synth_1/VGA_interface.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/VU_metre_synth_1/VU_metre.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/UART_Wrapper_synth_1/UART_Wrapper.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/Hearbeat_synth_1/Hearbeat.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/RAM_Wrapper_synth_1/RAM_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/RAM_Wrapper_synth_1/RAM_Wrapper.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_stage_synth_1/EQ_stage.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/EQ_stage_synth_1/EQ_stage.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FFT_Wrapper_synth_1/FFT_Wrapper.dcp]
  add_files -quiet C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp
  set_property netlist_only true [get_files C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/05_FPGA/Arty-S7/WAV_Player/WAV_Player.runs/FIR_interface_synth_1/FIR_interface.dcp]
  read_xdc C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/Contraintes_Arty.xdc
  read_xdc -mode out_of_context -ref FIR_interface C:/Users/hhartmann/Desktop/svn_fpga/trunk/01_Projects/WAV_Player/02_Source/108_MHz.xdc
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


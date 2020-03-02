@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Mon Mar 02 23:44:10 +0100 2020
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim FFT_Wrapper_tb_behav -key {Behavioral:sim_1:Functional:FFT_Wrapper_tb} -tclbatch FFT_Wrapper_tb.tcl -view C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/FFT_Wrapper_tb_behav.wcfg -view C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/NRM_Wrapper_tb_behav.wcfg -view C:/Users/Hugo/Documents/GitHub/WAV_Player/05_FPGA/Arty-S7/WAV_Player/Audio_channel_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

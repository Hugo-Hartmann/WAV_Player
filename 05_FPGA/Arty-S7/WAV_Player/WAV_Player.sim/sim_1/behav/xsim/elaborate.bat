@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Tue Aug 25 12:14:25 +0200 2020
REM SW Build 2405991 on Thu Dec  6 23:38:27 MST 2018
REM
REM Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
call xelab  -wto 37fd109b609d49cfb97f45bdce1df4bf --incr --debug typical --relax --mt 2 -L xbip_utils_v3_0_9 -L c_reg_fd_v12_0_5 -L xbip_dsp48_wrapper_v3_0_4 -L xbip_pipe_v3_0_5 -L xbip_dsp48_addsub_v3_0_5 -L xbip_addsub_v3_0_5 -L c_addsub_v12_0_12 -L xbip_dsp48_acc_v3_0_5 -L xbip_accum_v3_0_5 -L c_accum_v12_0_12 -L xil_defaultlib -L xbip_bram18k_v3_0_5 -L mult_gen_v12_0_14 -L blk_mem_gen_v8_4_2 -L lib_VHDL -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot FFT_Filter_tb_behav xil_defaultlib.FFT_Filter_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0

# In ModelSim
# do GOL_controller_bench_gui.do PROFILE_TEST_NUMBER
# PROFILE_TEST_NUMBER = [0...N], see GOL_controller_bench_Pkg.vhd
# CHECK GRID SIZE IN GOL_Pkg.vhd

# Compile FFT
vcom -work lib_VHDL ./../../02_Source/FFT_FIFO.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_Adder.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_Multiplier.vhd
vcom -work lib_VHDL ./../../02_Source/FFT_UAL.vhd

# Compile testbench
vcom -work lib_BENCH ./../../03_Tests/FFT_UAL_tb.vhd

# Launch simulation
vsim -gui -t 100ps lib_BENCH.FFT_UAL_tb
add wave -noupdate /fft_ual_tb/clk
add wave -noupdate /fft_ual_tb/reset_n
add wave -noupdate -divider Outputs
add wave -noupdate -radix decimal /fft_ual_tb/FFT_doutA_r
add wave -noupdate -radix decimal /fft_ual_tb/FFT_doutA_i
add wave -noupdate -radix decimal /fft_ual_tb/FFT_doutB_r
add wave -noupdate -radix decimal /fft_ual_tb/FFT_doutB_i
add wave -noupdate /fft_ual_tb/FFT_done
add wave -noupdate -divider Inputs
add wave -noupdate /fft_ual_tb/FFT_en
add wave -noupdate -radix decimal /fft_ual_tb/FFT_dinA_r
add wave -noupdate -radix decimal /fft_ual_tb/FFT_dinA_i
add wave -noupdate -radix decimal /fft_ual_tb/FFT_dinB_r
add wave -noupdate -radix decimal /fft_ual_tb/FFT_dinB_i
add wave -noupdate -radix decimal /fft_ual_tb/FFT_coef_r
add wave -noupdate -radix decimal /fft_ual_tb/FFT_coef_i
add wave -noupdate -divider {Sub-signals UAL}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Adder_out_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Adder_out_i
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Sub_out_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Sub_out_i
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Sub_done
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Mult_coef_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/Mult_coef_i
add wave -noupdate -divider {Multipliers i/o}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/din_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/din_i
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/coef_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/coef_i
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_real
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_imag
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_imag_real
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_real_imag
add wave -noupdate -divider {Multipliers out (reg)}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/FFT_en_d
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_real_d
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_imag_d
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_imag_real_d
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/p_real_imag_d
add wave -noupdate -divider {Addition (mult module)}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/sum_real
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/sum_imag
add wave -noupdate -divider {Rounding (mult module)}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/round_real
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/round_Cin_r
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/round_imag
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/round_Cin_i
add wave -noupdate -divider {Saturation (mult module)}
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/sat_real
add wave -noupdate -radix decimal /fft_ual_tb/U_FFT_UAL/U_Multiplier/sat_imag

run -all

onerror {resume}
quietly WaveActivateNextPane {} 0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {194 ns}

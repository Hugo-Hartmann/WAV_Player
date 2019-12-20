onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Multiplier_u16_s16_opt

do {wave.do}

view wave
view structure
view signals

do {Multiplier_u16_s16.udo}

run -all

quit -force

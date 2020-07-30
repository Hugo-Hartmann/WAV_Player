onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Multiplier_u16_s19_opt

do {wave.do}

view wave
view structure
view signals

do {Multiplier_u16_s19.udo}

run -all

quit -force

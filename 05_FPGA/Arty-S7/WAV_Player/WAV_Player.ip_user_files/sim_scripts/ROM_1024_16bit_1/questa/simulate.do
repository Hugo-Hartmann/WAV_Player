onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROM_1024_16bit_1_opt

do {wave.do}

view wave
view structure
view signals

do {ROM_1024_16bit_1.udo}

run -all

quit -force

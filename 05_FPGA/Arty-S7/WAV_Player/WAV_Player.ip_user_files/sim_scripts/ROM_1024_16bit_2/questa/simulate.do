onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROM_1024_16bit_2_opt

do {wave.do}

view wave
view structure
view signals

do {ROM_1024_16bit_2.udo}

run -all

quit -force

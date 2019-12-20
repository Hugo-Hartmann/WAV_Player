onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ROM_32_16bit_opt

do {wave.do}

view wave
view structure
view signals

do {ROM_32_16bit.udo}

run -all

quit -force

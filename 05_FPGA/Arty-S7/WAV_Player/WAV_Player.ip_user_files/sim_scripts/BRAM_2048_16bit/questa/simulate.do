onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BRAM_2048_16bit_opt

do {wave.do}

view wave
view structure
view signals

do {BRAM_2048_16bit.udo}

run -all

quit -force

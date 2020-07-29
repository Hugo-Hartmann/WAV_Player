onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FIFO_16bit_1024_opt

do {wave.do}

view wave
view structure
view signals

do {FIFO_16bit_1024.udo}

run -all

quit -force

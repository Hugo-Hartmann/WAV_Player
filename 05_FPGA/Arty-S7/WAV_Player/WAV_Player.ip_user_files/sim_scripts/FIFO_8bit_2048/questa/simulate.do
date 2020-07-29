onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FIFO_8bit_2048_opt

do {wave.do}

view wave
view structure
view signals

do {FIFO_8bit_2048.udo}

run -all

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FFT_FIFO_opt

do {wave.do}

view wave
view structure
view signals

do {FFT_FIFO.udo}

run -all

quit -force

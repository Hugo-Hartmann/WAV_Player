onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib RAM_4096_8bit_opt

do {wave.do}

view wave
view structure
view signals

do {RAM_4096_8bit.udo}

run -all

quit -force

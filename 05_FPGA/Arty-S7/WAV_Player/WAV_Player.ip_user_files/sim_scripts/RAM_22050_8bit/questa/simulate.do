onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib RAM_22050_8bit_opt

do {wave.do}

view wave
view structure
view signals

do {RAM_22050_8bit.udo}

run -all

quit -force

onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib RAM_512_16bit_opt

do {wave.do}

view wave
view structure
view signals

do {RAM_512_16bit.udo}

run -all

quit -force

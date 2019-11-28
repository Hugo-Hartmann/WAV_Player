onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BRAM_512_32bit_opt

do {wave.do}

view wave
view structure
view signals

do {BRAM_512_32bit.udo}

run -all

quit -force

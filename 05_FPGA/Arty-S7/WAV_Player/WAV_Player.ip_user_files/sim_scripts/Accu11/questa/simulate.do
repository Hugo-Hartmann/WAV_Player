onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Accu11_opt

do {wave.do}

view wave
view structure
view signals

do {Accu11.udo}

run -all

quit -force

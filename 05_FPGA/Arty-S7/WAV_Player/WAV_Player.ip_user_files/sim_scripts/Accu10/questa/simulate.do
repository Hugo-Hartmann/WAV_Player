onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Accu10_opt

do {wave.do}

view wave
view structure
view signals

do {Accu10.udo}

run -all

quit -force

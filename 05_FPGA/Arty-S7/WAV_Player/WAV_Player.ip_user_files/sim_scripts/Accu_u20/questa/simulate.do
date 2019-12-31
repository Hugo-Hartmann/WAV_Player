onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Accu_u20_opt

do {wave.do}

view wave
view structure
view signals

do {Accu_u20.udo}

run -all

quit -force

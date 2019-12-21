onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Accu_u27_opt

do {wave.do}

view wave
view structure
view signals

do {Accu_u27.udo}

run -all

quit -force

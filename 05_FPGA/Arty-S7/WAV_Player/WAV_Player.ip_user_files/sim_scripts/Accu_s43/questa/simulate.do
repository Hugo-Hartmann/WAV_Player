onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Accu_s43_opt

do {wave.do}

view wave
view structure
view signals

do {Accu_s43.udo}

run -all

quit -force

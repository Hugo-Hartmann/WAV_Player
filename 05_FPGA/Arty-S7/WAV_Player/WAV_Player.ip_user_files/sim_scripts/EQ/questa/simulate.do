onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib EQ_opt

do {wave.do}

view wave
view structure
view signals

do {EQ.udo}

run -all

quit -force

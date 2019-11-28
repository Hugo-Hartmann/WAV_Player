onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FIR_opt

do {wave.do}

view wave
view structure
view signals

do {FIR.udo}

run -all

quit -force

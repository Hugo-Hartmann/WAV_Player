onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib NRM_SQRT_opt

do {wave.do}

view wave
view structure
view signals

do {NRM_SQRT.udo}

run -all

quit -force

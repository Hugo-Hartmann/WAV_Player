onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MMCM_108MHZ_opt

do {wave.do}

view wave
view structure
view signals

do {MMCM_108MHZ.udo}

run -all

quit -force

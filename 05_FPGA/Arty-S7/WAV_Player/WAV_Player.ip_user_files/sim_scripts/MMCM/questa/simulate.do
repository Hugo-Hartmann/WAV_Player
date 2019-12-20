onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MMCM_opt

do {wave.do}

view wave
view structure
view signals

do {MMCM.udo}

run -all

quit -force

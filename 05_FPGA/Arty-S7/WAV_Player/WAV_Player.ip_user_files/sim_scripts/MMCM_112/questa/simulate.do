onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib MMCM_112_opt

do {wave.do}

view wave
view structure
view signals

do {MMCM_112.udo}

run -all

quit -force

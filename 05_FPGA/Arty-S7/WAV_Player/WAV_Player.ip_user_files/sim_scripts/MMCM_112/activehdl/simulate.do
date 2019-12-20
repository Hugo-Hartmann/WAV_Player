onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+MMCM_112 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.MMCM_112 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {MMCM_112.udo}

run -all

endsim

quit -force

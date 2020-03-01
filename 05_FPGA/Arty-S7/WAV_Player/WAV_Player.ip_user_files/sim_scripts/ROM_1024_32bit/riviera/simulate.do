onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ROM_1024_32bit -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ROM_1024_32bit xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ROM_1024_32bit.udo}

run -all

endsim

quit -force

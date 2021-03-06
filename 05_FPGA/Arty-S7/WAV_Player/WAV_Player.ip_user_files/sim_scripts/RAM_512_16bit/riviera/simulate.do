onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+RAM_512_16bit -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.RAM_512_16bit xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {RAM_512_16bit.udo}

run -all

endsim

quit -force

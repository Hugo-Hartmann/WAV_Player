onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+BRAM_2048_32bit -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.BRAM_2048_32bit xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {BRAM_2048_32bit.udo}

run -all

endsim

quit -force

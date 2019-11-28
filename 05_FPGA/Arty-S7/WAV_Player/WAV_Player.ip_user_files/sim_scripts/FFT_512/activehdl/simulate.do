onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+FFT_512 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.FFT_512 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {FFT_512.udo}

run -all

endsim

quit -force

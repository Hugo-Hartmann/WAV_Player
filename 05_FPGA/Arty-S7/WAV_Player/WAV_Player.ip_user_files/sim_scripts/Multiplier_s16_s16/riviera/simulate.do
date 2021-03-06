onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+Multiplier_s16_s16 -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.Multiplier_s16_s16 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {Multiplier_s16_s16.udo}

run -all

endsim

quit -force

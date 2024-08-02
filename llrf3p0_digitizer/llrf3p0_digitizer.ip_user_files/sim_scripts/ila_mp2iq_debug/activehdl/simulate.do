onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+ila_mp2iq_debug -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.ila_mp2iq_debug xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {ila_mp2iq_debug.udo}

run -all

endsim

quit -force

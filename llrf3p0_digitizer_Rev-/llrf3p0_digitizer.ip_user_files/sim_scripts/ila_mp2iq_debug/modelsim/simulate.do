onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ila_mp2iq_debug xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ila_mp2iq_debug.udo}

run -all

quit -force

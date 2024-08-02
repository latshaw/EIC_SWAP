onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ila_mp2iq_debug_opt

do {wave.do}

view wave
view structure
view signals

do {ila_mp2iq_debug.udo}

run -all

quit -force

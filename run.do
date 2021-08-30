transcript off 

vcom Detector000.vhd
vcom Detector1010.vhd
vcom Detector11011.vhd
vcom Detector1001.vhd
vcom testbench.vhd
vsim test_detector 
add wave sim:/test_detector/*
run 3500 ps

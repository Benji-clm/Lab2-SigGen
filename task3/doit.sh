#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sigdelay.vcd

~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace sigdelay.sv counter.sv dualram.sv --exe sigdelay_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

# run executable simulation file
obj_dir/Vsigdelay
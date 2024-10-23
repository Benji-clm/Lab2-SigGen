#!/bin/sh

# cleanup
rm -rf obj_dir
rm -f sinegen.vcd

~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# run Verilator to translate Verilog into C++, including C++ testbench
verilator -Wall --cc --trace sinegen.sv counter.sv rom.sv --exe sinegen_tb.cpp

# build C++ project via make automatically generated by Verilator
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# run executable simulation file
obj_dir/Vsinegen
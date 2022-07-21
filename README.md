# RedPitayaHelloWorldVHDL
Hello World code in VHDL for the RedPitaya board

Luis Villaseñor

License: GPLv3

Date: 2016-03-11



# Usage

Create a new project with Vivado (tested with Vivado v2015.4) 

see http://www.xilinx.com/support/download.html


Add the code to a new project and proceed to run Synthesis, Implementation and Bitstream Generation

The *.bit file generated can be converted to *.bin format with the fpga_bit_to_bin.py script taken from 

https://github.com/topic-embedded-products/meta-topic/blob/master/recipes-bsp/fpga/fpga-bit-to-bin

Transfer the HelloWorld.bin to the Red Pitaya and type

cat HelloWorld.bin > /dev/xdevcfg

The 8-bit LEDs will display a binary incremental counter at a rate of 1Hz

Reboot the Red Pitaya board to reinstall the permanent bitstream on the Zynq FPGA


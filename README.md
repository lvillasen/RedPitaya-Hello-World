# RedPitaya-Hello-World
Simple project for the RedPitaya board that illustrates the use of standard IPs from Vivado in combination with a module written in Verilog



Date: 2016-03-11

Updated: 2022-08-13



# Usage

Clone the repositiry

Create a new project with Vivado (tested with Vivado v2019.1) 

see https://www.xilinx.com/support/download.html

Select the device xc7z010clg400-1 

Add the verilog (.v) and the constraints (.xdc) files from the repository according to the block design shown in the screenshot provided. 

In 'Sources' go to 'IP Sources' right-click on 'project1' and select 'Create HDL Wraper'

Proceed to run Synthesis, Implementation and Bitstream Generation

Find the bitstream file (you may use the command 'find . -name *bit')

Transfer the bitstream file generated (*.bit)  to the Red Pitaya (you may use sftp root@rp-ip, put *.bit)

Connect to the RedPitaya (ssh root@rp-ip)

Program the FPGA (cat file_name.bit > /dev/xdevcfg)

The 8-bit LEDs will display a binary incremental counter at a rate of 1Hz

You may change the clock rate by editing the verilog counter module provided.

Reboot the Red Pitaya board to reinstall the permanent bitstream on the Zynq FPGA


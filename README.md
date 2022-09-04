# RedPitaya-Hello-World

## 1. Binary Counter Displayed on the LEDs

Simple project for the RedPitaya board that illustrates the use of standard IPs from Vivado in combination with a module written in Verilog

Date: 2016-03-11

Updated: 2022-08-13


### Usage

- Clone the repositiry

- Create a new project with Vivado (tested with Vivado v2019.1) see https://www.xilinx.com/support/download.html

- Select the device xc7z010clg400-1 

- Add the constraint *Hello-World.xdc* and verilog *counter.c*  files from the repository.

- Create a new Block Design according to the block shown in Block_Design.png. Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options. Add Module counter.v from the menu. Add a Binary Counter from thr *Add IP* menu. Add a port called led_o  with components from 7 down to 0.

- In 'Sources' go to 'IP Sources' right-click on 'project1' and select 'Create HDL Wraper'

- Proceed to run Synthesis, Implementation and Bitstream Generation

- Find the bitstream file (you may use the command 'find . -name *bit')

- Transfer the bitstream file (*.bit)  to the Red Pitaya (you may use *sftp root@rp-ip and put *.bit)

- Connect to the RedPitaya (*ssh root@rp-ip*)

- Program the FPGA with the command *cat file_name.bit > /dev/xdevcfg*

- The 8-bit LEDs will display a binary incremental counter at a rate of 1Hz

- You may change the clock rate by editing the verilog *counter.v* code.

- Reboot the Red Pitaya board to reinstall the permanent bitstream on the Zynq FPGA

## 2. Trigger Counter Displayed on the LEDs

### Usage

- Clone the repositiry

- Create a new project with Vivado (tested with Vivado v2019.1) see https://www.xilinx.com/support/download.html

- Select the device xc7z010clg400-1 

- Add the constraint *Hello-World.xdc* and verilog *counter.c*  files from the repository.

- Create a new Block Design according to the block shown in Fig. 1 Binary_Counter. 

- Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options

- In 'Sources' go to 'IP Sources' right-click on 'project1' and select 'Create HDL Wraper'

- Proceed to run Synthesis, Implementation and Bitstream Generation

- Find the bitstream file generated (you may use the command 'find . -name *bit')

- Transfer the bitstream file  (*.bit)  to the Red Pitaya (you may use *sftp root@rp-ip and put *.bit)

- Connect to the RedPitaya (*ssh root@rp-ip*)

- Program the FPGA with the command *cat file_name.bit > /dev/xdevcfg*

- The 8-bit LEDs will display a binary incremental counter at a rate of 1Hz

- You may change the clock rate by editing the verilog *counter.v* code.

- Reboot the Red Pitaya board to reinstall the permanent bitstream on the Zynq FPGA

- 

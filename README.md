# RedPitaya-Hello-World

Simple projects for the RedPitaya board that illustrate the use of standard IPs from Vivado in combination with modules written in Verilog.

## 1. Binary Counter Displayed on the LEDs


### Usage

- Clone the repositiry

- Create a new project with Vivado (tested with Vivado v2019.1) see https://www.xilinx.com/support/download.html

- Select the device xc7z010clg400-1 

- Add the constraint *redpitaya.xdc* and verilog *counter.c*  files from the repository.

- Create a new Block Design according to the block shown in Fig. 1.Binary_Counter. Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options. Add Module counter.v from the menu. Add a Binary Counter from thr *Add IP* menu. Add a port called led_o  with components from 7 down to 0.

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

- Add the constraint *redpitaya.xdc* and verilog *trigger.c*  files from the repository.

- Create a new Block Design according to the block shown in Fig. 2.Trigger_Counter. 

-  Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options. 
-  Add the IP called *AXI GPIO*. Enable *Dual Channel* and set GPIO 2 to *All Inputs* as shown in Fig. 2.AXI_GPIO.png. 
-  Run *Connection Automation* withh all options selected. Delete the *gpio-RTL_0* and *gpio-RTL_1* ports. to obtain the diagram shown in Fig. 2.AXI_GPIO_Diagram.png. 
-  From the menu Add Module add trigger. 
-  From the Add IP menu add *Utility Buffer* and rigth-click on the plus sign to display the differential IBUF_DS_P and IBUF_DS_N inputs. 
-  From the *Create Port* menu add the 3 input ports shown in Fig. 2.Trigger.png. and make the wire connections shown.

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

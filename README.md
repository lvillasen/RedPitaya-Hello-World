# RedPitaya-Hello-World

Simple projects for the RedPitaya board that illustrate the use of standard IPs from Vivado in combination with modules written in Verilog.

## 1. Binary Counter Displayed on the LEDs


### Usage

- Clone the repositiry

- Create a new project with Vivado (tested with Vivado v2019.1) see https://www.xilinx.com/support/download.html

- Select the device xc7z010clg400-1 

- Add the constraint *redpitaya.xdc* and verilog *counter.c*  files from the repository.

- Create a new Block Design according to the following instructions to creat a block diagram similar to Fig. 1.Binary_Counter. 
- Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options. 
- Add Module counter.v from the menu. 
- Add a Binary Counter from thr *Add IP* menu. 
- Add a port called led_o  with components from 7 down to 0.
- From the menu click on *Validate Design*

- In 'Sources' go to 'IP Sources' right-click on 'project1' and select 'Create HDL Wraper'

- Proceed to run Synthesis, Implementation and Bitstream Generation

- Find the bitstream file (you may use the command 'find . -name *bit')

- Transfer the bitstream file (*.bit)  to the Red Pitaya (you may use *sftp root@rp-ip and put *.bit)

- Connect to the RedPitaya (*ssh root@rp-ip*)

- Program the FPGA with the command *cat file_name.bit > /dev/xdevcfg*

- The 8-bit LEDs will display a binary incremental counter at a rate of 1Hz

- You may change the clock rate by editing the verilog *counter.v* code.

- Reboot the RedPitaya board or *cat fpga_0.94.bit > /dev/xdevcfg*to reinstall the official bitstream on the Zynq FPGA.

## 2. Trigger Counter Displayed on the LEDs

### Usage

- Clone the repositiry

- Create a new project with Vivado (tested with Vivado v2019.1) see https://www.xilinx.com/support/download.html

- Select the device xc7z010clg400-1 

- Add the constraint *redpitaya.xdc* and verilog *trigger.c*  files from the repository.

- Create a new Block Design according to the block shown in Fig. 2.Trigger_Counter. 

-  Add the IP called *ZYNQ7 Processing System* from the menu and *Run Block Automation* with default options. 
-  Add the IP called *AXI GPIO*. Enable *Dual Channel* and set GPIO 2 to *All Inputs* with a width of 14 as shown in Fig. 2.AXI_GPIO.png.
-  Run *Connection Automation* with all options selected. Delete the *gpio-RTL_0* and *gpio-RTL_1* ports. 
-  From the menu Add Module add trigger. 
-  From the Add IP menu add *Utility Buffer* and rigth-click on the plus sign to display the differential IBUF_DS_P and IBUF_DS_N inputs. 
-  From the *Create Port* menu add the 3 input ports and the led_o output shown in Fig. 2.Trigger_Counter.png. and make the wire connections shown.

- Note that the base address for the AXI_GPIO is 0x4120_0000, as shown in Fig. 2.Address_Editor.png. We will use this number to communicate to the PL from the PS.
- From the menu click on *Validate Design*

- In 'Sources' go to 'IP Sources' right-click on 'project1' and select 'Create HDL Wraper'

- Proceed to run Synthesis, Implementation and Bitstream Generation

- Find the bitstream file generated (it is the file with *bit' termination in the ProjectName.runs/impl_1 folder)

- Transfer the bitstream file to the Red Pitaya (you may use *sftp root@rp-ip and the *put* command line)

- Connect to the RedPitaya (*ssh root@rp-ip*)

- Program the FPGA with the command *cat file_name.bit > /dev/xdevcfg*

Now we read the baseline of the ADC-a by using the command line on the RedPitaya using the base address of the AXI_GPIO bus

``` monitor 0x41200008 ```
- In my case I get 0x00002067

Next you can set the treshold a few adc counts from the baseline voltage 

``` monitor 0x41200000 0x2060```

and you should see the LEDs display in binary the number of trigger signals due to small fluctuations of the baseline.

- Reboot the RedPitaya board or *cat fpga_0.94.bit > /dev/xdevcfg* to reinstall the official bitstream on the Zynq FPGA.


# Adapted from https://github.com/pavel-demin/red-pitaya-notes/blob/master/cfg/ports.xdc
# For more information see  http://www.redpitaya.com

############################################################################
# IO constraints                                                           #
############################################################################

### CLOCK

set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports clk_p_i]
set_property IOSTANDARD DIFF_HSTL_I_18 [get_ports clk_n_i]
set_property PACKAGE_PIN U18           [get_ports clk_p_i]
set_property PACKAGE_PIN U19           [get_ports clk_n_i]

### LEDs
set_property IOSTANDARD LVCMOS33 [get_ports {led_o[*]}]
set_property SLEW       SLOW     [get_ports {led_o[*]}]
set_property DRIVE      4        [get_ports {led_o[*]}]

set_property PACKAGE_PIN F16     [get_ports {led_o[0]}]
set_property PACKAGE_PIN F17     [get_ports {led_o[1]}]
set_property PACKAGE_PIN G15     [get_ports {led_o[2]}]
set_property PACKAGE_PIN H15     [get_ports {led_o[3]}]
set_property PACKAGE_PIN K14     [get_ports {led_o[4]}]
set_property PACKAGE_PIN G14     [get_ports {led_o[5]}]
set_property PACKAGE_PIN J15     [get_ports {led_o[6]}]
set_property PACKAGE_PIN J14     [get_ports {led_o[7]}]

############################################################################
# Clock constraints                                                        #
############################################################################

create_clock -period 8.000 -name clk_125MHz [get_ports clk_p_i]

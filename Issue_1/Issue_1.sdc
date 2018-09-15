derive_clock_uncertainty
create_clock -name clk [get_ports {clk}] -period 300MHz 
#set_false_path -from [get_registers {led*}] -to [get_ports {led}]
#set_false_path -from [get_clocks {clk}] -to [get_ports {led}]
set_false_path -from [all_clocks] -to [get_ports {led}]
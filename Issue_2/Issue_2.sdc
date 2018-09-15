derive_clock_uncertainty
create_clock -name {clk} [get_ports clk] -period 100MHz
create_clock -name {sclk} [get_ports sclk] -period 10MHz
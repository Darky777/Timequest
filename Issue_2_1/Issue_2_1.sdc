derive_clock_uncertainty
create_clock -name clk_i -period 100MHz [get_ports clk_i]
set clk_pll i_pll_2x|altpll_component|auto_generated|pll1|clk[0] 

derive_pll_clocks

set_clock_groups -exclusive -group [list $clk_pll clk_i]
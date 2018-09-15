module Issue_1 (
    input        clk,
    output logic led
);

logic [15:0 ] cnt_low,cnt_high;

always_ff @(posedge clk) begin 
    cnt_low <= cnt_low + 1'b1;
end
always_ff @(posedge clk) begin
    if(cnt_low == 16'hFFFF) begin
        cnt_high <= cnt_high + 1'b1;
    end
    led <= cnt_high[15:0];
end




endmodule
	
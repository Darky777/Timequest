module Issue_2 (
    input        clk , // Clock
    input        cs_n,
    input        sdi ,
    input        sclk,
    output logic led
);

    /*------------------------------------------------------------------------------
    --  spi clock domain
    ------------------------------------------------------------------------------*/
    logic [15:0] sdata;

    always_ff @(posedge sclk) begin : proc_sdata
        if(!cs_n) begin
            sdata <= {sdata[14:0],sdi};
        end
    end

    /*------------------------------------------------------------------------------
    --  system clock domain
    ------------------------------------------------------------------------------*/
    logic latch;
    logic [2:0] cs_reg;
    logic [15:0] level,cnt;

    always_ff @(posedge clk) begin : proc_cs_reg
        cs_reg <= {cs_reg[1:0],cs_n};
    end
    
    assign latch = ~cs_reg[2] & cs_reg[1];

    always_ff @(posedge clk) begin : proc_level
        
        if(latch) begin
            level <= sdata;
        end

        cnt <= cnt + 1'b1;
        led <= cnt < level;

    end
    
endmodule

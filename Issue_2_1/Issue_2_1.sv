module Issue_2_1 (
    // inp
    input           clk_i    ,
    input  shortint data_re_i,
    input  shortint data_im_i,
    // out
    output shortint data_o   ,
    output logic    re_p_im_o
);


    logic inclk0;
    wire clk_2x;
    wire locked;
    pll_2x i_pll_2x (.inclk0(clk_i), .c0(clk_2x), .locked(locked));

    shortint data_int_re,data_int_im;
    always_ff @(posedge clk_i) begin : proc_data_int
       data_int_re <= data_re_i;
       data_int_im <= data_im_i;
    end
    

    logic ff;
    always_ff @(posedge clk_2x) begin : proc_ff
        ff <= !ff;
    end

    always_ff @(posedge clk_2x) begin : proc_data_o
        data_o    <= ff ? data_int_re : data_int_im;
        re_p_im_o <= ff;
    end

endmodule
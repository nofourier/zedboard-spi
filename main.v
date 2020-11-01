module main(
    input clk,
    //input reset,
    //input send,
    //input slave_select,
    //input [2:0] data,
    input [7:0] switch,
    
    output [7:0] led
);

//wire [2:0] reg_t;

integer internal_count;
reg clk_slow;

assign led[7] = clk_slow;

always @(posedge clk) begin
    if (switch[3]) begin 
        internal_count = 0;
        clk_slow = 1;
    end else if (internal_count <= 25000000) begin
        internal_count = internal_count + 1;
    end else begin
        clk_slow = ~clk_slow;
        internal_count = 0;
    end
    
end

master master_test (.clka(clk_slow), .reset(switch[3]), .send(switch[5]), .data(switch[2:0]), .MOSI(led[0]));
slave1 slave1_test (.clkb(clk_slow), .reset(switch[3]), .send(switch[5]), .slave_select(switch[4]), .MOSI(led[0]), .led_r(led[3:1]));
slave2 slave2_test (.clkb(clk_slow), .reset(switch[3]), .send(switch[5]), .slave_select(switch[4]), .MOSI(led[0]), .led_r(led[6:4]));

endmodule
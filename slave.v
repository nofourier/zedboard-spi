
module slave1(
    input clkb,
    input reset,
    input send,
    input slave_select,
    input MOSI,
    
    output reg [2:0] led_r
    );
integer count;

always @(posedge clkb or posedge reset) begin
    if (reset) begin
        led_r <= 3'b000;
        count <= 0;
    end else if (send && slave_select && (count != 4)) begin
        led_r <= (MOSI << 2) + (led_r >> 1);
        count <= count + 1;
/*    end else if (send && slave_select && (count == 1)) begin
        led_r[2] <= MOSI;
        led_r[1] <= led_r[2];
        led_r[0] <= led_r[1];
        count <= count + 1;
    end else if (send && slave_select && (count == 2)) begin
        led_r[2] <= MOSI;
        led_r[1] <= led_r[2];
        led_r[0] <= led_r[1];

        count <= count + 1; */
    end else if (!send) begin
        count <= 0;
    end
end

endmodule

module slave2(
    input clkb,
    input reset,
    input send,
    input slave_select,
    input MOSI,
    
    output reg [2:0] led_r
    );
integer count;

always @(posedge clkb or posedge reset) begin
    if (reset) begin
        led_r <= 3'b000;
        count <= 0;
    end else if (send && !slave_select && (count != 4)) begin
        led_r <= (MOSI << 2) + (led_r >> 1);
        count <= count + 1;
/*    end else if (send && !slave_select && (count == 1)) begin
        led_r[2] <= MOSI;
        led_r[1] <= led_r[2];
        led_r[0] <= led_r[1];
        count <= count + 1;
    end else if (send && !slave_select && (count == 2)) begin
        led_r[2] <= MOSI;
        led_r[1] <= led_r[2];
        led_r[0] <= led_r[1];
        count <= count + 1;
    end else begin
        led_r <= led_r;
        count <= 0; */
    end else if (!send) begin
        count <= 0;
    end
end    
    
endmodule

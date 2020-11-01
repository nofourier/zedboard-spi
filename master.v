module master(
    input clka,
    input reset,
    input send,
    input [2:0] data,
    
    output reg MOSI
    //output reg [2:0] reg_t
);

integer count;

always @(posedge clka or posedge reset) begin
    if (reset) begin
        //reg_t <= 3'b000;
        MOSI <= 1'b0;
        count <= 0;
/*    end else if (send == 1'b1 && count == 0) begin
        //reg_t <= data;
        MOSI <= data[0];
        count <= count + 1;
    end else if (send == 1'b1 && count == 1) begin
        //reg_t <= data;
        MOSI <= data[1];
        count <= count + 1;
    end else if (send == 1'b1 && count == 2) begin
        //reg_t <= data;
        MOSI <= data[2];
        count <= count + 1;
    end else if (send == 1'b1 && count == 3) begin
        MOSI <= 0;
    end else begin
        MOSI <= 0;
        count <= 0; */
    end else if (send && count != 3) begin
        MOSI <= data[count];
        count <= count + 1;
    end else if (send && count == 3) begin
        MOSI <= 0;
    end else begin
        MOSI <= 0;
        count <= 0;
    end

end

endmodule
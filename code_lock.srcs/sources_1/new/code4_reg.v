`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2021/06/23 17:05:56
// Design Name:
// Module Name: code4_reg
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module code4_reg(
    input clk,
    input update,
    output [3:0] code,
    input [3:0] code_in
);
    reg [3:0]store_code;
    
    initial begin
        store_code = 4'b1011;    
    end
    
    always @(posedge clk)
    begin
        if (update)
            begin
            $display("%b",code_in);
            store_code = code_in;
            end
    end
    
    assign code=store_code;
endmodule

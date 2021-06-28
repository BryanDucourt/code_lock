`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 14:30:36
// Design Name: 
// Module Name: code4_in
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


module code4_in(
    input [3:0] codein,
    input check,
    input update,
    output [3:0] codeout,
    output checkout,
    output updateout
);
    reg [3:0] codereg;

    always @(codein)
        begin
            codereg = codein;
        end
    assign codeout=codereg;
    assign checkout=check;
    assign updateout=update;
endmodule : code4_in

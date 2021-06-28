`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 15:45:04
// Design Name:
// Module Name: top
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


module top(
    input [3:0] codein,
    input check,
    input update,
    input rst,
    input lock,
    output err_led,
    output beep,
    output unlock,
    input clk
);
    wire [3:0] code;
    wire [3:0] codeout;
    wire checkout,updateout,store,err,open;
    reg led,buzz;
    reg [29:0] cnt;
    code4_in codeinput(.codein(codein),.check(check),.update(update),.codeout(codeout),.checkout(checkout),.updateout(updateout));
    lock_dectect dec(.clk(clk),.rst(rst),.lock(lock),.store(store),.codin(codeout),.check(checkout),.update(updateout),.unlock(open),.err_led(err),.code(code));
    code4_reg codestore(.clk(clk),.update(store),.code(code),.code_in(codeout));
    initial begin
        led=0;
    end
    always @(posedge clk)
    begin
        if (err)
            begin
            if (cnt<29'd4)
                cnt<=cnt+1'd1;
            else
                cnt<=0;
            end
        else
            cnt <=0;
    end
    assign err_led=err;
    assign beep=(cnt<2)?1'b0:1'b1;
    assign unlock=open;

endmodule : top

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 15:54:14
// Design Name: 
// Module Name: tb
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


module tb(

);
    reg clk,rst=0;
    reg lock;
    reg check,update;
    reg [3:0] codin;
//    wire [3:0] codeout;
//    wire [3:0] code;
//    wire checkout,updateout;
//    wire store;
    wire unlock;
    wire err_led,beep;
    always begin
        clk=0;
        # 2;
        clk=1;
        # 2;
    end
//    code4_reg stCode(.clk(clk),.update(store),.code(code),.code_in(codeout));
//    code4_in test(.codein(codin),.check(check),.update(update),.codeout(codeout),.checkout(checkout),.updateout(updateout));
//    lock_dectect dec(.clk(clk),.rst(rst),.lock(lock),.store(store),.codin(codeout),.check(checkout),.update(updateout),
//                        .unlock(unlock),.err_led(err_led),.code(code),.beep(beep));
    top tp(.codein(codin),.check(check),.update(update),.rst(rst),.lock(lock),.err_led(err_led),.beep(beep),.unlock(unlock),.clk(clk));
    initial begin
        check=0;
        update=0;
        lock=0;
        codin=4'b0000;
        # 4 codin=4'b1111;
        # 4 check=1;
        # 80 check=0;
        # 4 rst=1;
        # 4 rst=0;
        # 4 codin=4'b1011;
        # 4 check=1;
        # 4 check=0;
        # 4 codin=4'b0011;
        # 4 update=1;
        # 4 update=0;
        # 4 lock=1;
        # 4 lock=0;
        # 4 codin=4'b1101;
        # 4 check=1;
        # 20 check=0;
        # 4 rst=1;
        # 4 rst=0;
        # 4 codin=4'b0011;
        # 4 check=1;
        # 4 check=0;
        # 4 rst=1;
        # 4 rst=0;
        
        
    end
endmodule


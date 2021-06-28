`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/06/23 15:13:00
// Design Name:
// Module Name: lock_dectect
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


module lock_dectect(
    input clk,
    input rst,
    input lock,
    output store,
    input [3:0] codin,
    input check,
    input update,
    output unlock,
    output err_led,
    input [3:0] code
);
    reg storecode;
    reg state=0,err=0;

    always @(posedge clk)
    begin
        if (rst)
            err=0;
        if (state==0&&check)//关锁时验证密码
            begin
                if (code==codin)
                begin
                
                    state=1;
                end
                else
                begin
                   
                    err =1;
                end
            end
        else if(state==1 && update==1)//给锁存器发送信号，将密码送入锁存器中
            begin
               storecode = 1;
            end
        else if(state==1 && lock)
            state=0;
        else
            begin
                storecode=0;
            end

    end


//    always @(negedge rst)
//        err =0;

    assign err_led=err;
    assign unlock=state;
    assign store=storecode;
endmodule


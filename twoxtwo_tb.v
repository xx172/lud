`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 23:04:42
// Design Name: 
// Module Name: twoxtwo_tb
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


module twoxtwo_tb();
reg[31:0]A,N;
reg clk;
wire [31:0]L,U;
twoxtwo uut(.A(A),.clk(clk),.L(L),.U(U),.N(N));
always #10clk=~clk;
initial
begin
clk=0;
A=0;



A={8'd1,8'd2,8'd5,8'd4};
N={8'd0,8'd0,8'd0,8'd0};






end
endmodule

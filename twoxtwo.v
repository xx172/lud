`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.05.2020 21:58:36
// Design Name: 
// Module Name: twoxtwo
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


module twoxtwo
(A,clk,L,U,N
);
input wire [31:0]A,N;
input clk;
output reg[31:0]L,U;
integer i,j,k,x;
real frequency;
real t0;
real t1;
reg[7:0] mat_A[0:1][0:1];
reg[7:0] lower[0:1][0:1];
reg[7:0] upper[0:1][0:1];
reg[7:0] upper1[0:1][0:1];
reg[7:0] lower1[0:1][0:1];
reg[7:0] sum1[0:1][0:1];
always@(posedge clk)
begin
t0=$realtime;
{mat_A[0][0],mat_A[0][1],mat_A[1][0],mat_A[1][1]}=A;
{lower1[0][0],lower1[0][1],lower1[1][0],lower1[1][1]}=N;

i=0;
j=0;
k=0;
x=1;

for(j=0;j<2;j=j+1)begin
for(i=0;i<2;i=i+1)begin

if(i<j)
begin 
upper[i][j]<=mat_A[i][j];
for(k=0;k<i-1;k=k+1)

upper[i][j]<=lower1[i][j]*upper[i][j];


if(i==j)

lower[i][j]<=32'd1;

else 

lower[i][j]<=32'd0;

end

else
begin lower[i][j]<=mat_A[i][j]; 

for(k=0;k<j-1;k=k+1)

lower[i][j]<=lower[i][j]-(lower[i][k]*upper[k][j]);
lower[i][j]=lower[i][j]/upper[j][j];
upper[i][j]<=1;
end
end
end



U={upper[0][0],upper[0][1],upper[1][0],upper[1][1]};
L={lower[0][0],lower[0][1],lower[1][0],lower[1][1]};


t1=$realtime;
frequency=1.0e8/(t1-t0);
$display("Frequency=%g",frequency);


end

endmodule

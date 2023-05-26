`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Jodhpur
// Engineer: Sameer Sharma
// 
// Create Date: 01/16/2023 01:39:35 PM
// Design Name: 
// Module Name: full_adder_4bit
// Project Name: 
// Target Devices: PYNQ Z2
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


module full_adder_4bit(a,b,c,out);
input [3:0] a,b;
input c;
output [4:0] out;
wire c1,c2,c3,c4;




full_adder f1(a[0],b[0],c,out[0],c1);
full_adder f2(a[1],b[1],c1,out[1],c2);
full_adder f3(a[2],b[2],c2,out[2],c3);
full_adder f4(a[3],b[3],c3,out[3],out[4]);                    







endmodule

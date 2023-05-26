`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 12:27:29 PM
// Design Name: 
// Module Name: BCD_adder
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


module BCD_adder(a,b,c,z,out);
input [3:0]a,b;
input c;
output z;
output[3:0]out;
//reg [3:0]temp;
full_adder_4bit(a,b,c,{z,out});

endmodule

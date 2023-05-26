`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2023 01:22:01 PM
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


module tb();
reg [3:0] a;
//reg s1,s0;
wire [7:0] out;

//reg [6:0] a,b;
//reg c;
//wire [7:0] out;

//mux(s0,s1,i0,i1,i2,i3,out);
//shifter sf(a,s1,s0,out);
multiply_by_6 m1(a,out);
//full_adder_7bit f_7bit_1(a,b,c,out);
initial begin
a=4'b1010; #10
a=4'b1001; #10
a=4'b1110; #10
a=4'b1111; #10
a=4'b0000; #10
//a=7'b1101010;b=7'b0101001;c=0;#10


$stop;
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT JODHPUR
// Engineer: Sameer Sharma
// 
// Create Date: 03/02/2023 01:15:58 PM
// Design Name: 
// Module Name: shifter
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

module full_adder(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
assign sum = a^b^c;
assign carry = (a&b)|(b&c)|(c&a);
endmodule

module full_adder_7bit(a,b,c,out);
input [6:0] a,b;
input c;

output [7:0] out;
wire c1,c2,c3,c4,c5,c6;
full_adder f1(a[0],b[0],c,out[0],c1);
full_adder f2(a[1],b[1],c1,out[1],c2);
full_adder f3(a[2],b[2],c2,out[2],c3);
full_adder f4(a[3],b[3],c3,out[3],c4);
full_adder f5(a[4],b[4],c4,out[4],c5);
full_adder f6(a[5],b[5],c5,out[5],c6);   
full_adder f7(a[6],b[6],c6,out[6],out[7]);   
   
endmodule

module mux(i3,i2,i1,i0,s1,s0,out);
input s0,s1,i0,i1,i2,i3;
output out;
assign out = ((!s1)&(!s0))&i0|((!s1)&(s0))&i1|((s1)&(!s0))&i2|((s1)&(s0))&i3;
endmodule

module shifter(i_a,i_s1,i_s0,o_out);
input [3:0]i_a;
input i_s0,i_s1;
output [6:0]o_out;
mux m1(0,0,0,i_a[0],i_s1,i_s0,o_out[0]);
mux m2(0,0,i_a[0],i_a[1],i_s1,i_s0,o_out[1]);
mux m3(0,i_a[0],i_a[1],i_a[2],i_s1,i_s0,o_out[2]);
mux m4(i_a[0],i_a[1],i_a[2],i_a[3],i_s1,i_s0,o_out[3]);
mux m5(i_a[1],i_a[2],i_a[3],0,i_s1,i_s0,o_out[4]);
mux m6(i_a[2],i_a[3],0,0,i_s1,i_s0,o_out[5]);
mux m7(i_a[3],0,0,0,i_s1,i_s0,o_out[6]);

endmodule

//module multiply_by_6(a,out);
//input [3:0] a;
//output [7:0] out;
//wire [6:0] temp1,temp2;
//shifter sf1(a,1,0,temp1);
//shifter sf2(a,0,1,temp2);
//full_adder_7bit f1(temp1,temp2,0,out);
//endmodule
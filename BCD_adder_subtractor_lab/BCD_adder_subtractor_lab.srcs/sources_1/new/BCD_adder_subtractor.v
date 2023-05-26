`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Jodhpur
// Engineer: Sameer Sharma
// 
// Create Date: 02/15/2023 01:24:57 PM
// Design Name: 
// Module Name: BCD_adder_subtractor
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

module full_adder_subtractor_4bit(a,b,c,out,cout);
input [3:0] a,b;
input c;
output cout;
output [3:0] out;
wire c1,c2,c3,c4;
full_adder f1(a[0],b[0]^c,c,out[0],c1);
full_adder f2(a[1],b[1]^c,c1,out[1],c2);
full_adder f3(a[2],b[2]^c,c2,out[2],c3);
full_adder f4(a[3],b[3]^c,c3,out[3],cout);   
endmodule

module BCD_adder(a,b,c,z,out);
input [3:0] a,b;
input c;
output [3:0] out;
output z;
wire [3:0] temp,temp1;
wire [4:0] sum,sum1;
//assign sum=a+b+c;
full_adder_4bit f1(a,b,c,sum);
assign temp1[0]=sum[0];assign temp1[1]=sum[1];assign temp1[2]=sum[2];assign temp1[3]=sum[3];
//assign out=sum;
assign z=sum[4]||sum[3]&sum[2]||sum[3]&sum[1];

assign temp[0]=0;assign temp[1]=z;assign temp[2]=z;assign temp[3]=0;
full_adder_4bit f2(temp,temp1,0,sum1);
assign out[0]=sum1[0];assign out[1]=sum1[1];assign out[2]=sum1[2];assign out[3]=sum1[3];




endmodule



module BCD_adder_subtractor_module(i_a,i_b,i_m,o_cout,o_s);
input [3:0] i_a,i_b;
input i_m;
output o_cout;
output [3:0] o_s;

wire [3:0] temp1,temp2,X,Y;
wire c1,c2,c3;
assign temp1[0]=0;assign temp1[1]=i_m;assign temp1[2]=0;assign temp1[3]=i_m;
full_adder_subtractor_4bit f1(temp1,i_b,i_m,X,c1);
BCD_adder b1(i_a,X,1'b0,o_cout,Y);
assign c3 = (i_m)&(!o_cout);
assign temp2[0]=0;assign temp2[1]=c3;assign temp2[2]=0;assign temp2[3]=c3;
full_adder_subtractor_4bit f2(temp2,Y,c3,o_s,c2);


endmodule

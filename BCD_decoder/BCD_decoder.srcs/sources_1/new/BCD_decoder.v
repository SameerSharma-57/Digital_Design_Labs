`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2023 11:09:44 PM
// Design Name: 
// Module Name: BCD_decoder
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


module BCD_decoder(a,b,c,d,out);
input a,b,c,d;
output [6:0] out;
assign out[0]= !((a||c||(b&d)||((!b)&(!d))));
assign out[1]= !((!b)||((!c)&(!d))||(c&d));
assign out[2]= !(b||(!c)||d);
assign out[3]= !(((!b)&(!d))||(c&(!d))||(b&(!c)&d)||((!b)&c)||a);
assign out[4]= !(((!b)&(!d))||(c&(!d)));
assign out[5]= !(a||((!c)&(!d))||(b&(!c))||(b&(!d)));
assign out[6]= !(a||(b&(!c))||((!b)&(c))||(c&(!d)));


endmodule

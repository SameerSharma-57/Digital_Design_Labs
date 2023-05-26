`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Jodhpur
// Engineer: Sameer Sharma
// 
// Create Date: 01/16/2023 02:01:50 PM
// Design Name: 
// Module Name: full_adder_4bit_tb
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


module full_adder_4bit_tb();
reg [3:0] ta,tb;
reg tc,ts2;
wire [4:0] tout;
full_adder_4bit dut(.a(ta),.b(tb),.c(tc),.s2(ts2),.out(tout));
initial begin
ta=4'b100;tb=4'b110;tc=0;ts2=0;
#10
ta=4'b100;tb=4'b110;tc=1;ts2=0;
#10

ta=4'b100;tb=4'b110;tc=1;ts2=1;
#10
$stop;
end
endmodule

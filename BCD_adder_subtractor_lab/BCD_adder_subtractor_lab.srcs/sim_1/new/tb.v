`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 01:26:27 PM
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
reg [3:0] ta,tb;
reg c;
wire [3:0] tout;
wire tz;
//full_adder_4bit dut(.a(ta),.b(tb),.c(tc),.out(tout));
BCD_adder_subtractor_module dut(.i_a(ta),.i_b(tb),.i_m(c),.o_cout(tz),.o_s(tout));
initial begin
ta=4'b0;tb=4'b0;c=0;
#10
ta=4'b1001;tb=4'b1001;c=1;
#10

ta=4'b1000;tb=4'b111;c=1;
#10
$stop;
end
endmodule


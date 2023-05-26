`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2023 12:58:53 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb();
reg [3:0] a,b;
reg c;
wire [3:0] out;
wire z;
BCD_adder dut(.a(a),.b(b),.c(c),.z(z),.out(out));
initial begin
a=4'b1010;a=4'b1010;c=0;
#10
a=4'b1010;a=4'b1010;c=1;
#10
$stop;

end
endmodule

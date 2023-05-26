`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2023 12:29:02 PM
// Design Name: 
// Module Name: half_adder_tb
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


module half_adder_tb();
reg a_tb,b_tb;
wire s_tb,c_tb;
half_adder(.a(a_tb),.b(b_tb),.s(s_tb),.c(c_tb));
initial begin
a_tb=0;b_tb=0;
#10
a_tb=1;b_tb=0;
#10
a_tb=0;b_tb=1;
#10
a_tb=1;b_tb=1;
#10
$stop;

end
endmodule

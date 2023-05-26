`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2023 12:37:24 PM
// Design Name: 
// Module Name: half_adder_test_bench
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


module half_adder_test_bench();
reg t_a,t_b;
wire t_s,t_c;
half_adder dut(.a(t_a),.b(t_b),.c(t_c),.s(t_s));
initial begin
t_a=0;t_b=0;
#10
t_a=1;t_b=0;
#10
t_a=0;t_b=1;
#10
t_a=1;t_b=1;
#10
$stop;
end
endmodule

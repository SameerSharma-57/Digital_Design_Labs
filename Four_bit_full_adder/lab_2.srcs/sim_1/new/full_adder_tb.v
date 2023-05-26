`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2023 01:04:09 PM
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
reg ta,tb,tc;
wire tsum,tcarry;
full_adder dut(.a(ta),.b(tb),.c(tc),.sum(tsum),.carry(tcarry));
initial begin
ta=0;tb=0;tc=0;
#10
ta=0;tb=0;tc=1;
#10
ta=0;tb=1;tc=0;
#10
ta=0;tb=1;tc=1;
#10
ta=1;tb=0;tc=0;
#10
ta=1;tb=0;tc=1;
#10
ta=1;tb=1;tc=0;
#10
ta=1;tb=1;tc=1;
#10
$stop;
end
endmodule

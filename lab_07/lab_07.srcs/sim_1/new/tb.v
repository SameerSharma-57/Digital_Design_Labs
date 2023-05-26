`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 01:42:06 PM
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

////Note: Please uncomment only the module for which you want simulation and please comment the other modules

////Testbench code for ALU
//module tb();
//reg [3:0] a,b;
//reg [2:0] s;
//wire [4:0] out;
//ALU test(a,b,s,out);
//initial begin
//a=4'b1010;b=4'b1011;s=3'b0;#10
//a=4'b1010;b=4'b1011;s=3'b001;#10
//a=4'b1010;b=4'b1011;s=3'b010;#10
//a=4'b1010;b=4'b1011;s=3'b011;#10
//$stop;
//end
//endmodule

//Testbench code for gate delay while we are not considering reduntant prime implicants
//module tb();
//    reg a,b,c;
//    wire out;
//    gateDelayWithoutRedutantPrimeImplicant g1(a,b,c,out);
//    initial begin
//        a=1;b=1;c=1;#100
//        a=0;b=1;c=0;#100
//        $stop;
//    end
//endmodule

//Testbench code for gate delay when reduntant prime implicant is considered
module tb();
    reg a,b,c;
    wire out;
    gateDelayWithRedutantPrimeImplicant g1(a,b,c,out);
    initial begin
        a=1;b=1;c=1;#100
        a=0;b=1;c=0;#100
        $stop;
    end
endmodule

//Testbench code for D flip flop
//module tb();
//    reg clk,d,reset;
//    wire out;
//    DFlipFlop d1(d,reset,clk,out);
//    always #10 clk=!clk;
//    initial begin
//    d=0;clk=0;reset=0;
//    #15 d=1;
//    #100 reset=1;
//    #20
//    $stop;
//    end
//endmodule

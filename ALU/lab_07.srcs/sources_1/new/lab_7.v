`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2023 01:30:42 PM
// Design Name: 
// Module Name: lab_7
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

//Module for ALU 
module ALU(a,b,s,out);
//Got two four bit inputs a and b and three control bits s[0],s[1] and s[2]
input [3:0] a,b;
input [2:0] s;

//5 bit output variable
output reg [4:0] out;
always @(*)
begin
    case(s)
        //it can perfrom 8 operations as stated below
        3'b000: out=5'b0;
        3'b001: out=a+b;
        3'b010: out=a-b;
        3'b011: out=a^b;
        3'b100: out=!(a^b);
        3'b101: out=a&b;
        3'b110: out=a|b;
        3'b111: out=5'b1;
    endcase
end
endmodule

module gateDelayWithoutRedutantPrimeImplicant(a,b,c,out);
    //got three single bit inputs a,b and c
    input a,b,c;
    //got a single output bit out
    output out;
    wire na,nab,ac;
    //logic for the gate is f=a'b + ac. We are not considering redutant prime implicant here
    // Here I have added gate delay of 10ns for each logical operation as shown below
    not #(10) not1(na,a);
    and #(10) and1(nab,na,b);
    and #(10) and2(ac,a,c);
    or #(10) or1(out,nab,ac);
    

endmodule

module gateDelayWithRedutantPrimeImplicant(a,b,c,out);
//similar to previous module only difference is that it is taking the reduntant group into consideration
    input a,b,c;
    output out;
    wire na,nab,ac,bc,temp;
    not #(10) not1(na,a);
    and #(10) and1(nab,na,b);
    and #(10) and2(ac,a,c);
    //reduntant prime implicant
    and #(10) and3(bc,b,c);
    or #(10) or1(out,bc,nab,ac);
//    or #(10) or2(out,temp,bc);
    

endmodule

module DFlipFlop(d,reset,clk,out);
//three input variables
input d,reset,clk;
//one output variable
output reg out;
//This block will run only when we get a positive edge on clock i.e. when clock moves from 0 to 1
always @ (posedge clk)
begin
    //when reset is one, reset the value of out to zero
    if(reset==1'b1)
        out <= 1'b0;
    // else set the value of output variable to d
    else
        out <= d;
    
end
endmodule



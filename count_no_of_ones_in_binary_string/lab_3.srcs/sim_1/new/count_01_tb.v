`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 02:17:43 PM
// Design Name: 
// Module Name: count_01_tb
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


module count_01_tb();

    reg [3:0]A;
    wire [2:0]B;
    
   count_01 C(A,B);
    initial
        begin
           A = 4'b1010;
        #10 A = 4'b1110;  
        #10
        $stop;
        end
    
endmodule


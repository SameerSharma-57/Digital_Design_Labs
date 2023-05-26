`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 02:26:01 PM
// Design Name: 
// Module Name: binary_to_gray_tb
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


module binary_to_gray_tb();
reg [3:0]Z;
    wire [3:0]A;
    
    binary_to_gray G(Z,A);
    initial
        begin
            Z = 4'b1011;
        #10 Z = 4'b1010;  
        #10 Z = 4'b0010;
        #10 Z = 4'b1001;
        #10 Z = 4'b0001;
        #10
        $stop;
       end
endmodule

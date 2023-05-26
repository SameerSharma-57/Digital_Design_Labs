`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 02:24:41 PM
// Design Name: 
// Module Name: binary_to_gray
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


module binary_to_gray(Z,A);
    input [3:0]Z;
    output [3:0]A;
    
    assign A[3] = Z[3];
    assign A[2] = Z[3]^Z[2];
    assign A[1] = Z[1]^Z[2];
    assign A[0] = Z[0]^Z[1];
endmodule

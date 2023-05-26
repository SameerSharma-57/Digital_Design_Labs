`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2023 02:15:36 PM
// Design Name: 
// Module Name: count_01
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


module count_01(A,B);
input [3:0]A;
    reg [2:0]B;

    
    always@(A)
    case(A)
        4'd0: B = 3'd0;
        4'd1: B = 3'd1;
        4'd2: B = 3'd1;
        4'd3: B = 3'd2;
        4'd4: B = 3'd1;
        4'd5: B = 3'd2;
        4'd6: B = 3'd2;
        4'd7: B = 3'd3;
        4'd8: B = 3'd1;
        4'd9: B = 3'd2;
        4'd10: B = 3'd2;
        4'd11: B = 3'd3;
        4'd12: B = 3'd2;
        4'd13: B = 3'd3;
        4'd14: B = 3'd3;
        4'd15: B = 3'd4;
    endcase
    
    output [2:0]B;
endmodule

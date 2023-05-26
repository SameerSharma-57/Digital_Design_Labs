`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 15:31:20
// Design Name: 
// Module Name: serial_adder
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


module mux_4(y, w3, w2, w1, w0, s1, s0);
    
    input w3, w2, w1, w0, s1, s0;
    output y;
    
    assign y = s1 ? (s0 ? w3 : w2) : (s0 ? w1 : w0);
    
 endmodule

module shifter(i, s, y);
    
    input [3:0]i;
    input [1:0]s;
    output [6:0]y;
    
    mux_4 y0 (y[0], 0, 0, 0, i[0], s[1], s[0]);
    mux_4 y1 (y[1], 0, 0, i[0], i[1], s[1], s[0]);
    mux_4 y2 (y[2], 0, i[0], i[1], i[2], s[1], s[0]);
    mux_4 y3 (y[3], i[0], i[1], i[2], i[3], s[1], s[0]);
    mux_4 y4 (y[4], i[1], i[2], i[3], 0, s[1], s[0]);
    mux_4 y5 (y[5], i[2], i[3], 0, 0, s[1], s[0]);
    mux_4 y6 (y[6], i[3], 0, 0, 0, s[1], s[0]);
    
    
endmodule




module d_latch(d, e, out);
    input d, e;
    output reg out;
    
    always @(d, e)
        begin
            if (e == 1) out = d;
        end
endmodule

module flip_flop(D, E, Y);
    
    input D, E;
    output Y;
    wire w;
    
    d_latch d1(D, E, w);
    d_latch d2(w, ~E, Y);
    
endmodule

module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    assign sum = (a ^ b ^ cin);
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule


module serial_adder(w, x, y, z, a, b, LA, LB, add, reset, clk, clk_div);
    
    input clk;
    input w, x, y, z;
    
    output reg [3:0]a;
    output reg [3:0]b;
        
    reg s;
    reg c0, c1, c2, c3, c4;
    reg cin, cout;
    
    
    input LA, LB, add, reset;
    output clk_div;
    
    reg [27:0]count = 0;
    
    always @ (posedge clk)
        count = count +1;
    
    assign clk_div = count[27];
    
    full_adder(a[0], b[0], cin, s, cout);
    
    always @ (posedge clk_div)
        begin
            if (reset)
            begin
                a = 4'b0000;
                b = 4'b0000;
                cin = 0;
                cout = 0;
                s = 0;
            end
            
            else if (LA)
            begin
                   a[0] = w;
                   a[1] = x;
                   a[2] = y;
                   a[3] = z;
            end
            
            else if (LB)
            begin
                   b[0] = w;
                   b[1] = x;
                   b[2] = y;
                   b[3] = z;
            end
            
            else if (add)
                begin
                    
//                    flip_flop(cout, 1, cin);
                    cin = cout;
                                    
                    a[0] <= a[1];
                    a[1] <= a[2];
                    a[2] <= a[3];
                    a[3] <= s;
                    
                    b[0] <= b[1];
                    b[1] <= b[2];
                    b[2] <= b[3];
                    b[3] <= 0;
                    
                    
            end
        end
    
 
endmodule






module multiplier (x, y, clk, reset, result);
  input [7:0] x, y;
  input clk, reset;
  output reg [15:0] result;
  reg [7:0] shift_reg;
  reg [3:0] counter;
  
  always @(posedge clk)
    if (reset) begin
      shift_reg <= 0;
      counter <= 4'd0;
      result <= 0;
    end
    else begin
      shift_reg <= {shift_reg[6:0], x};
      if (counter == 4'd0) begin
        counter <= 4'd4;
        result <= result + (shift_reg * y);
      end
      else begin
        counter <= counter - 1;
      end
    end
endmodule

//This code implements a sequential multiplier that takes two 8-bit inputs x and y, and multiplies them together using the shift-add algorithm. The result is a 16-bit output result.

//The shift_reg register is used to store the shifted value of x. The counter is used to count from 0 to 3 and then reset back to 0. When the counter is 0, the shifted value of x is multiplied with y and the result is added to the result register.

//Here's a brief explanation of the input and output variables:

//x: 8-bit input operand
//y: 8-bit input operand
//clk: clock signal
//reset: asynchronous reset signal
//result: 16-bit output result
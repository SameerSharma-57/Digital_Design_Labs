`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 10:09:42 PM
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

//module lfsr (
//    input clk,
//    input reset,
//    output reg [7:0] out
//);

//reg [7:0] state = 8'b00000001;

//always @(posedge clk or posedge reset) begin
//    if (reset) begin
//        state <= 8'b00000001;
//    end else begin
//        state <= {state[6:0], state[7] ^ state[4] ^ state[3] ^ state[1] ^ state[0]};
//    end
//end

//assign out = state;

//endmodule

//module full_adder(
//    input a,b,c,
//    output s,cout

//);

//    assign s=a^b^c;
//    assign cout=(a&b)|(b&c)|(c&a);
//endmodule

//module full_adder_4bit(
//    input [3:0] a,b,
//    input cin,
//    output [3:0] out,
//    output cout

//);
//    wire c0,c1,c2;
//    full_adder f0(a[0],b[0],cin,out[0],c0);
//    full_adder f1(a[1],b[1],c0,out[1],c1);
//    full_adder f2(a[2],b[2],c1,out[2],c2);
//    full_adder f3(a[3],b[3],c2,out[3],cout);


    
//endmodule


//module BCD_adder(
//    input [3:0] a,b,
//    input cin,
//    output [3:0] s,
//    output z

//);
//    wire cout;
//    wire [3:0]temp;
//    wire [3:0] temp_sum;
//    wire temp_cout;
//    full_adder_4bit f0(a,b,cin,temp_sum,temp_cout);
//    assign z = temp_cout|(temp_sum[3]&temp_sum[1])|(temp_sum[3]&temp_sum[2]);
//    assign temp = {1'b0,z,z,1'b0};
//    full_adder_4bit f1(temp_sum,temp,1'b0,s,cout);
    
    
    
    
//endmodule

//module ClockDividerc(input CLK_IN,output reg CLK_OUT);
    
//    reg[27:0] counter=28'd0;
//    parameter DIVISOR = 28'd125000000; //200hz
    
//    always @(posedge CLK_IN)

//    begin
//        counter <= counter + 28'd1;
//        if(counter >= ( DIVISOR-1 ) )
//            counter <= 28'd0;

//        CLK_OUT <= ( counter < DIVISOR >> 1 )? 1'b1 : 1'b0;  
//    end
//endmodule

//module frequency_divider(clk,div_clock);
//input clk;
//output reg div_clock;
//reg [26:0]count;

//always@(posedge clk)
//begin
//count=count+1;
//div_clock=count[26];
//end
//endmodule

//module debouncer (
//    input clk,  // clock input
//    input button,  // button input
//    output reg debounced_button  // debounced button output
//);

//    reg counter;
    
    
//    always @(posedge clk) begin
//        if (button != 1) begin
//            counter <= 0;
//        end
//         if (button==1 && counter==0) begin
//            counter <= 1;
//            debounced_button <=1;
//        end else begin
//            debounced_button <= 0;
//        end
        
//    end

//endmodule

//module test_module(
//    input clk,
//    input [1:0] s,
//    input [3:0] in,
//    output reg [3:0] msb = 5'b0,
//    output reg [3:0] lsb =5'b0
//    );
//    reg [1:0] state=2'b0;
//    always @(posedge clk)begin
            
//        case(s)
//            2'b00:begin
//                lsb<=in;
//                end
//            2'b01:
//                if(lsb==9)begin
//                    lsb<=0;
//                    msb<=msb+1;
//                end
//                else if(msb>=2 && lsb>=5)begin
//                    msb<=4'b0;
//                    lsb<=4'b0;
//                end
//                else
//                lsb<=lsb+1;
//            2'b10:
//                if(lsb==0)begin
//                    if(msb==0)begin
//                        lsb<=4'd5;
//                        msb<=4'd2;
                        
//                    end
//                    else begin
//                        lsb<=9;
//                        msb<=msb-1;
//                    end
                    
//                end
//                else
//                lsb<=lsb-1;
//            2'b11:begin
//                msb<=in;
                
//                end
                
//        endcase
//        end
        
    
//endmodule
//////////////////////////////////////////////////////////////////////////////////


module tb();
reg clk=1'b0;

wire [1:0] led1,led2;
wire [3:0] out;
wire div_clk1,dic_clk2;

test_module .dut (.clk(clk),.led1(led1),.led2(led2),.out(out),.div_clk1(div_clk1));

always #1
    clk=~clk;
initial begin
    
    #10500000
    $stop;
end
endmodule



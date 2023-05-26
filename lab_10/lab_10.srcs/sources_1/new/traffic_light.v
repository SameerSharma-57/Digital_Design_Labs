`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2023 16:04:18
// Design Name: 
// Module Name: DigitalSafe
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


module clock_divider(input clkin, output clkout);
    reg[27:0] counter=28'd0;
    always @(posedge clkin)
        counter <= counter + 28'd1;
    assign clkout = counter[27];
endmodule

module clock_divider2(input clkin, output clkout);
    reg[9:0] counter=10'd0;
    always @(posedge clkin)
        counter <= counter + 10'd1;
    assign clkout = counter[9];
endmodule

module SevenDigitDisplay(A,B,C,D,a,b,c,d,e,f,g);
    input A,B,C,D ;
    output a,b,c,d,e,f,g;
    
     
    
    assign a = ~(A|C|(B&D)|(~B&~D));
    assign b = ~(~B|(~C&~D)|(C&D));
    assign c = ~(~C|D|B);
    assign d = ~((~B&~D)|(B&~C&D)|(C&~D)|A|(~B&C));
    assign e = ~((~B&~D)|(C&~D));
    assign f = ~(A|(~C&~D)|(B&~D)|(B&~C));
    assign g = ~(A|(~B&C)|(B&~C)|(B&~D));
    
endmodule

module DigitalSafe(clk,reset,inpt,right,y,wrong,threewrong,backspace,enter,disp1,disp2,disp3,disp4);
    input clk,backspace,enter;
    input reset;
    input [9:0]inpt;
    wire clkout;
    clock_divider cl(clk,clkout);
    output reg right = 0;
    output reg wrong = 0;
    output reg threewrong = 0;
    
    wire clk2;
    clock_divider2 c2(clk,clk2);
    
    output reg [6:0]y = 7'b0000000;
    reg [6:0]display1 = 7'b1111111,display2 = 7'b1111111,display3 = 7'b1111111,display4 = 7'b1111111;
    output reg disp1 = 1,disp2 = 1,disp3 = 1,disp4 = 1;
    
    reg [3:0]password1 = 4'd0;
    reg [3:0]password2 = 4'd0;
    reg [3:0]password3 = 4'd0;
    reg [3:0]password4 = 4'd0;
    
    reg [3:0]inptpassword1;
    reg [3:0]inptpassword2;
    reg [3:0]inptpassword3;
    reg [3:0]inptpassword4;
    
    reg [2:0]count = 3'b000;
    reg [2:0]resetcount = 3'b000;
    
    reg [2:0]countwrong = 3'b000;
    reg [3:0]tempnum;
    wire [6:0]tempdisplay;
        
    reg A,B,C,D;

    
    always @(posedge clkout)
    begin
      case(inpt)
        10'b0000000000 : tempnum <= 4'b1111;
        10'b0000000001 : tempnum <= 4'd0;
        10'b0000000010 : tempnum <= 4'd1;
        10'b0000000100 : tempnum <= 4'd2;
        10'b0000001000 : tempnum <= 4'd3;
        10'b0000010000 : tempnum <= 4'd4;
        10'b0000100000 : tempnum <= 4'd5;
        10'b0001000000 : tempnum <= 4'd6;
        10'b0010000000 : tempnum <= 4'd7;
        10'b0100000000 : tempnum <= 4'd8;
        10'b1000000000 : tempnum <= 4'd9;
      endcase
      
    end

    SevenDigitDisplay S(tempnum[3],tempnum[2],tempnum[1],tempnum[0],tempdisplay[0],tempdisplay[1],tempdisplay[2],tempdisplay[3],tempdisplay[4],tempdisplay[5],tempdisplay[6]);
    
    always @(negedge clkout)
    begin
            if(countwrong == 2'b11)begin
                threewrong <= 1;
                wrong <= 0;
                right <= 0;
            end
        if(count < 3'b100 && tempnum!=4'b1111 && countwrong != 2'b11 && reset != 1)begin

            if(count == 3'b000)begin
                inptpassword1 <= tempnum;
                display4 <= tempdisplay;
            end
            else if(count == 3'b001)
            begin
                inptpassword2 <= tempnum;
                display3 <= tempdisplay;
            end
            else if(count == 3'b010)
            begin
                inptpassword3 <= tempnum;
                display2 <= tempdisplay;
            end
            else if(count == 3'b011)
            begin
                inptpassword4 <= tempnum;
                display1 <= tempdisplay;
            end
            count <= count + 3'b001;
        end
        else if(backspace == 1 && count!= 0 && countwrong != 2'b11)begin

            if(count == 3'b001)begin
                display4 <= 7'b1111111;
            end
            if(count == 3'b010)begin
                display3 <= 7'b1111111;
            end
            if(count == 3'b011)begin
                display2 <= 7'b1111111;
            end
            if(count == 3'b100)begin
                display1 <= 7'b1111111;
            end
            count <= count - 3'b001;
        end
        
        else if(backspace == 1 && resetcount!=0 && reset == 1 && countwrong != 2'b11)begin
            
            if(resetcount == 3'b001)begin
                display4 <= 7'b1111111;
            end
            if(resetcount == 3'b010)begin
                display3 <= 7'b1111111;
            end
            if(resetcount == 3'b011)begin
                display2 <= 7'b1111111;
            end
            if(resetcount == 3'b100)begin
                display1 <= 7'b1111111;
            end
            resetcount <= resetcount - 3'b001;
        end
        
        else if(resetcount == 3'b100 && tempnum == 4'b1111 && reset == 0 && countwrong != 2'b11)begin
            resetcount <= 3'b000;
            display4 <= 7'b1111111;
            display3 <= 7'b1111111;
            display2 <= 7'b1111111;
            display1 <= 7'b1111111;
        end
        
        else if(resetcount < 3'b100 && tempnum != 4'b1111 && reset == 1 && countwrong != 2'b11)begin
            if(resetcount == 3'b000)
            begin
                password1 <= tempnum;
                display4 <= tempdisplay;
            end
            else if(resetcount == 3'b001)
            begin
                password2 <= tempnum;
                display3 <= tempdisplay;
            end
            else if(resetcount == 3'b010)
            begin
                password3 <= tempnum;
                display2 <= tempdisplay;
            end
            else if(resetcount == 3'b011)
            begin
                password4 <= tempnum;
                display1 <= tempdisplay;
            end
            resetcount <= resetcount + 3'b001;
        end
        else if(count == 3'b100 && enter == 1 && countwrong != 2'b11 && reset != 1)begin
            if(inptpassword1 == password1 && inptpassword2 == password2 && inptpassword3 == password3 && inptpassword4 == password4)
            begin
                right <= 1;
                wrong <= 0;
                countwrong <= 0;
                count <= 3'b000;
                display1 <= 7'b1111111;
                display2 <= 7'b1111111;
                display3 <= 7'b1111111;
                display4 <= 7'b1111111;
            end
            else begin
                wrong <= 1;
                right <= 0;
                count <= 3'b000;
                countwrong <= countwrong + 2'b01;
                display1 <= 7'b1111111;
                display2 <= 7'b1111111;
                display3 <= 7'b1111111;
                display4 <= 7'b1111111; 
            end
        end
    end
    

    always @(posedge clk2)
    begin
        if(disp1 == 0 && disp2 == 0 && disp3 == 0 && disp4 == 0)begin
        
            disp1 <= 1;
            disp2 <= 1;
            disp3 <= 1;
            disp4 <= 1;
        end
        else if(disp1 == 1 && disp2 == 1 && disp3 == 1 && disp4 == 1)begin
            y <= display1;
            disp1 <= 0;
            disp2 <= 1;
            disp3 <= 1;
            disp4 <= 1;            
        end
        else if(disp1 == 0 && disp2 == 1 && disp3 == 1 && disp4 == 1)begin
            y <= display2;
            disp1 <= 1;
            disp2 <= 0;
            disp3 <= 1;
            disp4 <= 1;
        end
        else if(disp1 == 1 && disp2 == 0 && disp3 == 1 && disp4 == 1)begin
            y <= display3;
            disp1 <= 1;
            disp2 <= 1;
            disp3 <= 0;
            disp4 <= 1;
        end
        else if(disp1 == 1 && disp2 == 1 && disp3 == 0 && disp4 == 1)begin
            y <= display4;
            disp1 <= 1;
            disp2 <= 1;
            disp3 <= 1;
            disp4 <= 0;
        end
        else if(disp1 == 1 && disp2 == 1 && disp3 == 1 && disp4 == 0)begin
            disp1 <= 1;
            disp2 <= 1;
            disp3 <= 1;
            disp4 <= 1;
        end
    end
    

endmodule
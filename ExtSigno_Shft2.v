`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2017 07:33:02 AM
// Design Name: 
// Module Name: ExtSigno_Shft2
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


module ExtSigno_Shft2(sOut32,sIn16); //Out32, In32 son del shift
output [31:0] sOut32;
input [15:0] sIn16;
assign sOut32 = {{16{sIn16[15]}},sIn16};
endmodule

module shift_left_2(Out32, In32);
output [31:0] Out32;
input [31:0] In32;
assign Out32 = {In32[29:0],2'b00};// del shift2 
endmodule

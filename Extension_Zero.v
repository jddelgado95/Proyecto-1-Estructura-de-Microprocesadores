`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2017 07:30:26 AM
// Design Name: 
// Module Name: Extension_Zero
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

//modulo encargado de hacer la operacion de extendecion de zeros 
module Extension_Zero(zOut32,zIn16);
output [31:0] zOut32;
input [15:0] zIn16;
assign zOut32 = {{16{1'b0}},zIn16};
endmodule

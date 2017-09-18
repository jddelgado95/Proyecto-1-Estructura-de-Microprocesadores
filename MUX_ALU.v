`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2017 07:50:38 AM
// Design Name: 
// Module Name: MUX_ALU
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

//mux para una de las entradas de la ALU
module MUX_ALU(DataOut,A,B,C,Select);
output [31:0] DataOut;
input [1:0] Select;
input [31:0] A,B,C;
wire [31:0] DataOut1,DataOut2;

MUX_Bin_ALU muxAB(DataOut1,A,B, Select[1]);
MUX_Bin_ALU muxCA(DataOut2,C,A, Select[1]);
MUX_Bin_ALU muxABC(DataOut,DataOut1,DataOut2, Select[0]);

endmodule

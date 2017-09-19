`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/26/2017 07:40:23 AM
// Design Name: 
// Module Name: Unidad_CTRL
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

//modulo para la unidad de control de las señales del microprocesador en general
module Unidad_CTRL(
RegDst,
ALUSrc,
MemtoReg,
RegWrite,
MemRead,
MemWrite,
Branch,
ALUOp,
Jump,
SignZero,
Opcode
);

output RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
output [1:0] ALUOp;
input [5:0] Opcode;
reg RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,Jump,SignZero;
reg [1:0] ALUOp;
always @(*)
casex (Opcode)
 //para las instrucciones tipo R
 6'b000000 : begin // R - type
     RegDst = 1'b1; //activa el banco de registros
     ALUSrc = 1'b0; 
     MemtoReg= 1'b0;
     RegWrite= 1'b1; //escribe en el banco de registros
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10; //la ALU se activa para hacer operación lógica/aritmética
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 //para las instrucciones que cargan un dato de la memoria
 6'b100011 : begin // lw - load word
     RegDst = 1'b0;
     ALUSrc = 1'b1; //se activa el RISC de la ALU
     MemtoReg= 1'b1; //Busca el dato en la memoria para escribirlo en el banco de registros
     RegWrite= 1'b1; //escribe el dato en el banco de registros
     MemRead = 1'b1; //lee el dato de la memoria
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b0;
     SignZero= 1'b0; // sign extend
    end
 //para cuando se va a cargar un archivo en la memoria
 //recordar que "x" significa que no importa el estado
 6'b101011 : begin // sw - store word
     RegDst = 1'bx;
     ALUSrc = 1'b1; //se activa el RISC de la ALU
     MemtoReg= 1'bx;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b1; //escribe el dato en la memoria
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 //para las intrucciones que hacen branches
 6'b000101 : begin // bne - branch if not equal
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b1; //hace el branch
     ALUOp = 2'b01;
     Jump = 1'b0;
     SignZero= 1'b0; // sign extend
    end
 
 //para las instrucciones que necesitan un dato inmediato
 6'b001110 : begin // XORI - XOR immidiate
     RegDst = 1'b0;
     ALUSrc = 1'b1; //se activda el RISC de la ALU
     MemtoReg= 1'b0;
     RegWrite= 1'b1; //escribe en el banco de registros
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b11;
     Jump = 1'b0;
     SignZero= 1'b1; // hace la extensión de zero
    end
 
 //para las instrucciones que requieren saltos
 6'b000010 : begin // j - Jump
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b00;
     Jump = 1'b1; //hace el salto 
     SignZero= 1'b0;
    end
 default : begin 
     RegDst = 1'b0;
     ALUSrc = 1'b0;
     MemtoReg= 1'b0;
     RegWrite= 1'b0;
     MemRead = 1'b0;
     MemWrite= 1'b0;
     Branch = 1'b0;
     ALUOp = 2'b10;
     Jump = 1'b0;
     SignZero= 1'b0;
    end
 
endcase

endmodule

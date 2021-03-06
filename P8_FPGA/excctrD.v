`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:30:25 12/26/2017 
// Design Name: 
// Module Name:    excctrD 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "head.v"
module excctrD(
    input [31:0] causeD,
    input [31:0] instrD,
	 input [31:0] npc,
	 input br,
    output [31:0] causeD2
    );
	 wire[5:0] op, f;
	 wire[25:21] bits2521;
	 wire[4:0] t;

	 assign bits2521 = instrD[25:21];
	 assign op = instrD[31:26];
	 assign f = instrD[5:0];
	 assign t = instrD[20:16];
	 
	 
	 assign causeD2 = !(`lb||`lbu||`lh||`lhu||`lw||
							 `sb||`sh||`sw||
							 `add||`addu||`sub||`subu||
							 `sll||`srl||`sra||`sllv||`srlv||`srav||
							 `and||`andi||`or||`xor||`nor||`addi||`addiu|||`ori||`xori||`lui||
							 `slt||`slti||`sltiu||`sltu||
							 `beq||`bne||`blez||`bgtz||`bltz||`bgez||
							 `j||`jal||`jr||`jalr||
							 `eret||`mfc0||`mtc0)&&(causeD[30:0]==31'b0)?{causeD[31],24'b0, 5'd10, 2'b0}:
							 causeD;

endmodule

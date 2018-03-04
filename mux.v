`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:39 11/16/2015 
// Design Name: 
// Module Name:    mux 
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
module mux(
    input [6:0] a,
    input [6:0] b,
    input [6:0] c,
    input [6:0] d,
    output [6:0] salida,
	 output [3:0] trans,
    input [1:0] sel
    );
	 
	assign salida = 	(sel == 'b00) ? a:
							(sel == 'b01) ? b:
							(sel == 'b10) ? c:
							(sel == 'b11) ? d:
							'hf;

	assign trans = 	(sel == 'b00) ? 'b1110:
							(sel == 'b01) ? 'b1111:
							(sel == 'b10) ? 'b1011:
							(sel == 'b11) ? 'b0111:
							'hf;
endmodule


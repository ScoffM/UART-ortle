`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:08:29 11/16/2015 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2(
    input [7:0] switch,
    input [7:0] RX,
    output [7:0] salida,
	 input sel
	 );

	 
	 assign salida = 	(sel == 'b0) ? switch:
							(sel == 'b1) ? RX:
							'hf;
							
endmodule

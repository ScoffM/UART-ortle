`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:12 11/16/2015 
// Design Name: 
// Module Name:    clk 
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
module clkredu(
 input clk, //entrada del reloj interno 
 output reg salida //salida 
 ); 
 reg [25:0]conteo; 
always @(posedge clk) 
	begin 
		conteo <= conteo + 1; 
		if(conteo==2605)  
			begin 
				conteo <= 0; 
				salida <= salida+1; 
			end 
	end 
endmodule

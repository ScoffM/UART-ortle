`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:21 11/16/2015 
// Design Name: 
// Module Name:    gtv 
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
module gtv(
 input clk, //entrada del reloj interno 
 output reg [1:0] sel //selector 
 ); 
 reg [25:0]conteo; 

always @(posedge clk) 
	begin 
		conteo <= conteo + 1; 
		if(conteo==3000)  
			begin 
				conteo <= 0; 
				sel <= sel+1; 
			end 
	end 	
endmodule

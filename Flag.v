`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:32 11/16/2015 
// Design Name: 
// Module Name:    Flag 
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
module Flag(
		input [1:0]Rx,
		input clk, 
		input reset,
		input [1:0] identidad, 
		output reg bandera
    );
	 
	 always@(posedge clk, posedge reset)
	 	begin
			if (reset)
				bandera<=0;
			else 
				if(identidad == Rx)
					bandera<=1;
				else
					bandera<=0;
		end


endmodule

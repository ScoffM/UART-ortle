`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:14:32 11/16/2015 
// Design Name: 
// Module Name:    decoder 
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
module decoder(
		input bandera,
		input [7:0] in,
		output [6:0] Yo,
		output [6:0] El,
		output [6:0] msg //segments[6]->a, segment[0]->g
    );
	assign 
	msg=
		(in[3:0]==0 && bandera ==1)?'b0000001: //abcdefg
		(in[3:0]==1 && bandera ==1)?'b1001111:
		(in[3:0]==2 && bandera ==1)?'b0010010:
		(in[3:0]==3 && bandera ==1)?'b0000110:
		(in[3:0]==4 && bandera ==1)?'b1001100:
		(in[3:0]==5 && bandera ==1)?'b0100100:
		(in[3:0]==6 && bandera ==1)?'b0100000:
		(in[3:0]==7 && bandera ==1)?'b0001111:
		(in[3:0]==8 && bandera ==1)?'b0000000:
		(in[3:0]==9 && bandera ==1)?'b0000100:
		(in[3:0]==10 && bandera ==1)?'b0001000:
		(in[3:0]==11 && bandera ==1)?'b1100000:
		(in[3:0]==12 && bandera ==1)?'b0110001:
		(in[3:0]==13 && bandera ==1)?'b1000010:
		(in[3:0]==14 && bandera ==1)?'b0110000:
					'b1111110;
	assign Yo = 
		(in[7:6]==0)?'b0000001: //abcdefg
		(in[7:6]==1)?'b1001111:
		(in[7:6]==2)?'b0010010:
		(in[7:6]==3)?'b0000110:
		(in[7:6]==4)?'b1001100:
		(in[7:6]==5)?'b0100100:
					'b1111110;
	assign El = 
		(in[5:4]==0 && bandera ==1)?'b0000001: //abcdefg
		(in[5:4]==1 && bandera ==1)?'b1001111:
		(in[5:4]==2 && bandera ==1)?'b0010010:
		(in[5:4]==3 && bandera ==1)?'b0000110:
		(in[5:4]==4 && bandera ==1)?'b1001100:
		(in[5:4]==5 && bandera ==1)?'b0100100:
					'b1111110;			
		



endmodule

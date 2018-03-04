`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:53:19 11/16/2015 
// Design Name: 
// Module Name:    Trans 
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
module Trans(
	input clk, reset, transmitir, bandera,
   output reg salidaTx,
	input [7:0] entradaSw
   );
	reg [5:0] estado;
	always@(posedge clk, posedge reset)
			begin
				if(reset)
					begin
						estado<=0;
						salidaTx<=1;
					end
			else
				case(estado)
				0:begin
						if(transmitir|bandera)
							begin
								salidaTx<=0; //Start bit
								estado <= 1; //Siguiente estado
							end
						else
							begin
								estado<=0;   //regresamos al estado 0
								salidaTx<=1; //continuamos high
							end
				  end
				1:begin
						salidaTx<=entradaSw[0]; //mandamos primer bit
						estado<=2; //nos vamos al estado 2
					end
				2:begin
						salidaTx<=entradaSw[1]; 
						estado<=3; //nos vamos al estado 3
					end
				3:begin
						salidaTx<=entradaSw[2]; 
						estado<=4; //nos vamos al estado 4
					end
				4:begin
						salidaTx<=entradaSw[3]; 
						estado<=5; //nos vamos al estado 5
					end
				5:begin
						salidaTx<=entradaSw[4]; 
						estado<=6; //nos vamos al estado 6
					end
				6:begin
						salidaTx<=entradaSw[5]; 
						estado<=7; //nos vamos al estado 7
					end
				7:begin
						salidaTx<=entradaSw[6]; 
						estado<=8; //nos vamos al estado 8
					end
				8:begin
						salidaTx<=entradaSw[7]; 
						estado<=9; //nos vamos al estado 9
					end
				9:begin
						salidaTx<=0; //Bit vaquero de paridad. FIERRO
						estado <=10;
					end
				10:begin
						salidaTx<=1; //Stop Bit
						estado<=11; //Estado 0 vaquero
					end
				90:begin
						estado<=0;
					end
				default: estado <=estado+1; //mandalo al estado 0 vaquero por cualquier cosirijilla
					endcase
		end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:27 11/16/2015 
// Design Name: 
// Module Name:    Recibir 
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
module Recibir(
    input EntradaTx, reset,
	 input outclk, //////////////////
    output reg [7:0] SalidaRx//,
	
	 //output reg received
    );
reg [3:0] estado;

always@(posedge outclk) //quien sabe si a reset :o
		begin
			if(reset)
				begin
					estado<=0;
					SalidaRx<=7'b0;
				end
		else
			begin
			case(estado)
				0:begin
						if(EntradaTx==0) //si el transmisor transmitió el start bit, hacemos algo
							begin
								estado <= 1; //Siguiente estado
							end
						else //si no, no
							begin
								estado<=0;   //regresamos al estado 0
							end
				  end
				1:begin
						SalidaRx[0]<=EntradaTx; //guardamos primer bit
						estado<=2; //nos vamos al estado 2
					end
				2:begin
						SalidaRx[1]<=EntradaTx;  
						estado<=3; //nos vamos al estado 3
					end
				3:begin
						SalidaRx[2]<=EntradaTx;  
						estado<=4; //nos vamos al estado 4
					end
				4:begin
						SalidaRx[3]<=EntradaTx;  
						estado<=5; //nos vamos al estado 5
					end
				5:begin
						SalidaRx[4]<=EntradaTx;  
						estado<=6; //nos vamos al estado 6
					end
				6:begin
						SalidaRx[5]<=EntradaTx;  
						estado<=7; //nos vamos al estado 7
					end
				7:begin
						SalidaRx[6]<=EntradaTx;  
						estado<=8; //nos vamos al estado 8
					end
				8:begin
						SalidaRx[7]<=EntradaTx;  
						estado<=9; //nos vamos al estado 9
					end
				9:begin
						estado <=10;
					end
				10:begin
						estado<=0; //Estado 0 vaquero
						//received<=1;
					end
				default: estado <=0; //mandalo al estado 0 vaquero por cualquier cosirijilla
					endcase
		end
		end	
endmodule
 



`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:49:18 11/16/2015 
// Design Name: 
// Module Name:    Blastoise 
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
module Blastoise(
	input [7:0] in,//Entrada del dato de los 8 bits.Se introduce mediante los switches
	input send, //push button G12 envía la cadena o trama 
	input clk, //reloj interno de la basys
	input Rx, //Entrada del receptor
	input reset,//a la mera no se necesita reset :o
	output Tx, //Salida del transmisor
	output [6:0] segments, //segmentos de la basys
	output [3:0] trans
	);

	wire bauds; //Clock de velocidad de la UART
	wire bandera;
	wire [1:0] sel; //Para el multiplexor
	wire [7:0] RxData; //Cable con la data recibida que va al decodificador
	wire [6:0] msg,Yo,El ; //Decodificado del mensaje, id tuyo, y el id del que envio
	wire [7:0] TxData; //Aqui se guarda lo que se va atransmitir
	
		clkredu baudGen(.clk(clk),.salida(bauds)); //Da el clk para trabajar a los 9600 bauds
		
		//Proceso de recibir
		Recibir Recibir(.outclk(bauds),.EntradaTx(Rx),.SalidaRx(RxData),.reset(reset));//.received(received)); //quiza agregarele el reset al estado 0 vaquero
		Flag Bandereador(.clk(bauds),.Rx(RxData[5:4]),.identidad(in[7:6]),.bandera(bandera),.reset(reset)); //Compara 
		
		
		//Proceso de Enviar
		Mux2 EsMiador(.switch(in), .RX(RxData),.sel(bandera),.salida(TxData)); //Envía el dato correcto al transmisor
		Trans Transmitir(.clk(bauds),.reset(reset),.transmitir(send),.bandera(bandera),.entradaSw(TxData),.salidaTx(Tx));
		
		decoder decoderBH(.in(RxData),.msg(msg),.Yo(Yo),.El(El),.bandera(bandera)); // Este modulo decodifica el mensaje
		gtv gtv(.clk(clk),.sel(sel));
		mux mux1(.a(msg), .b(7'b0000001), .c(El), .d(Yo),.sel(sel),.salida(segments),.trans(trans));
endmodule



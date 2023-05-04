`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 09:27:04 PM
// Design Name: 
// Module Name: crc_8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module crc_8_basys(
    input logic [15:0] sw,
    output logic [15:0] LED
    );
    
    logic [7:0] check;
    
    // encoder(in data, out checksum)
    crc_8_encoder encoder(sw[7:0], check[7:0]);
    
    assign LED[7:0] = check[7:0];
    
    // decoder(in data, in checksum, out result)
    crc_8_decoder decoder(sw[15:8], check[7:0], LED[15:8]);
        
endmodule

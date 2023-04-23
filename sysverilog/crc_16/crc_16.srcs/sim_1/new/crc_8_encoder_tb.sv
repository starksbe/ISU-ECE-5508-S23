`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2023 09:19:13 AM
// Design Name: 
// Module Name: testbench1
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


module crc_8_encoder_testbench(
    );
    
    logic [7:0]inputData, poly, crc, checksum;
    
    CRC_Encoder dut (inputData, poly, checksum);
    
    initial begin
    
    inputData = 0; poly = 0; crc = 0; checksum = 0; #5;
    
    inputData = 8'h1a;
    poly = 8'h9b; #5; 
    
    #100;
    inputData = 8'h11; #5;
    //#100;
    //inputData = 8'h1b; #5;
    //#100;
   // inputData = 8'h1c; #5;
    
    end
    
initial
    
$monitor( "inputData=%b, poly=%b, crc=%b, checksum=%b", inputData, poly, crc, checksum);
    
endmodule

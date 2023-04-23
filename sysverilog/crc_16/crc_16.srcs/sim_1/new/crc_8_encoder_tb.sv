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


module crc_8_encoder_testbench();
    
    logic [7:0]inputData, poly, checksum;
    
    crc_8_encoder dut (inputData, poly, checksum);
    
    initial begin
        
        $monitor( "inputData=%b, poly=%b, checksum=%b", inputData, poly, checksum);
    
        inputData = 0; poly = 0; checksum = 0;
        poly = 8'h9b;
        
        inputData = 8'hde; #5;
        inputData = 8'hbe; #5;
        inputData = 8'hca; #5
        
        $finish;
    end
    
endmodule

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
    
    logic [7:0]input_data, poly, checksum;
    
    crc_8_encoder dut (input_data, poly, checksum);
    
    initial begin
        
        $monitor( "input_data=%b, poly=%b, checksum=%b", input_data, poly, checksum);
    
        input_data = 0; poly = 0; checksum = 0;
        poly = 8'h9b;
        
        input_data = 8'hde; #5;
        input_data = 8'hbe; #5;
        input_data = 8'hca; #5
        
        $finish;
    end
    
endmodule

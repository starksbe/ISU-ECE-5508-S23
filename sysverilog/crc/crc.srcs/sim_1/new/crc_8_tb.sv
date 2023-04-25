`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2023 09:28:35 PM
// Design Name: 
// Module Name: crc_8_tb
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
    
    logic [7:0]data, checksum;
    
    crc_8_encoder dut (data, checksum);
    
    initial begin
        
        $monitor( "data=%b, checksum=%b", data, checksum);
    
        data = 0; checksum = 0;
        
        data = 8'hde; #5;
        data = 8'hbe; #5;
        data = 8'hca; #5;
        
        $finish;
    end
    
endmodule

module crc_8_decoder_testbench();
    
    logic [7:0]data, checksum, result;
    
    crc_8_decoder dut (data, checksum, result);
    
    initial begin
        
        $monitor( "data=%b, checksum=%b, result=%b", data, checksum, result);
    
        data = 0; checksum = 0;
        
        data = 8'hde; checksum = 8'ha5; #5;
        data = 8'hbe; checksum = 8'hc5; #5;
        data = 8'hca; checksum = 8'hb1; #5
        
        $finish;
    end
    
endmodule

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
    
    logic [7:0] data, checksum; int unsigned crc_reg;
    
    crc_8_encoder dut (data, checksum);  //, crc_reg);
    
    initial begin
        
        $monitor( "data=%b, checksum=%b", data, checksum);
    
        data = 0; checksum = 0;
        
        #50 data = 8'hde; #25 assert (checksum == 8'ha5) $display("pass");
            else $display("Checksum %b (%x) DNE %b (%x)", checksum, checksum, 8'ha5, 8'ha5);
        #25 data = 8'hbe; #25 assert (checksum == 8'hc5) $display("pass");
            else $display("Checksum %b (%x) DNE %b (%x)", checksum, checksum, 8'hc5, 8'hc5);
        #25 data = 8'hca; #25 assert (checksum == 8'hb1) $display("pass");
            else $display("Checksum %b (%x) DNE %b (%x)", checksum, checksum, 8'hb1, 8'hb1);
        
        #25 $finish;
    end
    
endmodule

module crc_8_decoder_testbench();
    
    logic [7:0] data, checksum, result;  int unsigned crc_reg;
    
    crc_8_decoder dut (data, checksum, result);  //, crc_reg);
    
    initial begin
        
        $monitor( "data=%b, checksum=%b, result=%b", data, checksum, result);
    
        data = 0; checksum = 0;

        #50 data = 8'hde; checksum = 8'ha5; #25 assert (result == 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
        #25 data = $random & 8'hde; checksum = $random & 8'ha5; #25 assert (result != 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
        
        #25 data = 8'hbe; checksum = 8'hc5; #25 assert (result == 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
        #25 data = $random & 8'hbe; checksum = $random & 8'hc5; #25 assert (result != 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
            
        #25 data = 8'hca; checksum = 8'hb1; #25 assert (result == 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
        #25 data = $random & 8'hca; checksum = $random & 8'hff; #25 assert (result != 8'h00) $display("pass");
            else $display("Result %b (%x) DNE %b (%x)", result, result, 8'h00, 8'h00);
        
        #25 $finish;
    end
    
endmodule

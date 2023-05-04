`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2023 12:50:33 AM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    
    logic [15:0] x, y;
    
    crc_8_basys dut(x, y);
    
    initial begin
        x = 16'b0000000000000000;
    
        #25 x = 16'b0000000011011110;
        
        #25 $finish;
    end
endmodule

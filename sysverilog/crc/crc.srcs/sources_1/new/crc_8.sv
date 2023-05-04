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


module crc_8_encoder(
    input logic [7:0] data,  // Data is used to calculate checksum with poly.
    output logic [7:0] checksum  // Checksum calculated for 0 result of XOR.
    // , int unsigned crc_reg
    );
    
    int unsigned poly = 8'h9b;  // Internal variable for polynomial.
    int unsigned crc = 16'h00ff; // Internal variable for CRC register.
    
    // assign crc_reg = crc;
    
    always @(data) begin
        crc = 16'h00ff;  // Reinitialize the CRC register for the modulo 2 division.
        
        for (int i = 0; i < 8; i++) begin   // Iterate over each literal in dataword.
            if (crc & 8'h80)                // If current bit of crc register is 1.
                crc = (crc << 1) ^ poly;    // XOR CRC variable with polynomial.
            else                            //
                crc = crc << 1;             // Shift CRC register to left.
                                            //
            if (data & (1 << (7-i)))        // If current literal in dataword is 1 ...
                crc = crc ^ 8'h01;          // XOR CRC register with dataword.
            #1;                             //
            end                             //
                                            //
        checksum = crc & 8'hff;             // Only take 8 LSBs for checksum
    end
endmodule

module crc_8_decoder(
    input logic [7:0] data, checksum,  //  Data and checksum used to calculate result.
    output logic [7:0] result  // Result indicates if data received contains error (nonzero).
    // , int unsigned crc_reg
    );
    
    int unsigned poly = 8'h9b;  // Internal variable for polynomial.
    int unsigned crc = 16'h00ff; // Internal variable for CRC register.
    
    // assign crc_reg = crc;
    
    always @(data, checksum) begin
        crc = 16'h00ff;  // Reinitialize the CRC register for the modulo 2 division.
        
        for (int i = 0; i < 8; i++) begin   // Iterate over each literal in dataword.
            if (crc & 8'h80)                // If current bit of crc register is 1.
                crc = (crc << 1) ^ poly;    // XOR CRC variable with polynomial.
            else                            //
                crc = crc << 1;             // Shift CRC register to left.
                                            //
            if (data & (1 << (7 - i)))      // If current literal in dataword is 1 ...
                crc = crc ^ 8'h01;          // XOR CRC register with dataword.
            #1;                             //
            end                             //
                                            //
        result = checksum - (crc & 8'hff);  // Compare calculated checksum with supplied.
    end
endmodule

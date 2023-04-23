`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2023 09:18:54 AM
// Design Name: 
// Module Name: four_Bitin
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
    input logic [7:0]inputData, [7:0]poly, //inputs include the user input data and constant crc polynomial
    output logic [7:0]checksum             //only variable we want out of this is the checksum calculation
    );
    
int unsigned crc = 16'h00ff;                             //temp variable

always @(inputData) begin
    crc = 16'h00ff;
    
    for (int i = 0; i < 8; i++) begin           //iterate over each literal in dataword
        if (crc & 8'h80)                        //if current bit of crc register is 1
            crc = (crc << 1) ^ poly;           //XOR CRC variable with polynomial
        else 
            crc = crc << 1;                    //shift CRC register to left
        
        if (inputData & (1 << (7-i)))                 //if current literal in dataword is 1
            crc = crc ^ 8'h01;                  //XOR crc with dataword
        
    checksum = crc & 8'hFF;

    end
end
endmodule
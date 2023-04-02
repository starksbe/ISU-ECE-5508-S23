# ------------------------------------------------------------------------------
# File:             crc-encoder.py
# Description:      Performs CRC-16 error detection algorithm.
# Author:           Barret Durchi & Brandon Starks
# Date:             March April 1st, 2023
# ------------------------------------------------------------------------------
"""File that performs a CRC-16 error detection algorithm."""


def crc_16_encode(data: int, poly: int = 0x8005) -> int:
    """Function to encode two bytes of data with a two
    byte CRC checksum. Format of the encoded data is:
    bits [31-16] -> data, bits [15-0] -> crc checksum.
    
    Arguments:
        data (int): The 16 bit data word to encode with CRC.
        
    Returns:
        The original data with a 16 bit CRC checksum
        appended after the LSB of the data.
    """
    # The initial value of the CRC register
    crc = 0x0000

    # Iterate over each bit of the data word
    for i in range(16):
        # If the current bit of the CRC register is 1
        if crc & 0x8000:
            # XOR the CRC register with the polynomial
            crc = (crc << 1) ^ poly
        else:
            # Shift the CRC register to the left
            crc = crc << 1
        # If the current bit of the data word is 1
        if data & (1 << (15-i)):
            # XOR the CRC register with the data word
            crc = crc ^ 0x0001

    # Return the final value of the CRC register as a 16-bit integer
    return crc

if __name__ == "__main__":
    # Example data with CRC encoded.
    data = 0xbeef
    crc = crc_16_encode(data)

    print(f"Data:     {hex(data)}")
    print(f"CRC:      {hex(crc)}")

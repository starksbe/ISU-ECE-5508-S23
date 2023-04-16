# ------------------------------------------------------------------------------
# File:             crc-decoder.py
# Description:      Performs CRC-16 error detection algorithm.
# Author:           Brandon E. Starks
# Date:             March 28th, 2023
# ------------------------------------------------------------------------------
"""File that performs a CRC error detection algorithm."""

def crc_8_decode(data: int, crc: int, poly: int = 0x9B) -> int:
    """Function to decode a four bytes of data with a two
    byte CRC checksum to verify the integrity of the data.
    
    Arguments:
        data (int): The 16 bit data word to decode with CRC.
        poly (int): The polynomial of the CRC decoder.
        
    Returns:
        The calculated CRC checksum which should match the
        checksum provided with the data.
    """
    # The initial value of the CRC register
    crc_register = 0xFF

    # Iterate over each bit of the data word
    for i in range(8):
        # If the current bit of the CRC register is 1
        if crc_register & 0x80:
            # XOR the CRC register with the polynomial
            crc_register = (crc_register << 1) ^ poly
        else:
            # Shift the CRC register to the left
            crc_register = crc_register << 1
        # If the current bit of the data word is 1
        if data & (1 << (7-i)):
            # XOR the CRC register with the data word
            crc_register = crc_register ^ 0x01
    
    # If the final CRC value is 0, the CRC check passed
    if crc_register & 0xFF == crc:
        return True
    else:
        return False

def crc_16_decode(data: int, crc: int, poly: int = 0x8005) -> int:
    """Function to decode a four bytes of data with a two
    byte CRC checksum to verify the integrity of the data.
    
    Arguments:
        data (int): The 16 bit data word to decode with CRC.
        poly (int): The polynomial of the CRC decoder.
        
    Returns:
        The calculated CRC checksum which should match the
        checksum provided with the data.
    """
    # The initial value of the CRC register
    crc_register = 0xFFFF

    # Iterate over each bit of the data word
    for i in range(16):
        # If the current bit of the CRC register is 1
        if crc_register & 0x8000:
            # XOR the CRC register with the polynomial
            crc_register = (crc_register << 1) ^ poly
        else:
            # Shift the CRC register to the left
            crc_register = crc_register << 1
        # If the current bit of the data word is 1
        if data & (1 << (15-i)):
            # XOR the CRC register with the data word
            crc_register = crc_register ^ 0x0001
    
    # If the final CRC value is 0, the CRC check passed
    if crc_register & 0xFFFF == crc:
        return True
    else:
        return False

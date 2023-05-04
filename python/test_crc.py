# ------------------------------------------------------------------------------
# File:             test-crc.py
# Description:      Performs tests on CRC-16 error detection algorithms.
# Author:           Brandon E. Starks
# Date:             April 2nd, 2023
# ------------------------------------------------------------------------------
"""Test suite for the CRC-16 encoder/decoder modules."""

from crc_encoder import crc_8_encode as crc_encode
from crc_decoder import crc_8_decode as crc_decode

def test_crc_8(*data_values: int, show_results: bool = False) -> bool:
    """Test function to verify expected behavior of the CRC-8 encoder
    and decoder modules.
    
    Arguments:
        data (tuple[int, ...]): The data to run the checks on.
        display (bool): 
    
    Returns:
        True if all checks on each datum pass, otherwise false.
    """
    results = {}
    for data_word in data_values:
        crc_header = crc_encode(data_word)
        print(f"Data: {data_word:02x}, Checksum: {crc_header:02x}")
        crc_pass = crc_decode(data_word, crc_header)
        results[hex(data_word)] = crc_pass
    
    if show_results:
        print(f" results: {results}")

    return all([v for _,v in results.items()])

if __name__ == "__main__":
    assert test_crc_8(0xDE, 0xBE, 0xCA, show_results=True), "Not all CRC checks passed."

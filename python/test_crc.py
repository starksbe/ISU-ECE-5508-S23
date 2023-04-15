# ------------------------------------------------------------------------------
# File:             test-crc.py
# Description:      Performs tests on CRC-16 error detection algorithms.
# Author:           Brandon E. Starks
# Date:             April 2nd, 2023
# ------------------------------------------------------------------------------
"""Test suite for the CRC-16 encoder/decoder modules."""

import inspect
from crc_encoder import crc_16_encode
from crc_decoder import crc_16_decode

def test_crc_16_encode() -> None:
    """Test function to verify expected output of the CRC-16 encoder
    module.

    Arguments:

    
    Returns:

    """

def test_crc_16_decode() -> None:
    """Test function to verify expected output of the CRC-16 decoder
    module.
    
    Arguments:
        
    
    Returns:
        
    """

def test_crc_16(*data_values: int, show_results: bool = False) -> bool:
    """Test function to verify expected behavior of the CRC-16 encoder
    and decoder modules.
    
    Arguments:
        data (tuple[int, ...]): The data to run the checks on.
        display (bool): 
    
    Returns:
        True if all checks on each datum pass, otherwise false.
    """
    results = {}
    for data_word in data_values:
        crc_header = crc_16_encode(data_word)
        crc_pass = crc_16_decode(data_word, crc_header)
        results[hex(data_word)] = crc_pass
    
    if show_results:
        print(f"{inspect.currentframe().f_code.co_name}() results: {results}")

    return all([v for _,v in results.items()])

if __name__ == "__main__":
    assert test_crc_16(0xDEAD, 0xBEEF, 0xCAFE, show_results=True), "Not all CRC checks passed."

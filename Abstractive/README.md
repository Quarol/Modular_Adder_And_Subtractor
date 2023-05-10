The implementation of the mathematical formulas for any modulus with a simple test.
  
The unified set of formulas for modular addition and subtraction were given as follows:  
`` z = (x + (-1)^s * y) mod m
``    

if s = '0' and v < 2^n  
  or s = '1' and w >= 2^(n+1):
``z = w mod 2^n``

otherwise:
``z = v mod 2^n``

where ``w, v, m, n, s`` are given as follows:  
``w = x + (y XOR s) + (2^n AND s) + s``  
``v = x + (y XOR s) + (~m XOR s) + 1``  
``m`` - given modulus  
``n  = ceil(log2(m))`` - bits in each input number  
``s`` - operation parameter - '0' for addition, '1' for subtraction  
``a XOR s`` - every bit of a XOR s

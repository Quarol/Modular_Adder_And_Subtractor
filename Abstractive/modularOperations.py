import math


class ModularOperator:
    def __init__(self, modulus: int):
        self.n = None
        self.m = None
        self.subtract_mode = None
        self.set_modulus(modulus)

    def set_modulus(self, modulus: int):
        self.m = modulus
        self.n = math.log2(self.m)
        self.n = math.ceil(self.n)

    def add(self, x, y):
        return calculate(self.m, self.n, x, y, 0)

    def subtract(self, x, y):
        return calculate(self.m, self.n, x, y, 1)


'''
    ** - pow
    &  - bit-wise "and" 
    |  - bit-wise "or"
    ^  - bit-wise "xor"
    ~  - bit-wise "not"
'''


def calculate(m: int, n: int, x: int, y: int, s: int):
    if x not in range(m) or y not in range(m):  # range(m) means [0, m-1]
        raise Exception('\n\nERROR! The number must be in the range [0, m-1]')

    # created to save up on computing
    two_to_n = 2 ** n
    s_for_xy = s * (two_to_n - 1)
    s_for_2_to_n = s * (two_to_n*2 - 1)
    repeating_part = x + (y ^ s_for_xy)

    w = repeating_part + (two_to_n & s_for_2_to_n) + s  # alternatively: 2**n ^ NOT(s)
    v = repeating_part + (NOT(m) ^ s_for_xy) + 1

    if (s == 0 and v < two_to_n) or \
            (s == 1 and w >= two_to_n*2):
        return w % two_to_n

    return v % two_to_n


# in python int is always signed, so we have to keep the leftmost bit as it was
# we can achieve it by using bit-mask which leftmost bit is always 0
# to get such a mask, we have to subtract 1 from 1 left-shifted [num_of_bits] times
def NOT(number: int):
    bits = number.bit_length()
    bitmask = (1 << bits) - 1
    return ~number & bitmask

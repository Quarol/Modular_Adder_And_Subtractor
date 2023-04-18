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
        self.subtract_mode = 2 ** self.n - 1

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
    # created to save up on computing
    s_for_xy = s * (2**n - 1)
    s_for_2n = s * (2**(n+1) - 1)
    repeating_part = x + (y ^ s_for_xy)

    w = repeating_part + ((2**n) ^ s_for_2n) + s
    v = repeating_part + (NOT(m) ^ s_for_xy) + 1

    print(f'w={w}, v={v}, s={s}, 2**n={2**n}, !m={NOT(m)}, y^s={y^s}, 2**n^s={(2**n)^s}, !m^s={NOT(m)^s}')
    print("w:", x, y^s_for_xy, (2**n)^s_for_2n, s, "=", w)
    print("v:", x, y^s_for_xy, NOT(m)^s_for_xy, 1, "=", v)

    if (s == 0 and v < 2**n) or \
            (s == 1 and w >= 2**(n+1)):
        print('w chosen')
        return w % 2**n

    print('v chosen')
    return v % 2**n


def get_s(bits: int):
    return 2**bits - 1


# in python int is always signed, so we have to keep the leftmost bit as it was
# we can achieve it by using bit-mask which leftmost bit is always 0
# to do it, we have to subtract 1 from 1 left-shifted [num_of_bits] times
def NOT(number: int):
    bits = number.bit_length()
    bitmask = (1 << bits) - 1
    return ~number & bitmask

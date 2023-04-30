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

        if s == 1:
            test(x, y, w, two_to_n, s)
        return w % two_to_n

    #if s == 0:
     #   test(x, y, v, two_to_n, s)
    return v % two_to_n


def f(text: str):
    txt = ''
    for c in text:
        txt += c + '   '
    return txt


def test(x, y, p, two_to_n, s):
    bin_x = bin(x)[2::]
    bin_y = bin(y)[2::]
    bin_res = bin(p % two_to_n)[2::]

    bin_x = (4 - len(bin_x)) * '0' + bin_x
    bin_y = (4 - len(bin_y)) * '0' + bin_y
    bin_res = (4 - len(bin_res)) * '0' + bin_res

    file = open('res.txt', 'a')
    text = f'{s}    {f(bin_x)}  {f(bin_y)}  {f(bin_res)}\n'
    file.write(text)
    file.close()


# in python int is always signed, so we have to keep the leftmost bit as it was
# we can achieve it by using bit-mask which leftmost bit is always 0
# to get such a mask, we have to subtract 1 from 1 left-shifted [num_of_bits] times
def NOT(number: int):
    bits = number.bit_length()
    bitmask = (1 << bits) - 1
    return ~number & bitmask

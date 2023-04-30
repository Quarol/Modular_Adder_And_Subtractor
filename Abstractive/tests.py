import math


def NOT(number: int):
    bits = number.bit_length()
    bitmask = (1 << bits) - 1
    return ~number & bitmask


def test_combinations(m: int, comb):
    pass


def run(m):
    for a in range(2):
        for b in range(2):
            for c in range(2):
                for d in range(2):
                    for e in range(2):
                        for f in range(2):
                            for g in range(2):
                                test_combinations(m, [a, b, c, d, e, f, g])

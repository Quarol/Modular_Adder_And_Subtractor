import math
from modularOperations import ModularOperator as ModularOperator
import pdb


def test(m: int):
    n = math.log2(m)
    n = math.ceil(n)
    digital_numbers = [i for i in range(2 ** n)]

    combinations = []
    for x in digital_numbers:
        for y in digital_numbers:
            combinations.append([x, y])

    operator = ModularOperator(m)

    for combination in combinations:
        x = combination[0]
        y = combination[1]

        good_result_add = ((x % m) + (y % m)) % m
        result_add = operator.add(x, y)

        if good_result_add != result_add:
            operator.add(x, y)

        good_result_sub = ((x % m) - (y % m)) % m
        result_sub = operator.subtract(x, y)

        if good_result_sub != result_sub:
            operator.subtract(x, y)


def validate(results: list):
    for r in results:
        if r[0] != r[1]:
            return False
    return True


if __name__ == '__main__':
    m = 11
    operator = ModularOperator(m)
    x = 8
    y = 5
    print(operator.add(x, y))
    print(operator.subtract(x, y))


    #test(m)

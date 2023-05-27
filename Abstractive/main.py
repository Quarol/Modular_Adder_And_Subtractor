from modularOperations import ModularOperator as ModularOperator


# the function tests every combination of inputs for a given modulus - m
# it returns 2 boolean variables:
# - is_add - checking if all additions results were correct
# - is_sub - checking if all subtraction results were correct
def combinations(m: int):
    op = ModularOperator(m)

    # tests for addition:
    # fills good (the right results) and algorithm (results produced by ModularOperator)
    good = []
    algorithm = []
    for x in range(m):
        for y in range(m):
            t = (x % m + y % m) % m
            a = op.add(x, y)
            good.append(t)
            algorithm.append(a)

    # checks if every addition result is right and saves the answer to is_add
    is_add = True
    for i in range(len(good)):
        is_add = (good[i] == algorithm[i])
        if not is_add:
            break

    # tests for subtraction:
    # fills good (the right results) and algorithm (results produced by ModularOperator)
    good = []
    algorithm = []
    for x in range(m):
        for y in range(m):
            t = (x % m - y % m) % m
            a = op.subtract(x, y)
            good.append(t)
            algorithm.append(a)

    # checks if every subtraction result is right and saves the answer to is_sub
    is_sub = True
    for i in range(len(good)):
        is_sub = (good[i] == algorithm[i])
        if not is_sub:
            break

    return is_add, is_sub


# test of every input numbers combination for moduli in range [6, 200]
# The function prints moduli where at least one combination of inputs was wrong
# if every output for every combination was right, nothing will be printed
def test():
    m_min = 6
    m_max = 200

    for m in range(m_min, m_max + 1):
        is_true = combinations(m)
        if False in is_true:
            print(m)


if __name__ == '__main__':
    test()

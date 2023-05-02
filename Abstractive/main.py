from modularOperations import ModularOperator as ModularOperator



def combinations(m: int):
    op = ModularOperator(m)

    good = []
    algorithm = []
    for x in range(m):
        for y in range(m):
            t = (x % m + y % m) % m
            a = op.add(x, y)
            good.append(t)
            algorithm.append(a)

    is_add = True
    for i in range(len(good)):
        is_add = (good[i] == algorithm[i])
        if not is_add:
            break

    good = []
    algorithm = []
    for x in range(m):
        for y in range(m):
            t = (x % m - y % m) % m
            a = op.subtract(x, y)
            good.append(t)
            algorithm.append(a)

    is_sub = True
    for i in range(len(good)):
        is_sub = (good[i] == algorithm[i])
        if not is_sub:
            break

    return is_add, is_sub


def test():
    m_min = 6
    m_max = 200

    for m in range(m_min, m_max + 1):
        is_true = combinations(m)
        if False in is_true:
            print(m)


if __name__ == '__main__':
    test()

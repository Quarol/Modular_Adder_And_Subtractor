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


def f(text: str):
    txt = ''
    for c in text:
        txt += c + '   '
    return txt


if __name__ == '__main__':
    m = 11
    n = 4

    print('s    x3  x2  x1  x0    y3  y2  y1  y0    z3  z2  z1  z0')
    combinations(m)


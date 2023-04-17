from modularOperations import ModularOperator as ModularOperator


def test():
    operator = ModularOperator(17)
    var1 = operator.add(12, 13)
    var2 = operator.subtract(12, 13)

    print(var1)
    print(var2)


if __name__ == '__main__':
    test()

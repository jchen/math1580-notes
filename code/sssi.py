def sssi(M, s):
    L = []
    for i in M[::-1]:
        if s >= i:
            s -= i
            L.append(1)
        else:
            L.append(0)
    if s == 0:
        return L[::-1]

    print("!!!!!")

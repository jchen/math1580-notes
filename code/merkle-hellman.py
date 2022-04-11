from sssi import *

R = [1, 3, 9, 20, 50, 101]
A = 485
B = 1009
print(f"A and B coprime? {gcd(A, B) == 1}")

M = [i * A % B for i in R]
print(f"M = {M}")


def e(X):
    return sum([X[i] * M[i] for i in range(len(M))])


c = e([1, 1, 1, 0, 1, 1])

print(f"c = {c}")


def d(c):
    cp = ext_gcd(A, B)[0] * c % B
    return sssi(R, cp)


print(f"d(c) = {d(c)}")

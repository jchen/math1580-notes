def hadamard_ratio(L):
    H = abs(L.det())
    for v in L:
        H /= v.norm()
    return ((H ** (1 / L.dimensions()[0]))).n()

L = random_matrix(ZZ, 3, x=-10, y=10)

def babai(L, w):
    a = w * L.inverse()
    a = a.apply_map(lambda x : x.round())
    return (a, a * L)

w = random_vector(ZZ, 3, x=-100, y=100)

print(f"Hadamard Ratio: {hadamard_ratio(L)}")
print(f"Babai: {babai(L, w)}")
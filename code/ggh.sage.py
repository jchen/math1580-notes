

# This file was *autogenerated* from the file ggh.sage
from sage.all_cmdline import *   # import sage library

def random_sl(n, ops, limit):
    """
    Generates a random n x n matrix with determinant 1. 
    """
    L = identity_matrix(ZZ, n)
    for _ in range(ops):
        i = randrange(n)
        j = randrange(n)
        if i == j: 
            continue
        L[i] += L[j] * randrange(-limit, limit)
    return L


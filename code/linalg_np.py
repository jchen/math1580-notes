from numpy import *
from numpy.linalg import *


def hadamard_ratio(L):
    """
    Computes the Hadamard ratio of a list of vectors.
    """
    H = abs(det(array(L)))
    for v in L:
        H /= norm(v)
    return H ** (1 / len(L))

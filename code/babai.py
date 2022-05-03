from numpy import *
from numpy.linalg import *


def babai(L, w):
    """
    param L: lattice
    param w: vector
    """
    M = array(L).T
    W = array([w]).T
    a = vectorize(round)(inv(M) @ W)
    wp = M @ a
    return ([i[0] for i in a], [i[0] for i in wp])

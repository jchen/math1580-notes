from sympy import sqrt, Rational


def dot(v: list[int], w: list[int]) -> int:
    """
    Computes the dot product of two vectors.

    >>> dot([1, 2], [3, 4])
    11

    >>> dot([1, 2, 1], [3, 4, 3])
    14

    param v: a vector
    param w: a vector
    return: the dot product of v and w
    """
    return sum(v_i * w_i for v_i, w_i in zip(v, w))


def length(v: list[int]) -> float:
    """
    Computes the length of a vector.

    >>> length([3, 4])
    5.0

    >>> length([1, 2, 3])
    sqrt(14)

    param v: a vector
    return: the length of v
    """
    return sqrt(dot(v, v))


def gs(L: list[list[int]]) -> list[list[int]]:
    """
    Computes an orthogonal basis of span(L).

    >>> gs([[1, 0, -1], [1, -1, 0]])
    [[1.0, 0, -1.0], [0.5, 1.0, 0.5]]

    param L: a list of basis vectors
    return: an orthogonal basis using the Gram-Schmidt process
    """
    M = []
    for v in L:
        for w in M:
            mu = Rational(dot(w, v), dot(w, w))
            v = [v_i - mu * w_i for v_i, w_i in zip(v, w)]
        M.append(v)
    # Uncomment below if we want orthonormal basis:
    # M = [[v_i / length(v) for v_i in v] for v in M]
    return M

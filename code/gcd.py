def gcd(a: int, b: int) -> int:
    """
    Computes the gcd of a and b using the Euclidean algorithm.
    param a: int
    param b: int
    return: int gcd of a and b
    """
    while b != 0:
        a, b = b, a % b
    return a
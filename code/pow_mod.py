def pow_mod(a: int, b: int, p: int) -> int:
    """
    Computes a^b mod p using repeated squaring.
    param a: int
    param b: int
    param p: int
    return: int a^b mod p
    """
    result = 1
    while b > 0:
        if b & 1:
            result = (result * a) % p
        a = (a * a) % p
        b >>= 1
    return result

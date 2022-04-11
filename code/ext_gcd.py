def ext_gcd(a: int, b: int) -> tuple[int, int]:
    """
    Computes the gcd of a and b using the extended Euclidean algorithm.
    param a: int
    param b: int
    return: tuple (int x, int y) where ax + by = gcd(a, b)
    """
    x, y, z, w = 1, 0, 0, 1
    while b != 0:
        x, y, z, w = z, w, x - (a // b) * z, y - (a // b) * w
        a, b = b, a % b
    return (x, y)

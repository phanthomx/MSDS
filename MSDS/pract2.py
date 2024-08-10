import random
import math
def generate_Keypair(bitlength=16):
    p = generate_large_prime(bitlength)
    q  = generate_large_prime(bitlength)
    N = p * q
    phi = (p - 1) * (q - 1)
    print(phi)
    e = random.randrange(2, phi)
    while math.gcd(e, phi) != 1:
        e = random.randrange(2, phi)
    d = modular_inverse(e, phi)
    return ((N, e), (N, d))
def generate_large_prime(bitlength):
    while True:
        prime_candidate = random.getrandbits(bitlength)
        if is_prime(prime_candidate):
            return prime_candidate
def is_prime(n, k=10):
    if n<= 1:
        return False
    if n<= 3:
        return True
    if n % 2 == 0:
        return False
    r, s = 0, n - 1
    while s % 2 == 0:
        r += 1
        s //= 2
    for _ in range(k):
        a = random.randrange(2, n - 1)
        x = pow(a, s, n)
        if x == 1 or x == n - 1:
            continue
        for _ in range(r - 1):
            x = pow(x, 2, n)
            if x == n - 1:
                break
            else:
                return False
            return True
def modular_inverse(a, m):
    m0, x0, x1 = m, 0, 1
    if m == 1:
        return 0
    while a>1:
        q = a // m
        m, a = a % m, m
        x0, x1 = x1 - q * x0, x0
        if x1<0:
            x1 += m0
            return x1
def encrypt(message, public_key):
    N, e = public_key
    ciphertext = [pow(ord(char), e, N) for char in message]
    return ciphertext
def decrypt(ciphertext, private_key):
    N, d = private_key
    plaintext = [chr(pow(char, d, N)) for char in ciphertext]
    return ''.join(plaintext)
if __name__ == '__main__':
    public_key, private_key = generate_Keypair()
    print("Public Key (N, e):", public_key)
    print("Private Key (N, d):", private_key)
    message = "jadhav snehal";
    print("Original Message:", message)
    encrypted_message = encrypt(message, public_key)
    print("Encrypted Message:", encrypted_message)
    decrypted_message = decrypt(encrypted_message,private_key)
    print("Decrypted Message:", decrypted_message)

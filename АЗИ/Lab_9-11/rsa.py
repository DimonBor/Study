import random


BIT_SIZE = int(8)

first_primes_list = [
    2, 3, 5, 7, 11, 13, 17, 19, 23, 29,
    31, 37, 41, 43, 47, 53, 59, 61, 67,
    71, 73, 79, 83, 89, 97, 101, 103,
    107, 109, 113, 127, 131, 137, 139,
    149, 151, 157, 163, 167, 173, 179,
    181, 191, 193, 197, 199, 211, 223,
    227, 229, 233, 239, 241, 251, 257,
    263, 269, 271, 277, 281, 283, 293,
    307, 311, 313, 317, 331, 337, 347, 349
]


def n_bit_random(n):
    return random.randrange(2**(n-1)+1, 2**n - 1)
 

def get_low_level_prime(n):
    while True:
        pc = n_bit_random(n)
        for divisor in first_primes_list:
            if pc % divisor == 0 and divisor**2 <= pc:
                break
        else: return pc
 
 
def is_miller_rabin_passed(mrc):
    max_divisions_by_two = 0
    ec = mrc-1
    while ec % 2 == 0:
        ec >>= 1
        max_divisions_by_two += 1
    assert(2**max_divisions_by_two * ec == mrc-1)
 
    def trial_composite(round_tester):
        if pow(round_tester, ec, mrc) == 1:
            return False
        for i in range(max_divisions_by_two):
            if pow(round_tester, 2**i * ec, mrc) == mrc-1:
                return False
        return True
 
    number_of_rabin_trials = 20
    for i in range(number_of_rabin_trials):
        round_tester = random.randrange(2, mrc)
        if trial_composite(round_tester):
            return False
    return True


def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a


def multiplicative_inverse(e, phi):
    d = 0
    x1 = 0
    x2 = 1
    y1 = 1
    temp_phi = phi
    
    while e > 0:
        temp1 = temp_phi/e
        temp2 = temp_phi - temp1 * e
        temp_phi = e
        e = temp2
        
        x = x2- temp1* x1
        y = d - temp1 * y1
        
        x2 = x1
        x1 = x
        d = y1
        y1 = y
    
    if temp_phi == 1:
        return d + phi


def generate_p_q():
    p = q = int()
    while not p:
        prime_candidate = get_low_level_prime(BIT_SIZE)
        if is_miller_rabin_passed(prime_candidate): p = prime_candidate
    while not q:
        prime_candidate = get_low_level_prime(BIT_SIZE)
        if is_miller_rabin_passed(prime_candidate) and prime_candidate != p: q = prime_candidate
    
    return (p, q)


def egcd(a, b):
        if a == 0:
            return (b, 0, 1)
        else:
            g, y, x = egcd(b % a, a)
            return (g, x - (b // a) * y, y)


def modinv(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('Модульна інверсія не існує, помилка генерування ключа!')
    else:
        return x % m


def generate_keypair(p, q):
    if not (is_miller_rabin_passed(p) and is_miller_rabin_passed(q)):
        raise ValueError('Обидва числа мають бути простими.')
    elif p == q:
        raise ValueError('p та q не можуть бути однакові')

    n = p * q

    print("P = ", p, "\nQ = ", q, "\nN = ", n)

    phi = (p-1) * (q-1)

    print("Фі = ", phi)

    e = random.randrange(1, phi)
    g = gcd(e, phi)
    
    while g != 1:
        e = random.randrange(1, phi)
        g = gcd(e, phi)

    d = modinv(e, phi)

    return ((e, n), (d, n))


def encrypt(pk, plaintext):
    key, n = pk
    cipher = [(ord(char) ** key) % n for char in plaintext]
    return cipher


def decrypt(pk, ciphertext):
    key, n = pk
    plain = [chr((char ** key) % n) for char in ciphertext]
    return ''.join(plain)
    

if __name__ == '__main__':

    print("RSA Шифрувальник/ Дешифрувальник")

    p = int(input("Введіть просте число P (0 для автоматичної генерації): "))
    if not p: 
        p, q = generate_p_q()
    else: 
        q = int(input("Введіть просте число Q (не повинно співпадати з числом P): "))
    
    print("Генеруємо публічний/приватний пару клоючів . . .")
    public, private = generate_keypair(p, q)
    print("Ваш публічний ключ", public[0] ,"\nТа ваш приватний ключ", private[0])
    
    message = input("Введіть повідомлення, яке буде зашифроване вашим приватним ключем: ")
    
    encrypted_msg = encrypt(private, message)
    print("Зашифроване повідомлення: ")
    print(''.join(map(lambda x: str(x), encrypted_msg)))
    
    print("Розшифровуємо ваше повідомлення викорстовуючи публічний ключ", public[0] ,"...")
    print("Ваше повідомлення:")
    print(decrypt(public, encrypted_msg))
import sys

alphabet = [
    ' ', 'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й',
    'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч',
    'ш', 'щ', 'ь', 'ю', 'я'
]


def toBin(input, b):                        # Converting string to binary string
    if str(input).isdigit():
        str_i = str(bin(int(input)))
    else:
        str_i = str(bin(alphabet.index(input)))

    str_i = str_i[2:]

    while len(str_i) < b: str_i = '0' + str_i

    return str_i


def convertStrToBin(input, b):                      # Converting Array to binary
    output = []

    for i in input:
        output.append(toBin(i, b))

    return output


def convertBintoStr(input):                  # Converting binary array to string
    output = []

    for i in input:
        output.append(alphabet[int(i, 2)])

    return output


def generate(A, C, b, T_0, i):                # Generating pseudo random numbers
    output = []
    output.append(T_0)

    for i in range(i):
        generated = (A * output[-1] + C) % pow(2, b)
        while generated > 33: generated -= 33
        output.append(generated)

    return output[1:]


def crypt(input, gamma):                 # Encrypting/Decrypt using gamma method
    output = []

    for i in range(len(input)):
        first_number = input[i]
        second_number = gamma[i]
        summ = str()

        for j in zip(first_number, second_number):
            summ += str((int(j[0]) + int(j[1])) % 2)

        output.append(summ)

    return output


def main():                                                      # Main function
    try:
        if sys.argv[1]: pass
    except:
        print("Choose flag and try again!!!\n\t -e(encrypt)\n\t -d(decrypt)")
        exit(0)

    match sys.argv[1]:
        case "-d":                                   # Case of decrypt parameter
            encryptedText = str(input("Enter encrypted text: "))
            gamma = input("Enter gamma: ").split()

            encryptedBin = convertStrToBin(encryptedText, len(gamma[0]))

            decryptedBin = crypt(encryptedBin, gamma)
            decryptedText = convertBintoStr(decryptedBin)

            print(
                "\nYour encrypted text is:", encryptedText, "\n"
                "Its Binary:", encryptedBin, "\n\n"
                "Gamma is:", gamma, "\n\n"
                "Decrypted binary:", decryptedBin, "\n"
                "Decrypted text:", ''.join(decryptedText), "\n"
            )

        case "-e":                                     # Classic encryption mode
            A, C, b, T_0 = map(int, input("Enter A, C, b and T_0: ").split())
            openText = str(input("Enter open text: "))

            gamma = generate(A, C, b, T_0, len(openText))

            openTexBin = convertStrToBin(openText, b)
            gammaBin = convertStrToBin(gamma, b)

            encryptedBin = crypt(openTexBin, gammaBin)
            encryptedText = convertBintoStr(encryptedBin)

            print(
                "\nYour open text is:", openText, "\n"
                "Its Binary:", openTexBin, "\n\n"
                "Generated gamma is:", gamma, "\n"
                "Its binary:", gammaBin, "\n\n"
                "Encrypted binary:", encryptedBin, "\n"
                "Encrypted text:", ''.join(encryptedText), "\n"
            )

        case "-h":
            print("Choose flag: \n\t -e(encrypt)\n\t -d(decrypt)")
            exit(0)

        case _:
            print("Wrong flag, try again!!!")


if __name__ == "__main__":
    main()

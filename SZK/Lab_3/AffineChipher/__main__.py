import sys
import math


alphabet = [
    'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й',
    'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч',
    'ш', 'щ', 'ь', 'ю', 'я', ' '
]

def encrypt(string, keyA, keyB):
    output = ""
    for i in string:
        index = (keyA*alphabet.index(i) + keyB) % len(alphabet)
        output += alphabet[index]

    return output


def decrypt(string, keyA, keyB):
    output = ""
    for i in string:
        index = pow(keyA, -1, len(alphabet))*(alphabet.index(i) - keyB) % len(alphabet)
        output += alphabet[index]

    return output


def brute(string):
    output = ""
    for keyA in range(0, len(alphabet)-1):
        if math.gcd(keyA, len(alphabet)) == 1:
            for keyB in range(0, len(alphabet)-1):
                print(
                    f"Result with keys: A = {keyA} | B = {keyB}\n",
                    decrypt(string, keyA, keyB),
                    "\n\n"
                )


def main(args=sys.argv):
    # Using file as input source
    if "--file" in args:
        try:
            fileName = args[args.index("--file")+1]
        except:
            print("ERROR, no file specified!")
            return 0
        try:
            f = open(fileName, "r")
            inputText = ''.join(f.read())
        except:
            print("ERROR, can`t open file!")
            return 0
        
    # Using plain text as input source
    else:
        inputText = input("Enter input text: ")

    # Taking key from args
    try: 
        keyA = int(args[args.index("--key")+1])
        keyB = int(args[args.index("--key")+2])
        if 0 > keyA > len(alphabet) or 0 > keyB > len(alphabet) or math.gcd(keyA, len(alphabet)) != 1:
            print("ERROR, wrong key specified!")
            return 0
    except:
        if "--hack" not in args:
            print("ERROR, no key specified!")
            return 0
        else: pass

    print(f"Input text:\n{inputText}\n")

    # Choosing an option
    if "--encrypt" in args:
        print(f"Encrypted text is:\n{encrypt(inputText, keyA, keyB)}")
    if "--decrypt" in args:
        print(f"Decrypted text is:\n{decrypt(inputText, keyA, keyB)}")
    if "--hack" in args:
        print("Trying to hack chipher...\n")
        brute(inputText)

    return 0


if __name__ == "__main__":
    main()
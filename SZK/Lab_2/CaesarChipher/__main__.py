import sys

alphabet = [
    'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й',
    'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч',
    'ш', 'щ', 'ь', 'ю', 'я', ' '
]


def caesar(string, key):
    output = ""
    for i in string:
        index = (alphabet.index(i)+key) % len(alphabet)
        output += alphabet[index]

    return output


def uncaesar(string, key):
    output = ""
    for i in string:
        index = alphabet.index(i)-key
        while index < 0: index += len(alphabet)
        output += alphabet[index]

    return output


def frequencyAnalysis(string):
    lettersFreq = {}
    for letter in string: 
        try: lettersFreq[letter] += 1
        except: lettersFreq[letter] = 1
    print(lettersFreq)
    possibleSpace = max(lettersFreq, key=lettersFreq.get)
    key = alphabet.index(possibleSpace)+1
    print(
        f"Result with key {key}:\n",
        uncaesar(string, key),
        "\n"
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
        key = int(args[args.index("--key")+1])
    except:
        if "--hack" not in args:
            print("ERROR, no key specified!")
            return 0
        else: pass

    print(f"Input text:\n {inputText}\n")

    # Choosing an option
    if "--encrypt" in args:
        print(f"Encrypted text is:\n{caesar(inputText, key)}")
    if "--decrypt" in args:
        print(f"Decrypted text is:\n{uncaesar(inputText, key)}")
    if "--hack" in args:
        print("Trying to hack chipher...\n")
        frequencyAnalysis(inputText)

    return 0


if __name__ == "__main__":
    main()

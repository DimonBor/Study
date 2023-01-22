import sys
import json

alphabet = [
    'А','Б','В','Г','Ґ','Д','Е','Є','Ж','З','И','І','Ї','Й','К',
    'Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ',
    'Ь','Ю','Я'
 ]

ukrIC = 0.0575

def convert_to_indeces(str):
    arr = []
    for i in range(len(str)):
        for j in range(len(alphabet)):
            if str[i] == alphabet[j]: arr.append(j)
    return arr


def convert_to_string(arr):
    str = ""
    for i in range(len(arr)):
        for j in range(len(alphabet)):
            if arr[i] == j: str += alphabet[j]
    return str


def findKey(openedLetter, closedLetter):
    openedIndex = alphabet.index(openedLetter)
    closedIndex = alphabet.index(closedLetter)
    counter = 0
    while openedIndex != closedIndex:
        counter += 1
        closedIndex -= 1
        closedIndex = closedIndex + len(alphabet) if closedIndex < 0 else closedIndex
    
    return counter

def frequencyAnalysis(string):
    lettersFreq = {}
    for letter in string: 
        try: lettersFreq[letter] += 1
        except: lettersFreq[letter] = 1
    print(lettersFreq)

    sortedFreq = sorted(lettersFreq, key=lettersFreq.get, reverse=True)

    return (
        findKey("О", sortedFreq[0]), 
        findKey("А", sortedFreq[0]), 
        findKey("Н", sortedFreq[0]),
        findKey("И", sortedFreq[0]),
        findKey("Т", sortedFreq[0]),
        findKey("В", sortedFreq[0])
    )


def encrypt(user_input, key_word):

    key = encrypted = ""
    user_indices = key_indices = encrypted_indices = []

    while len(key) <= len(user_input): key += key_word

    user_indices = convert_to_indeces(user_input)
    key_indices = convert_to_indeces(key)

    for i in range(len(user_indices)):
        if user_indices[i] + key_indices[i] >= len(alphabet):
            encrypted_indices.append(user_indices[i] + key_indices[i] - len(alphabet))
        else: encrypted_indices.append(user_indices[i] + key_indices[i])

    encrypted = convert_to_string(encrypted_indices)

    return encrypted


def decrypt(user_input, key_word):

    key = decrypted = ""
    user_indices = key_indices = decrypted_indices = []

    while len(key) <= len(user_input): key += key_word

    user_indices = convert_to_indeces(user_input)
    key_indices = convert_to_indeces(key)

    for i in range(len(user_indices)):
        if user_indices[i] - key_indices[i] < 0:
            decrypted_indices.append(user_indices[i] - key_indices[i] + len(alphabet))
        else: decrypted_indices.append(user_indices[i] - key_indices[i])

    decrypted = convert_to_string(decrypted_indices)

    return decrypted


def hack(inputText):
    d_indeces = {}
    d_sum = 0

    IC = {}
    ICdeltas = {}

    inputIndeces = convert_to_indeces(inputText)
    for i in range(2, 10):
        d_indeces[i] = []
        for j in range(i, len(inputIndeces), i):
            d_indeces[i].append(j)
    
    for d in d_indeces:
        output = ""
        print(f"D: {d}")
        for lt in d_indeces[d]:
            output += alphabet[inputIndeces[lt]]
        print(output, "\n")

    for d in d_indeces:
        IC[d] = 0
        tempLetters = []
        lettersCount = {}

        for di in d_indeces[d]:
            tempLetters.append(inputIndeces[di])

        for lt in tempLetters:
            if alphabet[lt] in lettersCount: lettersCount[alphabet[lt]] += 1
            else: lettersCount[alphabet[lt]] = 1

        print(F"D: {d}\n{json.dumps(lettersCount, indent=1, ensure_ascii=False)}")


        for i in lettersCount:
            IC[d] += (lettersCount[i]*(lettersCount[i]-1))/(len(d_indeces[d])*(len(d_indeces[d])-1))

    for i in IC:
        ICdeltas[i] = max(IC[i], ukrIC) - min(IC[i], ukrIC)
    
    print(json.dumps(IC, indent=1, ensure_ascii=False))
    print(json.dumps(ICdeltas, indent=1, ensure_ascii=False))
    keyLen = min(ICdeltas, key=ICdeltas.get)
    print(keyLen)

    d_indeces = {}

    for i in range(keyLen):
        d_indeces[i] = []
        for j in range(i, len(inputIndeces), keyLen):
            d_indeces[i].append(j)

    possibleKeysArr = []

    for d in d_indeces:
        output = ""
        print(f"D: {keyLen} + {d}")
        for lt in d_indeces[d]:
            output += alphabet[inputIndeces[lt]]
        print(output)
        possibleKeys = frequencyAnalysis(output)
        possibleKeysArr.append(possibleKeys)
        print(f"Possibe keys: {possibleKeys}\n")

    for i in possibleKeysArr:
        print([alphabet[j] for j in i])




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
        key_word = args[args.index("--key")+1]            
    except:
        if "--hack" not in args:
            print("ERROR, no key specified!")
            return 0
        else: pass

    print(f"Input text:\n{inputText}\n")

    # Choosing an option
    if "--encrypt" in args:
        print(f"Encrypted text is:\n{encrypt(inputText, key_word)}")
    if "--decrypt" in args:
        print(f"Decrypted text is:\n{decrypt(inputText, key_word)}")
    if "--hack" in args:
        print("Trying to hack chipher...\n")
        hack(inputText)

    return 0


if __name__ == "__main__":
    main()
import sys
import math
import numpy
from sympy import Matrix

m = 3

alphabet = [
    'А','Б','В','Г','Ґ','Д','Е','Є','Ж','З','И','І','Ї','Й','К',
    'Л','М','Н','О','П','Р','С','Т','У','Ф','Х','Ц','Ч','Ш','Щ',
    'Ь','Ю','Я'
]


def encrypt(inputMatrix, key):
    npKey = numpy.array(key)
    npInputMatrix = numpy.array(inputMatrix)
    outputMatrix = numpy.matmul(npInputMatrix.T, npKey.T)
    
    print(
        f"Input matrix: \n{npInputMatrix}\n"
        f"Key array: \n{numpy.array(key)}\n"
        f"Output Matrix: \n{outputMatrix}\n"
    )

    output = ""
    for i in outputMatrix:
        for j in i:
            output += alphabet[j % len(alphabet)]
    
    return output


def decrypt(inputMatrix, key):
    inverseKey = Matrix(key).inv_mod(len(alphabet))
    npKey = numpy.array(inverseKey)
    npKey = npKey.astype(float)
    npInputMatrix = numpy.array(inputMatrix)
    outputMatrix = numpy.matmul(npInputMatrix.T, npKey.T)

    print(
        f"Input matrix: \n{npInputMatrix}\n"
        f"Key array: \n{numpy.array(key)}\n"
        f"Inverted key: \n{npKey}\n"
        f"Output Matrix: \n{outputMatrix}\n"
    )

    output = ""
    for i in outputMatrix:
        for j in i:
            output += alphabet[int(j) % len(alphabet)]
    
    return output


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
        keyWord = args[args.index("--key")+1]            
    except:
        print("ERROR, no key specified!")
        return 0

    if len(keyWord) % m:
        print("ERROR, invalid key len!")
        return 0

    # Generating KeyMatrix
    keyMatrix = [[] for i in range(m)]
    counter = 0
    for i in keyWord:
        keyMatrix[counter].append(alphabet.index(i))
        counter += 1 
        counter = 0 if counter > m-1 else counter
    
    keyMatrixDet = numpy.linalg.det(keyMatrix)
    if keyMatrixDet == 0 or math.gcd(abs(int(keyMatrixDet)), len(alphabet)) != 1:
        print("ERROR, invalid key!")
        return 0

    # Generating TextMatrix
    textMatrix = [[] for i in range(m)]
    counter = 0
    for i in inputText:
        textMatrix[counter].append(alphabet.index(i))
        counter += 1 
        counter = 0 if counter > m-1 else counter

    print(textMatrix)

    print(f"Input text:\n{inputText}\n")

    # Choosing an option
    if "--encrypt" in args:
        print(f"Encrypted text is:\n{encrypt(textMatrix, keyMatrix)}")
    if "--decrypt" in args:
        print(f"Decrypted text is:\n{decrypt(textMatrix, keyMatrix)}")

    return 0


if __name__ == "__main__":
    main()
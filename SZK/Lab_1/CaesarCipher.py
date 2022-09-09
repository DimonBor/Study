import sys

alphabet = [
    'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 
    'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 
    'ш', 'щ', 'ь', 'ю', 'я', ' '
]


def caesar(string, key):
    output = ""
    for i in string:
        index = (alphabet.index(i)+key)%len(alphabet)
        output += alphabet[index]

    return output


def uncaesar(string, key):
    output = ""
    for i in string:
        index = alphabet.index(i)-key+len(alphabet) if (alphabet.index(i)-key)<0 else alphabet.index(i)-key
        output += alphabet[index]

    return output


def bruteForce(string):
    for key in range(len(alphabet)): 
        print(
            f"Result with key {key}\n\n"
            uncaesar(string, key)
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
        print("Enter input text")

    # Taking key from args 
    try: 
        key = args[args.index("--key")+1]
    except:
        print("ERROR, no key specified!")
        return 0

if __name__ == "__main__":
    main()

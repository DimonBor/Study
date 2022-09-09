import os
import time as t

alphabet = [
    'а', 'б', 'в', 'г', 'ґ', 'д', 'е', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й',
    'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ь', 'ю', 'я',
    'А', 'Б', 'В', 'Г', 'Ґ', 'Д', 'Е', 'Є', 'Ж', 'З', 'И', 'І', 'Ї', 'Й',
    'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ь', 'Ю', 'Я'
 ]


def clear_screen():
    if(os.name == 'posix'):
        os.system('clear')
    else:
        os.system('cls')
        

def wait_plz(time_to_sleep):
    t.sleep(time_to_sleep)


def is_in_vector(arr, key):
    for i in range(len(arr)-1):
        if arr[i] == key: return True
    return False


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



def main():

    user_input = int()
    output = ""

    while True:

        clear_screen()

        print("Hi, enter text: ")
        user_input = str(input())
        print("Enter keyword: ")
        key_word = str(input())

        print(
            "1. Encrypt\n"+
            "2. Decrypt\n"+
            "Choose your option: "
        )
        user_choise = int(input())

        match user_choise:
            case 1:
                output = encrypt(user_input, key_word)
                print("\nEncrypted text is \n\n" + output + "\n\n")
                break
            case 2:
                output = decrypt(user_input, key_word)
                print("\nDecrypted text is \n\n" + output + "\n\n")
                break
            case _:
                print("Wrong input!!! Try again...")
                wait_plz(1)

    exit(0)


if __name__ == "__main__":
    main()

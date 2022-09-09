# Caesar cipher realisation

Simple Caesar encrypter/decrypter with brute force mehod.

### Available Flags
- `--encrypt` - encrytion mode;
- `--decrypt` - decryption mode;
- `--brute` - brute force mode;
- `--key [int]` - key value for encryption/decryption;
- `--file [file_name]` - specify file to read input text (all characters must be in the `alphabet` variable).

### Usage example
Following comand will encrypt text from file `text.txt` with key **2**.
```bash
python -m CaesarCipher --key 2 --encrypt --file test.txt
```
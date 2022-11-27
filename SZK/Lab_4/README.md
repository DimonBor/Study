# Affine cipher realisation

Simple Affine encrypter/decrypter with Frequency Analysis mehod.

### Available Flags
- `--encrypt` - encrytion mode;
- `--decrypt` - decryption mode;
- `--hack` - hack mode;
- `--key [int] [int]` - keys (A and B) value for encryption/decryption;
- `--file [file_name]` - specify file to read input text (all characters must be in the `alphabet` variable).

### Usage example
Following comand will encrypt text from file `text.txt` with key **2**.
```bash
python -m AffineChipher --key 5 6 --encrypt --file test.txt
```
To hack message using frequency analysis use folowing:
```bash
python -m AffineChipher --hack --file test.txt
```
#include <iostream>
#include <string>
#include <algorithm>
#include <fstream>
#include <cctype>
#include <vector>

#ifdef WINDOWS
#include <Windows.h>
#else
#include <unistd.h>
#endif

#include "alphabet.h"
#include "func.h"


int main(){

  int user_input;
  string output;

  try_again:

  clear_screen();

  cout <<
  "1. Encrypt\n" <<
  "2. Decrypt\n" <<
  "3. Hack\n"<<
  "Hi, choose your option: ";
  cin >> user_input;

  switch (user_input){
    case 1: {
      output = encrypt();
      cout << " Encrypted text is \n\n" << output << "\n\n";
      break;
    }
    case 2: {
      output = decrypt();
      cout << " Decrypted text is \n\n" << output << "\n\n";
      break;
    }
    case 3: {
      output = hack();
      cout << " Hacked text is \n\n" << output << "\n\n";
      break;
    }
    default: {
      cout << "Wrong input!!! Try again...";
      sleep(1);
      goto try_again;
    }
  }

  return 0;

}

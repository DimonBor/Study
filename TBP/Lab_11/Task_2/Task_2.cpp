#include <iostream>
#include "alphabet.h"
#include "func.h"

int main() {

  std::string inputText, key, outputText;
  character* keyArray;
  int userInput;

  std::cout << "Enter text: ";
  std::getline(std::cin, inputText);

  std::cout << "Enter key: ";
  std::cin >> key;

  int m = inputText.length()/key.length();               // Defining array size
  int n = key.length();
  char inputArray[m][n];

  std::cout << "Array size: " << m << " " << n << std::endl;

  keyArray = strToCharacter(key);
  sortKey(keyArray, n);

    tryAgain:
  std::cout << "Choise your option:" << std::endl
    << "1.Encode" << std::endl
    << "2.Decode" << std::endl;
  std::cin >> userInput;

  switch(userInput) {
    case 1: {
      for (int i = 0; i < n; i++) {       // Transofrming input string to array
        for (int j = 0; j < m; j++) {
          inputArray[j][i] = inputText[0];
          inputText.erase(inputText.begin());
        }
      }

      std::cout << "Input array:" << std::endl;        // Outputing input array
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          std::cout << inputArray[i][j] << " ";
        }
        std::cout << std::endl;
      }

      char encodedArray[m][n];                              // Switching colums
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
          encodedArray[j][i] = inputArray[j][keyArray[i].prevIndex];
        }
      }

      std::cout << "Encoded array:" << std::endl;    // Outputing encoded array
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          std::cout << encodedArray[i][j] << " ";
        }
        std::cout << std::endl;
      }

      for (int i = 0; i < m; i++) {     // Transforming array to encoded string
        for (int j = 0; j < n; j++) {
          outputText += encodedArray[i][j];
        }
      }

      std::cout << "Encoded text:" << std::endl << outputText << std::endl;
      break;
    }
    case 2: {
      for (int i = 0; i < m; i++) {             // Transforming string to array
        for (int j = 0; j < n; j++) {
          inputArray[i][j] = inputText[0];
          inputText.erase(inputText.begin());
        }
      }

      std::cout << "Input array:" << std::endl;        // Outputing input array
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          std::cout << inputArray[i][j] << " ";
        }
        std::cout << std::endl;
      }

      char decodedArray[m][n];                              // Switching colums
      for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++) {
          decodedArray[j][keyArray[i].prevIndex] = inputArray[j][i];
        }
      }

      std::cout << "Decoded array:" << std::endl;    // Outputing decoded array
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          std::cout << decodedArray[i][j] << " ";
        }
        std::cout << std::endl;
      }

      for (int i = 0; i < n; i++) {    // Transforming array to readeble string
        for (int j = 0; j < m; j++) {
          outputText += decodedArray[j][i];
        }
      }

      std::cout << "Decoded text:" << std::endl << outputText << std::endl;
      break;
    }
    default: {
      std::cout << "Invalid input, try again!" << std::endl;
      goto tryAgain;
    }
  }

  delete[] keyArray;

}

#include <iostream>
#include <fstream>
#include <cctype>

const unsigned int data_size = 50;

int main() {

  FILE* randomData = fopen("/dev/random", "r");
  char myRandomData[data_size];
  char temp_data = ' ';

  if (randomData == NULL) {
    std::cout << "Something went wrong!!!" << std::endl;
  }
  else {
    for (int i = 0; i < data_size; i++) {
      retry:
      ssize_t result = fread(&temp_data, 1, 1, randomData);
      if (result < 0) {
          std::cout << "Something went wrong!!!" << std::endl;
          goto retry;
      }
      else if (!isalpha(temp_data)) goto retry;
      myRandomData[i] = temp_data;
    }
    fclose(randomData);
    std::cout << "Collected data: " << myRandomData << std::endl;
  }

  return 0;
}

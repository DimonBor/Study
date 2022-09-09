#include <iostream>
#include <cctype>
#include <sys/random.h>

const unsigned int data_size = 50;

int main() {

  char myRandomData[data_size];
  char temp_data = ' ';

  for (int i = 0; i < data_size; i++) {
    retry:
    ssize_t result = getrandom(&temp_data, 1, GRND_RANDOM);
    if (result < 0) {
        std::cout << "Something went wrong!!!" << std::endl;
        return 0;
    }
    else if (!isalpha(temp_data)) goto retry;
    myRandomData[i] = temp_data;
  }

  std::cout << "Collected data: " << myRandomData << std::endl;

  return 0;

}

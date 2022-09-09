#include <iostream>
#include <vector>

int main() {

  std::vector<int>::iterator it;
  std::vector<int> exampleArray;
  exampleArray = { 1, 2, 3, 4 };

  it = exampleArray.begin();
  while (it != exampleArray.end()) {
    std::cout << *it << " ";
    ++it;
  }
  std::cout << std::endl;

}

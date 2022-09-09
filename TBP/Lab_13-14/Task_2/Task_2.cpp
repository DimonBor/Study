#include <iostream>
#include <vector>
#include <algorithm>

class divisibleByK {
  private:
    int K = 2;
  public:
    int getK() { return K; }
    bool operator() (int& x) { return !(x%K); }
};


int main() {

  divisibleByK predic;
  std::vector<int> exampleArray;
  std::vector<int>::iterator vi;

  int lastIndex = -1;
  exampleArray = { 1, 2, 3, 4, -5, 6, 7, 8, -9, -10};

  std::cout << "Start array: ";
  for (auto i : exampleArray) { std::cout << i << " "; }
  std::cout << std::endl;

  for (unsigned i = exampleArray.size()-1; i >= 0; i--) {
    if (exampleArray[i] >= 0) {
      lastIndex = i;
      break;
    }
  }
  std::cout << "Last positive index is: " << lastIndex << std::endl;

  for (auto &i : exampleArray) { predic(i) ? i /= predic.getK(): true; }

  std::cout << "Array devided by K: ";
  for (auto i : exampleArray) { std::cout << i << " "; }
  std::cout << std::endl;

  int a = 2, b = 6;

  for (unsigned i = a; i < b; i++) { exampleArray.push_back(exampleArray[i]); }

  std::cout << "Extended array: ";
  for (auto i : exampleArray) { std::cout << i << " "; }
  std::cout << std::endl;

}

#include <iostream>


class Int {
  private:
    int number;
  public:
    Int (int newInt) {
      number = newInt;
    }
    void operator++ (int) {
      number += 5;
    }
    Int operator+ (int secondInt) { return Int(number + secondInt); }
    Int operator+ (Int& secondInt) { return Int(number + secondInt.number); }
    friend Int operator+ (int firstInt, Int& secondInt) { return Int(firstInt + secondInt.number); }
    friend void operator-- (Int& firstInt) { firstInt.number -= 5; }
    friend Int operator- (Int& firstInt, int secondInt) { return Int(firstInt.number - secondInt); }
    friend Int operator- (Int& firstInt, Int& secondInt) { return Int(firstInt.number - secondInt.number); }
    friend Int operator- (int firstInt, Int& secondInt) { return Int(firstInt - secondInt.number); }
    friend std::ostream& operator<< (std::ostream& outStream, Int intNumber) {
      outStream << intNumber.number;
      return outStream;
    }
};


int main() {

  Int a(5);
  int b(5);

  std::cout << "A is " << a << std::endl;
  std::cout << "B is " << b << std::endl;

  a++;
  b++;

  std::cout << "A++ is " << a << std::endl;
  std::cout << "B++ is " << b << std::endl;

  std::cout << "A + B is " << a + b << std::endl;
  std::cout << "B + A  is " << b + a << std::endl;

  std::cout << "A - B is " << a - b << std::endl;
  std::cout << "B - A is " << b - a << std::endl;

  --a;
  b--;

  std::cout << "A-- is " << a << std::endl;
  std::cout << "B-- is " << b << std::endl;

}

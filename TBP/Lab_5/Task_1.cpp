#include <iostream>


class Student{
  friend void name(Student &);
  friend void setRate(Student &, int price);
  private:
    std::string name;
    int rate;
  public:
    Student(std::string newName, int newRate) {
      name = newName;
      rate = newRate;
    }
    std::string getName() {
      return name;
      }
    int getRate() {
      return rate;
    }
};


void name(Student &student) {
  std::cout << "Student is " << student.name << std::endl;
}


void setRate(Student &student, int rate) {
  if (rate > 0 && rate < 6) student.rate = rate;
}


int main() {

  Student valik("Valik", 0);

  name(valik);
  std::cout << valik.getName() << " : " << valik.getRate() << std::endl;

  setRate(valik, 5);
  std::cout << valik.getName() << " : " << valik.getRate() << std::endl;

  return 0;
}

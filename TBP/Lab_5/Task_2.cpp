#include <iostream>

class Student;
class Teacher{
  public:
    Teacher(std::string newName){
      name = newName;
    }
    void teach(Student &a);
    void setRate(Student &a, int rate);
  private:
    std::string name;
};

class Student{
  friend class Teacher;
  public:
    Student(std::string newName, int newRate){
      name = newName;
      rate = newRate;
    }
    std::string getName() { return name; }
    int getRate() { return rate; }
  private:
    std::string name;
    int rate;
};

void Teacher::teach(Student &student){
  std::cout << name << " teaches " << student.name << std::endl;
}

void Teacher::setRate(Student &student, int rate) {
  if (rate > 0 && rate < 6) student.rate = rate;
}

int main() {

  Student valik("Valik", 0);
  Teacher k("Vitalii");

  k.teach(valik);
  k.setRate(valik, 1);
  std::cout << valik.getName() << " : " << valik.getRate() << std::endl;

  return 0;
}

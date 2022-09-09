#include <iostream>
#include "classes.h"

int main() {

  Student student("Valik", 19, 86, 2);
  Teacher teacher("Vasilii", 50, "Math");
  HeadOfDepartment head("Mark", 35, "Computer science", 20000);

  std::cout << "Student " << student.getName() << " course is " << student.getCourse() << std::endl;
  std::cout << "Teacher " << teacher.getName() << " speciality is " << teacher.getSpeciality() << std::endl;
  std::cout << "Head Of Department " << head.getName() << " salary is " << head.getSalary() << std::endl;
}

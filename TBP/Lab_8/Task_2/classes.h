class Person {
  protected:
    std::string name;
    int age;
  public:
    std::string getName() { return name; }
    int getAge() { return age; }
};


class Student : public Person {
  private:
    float rate;
    int course;
  public:
    Student(std::string newName, int newAge, float newRate, int newCourse) {
      name = newName;
      age = newAge;
      rate = newRate;
      course = newCourse;
    }
    float getRate() { return rate; }
    int getCourse() { return course; }
};


class Teacher : public Person {
  protected:
    std::string speciality;
  public:
    Teacher() {}
    Teacher(std::string newName, int newAge, std::string newSpeciality) {
      name = newName;
      age = newAge;
      speciality = newSpeciality;
    }
    std::string getSpeciality() { return speciality; }
};


class HeadOfDepartment : public Teacher {
  private:
    float salary;
  public:
    HeadOfDepartment(std::string newName, int newAge, std::string newSpeciality, float newSalary) {
      name = newName;
      age = newAge;
      speciality = newSpeciality;
      salary = newSalary;
    }
    float getSalary() { return salary; }
};

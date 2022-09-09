class Currency {
  protected:
    float count, course;
  public:
    float convertToHrn() { return count*course; }
};


class Euro : public Currency {
  public:
    Euro(float newCount, float newCourse) {
      count = newCount;
      course = newCourse;
    }
    float convertToCent() { return count*100; }
};


class Dollar : public Currency {
  public:
    Dollar(float newCount, float newCourse) {
      count = newCount;
      course = newCourse;
    }
    float convertToCent() { return count*100; }
};


class Pound : public Currency {
  public:
    Pound(float newCount, float newCourse) {
      count = newCount;
      course = newCourse;
    }
    float convertToPenny() { return count*100; }
};

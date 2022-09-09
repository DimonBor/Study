class DateTime {
  private:
    int hours, minutes;
  public:
    DateTime () {
      hours = minutes = 0;
    }
    DateTime (int newHours, int newMinutes) {
      hours = newHours;
      minutes = newMinutes;
    }

    int getHours() { return hours; }
    int getMinutes() { return minutes; }

    void AddMinutes(int newMinutes) {
      minutes += newMinutes;
      while (minutes >= 60) {
        minutes -= 60;
        hours ++;
        if (hours == 24) hours = 0;
      }
    }

    bool operator< (DateTime& anotherTime) {
      if (hours == anotherTime.hours) {
        if (minutes < anotherTime.minutes) return true;
        else return false;
      }
      else {
        int firstHours = hours % 12;
        int secondHours = anotherTime.hours % 12;
        int difference = std::max(firstHours, secondHours) - std::min(firstHours, secondHours);
        if (difference < 6){
          if (firstHours < secondHours) return true;
          else return false;
        }
        else {
          if (firstHours < secondHours) return false;
          else return true;
        }
      }
    }

    bool operator> (DateTime& anotherTime) {
      if (hours == anotherTime.hours) {
        if (minutes > anotherTime.minutes) return true;
        else return false;
      }
      else {
        int firstHours = hours % 12;
        int secondHours = anotherTime.hours % 12;
        int difference = std::max(firstHours, secondHours) - std::min(firstHours, secondHours);
        if (difference < 6){
          if (firstHours > secondHours) return true;
          else return false;
        }
        else {
          if (firstHours > secondHours) return false;
          else return true;
        }
      }
    }

    bool operator== (DateTime& anotherTime) {
      return hours == anotherTime.hours && minutes == anotherTime.minutes;
    }

};

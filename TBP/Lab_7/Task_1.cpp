#include <iostream>


class Car {
  private:
    std::string oem, body, fuel;
    int cost, power;
  public:
    Car() { }
    Car (std::string newOem, std::string newBody, std::string newFuel, int newCost, int newPower) {
      oem = newOem;
      body = newBody;
      fuel = newFuel;
      cost = newCost;
      power = newPower;
    }
    bool operator==(Car& secondCar) {
      return oem == secondCar.oem && body == secondCar.body &&
        fuel == secondCar.fuel && power == secondCar.power;
    }
    bool operator!=(Car& secondCar) {
      return oem != secondCar.oem || body != secondCar.body ||
        fuel != secondCar.fuel || power != secondCar.power;
    }
    bool operator<(Car& secondCar) {
      return cost < secondCar.cost;
    }
    bool operator>(Car& secondCar) {
      return cost > secondCar.cost;
    }
    Car operator+(Car& secondCar) {
      return Car(oem, body, fuel, cost + secondCar.cost, power);
    }
};


int main() {
  Car array[5];

  array[0] = Car("Mercedes", "Coupe", "Petrol", 24000, 250);
  array[1] = Car("BMW", "Universal", "Diesel", 12000, 120);
  array[2] = array[1] + array[0];
  array[3] = Car("Renault", "Minivan", "Diesel", 6000, 90);
  array[4] = Car("BMW", "Sedan", "Diesel", 20000, 150);

  for (int i = 1; i < 5; i++) {
    if (array[i] == array[i-1]) {
      std::cout << "Car " << i << " == Car " << i-1 << std::endl;
    }
    else {
      std::cout << "Car " << i << (array[i] < array[i-1] ? " < " : " > "); std::cout << "Car " << i-1 << std::endl;
    }
  }
}

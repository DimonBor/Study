#include <iostream>
#include "classes.h"

void addTrucks(int count, Truck* array) {
  for (int i = 0; i < count; i++) {
    std::cout << "------------" << std::endl;
    std::cout << "Enter truck " << i+1 << " data" << std::endl;
    array[i].inputData();
  }
}


int main() {
  int size, filterMaxSpeed;
  float filterMaxCost, filterMaxLoad;

  std::cout << "Enter size of trucks array: ";
  std::cin >> size;
  Truck* trucksArray = new Truck[size];

  addTrucks(size, trucksArray);

  std::cout << "------------" << std::endl;
  std::cout << "Enter filters" << std::endl;
  std::cout << "Max Load: ";
  std::cin >> filterMaxLoad;
  std::cout << "Max Speed: ";
  std::cin >> filterMaxSpeed;
  std::cout << "Max Cost: ";
  std::cin >> filterMaxCost;

  std::cout << "------------" << std::endl;
  std::cout << "Suitable offers" << std::endl;
  std::cout << "------------" << std::endl;
  for (int i = 0; i < size; i++) {
    if (
      trucksArray[i].getMaxLoad() >= filterMaxLoad &&
      trucksArray[i].getMaxSpeed() >= filterMaxSpeed &&
      trucksArray[i].getCost() <= filterMaxCost) {
        trucksArray[i].printData();
        std::cout << "------------" << std::endl;
    }
  }
  return 0;
}

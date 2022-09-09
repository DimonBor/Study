#include <iostream>
#include "classes.h"

int main() {

  House house_1("Pushkina, 21", "For business", 1000, 20000000, 10);
  Cottage cottage_1("Yablochnaya, 35", "For relax", 600, 1000000, 400, 10);

  std::cout << "house_1 is " << house_1.getPurpose() << " and costs " << house_1.getCost() << std::endl;
  std::cout << "cottage_1 is " << cottage_1.getPurpose() << " and costs " << cottage_1.getCost() << std::endl;

}

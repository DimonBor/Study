#include <iostream>
#include "classes.h"

int main() {

  Ship newShip;
  Sailboat sailboat(12);
  Ship &newSailboat = sailboat;
  Steamer steamer(5);
  Ship &newSteamer = steamer;
  Corvette corvette(30);
  Ship &newCorvette = corvette;

  std::cout << "-------Abstract ship is going-------" << std::endl;
  newShip.fullSpeedAhead();

  std::cout << "-------Sailboat is going-------" << std::endl;
  newSailboat.fullSpeedAhead();

  std::cout << "-------Steamer is going-------" << std::endl;
  newSteamer.fullSpeedAhead();

  std::cout << "-------Corvette is going-------" << std::endl;
  newCorvette.fullSpeedAhead();

}

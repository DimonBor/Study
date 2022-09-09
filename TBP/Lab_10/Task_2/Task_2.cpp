#include <iostream>
#include <fstream>
#include "classes.h"

int main() {

  Sailboat sailboat("Dream");
  Steamer steamer("Titanic", 1500);

  std::cout << "Enter max speed for " << sailboat.getName() << ": ";
  std::cin >> sailboat;

  std::cout << "Enter max speed and max passengers for " << steamer.getName() << ": ";
  std::cin >> steamer;

  std::cout << sailboat;
  std::cout << steamer;

  std::ofstream output_file("output");
  output_file << steamer;
  output_file.close();

}

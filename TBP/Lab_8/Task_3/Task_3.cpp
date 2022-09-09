#include <iostream>
#include "classes.h"


int main() {

  Euro euro(100, 30.72);
  Dollar dollar(100, 26.45);
  Pound pound(100, 36.54);

  std::cout << "100 euros in hrn " << euro.convertToHrn() << std::endl;
  std::cout << "100 dollars in hrn " << dollar.convertToHrn() << std::endl;
  std::cout << "100 pounds in hrn " << pound.convertToHrn() << std::endl;

  std::cout << "100 euros in cents " << euro.convertToCent() << std::endl;
  std::cout << "100 dollars in cents " << dollar.convertToCent() << std::endl;
  std::cout << "100 pounds in penny " << pound.convertToPenny() << std::endl;

}

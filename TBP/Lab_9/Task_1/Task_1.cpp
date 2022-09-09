#include <iostream>
#include "classes.h"

int main() {

  Transport newTransport;
  PassengerTransport passengerTransport;
  Transport &newPassengerTransport = passengerTransport;
  FreightTransport freightTransport;
  PassengerTransport &newFreightTransport = freightTransport;

  newTransport.doJob();
  newPassengerTransport.doJob();
  newFreightTransport.doJob();

  std::cout << "newTransport profit is " << newTransport.getprofit() << std::endl;
  std::cout << "PassengerTransport profit is " << newPassengerTransport.getprofit() << std::endl;
  std::cout << "FreightTransport profit is " << newFreightTransport.getprofit() << std::endl;

}

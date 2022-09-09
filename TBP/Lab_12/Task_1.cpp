#include <vector>
#include <fstream>
#include "classes.h"

int main() {

  Matrix newMatrix;

  newMatrix.loadMatrix("input.txt");
  newMatrix.processMatrix("output.txt");

}

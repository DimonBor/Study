#include <iostream>
#include <fstream>
#include <cmath>
#include <sstream>
#include <vector>
#include "date_time.h"


std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> result;
    std::stringstream ss (s);
    std::string item;

    while (getline (ss, item, delim)) {
        result.push_back (item);
    }

    return result;
}


int main() {

  std::ifstream sr("saloon.in");

  std::string line;
  std::getline(sr, line);
  int N = std::stoi(line);

  DateTime input[N];
  int impatience[N];


  for (int i = 0; i < N; i++) {
    std::getline(sr, line);
    std::vector<std::string> client = split(line, ' ');
    input[i] = DateTime(std::stoi(client[0]), std::stoi(client[1]));
    impatience[i] = std::stoi(client[2]);
  }

  sr.close();

  DateTime output[N];

  for (int i = 0; i < N; i++) {
    int k = 0;
    int kN = 0;
    for (int j = i - 1; j >= 0; j--)
      if (output[j] > input[i]){
        k++;
        kN = i - j;
      }

    if (impatience[i] < k) output[i] = input[i];
    else {
      output[i] = input[i];
      output[i].AddMinutes(20);

      for (int j = i - 1; j >= i - kN; j--)
        if (output[j] > input[i]) {
          output[i] = output[j];
          output[i].AddMinutes(20);
          break;
        }
    }
  }

  std::ofstream sw("saloon.out");

  for (int i = 0; i < N; i++)
    sw << output[i].getHours() << " " << output[i].getMinutes() << std::endl;

  sw.close();
}

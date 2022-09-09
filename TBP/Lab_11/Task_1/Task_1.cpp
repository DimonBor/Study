#include <iostream>

int getRandom(int a, int b) {
  return a + (std::rand() % (b - a + 1));
}


int getSumm(int* array, int N) {
  int tempSumm = 0;
  for (int i = 0; i < N; i++) {
    tempSumm += array[i];
  }
  return tempSumm;
}


std::string output(int* array, int N) {
  std::string tempStr;
  for (int i = 0; i < N; i++) {
    tempStr += std::to_string(array[i]) + " ";
  }
  return tempStr;
}


int main() {

  std::srand(time(NULL));

  int N = getRandom(3, 20);

  int* A = new int[N];
  int* B = new int[N];

  for (int i = 0; i < N; i++) {
    A[i] = getRandom(1, 50);
    B[i] = getRandom(1, 50);
  }

   int summA = getSumm(A, N);
   int summB = getSumm(B, N);

   A[N] = 10;

   std::cout << "Smallest summ array is ";
   if (summA < summB) {
     std::cout << "A(summ = " << summA << "): " << output(A, N+1) << std::endl;
     std::cout << "Biggest summ array is ";
     std::cout << "B(summ = " << summB << "): " << output(B, N) << std::endl;
   }
   else {
     std::cout << "B(summ = " << summB << "): " << output(B, N) << std::endl;
     std::cout << "Biggest summ array is ";
     std::cout << "A(summ = " << summA << "): " << output(A, N+1) << std::endl;
   }

   delete[] A, B;

}

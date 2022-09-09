#include <iostream>
#include <ctime>

class Matrix {
  private:
    int m, n;
    float* matrix;
  public:
    Matrix (Matrix& newMatrix) {
      m = newMatrix.m;
      n = newMatrix.n;
      matrix = new float[m*n];
      for (int i = 0; i < m*n; i++) {
        matrix[i] = newMatrix.matrix[i];
      }
    }
    Matrix (int newM, int newN) {
      m = newM;
      n = newN;
      matrix = new float[m*n];
    }
    ~Matrix () {
      delete[] matrix;
    }

    float* get_matrix() { return matrix; }

    void fillMatrix() {
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
          matrix[i*m+j]=rand()%9;
        }
      }
    }

    Matrix operator* (Matrix& secondMatrix) {
      Matrix outputMatrix = Matrix(secondMatrix.m, secondMatrix.n);
      for (int i = 0; i < m; i++) {
        for (int j = 0; j < secondMatrix.n; j++) {
          outputMatrix.matrix[i*m+j] = 0;
          for (int k = 0; k < n; k++)
            outputMatrix.matrix[i*m+j] += matrix[i*m+k] * secondMatrix.matrix[k*m+j];
        }
      }
      return outputMatrix;
    }

    friend std::ostream& operator<< (std::ostream& outStream, Matrix outputMatrix) {
      for (int i = 0; i < outputMatrix.m; i++) {
        for (int j = 0; j < outputMatrix.n; j++) {
          outStream << outputMatrix.matrix[i*outputMatrix.m+j] << " ";
        }
        outStream << std::endl;
      }
      return outStream;
    }
};


int main () {

  srand(time(0));
  int m, n;

  std::cout << "Enter size A (m, n): ";
  std::cin >> m >> n;
  Matrix A(m, n);
  std::cout << "Enter size B (m, n): ";
  std::cin >> m >> n;
  Matrix B(m, n);

  A.fillMatrix();
  B.fillMatrix();

  std::cout << "Matrix A + B" << std::endl << A.get_matrix() + B.get_matrix();

  std::cout << "Matrix A" << std::endl << A;
  std::cout << "Matrix B" << std::endl << B;
  Matrix C = A * B;
  std::cout << "Matrix C" << std::endl << C;

}

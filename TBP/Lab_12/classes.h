class Matrix {
  private:
    std::vector<int> matrix;
    int m = 0, n = 0;
  public:
    Matrix() { }

    void loadMatrix(std::string filename) {
      int tempInt;
      std::ifstream inputFile(filename);
      inputFile >> m >> n;
      for (int i = 0; i < m*n; i ++) {
        inputFile >> tempInt;
        matrix.push_back(tempInt);
      }
      inputFile.close();
    }

    void processMatrix(std::string filename) {
      int counter = 0, summ = 0;
      for (auto i : matrix) {
        if (i > 0) {
          counter++;
          summ += i;
        }
      }
      std::ofstream outputFile(filename);
      outputFile << "Count of positive elements: " << counter << std::endl
        << "Summ of positive elements: " << summ << std::endl
        << "For matrix: " << std::endl;
      for (int i = 0; i < m; i ++) {
        for (int j = 0; j < n; j ++) {
          outputFile << matrix[i*n+j] << " ";
        }
        outputFile << std::endl;
      }
      outputFile.close();
    }

};

class Truck {
  private:
    std::string model;
    int maxLoad;
    int maxSpeed;
    float cost;
  public:
    void setModel(std::string newModel) { model = newModel; }
    void setMaxLoad(int newLoad) { maxLoad = newLoad; }
    void setMaxSpeed(int newSpeed) { maxSpeed = newSpeed; }
    void setCost(float newCost) { cost = newCost; }

    std::string getModel() { return model; }
    int getMaxLoad() { return maxLoad; }
    int getMaxSpeed() { return maxSpeed; }
    float getCost() { return cost; }

    void inputData() {
      std::cout << "Model: ";
      std::cin >> model;
      std::cout << "Max Load: ";
      std::cin >> maxLoad;
      std::cout << "Max Speed: ";
      std::cin >> maxSpeed;
      std::cout << "Cost: ";
      std::cin >> cost;
    }

    void printData() {
      std::cout << "Model: " << model << std::endl;
      std::cout << "Max Load: " << maxLoad << std::endl;
      std::cout << "Max Speed: " << maxSpeed << std::endl;
      std::cout << "Cost: " << cost << std::endl;
    }
};

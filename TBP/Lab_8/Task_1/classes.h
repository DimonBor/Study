class Building {
  protected:
    std::string address, purpose;
    float area, cost;
  public:
    std::string getAddress() { return address; }
    std::string getPurpose() { return purpose; }
    float getArea() { return area; }
    float getCost() { return cost; }
};


class House : public Building {
  private:
    int numberOfApartments;
  public:
    House(std::string newAddress, std::string newPurpose, float newArea, \
      float newCost, int newNumberOfApartments) {
        address = newAddress;
        area = newArea;
        purpose = newPurpose;
        cost = newCost;
        numberOfApartments = newNumberOfApartments;
    }
    int getNumberOfApartments() { return numberOfApartments; }
};


class Cottage : public Building {
  private:
    float gardenArea;
    int treeCount;
  public:
    Cottage(std::string newAddress, std::string newPurpose, float newArea, \
      float newCost, float newGardenArea, int newTreeCount) {
        address = newAddress;
        area = newArea;
        purpose = newPurpose;
        cost = newCost;
        gardenArea = newGardenArea;
        treeCount = newTreeCount;
    }
    float getGardenArea() { return gardenArea; }
    int getTreeCount() { return treeCount; }
};

class Ship {
  protected:
    float maxSpeed = 0;
  public:
    virtual void fullSpeedAhead() {
      std::cout << "Can't run abstract ship!" << std::endl;
    }
};


class Sailboat : public Ship {
  public:
    Sailboat (int newMaxSpeed) {
      maxSpeed = newMaxSpeed;
    }
    void fullSpeedAhead() {
      std::cout << "Looking for wind..." << std::endl;
      std::cout << "Set sail!" << std::endl;
      std::cout << "We go at a speed of " << maxSpeed << " knots" << std::endl;
    }
};


class Steamer : public Ship {
  public:
    Steamer (int newMaxSpeed) {
      maxSpeed = newMaxSpeed;
    }
    void fullSpeedAhead() {
      std::cout << "Fire up the stoves..." << std::endl;
      std::cout << "Full speed ahead!" << std::endl;
      std::cout << "We go at a speed of " << maxSpeed << " knots" << std::endl;
    }
};


class Corvette : public Ship {
  public:
    Corvette (int newMaxSpeed) {
      maxSpeed = newMaxSpeed;
    }
    void fullSpeedAhead() {
      std::cout << "Preparing the guns..." << std::endl;
      std::cout << "Full speed ahead!" << std::endl;
      std::cout << "We go at a speed of " << maxSpeed << " knots" << std::endl;
    }
};

class Ship {
  protected:
    float maxSpeed = 0;
    std::string name;
  public:
    std::string getName() { return name; }
};


class Sailboat : public Ship {
  public:
    Sailboat (std::string newName) {
      name = newName;
    }

    friend std::ostream& operator<< (std::ostream& out, Sailboat& sailboat) {
      out << "Sailboat named " << sailboat.name << " has max speed " << sailboat.maxSpeed << std::endl;
      return out;
    }
    friend std::istream& operator>> (std::istream& in, Sailboat& sailboat) {
      in >> sailboat.maxSpeed;
      return in;
    }
};


class Steamer : public Ship {
  private:
    int maxPassengers;
  public:
    Steamer (std::string newName, int newMaxPassengers) {
      name = newName;
      maxPassengers = newMaxPassengers;
    }

    friend std::ostream& operator<< (std::ostream& out, Steamer& steamer) {
      out << "Steamer named " << steamer.name << " has max speed " << steamer.maxSpeed
        << " and can take " << steamer.maxPassengers << " passengers" << std::endl;
      return out;
    }
    friend std::istream& operator>> (std::istream& in, Steamer& steamer) {
      in >> steamer.maxSpeed;
      in >> steamer.maxPassengers;
      return in;
    }
};

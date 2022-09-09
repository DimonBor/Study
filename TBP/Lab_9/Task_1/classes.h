class Transport {
  protected:
    float profit = 0;
  public:
    float getprofit() { return profit; }
    virtual void doJob() {
      std::cout << "Can't do job" << std::endl;
    }
};


class PassengerTransport : public Transport {
  public:
    void doJob() {
      std::cout << "Transferring people..." << std::endl;
      profit += 5;
    }
};


class FreightTransport : public PassengerTransport {
  public:
    void doJob() {
      std::cout << "We carry cargo..." << std::endl;
      profit += 10;
    }
};

#include <iostream>


class Profit {
  private:
    int income, spending;
  public:
    Profit (){
      income = spending = 0;
    }
    Profit (int newIncome, int newSpending){
      income = newIncome;
      spending = newSpending;
    }
    friend Profit operator+(Profit& firstProfit, Profit& secondProfit){
      return Profit(firstProfit.income + secondProfit.income, firstProfit.spending + secondProfit.spending);
    }
    friend Profit operator-(Profit& firstProfit, Profit& secondProfit){
      return Profit(firstProfit.income - secondProfit.income, firstProfit.spending - secondProfit.spending);
    }
    friend void operator+=(Profit& firstProfit, Profit& secondProfit){
      firstProfit.income += secondProfit.income;
      firstProfit.spending += secondProfit.spending;
    }
    friend void operator-=(Profit& firstProfit, Profit& secondProfit){
      firstProfit.income -= secondProfit.income;
      firstProfit.spending -= secondProfit.spending;
    }
    friend std::ostream& operator<< (std::ostream& outStream, Profit& firstProfit) {
      outStream << firstProfit.income << " " << firstProfit.spending << std::endl;
      return outStream;
    }
};


int main() {
  Profit first(500, 100), second(300, 200);
  Profit third = first + second;
  Profit fourth =  first - second;

  std::cout << "First: " << first;
  std::cout << "Second: " << second;
  std::cout << "Third(First + Second): " << third;
  std::cout << "Fourth(First - Second): " << fourth;

  first += second;
  second -= first;

  std::cout << "First += Second: " << first;
  std::cout << "Second -= First: " << second;
}

#include <iostream>
#include <vector>

int main() {

	std::vector<int> arr = {1, 2, 3, 4, 5};

	for( int number : arr) {
		std::cout << number << std::endl;
	}
}

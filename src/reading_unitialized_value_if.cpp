#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  bool b;
  if (b) {
    std::cout << "unitialized value is true" << std::endl;
  } else {
    std::cout << "unitialized value is false" << std::endl;
  }
  return EXIT_SUCCESS;
}

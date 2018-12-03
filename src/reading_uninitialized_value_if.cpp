#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  bool b;
  if (b) {
    std::cout << "uninitialized value is true" << std::endl;
  } else {
    std::cout << "uninitialized value is false" << std::endl;
  }
  return EXIT_SUCCESS;
}

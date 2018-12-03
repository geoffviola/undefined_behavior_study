#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  int32_t a = 1;
  std::cout << a / 0 << std::endl;
  return EXIT_SUCCESS;
}

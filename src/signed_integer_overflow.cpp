#include <cstdint>
#include <cstdlib>
#include <iostream>
#include <limits>

int main() {
  int32_t a = std::numeric_limits<int32_t>::max();
  ++a;
  std::cout << a << '\n';
  return EXIT_SUCCESS;
}
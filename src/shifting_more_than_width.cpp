#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  uint32_t u = 0U;
  std::cout << (u << 33) << std::endl;
  return EXIT_SUCCESS;
}

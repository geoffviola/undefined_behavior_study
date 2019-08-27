#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>

#include "debug_help.hpp"

int main() {
  std::array<int32_t, 10> arr;
  std::cout << arr[arr.size()] << std::endl;
  return EXIT_SUCCESS;
}

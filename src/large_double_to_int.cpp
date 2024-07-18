/*
C++ working draft
7.10.2
If the value being converted is outside the range of values that can be
represented, the behavior is undefined.
*/

#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr double kLargeDouble = 1e3;
  std::cout << static_cast<int>(static_cast<int8_t>(kLargeDouble)) << '\n';
  return EXIT_SUCCESS;
}

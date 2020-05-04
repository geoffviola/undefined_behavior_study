/*
C++17 working draft
8.5.7.1
The behavior is undefined if the right operand is negative,
or greater than or equal to the length in bits of the
promoted left operand
*/
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr uint32_t kU = 0U;
  static constexpr int kShift = 33;
  std::cout << (kU << kShift) << std::endl;
  return EXIT_SUCCESS;
}

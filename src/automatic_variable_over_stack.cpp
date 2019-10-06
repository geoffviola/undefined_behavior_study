#include <array>
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr int kArraySize = 10000000;
  std::array<char, kArraySize> large_var{};
  large_var[0] = static_cast<char>(1);
  large_var[kArraySize - 1] = static_cast<char>(2);
  std::cout << large_var[0] << large_var[kArraySize - 1] << '\n';
  return EXIT_SUCCESS;
}


#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr int kArraySize = 10;
  std::array<int32_t, kArraySize> arr{};
  std::cout << arr[arr.size()] << '\n';
  return EXIT_SUCCESS;
}

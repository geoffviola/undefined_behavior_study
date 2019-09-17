#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  std::array<int32_t, 10> arr;
  arr.fill(0);
  std::cout << arr[arr.size()] << std::endl;
  return EXIT_SUCCESS;
}

#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  std::array<int32_t, 10> arr{};
  std::cout << static_cast<void *>(arr.data() - 1) << std::endl;
  return EXIT_SUCCESS;
}

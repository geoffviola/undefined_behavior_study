#include <array>
#include <cstdint>
#include <cstdlib>

int main() {
  std::array<int32_t, 10> arr;
  printf("%p\n", static_cast<void *>(arr.data() - 1));
  return EXIT_SUCCESS;
}

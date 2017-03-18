#include <cstdlib>
#include <cstdint>
#include <array>

int main()
{
  std::array<int32_t, 10> arr;
  printf("%p\n", static_cast<void*>(arr.data() - 1));
  return EXIT_SUCCESS;
}

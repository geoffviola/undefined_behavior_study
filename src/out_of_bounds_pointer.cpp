#include <cstdlib>
#include <cstdint>
#include <array>

int main()
{
  std::array<int32_t, 10> arr;
  printf("%p\n", &arr[arr.size()]);
  return EXIT_SUCCESS;
}
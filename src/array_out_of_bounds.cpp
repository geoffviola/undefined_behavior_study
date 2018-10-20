#include <array>
#include <cstdint>
#include <cstdlib>
#include <cstdio>

int main()
{
  std::array<int32_t, 10> arr;
  printf("%d\n", arr[arr.size()]);
  return EXIT_SUCCESS;
}
#include <cstdlib>
#include <cstdint>
#include <array>
#include <stdio.h>

int main()
{
  std::array<int32_t, 10> arr;
  printf("%d\n", arr[arr.size()]);
  return EXIT_SUCCESS;
}
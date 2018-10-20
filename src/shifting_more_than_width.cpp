#include <cstdint>
#include <cstdlib>
#include <cstdio>

int main()
{
  uint32_t u = 0U;
  printf("%u\n", u << 33);
  return EXIT_SUCCESS;
}
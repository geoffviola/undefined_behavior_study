#include <cstdint>
#include <cstdlib>
#include <cstdio>

int main()
{
  int32_t a = 1;
  printf("%d\n", a / 0);
  return EXIT_SUCCESS;
}
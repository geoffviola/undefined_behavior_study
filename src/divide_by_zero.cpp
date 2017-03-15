#include <cstdlib>
#include <cstdint>
#include <stdio.h>

int main()
{
  int32_t a = 1;
  printf("%d\n", a / 0);
  return EXIT_SUCCESS;
}
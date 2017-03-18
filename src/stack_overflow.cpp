#include <cstdlib>
#include <cstdint>
#include <stdio.h>

int32_t global = 1;

static int call_self()
{
  global = call_self() + 1;
}

int main()
{
  printf("%d\n", call_self());
  return EXIT_SUCCESS;
}

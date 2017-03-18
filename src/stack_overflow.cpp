#include <cstdlib>
#include <cstdint>
#include <stdio.h>

uint32_t global = 1;

static uint32_t call_self()
{
  global = call_self() + 1;
}

int main()
{
  printf("%u\n", call_self());
  return EXIT_SUCCESS;
}

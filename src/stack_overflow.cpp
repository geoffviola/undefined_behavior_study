#include <cstdint>
#include <cstdio>
#include <cstdlib>

uint32_t global = 1;

static uint32_t call_self() {
  global = call_self() + 1;
  return global;
}

int main() {
  printf("%u\n", call_self());
  return EXIT_SUCCESS;
}

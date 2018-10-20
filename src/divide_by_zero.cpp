#include <cstdint>
#include <cstdio>
#include <cstdlib>

int main() {
  int32_t a = 1;
  printf("%d\n", a / 0);
  return EXIT_SUCCESS;
}
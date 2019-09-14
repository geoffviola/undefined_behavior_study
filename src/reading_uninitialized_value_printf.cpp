/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdio>
#include <cstdlib>

int main() {
  int32_t a;
  printf("%d\n", a);
  return EXIT_SUCCESS;
}

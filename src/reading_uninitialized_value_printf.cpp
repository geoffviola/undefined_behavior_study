/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdio>
#include <cstdlib>

int main() {
  int32_t a;
  // NOLINTENEXTLINE(cppcoreguidelines-pro-type-vararg)
  printf("%d\n", a);
  return EXIT_SUCCESS;
}

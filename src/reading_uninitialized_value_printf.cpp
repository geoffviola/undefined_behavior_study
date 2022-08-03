/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdio>
#include <cstdlib>

int main() {
  int32_t a;
  // NOLINTNEXTLINE(cppcoreguidelines-pro-type-vararg,hicpp-vararg)
  printf("%d\n", a);
  return EXIT_SUCCESS;
}

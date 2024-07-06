/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  int32_t a;
  int32_t b;
  std::cout << a + b << '\n';
  return EXIT_SUCCESS;
}

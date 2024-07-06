/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  int32_t a;
  std::cout << a << '\n';
  return EXIT_SUCCESS;
}

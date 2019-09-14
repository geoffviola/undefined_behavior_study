/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  int32_t a;
  std::cout << a << std::endl;
  return EXIT_SUCCESS;
}

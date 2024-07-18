/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdlib>
#include <iostream>

int main() {
  bool b;
  if (b) {
    std::cout << "uninitialized value is true" << '\n';
  } else {
    std::cout << "uninitialized value is false" << '\n';
  }
  return EXIT_SUCCESS;
}

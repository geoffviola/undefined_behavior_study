/*
https://en.cppreference.com/w/cpp/language/ub
Access to pointer passed to realloc
*/

#include <cstdlib>
#include <iostream>

int main() {
  int *p = static_cast<int *>(std::malloc(sizeof(int)));
  static_cast<void>(static_cast<int *>(std::realloc(p, sizeof(int))) + 1);
  std::cout << *p << std::endl;
  return EXIT_SUCCESS;
}

/*
https://en.cppreference.com/w/cpp/language/ub
Access to pointer passed to realloc
*/

#include <cstdlib>
#include <iostream>

int main() {
  auto *p1 = static_cast<int *>(std::malloc(sizeof(int)));
  auto *p2 = static_cast<int *>(std::realloc(p1, sizeof(int)));
  std::cout << *p1 << *p2 << '\n';
  free(p2);
  return EXIT_SUCCESS;
}

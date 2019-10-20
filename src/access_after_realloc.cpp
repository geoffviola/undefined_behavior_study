/*
https://en.cppreference.com/w/cpp/language/ub
Access to pointer passed to realloc
*/

#include <cstdlib>
#include <iostream>

int main() {
  // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, hicpp-no-malloc)
  auto *p1 = static_cast<int *>(std::malloc(sizeof(int)));
  // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, hicpp-no-malloc)
  auto *p2 = static_cast<int *>(std::realloc(p1, sizeof(int)));
  std::cout << *p1 << *p2 << '\n';
  // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, hicpp-no-malloc)
  free(p2);
  return EXIT_SUCCESS;
}

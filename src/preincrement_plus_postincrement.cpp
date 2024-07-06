/*
https://en.cppreference.com/w/cpp/language/eval_order
Undefined behavior
*/

#include <cstdlib>
#include <iostream>

int main() {
  int i = 0;
  i = ++i + i++;
  std::cout << i << '\n';
  return EXIT_SUCCESS;
}

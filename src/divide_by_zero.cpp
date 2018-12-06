/*
C++ 17 working draft
8.5.5.4
If the second operand of / or % is zero the behavior is undefined
*/

#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  int32_t a = 1;
  std::cout << a / 0 << std::endl;
  return EXIT_SUCCESS;
}

/*
C++ working draft
7.10.2
If the value being converted is outside the range of values that can be
represented, the behavior is undefined.
*/

#include <cstdlib>
#include <iostream>

int main() {
  std::cout << static_cast<int>(static_cast<int8_t>(1e3)) << std::endl;
  return 0;
}

/*
C++ working draft
7.9.1
If the source value is between two adjacent destination values, the result
of the conversion is an implementation-defined choice of either of those
values. Otherwise, the behavior is undefined.
*/
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr double kLargeDouble = 1e100;
  std::cout << static_cast<float>(kLargeDouble) << std::endl;
  return 0;
}

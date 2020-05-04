/*
http://eel.is/c++draft/conv.double#1
7 Expressions [expr]
7.3 Standard conversions [conv]
7.3.9 Floating-point conversions [conv.double]
1 A prvalue of floating-point type can be converted to a prvalue of another floating-point type.
  If the source value can be exactly represented in the destination type, the result of the conversion is that exact representation.
  If the source value is between two adjacent destination values, the result of the conversion is an implementation-defined choice of either of those values.
  Otherwise, the behavior is undefined.

https://docs.microsoft.com/en-us/cpp/c-language/conversions-from-floating-point-types?view=vs-2019
Represent as a float. If double value can't be represented exactly as float, loss of precision occurs. If value is too large to be represented as float, the result is undefined.
*/
#include <cstdlib>
#include <iostream>

int main() {
  static constexpr double kLargeDouble = 1e100;
  std::cout << static_cast<float>(kLargeDouble) << std::endl;
  return 0;
}

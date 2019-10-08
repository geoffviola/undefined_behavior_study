/*
CppCon 2019: Louis Dionne “The C++ ABI From the Ground Up”
https://youtu.be/DZ93lP1I7wU?t=1651
*/

#include <iostream>

#include "odr_violation_function_lib.h"

int foo() { return 1; }

int main() {
  std::cout << foo() << '\n';
  return EXIT_SUCCESS;
}

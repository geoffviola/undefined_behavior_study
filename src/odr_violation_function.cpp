/*
CppCon 2019: Louis Dionne “The C++ ABI From the Ground Up”
https://youtu.be/DZ93lP1I7wU?t=1651

One and only one definition of every non-inline function or variable that is odr-used (see below) is required to appear in the entire program (including any standard and user-defined libraries). The compiler is not required to diagnose this violation, but the behavior of the program that violates it is undefined.
https://en.cppreference.com/w/cpp/language/definition
*/

#include <iostream>

#include "odr_violation_function_lib.h"

int foo() { return 1; }

int main() {
  std::cout << foo() << '\n';
  return EXIT_SUCCESS;
}

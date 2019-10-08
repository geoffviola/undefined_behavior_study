/*
CppCon 2019: Louis Dionne “The C++ ABI From the Ground Up”
https://youtu.be/DZ93lP1I7wU?t=1000
*/

#include <iostream>

#include "odr_violation_struct_ret_lib.h"

struct Point {
  float x;
  float y;
};

int main() {
  const Point p(foo());
  std::cout << p.x << ", " << p.y << '\n';
  return EXIT_SUCCESS;
}

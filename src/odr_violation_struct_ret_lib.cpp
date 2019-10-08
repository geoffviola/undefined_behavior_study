#include "odr_violation_struct_ret_lib.h"

struct Point {
  float y;
  float x;
};

Point foo() {
  Point p{};
  p.x = 1.0f;
  p.y = 2.0f;
  return p;
}

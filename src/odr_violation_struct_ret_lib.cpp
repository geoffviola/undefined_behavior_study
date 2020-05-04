#include "odr_violation_struct_ret_lib.h"

struct Point {
  float y;
  float x;
};

Point foo() {
  static constexpr float kDefaultX = 1.0F;
  static constexpr float kDefaultY = 2.0F;

  Point p{};
  p.x = kDefaultX;
  p.y = kDefaultY;
  return p;
}

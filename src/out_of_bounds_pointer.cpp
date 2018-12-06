/*
C++17 working draft
8.5.6.4
If the expression P points to element x[i] of an array object x with n
elements,86 the expressions P + J and J + P (where J has the value j)
point to the (possibly-hypothetical) element x[i + j] if 0 ≤ i + j ≤ n;
otherwise, the behavior is undefined. Likewise, the expression P - J
points to the (possibly-hypothetical) element x[i − j]
if 0 ≤ i − j ≤ n; otherwise, the behavior is undefined.
*/
#include <array>
#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  std::array<int32_t, 10> arr{};
  std::cout << static_cast<void *>(arr.data() - 1) << std::endl;
  return EXIT_SUCCESS;
}

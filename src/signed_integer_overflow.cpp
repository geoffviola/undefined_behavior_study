#include <cstdint>
#include <cstdlib>
#include <limits>

int main() {
  int32_t a = std::numeric_limits<int32_t>::max();
  ++a;
  return EXIT_SUCCESS;
}
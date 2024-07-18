#include <cstdint>
#include <cstdlib>
#include <iostream>

namespace {
// NOLINTNEXTLINE(cppcoreguidelines-avoid-non-const-global-variables)
uint32_t global = 1;

uint32_t call_self() {
  global = call_self() + 1;
  return global;
}
} // namespace

int main() {
  std::cout << call_self() << '\n';
  return EXIT_SUCCESS;
}

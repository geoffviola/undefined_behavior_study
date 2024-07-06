#include <cstdint>
#include <cstdlib>
#include <iostream>

// NOLINTNEXTLINE(cppcoreguidelines-avoid-non-const-global-variables)
static uint32_t global = 1;

static uint32_t call_self() {
  global = call_self() + 1;
  return global;
}

int main() {
  std::cout << call_self() << '\n';
  return EXIT_SUCCESS;
}

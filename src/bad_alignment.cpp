/**
The C Standard, 6.3.2.3, paragraph 7

A pointer to an object or incomplete type may be converted to a pointer to a different object or incomplete type. If the resulting pointer is not correctly aligned for the referenced type, the behavior is undefined.
*/

#include <cstdint>
#include <cstdlib>
#include <iostream>

struct SomeChars {
  char single_char;
  char four_chars[4];
};

int main() {
  SomeChars some_chars = {};
  some_chars.four_chars[0] = '1';
  // NOLINTNEXTLINE(cppcoreguidelines-pro-type-reinterpret-cast)
  const int32_t a = *reinterpret_cast<const int32_t *>(some_chars.four_chars);
  std::cout << a << '\n';
  return EXIT_SUCCESS;
}

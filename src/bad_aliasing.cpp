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
  const int32_t a = *reinterpret_cast<const int32_t *>(some_chars.four_chars);
  std::cout << a << '\n';
  return EXIT_SUCCESS;
}

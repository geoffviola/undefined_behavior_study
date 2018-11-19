#include <cstdio>
#include <cstdlib>

void maybe_set_char_ptr(char **) {}

int main() {
  char *char_ptr;
  maybe_set_char_ptr(&char_ptr);
  std::puts(char_ptr);
  return EXIT_SUCCESS;
}

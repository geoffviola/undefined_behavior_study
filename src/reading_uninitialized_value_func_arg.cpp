/*
https://en.cppreference.com/book/uninitialized
*/
#include <cstdio>
#include <cstdlib>

void maybe_set_char_ptr(char ** /*unused*/) {}

int main() {
  char *char_ptr;
  maybe_set_char_ptr(&char_ptr);
  std::puts(char_ptr);
  return EXIT_SUCCESS;
}

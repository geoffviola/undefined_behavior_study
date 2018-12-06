/*
C++17 working draft
9.6.3.2
"flowing off the end of a function other than main (6.8.3.1) results in
undefined behavior."
*/
#include <cstdio>
#include <cstdlib>

char *get_char_ptr() {}

int main() {
  std::puts(get_char_ptr());
  return EXIT_SUCCESS;
}

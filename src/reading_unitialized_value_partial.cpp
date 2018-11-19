#include <cstdlib>
#include <cstdio>

bool global_var = false;

int main() {
  char * char_ptr;
  if (global_var) {
    char_ptr = "properly initialized";
  }
  std::puts(char_ptr);
  return EXIT_SUCCESS;
}

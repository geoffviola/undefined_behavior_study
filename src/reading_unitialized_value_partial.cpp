#include <cstdio>
#include <cstdlib>

bool global_var = false;

int main() {
  const char *char_ptr;
  if (global_var) {
    char_ptr = "properly initialized";
  }
  std::puts(char_ptr);
  return EXIT_SUCCESS;
}

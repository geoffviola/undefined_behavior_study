#include <cstdlib>

#include "reading_uninitialized_value_lib.h"

int main() {
  int i;
  read_from_cref(i);
  return EXIT_SUCCESS;
}

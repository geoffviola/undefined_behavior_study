#include <iostream>

#include "reading_uninitialized_value_lib.h"

void read_from_cref(int const &cref) { std::cout << cref << '\n'; }

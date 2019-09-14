#include <iostream>

#include "reading_uninitialized_value_lib.h"

void read_from_ptr(int const *const ptr) { std::cout << *ptr << std::endl; }

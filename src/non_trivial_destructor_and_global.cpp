#include "non_trivial_destructor_and_global.h"

// NOLINTNEXTLINE(cppcoreguidelines-avoid-non-const-global-variables)
int global_int = 0;

NonTrivialDestructor::~NonTrivialDestructor() { ++global_int; }

NonTrivialDestructor *new_non_trivial_destructor_ptr() {
  return new NonTrivialDestructor();
}

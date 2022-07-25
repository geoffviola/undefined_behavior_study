/**
http://eel.is/c++draft/expr.delete

7 Expressions
7.6 Compound expressions
7.6.2 Unary expressions
7.6.2.8 Delete

If the object being deleted has incomplete class type at the point of deletion and the complete class has a non-trivial destructor or a deallocation function, the behavior is undefined.
*/

#include <cstdlib>
#include <iostream>
#include <memory>

// intentionally missing
//#include "non_trivial_destructor_and_global.h"

// NOLINTNEXTLINE(cppcoreguidelines-avoid-non-const-global-variables)
extern int global_int;
class NonTrivialDestructor;
NonTrivialDestructor* new_non_trivial_destructor_ptr();

void foo() {
  const NonTrivialDestructor* a = new_non_trivial_destructor_ptr();
  delete a;
}

int main() {
  foo();
  std::cout << global_int << '\n';
  return EXIT_SUCCESS;
}

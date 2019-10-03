#include "virtual_call_in_destructor_lib.hpp"

Parent::Parent() {
  Helper();
}

void Parent::Helper() {
  Foo();
}

void Child::Foo() {
  std::cout << "here\n";
}


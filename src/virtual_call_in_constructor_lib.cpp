#include "virtual_call_in_constructor_lib.hpp"

#include <iostream>

Parent::Parent() { Helper(); }

void Parent::Helper() { Foo(); }

void Child::Foo() { std::cout << "here\n"; }

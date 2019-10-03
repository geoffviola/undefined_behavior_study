#include <cstdlib>
#include <iostream>

class Parent {
public:
  virtual inline ~Parent() { Foo(); }

  virtual void Foo() = 0;
};

class Child : public Parent {
public:
  inline void Foo() override { std::cout << "here\n"; }
};

int main() {
  Child c;
  return EXIT_SUCCESS;
}

#include <cstdlib>
#include <iostream>

class Parent {
public:
  Parent() = default;
  virtual ~Parent() { Foo(); }
  Parent(const Parent &) = default;
  Parent &operator=(const Parent &) = default;
  Parent(Parent &&) = default;
  Parent &operator=(Parent &&) = default;

  virtual void Foo() = 0;
};

class Child : public Parent {
public:
  void Foo() override { std::cout << "here\n"; }
};

int main() {
  const Child c;
  return EXIT_SUCCESS;
}

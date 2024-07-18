#include <cstdlib>
#include <iostream>

class Parent {
public:
  Parent() { Helper(); }
  virtual ~Parent() = default;
  Parent(const Parent &) = default;
  Parent &operator=(const Parent &) = default;
  Parent(Parent &&) = default;
  Parent &operator=(Parent &&) = default;

  virtual void Foo() = 0;

private:
  void Helper() { Foo(); }
};

class Child : public Parent {
public:
  void Foo() override { std::cout << "here\n"; }
};

int main() {
  Child c;
  return EXIT_SUCCESS;
}

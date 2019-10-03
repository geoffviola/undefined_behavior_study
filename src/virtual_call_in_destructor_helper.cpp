#include <cstdlib>
#include <iostream>

class Parent {
public:
  Parent() = default;
  virtual inline ~Parent() { Helper(); }
  Parent(const Parent&) = default;
  Parent(Parent &&) = default;
  Parent& operator=(Parent &&) = default;

  virtual void Foo() = 0;

private:
  inline void Helper() { Foo(); }
};

class Child : public Parent {
public:
  inline void Foo() override { std::cout << "here\n"; }
};

int main() {
  Child c;
  return EXIT_SUCCESS;
}

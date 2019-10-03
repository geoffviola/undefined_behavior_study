#pragma once

#include <cstdlib>
#include <iostream>

class Parent {
public:
  Parent() = default;
  virtual ~Parent();
  Parent(const Parent&) = default;
  Parent(Parent &&) = default;
  Parent& operator=(Parent &&) = default;

  virtual void Foo() = 0;

private:
  void Helper();
};

class Child : public Parent {
public:
  void Foo() override;
};

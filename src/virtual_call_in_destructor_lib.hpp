#pragma once

#include <cstdlib>
#include <iostream>

class Parent {
public:
  virtual ~Parent();
  virtual void Foo() = 0;

private:
  void Helper();
};

class Child : public Parent {
public:
  void Foo() override;
};


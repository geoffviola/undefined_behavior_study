#pragma once

class Parent {
public:
  Parent();
  ~Parent() = default;
  Parent(const Parent &) = default;
  Parent &operator=(const Parent &) = default;
  Parent(Parent &&) = default;
  Parent &operator=(Parent &&) = default;

  virtual void Foo() = 0;

private:
  void Helper();
};

class Child : public Parent {
public:
  void Foo() override;
};

#include <cstdlib>
#include <iostream>

int &get_bad_reference() {
  int a = 1;
  return a;
}

int main() {
  const int &a = get_bad_reference();
  std::cout << "a=" << a << '\n';
  return EXIT_SUCCESS;
}

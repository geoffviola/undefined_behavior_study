#include <cstdlib>
#include <iostream>

int main() {
  const int i = 0;
  const int &i_ref = i;
  const_cast<int &>(i_ref) = 1;
  std::cout << i << '\n';
  return EXIT_SUCCESS;
}

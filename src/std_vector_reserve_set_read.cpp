#include <cstdlib>
#include <iostream>
#include <vector>

int main() {
  std::vector<char> v;
  v.reserve(1);
  v[0] = 'a';
  std::cout << v[0] << '\n';
  return EXIT_SUCCESS;
}

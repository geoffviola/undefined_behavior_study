/*
http://eel.is/c++draft/vector.data
Returns: A pointer such that [data(), data() + size()) is a valid range.
*/
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

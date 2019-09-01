/*
http://www.cplusplus.com/reference/string/string/string/

from c-string (4) string (const char* s);
...
If s is a null pointer, ... it causes undefined behavior.
*/
#include <cstdlib>
#include <iostream>
#include <string>

int main() {
  std::string s(nullptr);
  std::cout << s << '\n';
  return EXIT_SUCCESS;
}

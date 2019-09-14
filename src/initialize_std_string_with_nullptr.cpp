/*
http://www.cplusplus.com/reference/string/string/string/

from c-string (4) string (const char* s);
...
If s is a null pointer, ... it causes undefined behavior.
*/
#include <cstdlib>
#include <iostream>
#include <string>

const char *get_c_str() { return nullptr; }

int main() {
  const char *const c_str = get_c_str();
  const std::string s(c_str);
  std::cout << s << '\n';
  return EXIT_SUCCESS;
}

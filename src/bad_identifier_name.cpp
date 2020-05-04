/*
http://eel.is/c++draft/lex.name#3
5 Lexical conventions [lex]
5.10 Identifiers [lex.name]
3. In addition, some identifiers are reserved for use by C++ implementations and
shall not be used otherwise; no diagnostic is required. (3.1) Each identifier
that contains a double underscore __ or begins with an underscore followed by an
uppercase letter is reserved to the implementation for any use. (3.2) Each
identifier that begins with an underscore is reserved to the implementation for
use as a name in the global namespace.
*/

#include <cstdlib>
#include <iostream>

int _underscore_global = 0;

int main() {
  const int __double_underscores_in_front = 1;
  const int double_underscores__in_middle = 2;
  const int double_underscores_at_end__ = 3;
  const int _Undercore_and_uppercase_char = 4;
  std::cout << _underscore_global << __double_underscores_in_front
            << double_underscores__in_middle << double_underscores_at_end__
            << _Undercore_and_uppercase_char << '\n';
  return EXIT_SUCCESS;
}

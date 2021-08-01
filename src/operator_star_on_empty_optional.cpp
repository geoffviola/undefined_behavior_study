/**
https://eel.is/c++draft/optional.observe#1
constexpr const T* operator->() const;
constexpr T* operator->();
Preconditions: *this contains a value.

https://en.cppreference.com/w/cpp/utility/optional/operator*
The behavior is undefined if *this does not contain a value.

Related news story
https://arstechnica.com/gadgets/2021/07/google-pushed-a-one-character-typo-to-production-bricking-chrome-os-devices/
*/

#include <cstdlib>
#include <iostream>
#include <optional>

int main() {
  std::optional<int> foo;
  std::cout << *foo << '\n';
  return EXIT_SUCCESS;
}

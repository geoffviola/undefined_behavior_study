/*
https://eel.is/c++draft/expr#basic.lval-11
7.2.1.11
#
If a program attempts to access ([defns.access]) the stored value of an object
through a glvalue whose type is not similar ([conv.qual]) to one of the
following types the behavior is undefined:52

    (11.1)
    the dynamic type of the object,
    (11.2)
    a type that is the signed or unsigned type corresponding to the dynamic type
of the object, or (11.3) a char, unsigned char, or std​::​byte type.
*/

#include <cstdint>
#include <cstdlib>
#include <iostream>

int main() {
  const int32_t a = 1;
  std::cout << *reinterpret_cast<const uint32_t *>(&a) << '\n';
  return EXIT_SUCCESS;
}

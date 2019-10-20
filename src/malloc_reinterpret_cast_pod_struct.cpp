/*
Unlike in C, however, objects with trivial default constructors cannot be
created by simply reinterpreting suitably aligned storage, such as memory
allocated with std::malloc: placement-new is required to formally introduce a
new object and avoid potential undefined behavior.
https://en.cppreference.com/w/cpp/language/default_constructor#Trivial_default_constructor
*/

#include <cstdlib>
#include <iostream>

struct MyPod {
  int x;
};

int main() {
  // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, hicpp-no-malloc)
  void *raw_ptr = malloc(sizeof(MyPod));
  auto *const my_pod = reinterpret_cast<MyPod *>(raw_ptr);
  my_pod->x = 1;
  std::cout << my_pod->x << '\n';
  // NOLINTNEXTLINE(cppcoreguidelines-no-malloc, hicpp-no-malloc)
  free(raw_ptr);
  return EXIT_SUCCESS;
}

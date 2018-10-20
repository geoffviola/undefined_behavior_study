#include <cstdint>
#include <cstdio>
#include <cstdlib>

int main() {
  bool b;
  if (b) {
    printf("unitialized value is true\n");
  } else {
    printf("unitialized value is false\n");
  }
  return EXIT_SUCCESS;
}
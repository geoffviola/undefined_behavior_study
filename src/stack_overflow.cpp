#include <cstdlib>

static void call_self()
{
  call_self();
}

int main()
{
  call_self();
  return EXIT_SUCCESS;
}
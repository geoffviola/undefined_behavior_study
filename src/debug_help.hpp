#pragam once

#ifdef _WIN32
#include <cstdlib>

#define _wassert _original_wassert

void _wassert(
   wchar_t const* message,
   wchar_t const* filename,
   unsigned line
) {
  std::abort();
}
#endif

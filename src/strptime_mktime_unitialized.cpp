/*
https://stackoverflow.com/a/24185697
*/
#include <cstdlib>
#include <ctime>
#include <iostream>

int main() {
  const char *const kTime = "2019";
  const char *const kFormat = "%Y";
  tm tmp_time;
  strptime(kTime, kFormat, &tmp_time);
  // proper initialization
  // tmp_time.tm_isdst = -1;
  time_t time = mktime(&tmp_time);
  std::cout << static_cast<uint64_t>(time) << '\n';
  return EXIT_SUCCESS;
}

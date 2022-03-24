#include "caffeine.h"
#include <cstring>
#include <cstdint>

// Parse an integer from a string, skipping any initial spaces.
uint32_t parse_int(const char* s) {
  while (*s == ' ') s++;

  uint32_t value = *s++ - '0';
  while (*s++) value = 10 * value + (*s - '0');
  return value;
}

int main(int argc, char** argv) {
  char data[24];
  caffeine_make_symbolic(data, sizeof(data), "data");
  caffeine_assume(data[sizeof(data) - 1] == '\0');
  return parse_int(data);
}

#include "caffeine.h"
#include <stdio.h>

int main(int argc, char** argv) {
  char input[4];
  char output[1024];

  caffeine_make_symbolic(input, sizeof(input), "input");
  caffeine_assume(input[sizeof(input) - 1] == '\0');

  snprintf(output, sizeof(output), input);
  return 0;
}


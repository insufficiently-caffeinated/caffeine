
#include "caffeine.h"

/**
 * This is a variant on KLEE's maze example which does everything symbolically.
 */

#define H 7
#define W 11

int main(int argc, char* argv[]) {
  int x, y;   // Player position
  int ox, oy; // Old player position
  int i = 0;  // Iteration number
#define ITERS 28
  char program[ITERS];

  // clang-format off
  char maze[H][W] = { 
    "+-+---+---+",
    "| |     |#|",
    "| | --+ | |",
    "| |   | | |",
    "| +-- | | |",
    "|     |   |",
    "+-----+---+"};
  // clang-format on

  x = 1;
  y = 1;
  maze[y][x] = 'X';

  caffeine_make_symbolic(program, sizeof(program), "program");

  while (i < ITERS) {
    ox = x; // Save old player position
    oy = y;

    caffeine_assume(program[i] == 'w' || program[i] == 's' ||
                    program[i] == 'a' || program[i] == 'd');
    y += program[i] == 'w' ? -1 : program[i] == 's' ? 1 : 0;
    x += program[i] == 'a' ? -1 : program[i] == 'd' ? 1 : 0;

    // Make caffeine print the solution when we reach the end
    caffeine_assert(maze[y][x] != '#');

    caffeine_assume((x >= 0) & (x < W));
    caffeine_assume((y >= 0) & (y < H));
    caffeine_assume((maze[y][x] == ' ') | ((y == 2) & (maze[y][x] == '|')));

    maze[y][x] = 'X';

    i++;
  }

  caffeine_assume(false);
  return 0;
}


#include "caffeine.h"

#define H 7
#define W 11

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

int main(int argc, char* argv[]) {
  int x, y;   // Player position
  int ox, oy; // Old player position
  int i = 0;  // Iteration number
#define ITERS 28
  char program[ITERS];

  x = 1;
  y = 1;
  maze[y][x] = 'X';

  caffeine_make_symbolic(program, sizeof(program), "program");

  while (i < ITERS) {
    ox = x; // Save old player position
    oy = y;

    switch (program[i]) {
    case 'w':
      y--;
      break;
    case 's':
      y++;
      break;
    case 'a':
      x--;
      break;
    case 'd':
      x++;
      break;
    default:
      // Wrong command! (we only accept w,s,a,d)
      // We don't want to consider these cases
      caffeine_assume(false);
      break;
    }

    // Make caffeine print the solution when we reach the end
    caffeine_assert(maze[y][x] != '#');

    if (maze[y][x] != ' ' &&
        !((y == 2 && maze[y][x] == '|' && x > 0 && x < W))) {
      x = ox;
      y = oy;
    }

    if (ox == x && oy == y) {
      caffeine_assume(false);
    }

    maze[y][x] = 'X';

    i++;
  }

  caffeine_assume(false);
}

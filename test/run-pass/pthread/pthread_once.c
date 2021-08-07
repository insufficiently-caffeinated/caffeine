#include "caffeine.h"

#include <pthread.h>

pthread_once_t lock = PTHREAD_ONCE_INIT;
int global = 0;

void increment() {
  global++;
}

void test() {
  pthread_once(&lock, increment);
  pthread_once(&lock, increment);
  caffeine_assert(global == 1);
}

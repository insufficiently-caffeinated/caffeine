#include <pthread.h>
#include <errno.h>

// TODO: Improve implementation if we ever support
// analysis of multithreaded programs

// Allegedly this can return EINVAL "If either once_control or init_routine is invalid."
// ( https://linux.die.net/man/3/pthread_once ) Not sure exactly what "invalid" means here
// though because the function marks `once_control` and `init_routine` as non-null.
// I also looked at some implementations and it looks like they just return 0
int pthread_once(pthread_once_t *once_control,
    void (*init_routine)(void)) {

  if (*once_control != PTHREAD_ONCE_INIT) {
    return 0;
  }

  *once_control = !PTHREAD_ONCE_INIT;
  init_routine();
  return 0;
}

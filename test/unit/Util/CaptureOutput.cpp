#include "Util/CaptureOutput.h"

#if defined(__linux__) || defined(__APPLE__)
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>

#define STDERR 2
#endif

namespace caffeine {

#if defined(__linux__) || defined(__APPLE__)
CaptureStderr::CaptureStderr() : old_stderr(STDERR) {
#ifndef __linux__
  int newfd = memfd_create("test-log-output", 0);
#else
  int newfd = open("test-log-output", O_CREAT | O_RDWR | O_EXCL, S_IRWXU);
  unlink("test-log-output");
#endif

  if (newfd < 0)
    return;

  old_stderr = dup(STDERR);
  dup2(newfd, STDERR);
  close(newfd);
}
CaptureStderr::~CaptureStderr() {
  dup2(old_stderr, STDERR);
  if (old_stderr != STDERR)
    close(old_stderr);
}

void CaptureStderr::emit() {
  if (old_stderr == STDERR)
    return;

  char buffer[1024];

  lseek(STDERR, 0, SEEK_SET);

  while (true) {
    ssize_t result = read(STDERR, buffer, sizeof(buffer));
    if (result <= 0) {
      if (result < 0 && errno == -EINTR)
        continue;
      break;
    }

    while (write(old_stderr, buffer, result) < 0 && errno == -EINTR) {}
  }

  while (ftruncate(STDERR, 0) < 0 && errno == -EINTR) {}
}

#else
CaptureStderr::CaptureStderr() {}
CaptureStderr::~CaptureStderr() {}

void CaptureStderr::emit() {}
#endif

} // namespace caffeine

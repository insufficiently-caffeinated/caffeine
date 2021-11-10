#pragma once

namespace caffeine {

class CaptureStderr {
private:
#ifdef __linux__
  int redirect_fd;
  int old_stderr;
#else

#endif

public:
  CaptureStderr();
  ~CaptureStderr();

#ifdef __linux__
  CaptureStderr(CaptureStderr&&);
  CaptureStderr& operator=(CaptureStderr&&);
#else
  CaptureStderr(CaptureStderr&&) = default;
  CaptureStderr& operator=(CaptureStderr&&) = default;
#endif

  CaptureStderr(const CaptureStderr&) = delete;
  CaptureStderr& operator=(const CaptureStderr&) = delete;

  void emit();
};

} // namespace caffeine

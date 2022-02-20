#pragma once

#include "caffeine/Interpreter/FailureLogger.h"
#include <atomic>
#include <string>
#include <string_view>

namespace caffeine {

class DiskFailureLogger : public FailureLogger {
public:
  DiskFailureLogger(std::string_view directory);

  void log_failure(const Model* model, const Context& context,
                   const Failure& failure) override;

private:
  FILE* create_file();

private:
  std::string outdir;
  std::atomic_uint64_t counter{0};
};

} // namespace caffeine

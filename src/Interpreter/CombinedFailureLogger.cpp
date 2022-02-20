#include "caffeine/Interpreter/FailureLogger.h"

namespace caffeine {

CombinedFailureLogger::CombinedFailureLogger(
    std::vector<std::unique_ptr<FailureLogger>>&& loggers)
    : loggers(std::move(loggers)) {}

void CombinedFailureLogger::log_failure(const Model* model, const Context& ctx,
                                        const Failure& failure) {
  for (auto& logger : loggers)
    logger->log_failure(model, ctx, failure);
}

} // namespace caffeine

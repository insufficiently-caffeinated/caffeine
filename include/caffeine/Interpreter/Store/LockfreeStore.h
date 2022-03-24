#pragma once

#include "caffeine/Interpreter/Store.h"
#include <atomic>
#include <boost/lockfree/queue.hpp>
#include <condition_variable>

namespace caffeine {

class LockfreeContextStore : public ExecutionContextStore {
public:
  LockfreeContextStore(size_t num_readers);
  ~LockfreeContextStore();

  std::optional<Context> next_context() override;

  void add_context(Context&& ctx) override;
  void shutdown() override;

  LockfreeContextStore(const LockfreeContextStore&) = delete;
  LockfreeContextStore& operator=(const LockfreeContextStore&) = delete;

private:
  size_t num_readers_;
  size_t blocked_{0};
  std::atomic<bool> done_{false};
  boost::lockfree::queue<Context*> queue_{32};
  std::condition_variable cond_;
  std::mutex mutex_;
};

} // namespace caffeine

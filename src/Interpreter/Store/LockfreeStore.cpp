#include "caffeine/Interpreter/Store/LockfreeStore.h"
#include "caffeine/ADT/Guard.h"

namespace caffeine {

std::optional<Context> LockfreeContextStore::next_context() {
  do {
    if (done_.load(std::memory_order_relaxed)) {
      return std::nullopt;
    }

    Context* ptr;
    if (queue_.pop(ptr)) {
      std::unique_ptr<Context> ctx{ptr};
      return std::move(*ctx);
    }

    std::unique_lock lock{mutex_};
    blocked_ += 1;

    if (blocked_ == num_readers_) {
      blocked_ -= 1;
      shutdown();
      return std::nullopt;
    }

    cond_.wait_for(lock, std::chrono::milliseconds(100));
  } while (true);
}

void LockfreeContextStore::add_context(Context&& ctx) {
  if (done_.load(std::memory_order_relaxed))
    return;

  auto ctxptr = std::make_unique<Context>(std::move(ctx));
  if (queue_.push(ctxptr.get())) {
    (void)ctxptr.release();
    cond_.notify_one();
  } else {
    CAFFEINE_ABORT("Failed to push to main queue");
  }
}

void LockfreeContextStore::shutdown() {
  done_.store(true);
  cond_.notify_all();
}

LockfreeContextStore::LockfreeContextStore(size_t num_readers)
    : num_readers_(num_readers) {}
LockfreeContextStore::~LockfreeContextStore() {
  CAFFEINE_ASSERT(blocked_ == 0);

  Context* ptr;
  while (queue_.unsynchronized_pop(ptr)) {
    delete ptr;
  }
}

} // namespace caffeine

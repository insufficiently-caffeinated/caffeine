#pragma once

#include <ostream>
#include <vector>

namespace caffeine {

class ContextEventNotifier;
class ContextEventObserver;

class ContextEventNotifier {

  std::vector<ContextEventObserver*> observers;

public:
  ContextEventNotifier() = default;
  virtual ~ContextEventNotifier() = default;

  void add_observer(ContextEventObserver* o);

  void notify_context_added(size_t added = 1);
  void notify_context_finished(size_t finished = 1);
};

class ContextEventObserver {

  virtual void update() = 0;

protected:
  size_t total_contexts;
  size_t completed_contexts;

public:
  ContextEventObserver() : total_contexts(0), completed_contexts(0){};
  virtual ~ContextEventObserver() = default;

  virtual void update_added_contexts(size_t added);
  virtual void update_finished_contexts(size_t finished);
};

class ContextEventLogger : public ContextEventObserver {
  std::ostream* os;

protected:
  void update() override;

public:
  ContextEventLogger(std::ostream& o) : ContextEventObserver(), os(&o){};
};

} // namespace caffeine
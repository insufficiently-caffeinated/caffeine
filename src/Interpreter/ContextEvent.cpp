#include "caffeine/Interpreter/ContextEvent.h"

#include <sstream>

namespace caffeine {

//// ContextEventNotifier Member functions
void ContextEventNotifier::add_observer(ContextEventObserver* o) {
  observers.push_back(o);
}

void ContextEventNotifier::notify_context_added(size_t added) {
  for (ContextEventObserver* o : observers) {
    o->update_added_contexts(added);
  }
}

void ContextEventNotifier::notify_context_finished(size_t finished) {
  for (ContextEventObserver* o : observers) {
    o->update_finished_contexts(finished);
  }
}

//// ContextEventObserver Member Functions
void ContextEventObserver::update_added_contexts(size_t added) {
  total_contexts += added;
  update();
}

void ContextEventObserver::update_finished_contexts(size_t finished) {
  completed_contexts += finished;
  update();
}

void ContextEventLogger::update() {
  std::stringstream ss;
  ss << "Currently processed " << completed_contexts << " / " << total_contexts
     << " total contexts.\n";

  *os << ss.str() << std::flush;
}

} // namespace caffeine
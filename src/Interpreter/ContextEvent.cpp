#include "caffeine/Interpreter/ContextEvent.h"

#include <sstream>
#include <sys/ioctl.h>

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

ContextEventLogger::ContextEventLogger(std::ostream& o, bool no_output)
    : ContextEventObserver(), os(&o) {

  if (!no_output) {
    struct winsize w;
    ioctl(0, TIOCGWINSZ, &w);

    size_t lines = w.ws_row;
    *os << "\n"
        << "\0337"
        << "\033[0;" << lines << "r\0338\033[1A";
  }
};

void ContextEventLogger::update() {
  std::stringstream ss;
  struct winsize w;
  ioctl(0, TIOCGWINSZ, &w);
  size_t lines = w.ws_row;

  ss << "\0337"
     << "\033[" << lines << ";0f";
  ss << "Currently processed " << completed_contexts << " contexts."
     << "\0338";

  *os << ss.str() << std::flush;
}

} // namespace caffeine

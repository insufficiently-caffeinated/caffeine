#include "caffeine/Support/SyncOStream.h"

namespace caffeine {

std::map<std::ostream*, std::mutex> sync_ostream_wrapper::locks;

sync_ostream_wrapper::sync_ostream_wrapper(std::ostream& o) : os(&o) {
  if (locks.find(os) == locks.end()) {
    locks[os];
  }
}

sync_ostream_wrapper::~sync_ostream_wrapper() {
  flush();
}

void sync_ostream_wrapper::flush() {
  std::lock_guard<std::mutex> lock(locks[os]);
  *os << sstream.str() << std::flush;
}

std::string sync_ostream_wrapper::get_formatted_string() {
  return sstream.str();
}

} // namespace caffeine

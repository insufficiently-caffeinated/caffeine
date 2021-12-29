#include "caffeine/Support/SyncOStream.h"

namespace caffeine {

std::map<std::ostream *, std::mutex> locks;

sync_ostream_wrapper::sync_ostream_wrapper( std::ostream& o )
  : os(&o)
{
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

sync_ostream_wrapper& sync_ostream_wrapper::operator<< (const std::string & s) {
  sstream << s;
  return *this;
}

} // namespace caffeine

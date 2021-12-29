#pragma once

#include <map>
#include <mutex>
#include <ostream>
#include <sstream>
#include <string>

namespace caffeine {

/**
 * A wrapper class for an ostream object. This is modelled after
 * the version that is in C++20
 */
class sync_ostream_wrapper {
  static std::map<std::ostream *, std::mutex> locks;

  std::ostream * os;
  std::stringstream sstream;

  void flush();

public:

  sync_ostream_wrapper( std::ostream& o );
  ~sync_ostream_wrapper();

  sync_ostream_wrapper& operator<< (const std::string & s);
  // TODO: potentially other functions for string output...
};

} // namespace caffeine

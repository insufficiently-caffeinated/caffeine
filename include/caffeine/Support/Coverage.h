#pragma once

#include <map>
#include <memory>
#include <string>
#include <vector>

#include "caffeine/ADT/StringMap.h"

namespace caffeine {

class Line;

class CoverageReport {
  StringMap<std::vector<size_t>> file_lines;

public:
  CoverageReport() = default;
  ~CoverageReport() = default;

  void add_file(std::string, std::map<size_t, Line>);

  void print(std::ostream& out) const;
};

class CoverageTracker {
private:
  std::vector<std::map<size_t, Line>> file_lines;
  StringMap<size_t> file_to_vec;

public:
  CoverageTracker() = default;
  ~CoverageTracker() = default;

  CoverageTracker(const CoverageTracker&) = default;
  CoverageTracker(CoverageTracker&&) = default;

  void touch(std::string filename, size_t line);
  CoverageReport report() const;
};

class Line {
private:
  size_t line_;
  size_t hits_;

public:
  Line() = default;
  Line(size_t line_num, size_t hits = 1);
  ~Line() = default;

  Line(const Line&) = default;
  Line(Line&&) = default;

  /**
   * Used to keep track how many times this line has been seen
   * during execution.
   */
  void touch(size_t hits = 1);

  // Values
  size_t line() const;
  size_t hits() const;
};

} // namespace caffeine

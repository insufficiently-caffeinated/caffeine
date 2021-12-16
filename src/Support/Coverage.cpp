#include "caffeine/Support/Coverage.h"

#include <algorithm>
#include <iostream>
#include <sstream>
#include <iterator>

namespace caffeine {

// CoverageReport

void CoverageReport::add_file(std::string filename,
                              std::map<size_t, Line> lines) {
  std::vector<size_t> l;
  std::transform(lines.begin(), lines.end(), std::back_inserter(l),
                 [](std::pair<size_t, Line> line) { return line.first; });
  file_lines.emplace(filename, l);
}

void CoverageReport::print(std::ostream& out) const {
  out << "=============Coverage report==============" << std::endl;

  for (const auto& [file, lines] : file_lines) {
    std::ostringstream oss;
    if (!lines.empty()) {
      std::copy(lines.begin(), lines.end()-1,
        std::ostream_iterator<size_t>(oss, ","));
      oss << lines.back();
    }
    out << "-> " << file << ": [" << oss.str() <<  "]" << std::endl;
  }
  out << "=========================================" << std::endl;
}

// CoverageTracker

void CoverageTracker::touch(std::string filename, size_t line) {
  // Check if this file is already being tracked
  auto it_file = file_to_vec.find(filename);
  size_t vecPos = 0;
  if (it_file == file_to_vec.end()) {
    vecPos = file_lines.size();
    std::map<size_t, Line> m;
    file_lines.push_back(m);
    file_to_vec.emplace(filename, vecPos);
  } else {
    vecPos = (*it_file).second;
  }
  // Check if line has already been seen.
  auto it_line = file_lines[vecPos].find(line);
  if (it_line == file_lines[vecPos].end()) {
    Line l{line};
    file_lines[vecPos].emplace(line, l);
  } else {
    file_lines[vecPos][line].touch();
  }
}

CoverageReport CoverageTracker::report() const {
  CoverageReport report;

  for (const auto& [file, pos] : file_to_vec) {
    report.add_file(file, file_lines[pos]);
  }
  return report;
}

// --- Line

Line::Line(size_t line_number, size_t hits) : line_{line_number}, hits_{hits} {}

void Line::touch(size_t hits) {
  hits_ += hits;
}

void Line::touch_branch(size_t branch_id, size_t hits) {
  // TODO: Later expansion
}

void Line::touch_switch(size_t switch_id, size_t hits) {
  // TODO: Later expansion
}

size_t Line::line() const {
  return line_;
}

size_t Line::hits() const {
  return hits_;
}

} // namespace caffeine
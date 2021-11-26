#include "caffeine/Support/Coverage.h"

namespace caffeine {


// CoverageTracker

void CoverageTracker::touch(std::string filename, size_t line) {
    auto fileIterator = lines_.find(filename);
    if (fileIterator == lines_.end()) {
        lines_.emplace(filename, std::make_unique<Map<size_t, std::unique_ptr<Line>>());
    }

    auto lineIterator = lines_[filename]->find(line);
    if (lineIterator == lines_[filename]->end()) {
        lines_[filename].emplace(line, std::make_unique<Line>(line));
    } else {
        (*lineIterator)[line]->touch();
    }
}

CoverageReport CoverageTracker::report() const {
    // TODO
}


// --- Line

Line::Line(size_t line_number, size_t hits): 
    line_{line_number}, hits_{hits} {}

void Line::touch(size_t hits) {
    hits_ += hits;
}

size_t Line::LineNumber() {
    return line_;
}

size_t Line::Hits() {
    return hits_;
}

} // namespace caffeine
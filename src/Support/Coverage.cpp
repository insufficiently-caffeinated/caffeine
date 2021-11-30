#include "caffeine/Support/Coverage.h"

namespace caffeine {


// CoverageTracker

void CoverageTracker::touch(std::string filename, size_t line) {
    // Check if this file is already being tracked
    auto it_file = file_to_vec.find(filename);
    size_t vecPos = 0;
    if (it_file == file_to_vec.end()) {
        vecPos = file_lines.size();
        std::map<size_t, Line> m;
        file_lines.push_back(m);
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

// --- Line

Line::Line(size_t line_number, size_t hits): 
    line_{line_number}, hits_{hits} {}

void Line::touch(size_t hits) {
    hits_ += hits;
}

size_t Line::LineNumber() const {
    return line_;
}

size_t Line::Hits() const {
    return hits_;
}

} // namespace caffeine
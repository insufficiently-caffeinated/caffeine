#pragma once 

#include <map>
#include <memory>
#include <string>

namespace caffeine {

class Line;

class CoverageReport {
public:
    CoverageReport();
    ~CoverageReport();
};

class CoverageTracker {
private:
    Map<std::string, std::unique_ptr<Map<size_t, std::unique_ptr<Line>>>> lines_;
    
public:
    CoverageTracker() = default;
    ~CoverageTracker() = default;

    CoverageTracker(const CoverageTracker) = default;
    CoverageTracker(CoverageTracker&&) = default;

    CoverageTracker operator=(const CoverageTracker&) = default;
    CoverageTracker operator=(CoverageTracker&&) = default;

    void touch(std::string filename, size_t line);
    CoverageReport report() const;
};

class Line {
private:
    size_t line_;
    size_t hits_;

public:
    excplicit Line(size_t line_num, size_t hits = 1);
    ~Line() = default;

    /**
     * Used to keep track how many times this line has been seen
     * during execution.
     */
    void touch(size_t hits = 1);
    size_t LineNumber() const;
    size_t Hits() const;
}

} // namespace caffeine

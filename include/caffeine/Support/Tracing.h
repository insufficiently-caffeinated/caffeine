#pragma once

#include "caffeine/Config.h"
#include "caffeine/Support/Macros.h"
#include <memory>
#include <string_view>

namespace caffeine::tracing {

class TraceSink;

/**
 * Open a new tracing context.
 *
 * This initializes a new global tracing context that is tied to the lifetime of
 * the created TraceContext object. If there is no global tracing context that
 * is current then no spans will be recorded.
 *
 * It is an error to try and create a tracing context when another one already
 * exists.
 */
class TraceContext {
public:
#if CAFFEINE_ENABLE_TRACING
  std::unique_ptr<TraceSink> impl;
#endif

public:
#if CAFFEINE_ENABLE_TRACING
  TraceContext(const char* output_file);
  ~TraceContext();

  bool is_enabled() const;
#else
  TraceContext(const char*) {}
  ~TraceContext() = default;

  bool is_enabled() const {
    return false;
  }
#endif
public:
  TraceContext(TraceContext&&) = delete;
  TraceContext(const TraceContext&) = delete;
  TraceContext& operator=(TraceContext&&) = delete;
  TraceContext& operator=(const TraceContext&) = delete;
};

/**
 * An individual span within the recorded trace of the program.
 *
 * In our model, a span is a named window of time with arbitrary user-added
 * annotations. An AutoTraceBlock creates a span that is automatically closed
 * when the block is destroyed. Currently this is the only way to create a trace
 * span.
 *
 * Note that the recommended way to create a trace span is by using the
 * CAFFENE_TRACE_SPAN macro.
 *
 * Performance
 * ===========
 * When tracing is disabled at compile time, all the methods of AutoTraceBlock
 * are stubbed out and should be completely optimized away, making it zero-cost.
 * Otherwise, there is a runtime check when creating the block.
 *
 * If creating an annotation would be expensive then you can use is_enabled to
 * check whether this block will record anything and only emit the annotation if
 * it would.
 *
 * Annotations
 * ===========
 * Annotations are a collection of string key-value pairs. They (should) be
 * shown along with each span when the log is transformed into whatever final
 * format is applicable.
 *
 * Annotations are meant to be used to store whatever context-relevant
 * information one would want to properly interpret the span.
 */
class AutoTraceBlock {
private:
#if CAFFEINE_ENABLE_TRACING
  struct Impl;

  std::unique_ptr<Impl> impl;
#endif

public:
  // Limit annotation size to 32KB to keep the annotation file size from
  // exploding.
  //
  // Note that chrome can only load at most 256MB of trace data so raising this
  // limit can cause problems for traces with large annotations.
  static constexpr size_t MAX_ANNOTATION_SIZE = 32 * 1024;

#if CAFFEINE_ENABLE_TRACING
  AutoTraceBlock(std::string_view name);
  ~AutoTraceBlock();

  AutoTraceBlock(AutoTraceBlock&&);
  AutoTraceBlock& operator=(AutoTraceBlock&&);
#else
  AutoTraceBlock(std::string_view) {}
  ~AutoTraceBlock() = default;

  AutoTraceBlock(AutoTraceBlock&&) = default;
  AutoTraceBlock& operator=(AutoTraceBlock&&) = default;
#endif

#if CAFFEINE_ENABLE_TRACING
  bool is_enabled() const;
#else
  bool is_enabled() const {
    return false;
  }
#endif

#if CAFFEINE_ENABLE_TRACING
  /**
   * End the span early. Normally the span is ended when the destructor is
   * called but if the lifetime you're trying to trace isn't directly linked to
   * a scope then it may be easier to just call this method instead.
   *
   * Note: Any annotations added after calling close will not be recorded.
   */
  void close();
#else
  void close() {}
#endif

  AutoTraceBlock& annotate(std::string_view name, std::string_view value) & {
    annotate_detail(name, value);
    return *this;
  }
  AutoTraceBlock&& annotate(std::string_view name, std::string_view value) && {
    annotate_detail(name, value);
    return std::move(*this);
  }

private:
#if CAFFEINE_ENABLE_TRACING
  void annotate_detail(std::string_view name, std::string_view value);
#else
  void annotate_detail(std::string_view, std::string_view) {}
#endif

public:
  template <typename F>
  AutoTraceBlock& annotate_func(F&& func) & {
    if (is_enabled())
      func(*this);
    return *this;
  }
  template <typename F>
  AutoTraceBlock&& annotate_func(F&& func) && {
    if (is_enabled())
      func(*this);
    return std::move(*this);
  }

public:
  AutoTraceBlock(const AutoTraceBlock&) = delete;
  AutoTraceBlock& operator=(const AutoTraceBlock&) = delete;
};

namespace detail {
  void annotate_tid(AutoTraceBlock& block);
}

/**
 * Open a trace block and record some common trace metadata.
 *
 * This is the recommended way of opening a trace span. It returns an
 * AutoTraceBlock instance that you can add custom annotations to.
 */
#define CAFFEINE_TRACE_SPAN(name)                                              \
  ::caffeine::tracing::AutoTraceBlock(name)                                    \
      .annotate("line", CAFFEINE_STRINGIFY(__LINE__))                          \
      .annotate("file", __FILE__)                                              \
      .annotate("func", CAFFEINE_FUNCTION)                                     \
      .annotate_func(::caffeine::tracing::detail::annotate_tid)

} // namespace caffeine::tracing

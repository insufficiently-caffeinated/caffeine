#include "caffeine/Support/Tracing.h"
#include "caffeine/Protos/tracepoint.capnp.h"
#include "caffeine/Support/Assert.h"
#include <capnp/message.h>
#include <capnp/orphan.h>
#include <capnp/serialize-packed.h>
#include <chrono>
#include <cstdio>
#include <fmt/format.h>
#include <fmt/ostream.h>
#include <llvm/ADT/SmallVector.h>
#include <thread>
#include <vector>

namespace caffeine::tracing {

namespace detail {
  void annotate_tid(AutoTraceBlock& block) {
    block.annotate("tid", fmt::format("{}", std::this_thread::get_id()));
  }
} // namespace detail

#if CAFFEINE_ENABLE_TRACING

namespace {
  static TraceSink* trace_sink = nullptr;

  void build_string(capnp::Text::Builder&& builder, std::string_view string) {
    CAFFEINE_ASSERT(builder.size() == string.size());
    std::copy(string.begin(), string.end(), builder.asArray().begin());
  }
} // namespace

class TraceSink {
private:
  FILE* output;

public:
  TraceSink(FILE* output) : output(output) {
    CAFFEINE_ASSERT(output);
  }
  ~TraceSink() {
    fclose(output);
  }

  FILE* file() const {
    return output;
  }
};

TraceContext::TraceContext(const char* output_file) {
  FILE* file = fopen(output_file, "wb");
  if (!file)
    throw std::runtime_error("Unable to open trace file");

  CAFFEINE_ASSERT(!trace_sink, "Tried to create a new TraceContext while "
                               "another one was already current.");

  impl = std::make_unique<TraceSink>(file);
  trace_sink = impl.get();
}
TraceContext::~TraceContext() {
  if (impl)
    trace_sink = nullptr;
}

bool TraceContext::is_enabled() const {
  return !!impl;
}

bool TraceContext::tracing_enabled() {
  return !!trace_sink;
}

struct AutoTraceBlock::Impl {
  capnp::MallocMessageBuilder message;
  llvm::SmallVector<
      std::pair<capnp::Orphan<capnp::Text>, capnp::Orphan<capnp::Text>>, 16>
      annotations;
  TraceSpan::Builder span;

  Impl() : span(message.initRoot<TraceSpan>()) {
    annotations.reserve(16);
  }

  void emit() {
    auto sink = trace_sink;
    if (!sink)
      return;

    span.setEnd(std::chrono::system_clock::now().time_since_epoch().count());

    auto list = span.initAnnotations(annotations.size());
    size_t i = 0;
    for (auto&& [name, value] : annotations) {
      list[i].adoptName(std::move(name));
      list[i].adoptValue(std::move(value));

      i += 1;
    }

    kj::VectorOutputStream stream;
    capnp::writePackedMessage(stream, message);

    auto data = stream.getArray();
    fwrite(data.begin(), data.size(), 1, sink->file());
  }
};

AutoTraceBlock::AutoTraceBlock() {}
AutoTraceBlock::AutoTraceBlock(std::string_view name) {
  if (trace_sink) {
    impl = std::make_unique<Impl>();
    build_string(impl->span.initName(name.size()), name);

    impl->span.setStart(
        std::chrono::system_clock::now().time_since_epoch().count());
  }
}
AutoTraceBlock::~AutoTraceBlock() {
  if (!impl)
    return;

  impl->emit();
}

AutoTraceBlock::AutoTraceBlock(AutoTraceBlock&& block)
    : impl(std::move(block.impl)) {}
AutoTraceBlock& AutoTraceBlock::operator=(AutoTraceBlock&& block) {
  impl = std::move(block.impl);
  return *this;
}

bool AutoTraceBlock::is_enabled() const {
  return impl && trace_sink;
}

void AutoTraceBlock::close() {
  if (impl)
    impl->emit();
  impl = nullptr;
}

void AutoTraceBlock::annotate_detail(std::string_view name,
                                     std::string_view value) {
  if (!impl)
    return;

  auto orphanage = impl->message.getOrphanage();

  if (name.size() > MAX_ANNOTATION_SIZE)
    name = std::string_view(name.data(), MAX_ANNOTATION_SIZE);
  if (value.size() > MAX_ANNOTATION_SIZE)
    value = std::string_view(value.data(), MAX_ANNOTATION_SIZE);

  auto oname = orphanage.newOrphan<capnp::Text>(name.size());
  auto ovalue = orphanage.newOrphan<capnp::Text>(value.size());

  build_string(oname.get(), name);
  build_string(ovalue.get(), value);

  impl->annotations.emplace_back(std::move(oname), std::move(ovalue));
}

#endif



} // namespace caffeine::tracing

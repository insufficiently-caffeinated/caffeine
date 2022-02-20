#include "caffeine/Interpreter/DiskFailureLogger.h"
#include "caffeine/ADT/Guard.h"
#include "caffeine/Protos/testcase.capnp.h"
#include <atomic>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <capnp/message.h>
#include <capnp/orphan.h>
#include <capnp/serialize-packed.h>
#include <cstdio>
#include <cstdlib>
#include <fmt/format.h>
#include <sstream>

namespace fs = boost::filesystem;

namespace caffeine {

DiskFailureLogger::DiskFailureLogger(std::string_view directory)
    : outdir(directory) {
  if (!outdir.empty() && outdir.back() == '/')
    outdir.pop_back();

  if (fs::create_directories(outdir))
    // We've just created the directory so it must be empty
    return;
}

void DiskFailureLogger::log_failure(const Model* model, const Context& ctx,
                                    const Failure& failure) {
  FILE* file = create_file();
  CAFFEINE_ASSERT(file, "Failed to create test case output file");
  auto guard = make_guard([=] { fclose(file); });

  capnp::MallocMessageBuilder builder;
  auto orphanage = builder.getOrphanage();
  auto testcase = builder.initRoot<protos::TestCase>();
  auto constants = testcase.initConstants(ctx.constants.size());

  size_t index = 0;
  auto oconst = orphanage.newOrphan<protos::Constant>();
  for (const auto& [name, expr] : ctx.constants) {
    auto value = model->evaluate(*expr, ctx.egraph).array();
    auto oname = orphanage.newOrphan<capnp::Text>(name.size());
    auto ovalue = orphanage.newOrphan<capnp::Data>(value.size());

    std::copy(name.begin(), name.end(), oname.get().begin());
    std::copy(value.data(), value.data() + value.size(), ovalue.get().begin());

    auto c = oconst.get();
    c.adoptName(std::move(oname));
    c.adoptValue(std::move(ovalue));

    constants.setWithCaveats(index, c.asReader());
    index += 1;
  }

  std::stringstream backtrace_ss;
  ctx.print_backtrace(backtrace_ss);
  auto backtrace = backtrace_ss.str();

  auto omessage = testcase.initMessage(failure.message.size());
  auto obacktrace = testcase.initBacktrace(backtrace.size());

  std::copy(failure.message.begin(), failure.message.end(), omessage.begin());
  std::copy(backtrace.begin(), backtrace.end(), obacktrace.begin());

  kj::VectorOutputStream stream;
  capnp::writePackedMessage(stream, builder);

  auto data = stream.getArray();
  std::fwrite(data.begin(), data.size(), 1, file);
}

FILE* DiskFailureLogger::create_file() {
  FILE* file = nullptr;
  fs::path path = outdir;

  do {
    uint64_t value = counter.fetch_add(1);
    fs::path fpath = path;
    fpath.append(fmt::format(FMT_STRING("/{:06}.tc"), value));

    file = std::fopen(fpath.c_str(), "wxb");
    fmt::print("{}\n", fpath.native());

    // We only keep going around if we failed to create the file due to another
    // one with the same name already exists.
  } while (!file && errno == EEXIST);

  return file;
}

} // namespace caffeine

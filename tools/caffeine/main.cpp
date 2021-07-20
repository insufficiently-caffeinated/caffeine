
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Interpreter/ThreadQueueStore.h"
#include "caffeine/Support/DiagnosticHandler.h"
#include "caffeine/Support/Signal.h"
#include "caffeine/Support/Tracing.h"

#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Support/raw_os_ostream.h>
#include <z3++.h>

#include <atomic>
#include <exception>
#include <iostream>
#include <memory>
#include <signal.h>
#include <thread>

using namespace llvm;
using namespace caffeine;

class CountingFailureLogger : public caffeine::PrintingFailureLogger {
public:
  std::atomic<uint64_t> num_failures = 0;
  llvm::Function* func;

  CountingFailureLogger(std::ostream& os, llvm::Function* func)
      : PrintingFailureLogger(os), func{func} {}

  void log_failure(const caffeine::Model* model, const caffeine::Context& ctx,
                   const caffeine::Failure& failure) override {
    num_failures += 1;
    caffeine::PrintingFailureLogger::log_failure(model, ctx, failure);
  }
};

cl::opt<std::string> input_filename{cl::Positional};
cl::opt<std::string> entry{
    "entry",
    cl::desc(
        "Entry method that will be executed by caffeine. [default = main]"),
    cl::value_desc("function"), cl::init("main")};
cl::opt<bool> invert_exitcode{
    "invert-exitcode",
    cl::desc("invert the exit code. 0 if the program returns a failure, 1 "
             "otherwise. All other exit codes remain the same.")};
cl::opt<size_t> threads{
    "t", cl::desc("the number of threads to use. 0 means num_cpus")};
cl::opt<bool> force_symbolic_allocator{
    "force-symbolic-allocator",
    cl::desc("force caffeine to only use the symbolic allocator. By default, "
             "caffeine will assign concrete addresses to allocations made by "
             "the program under test if possible. This option disables that "
             "and forces all allocations to have symbolic addresses. This "
             "may be much slower than allowing concrete addresses.")};
cl::opt<std::string> enable_tracing{
    "trace",
    cl::desc("Enable tracing to the output log specified by this flag."),
    cl::value_desc("filename")};
cl::opt<std::string> store_type{
    "store",
    cl::desc("Choose which solver caffeine will use. Should be one of: queue, "
             "thread-queue."),
    cl::value_desc("store"), cl::init("thread-queue")};

static ExitOnError exit_on_err;

static std::unique_ptr<Module>
loadFile(const char* argv0, const std::string& filename, LLVMContext& context) {
  llvm::SMDiagnostic error;
  auto module = llvm::parseIRFile(filename, error, context);

  if (!module) {
    error.print(argv0, llvm::errs());
    return nullptr;
  }

  return module;
}

int main(int argc, char** argv) {
  InitLLVM X(argc, argv);
  caffeine::RegisterSignalHandlers();

  exit_on_err.setBanner(std::string(argv[0]) + ":");

  LLVMContext ctx;
  ctx.setDiagnosticHandler(
      std::make_unique<caffeine::CaffeineDiagnosticHandler>(), true);

  cl::ParseCommandLineOptions(argc, argv, "symbolic executor for LLVM IR");

  std::optional<caffeine::tracing::TraceContext> tracectx;
  if (enable_tracing.getNumOccurrences() != 0) {
    tracectx.emplace(enable_tracing.c_str());

    if (tracectx->is_enabled()) {
      WithColor::remark() << "Logging trace to " << enable_tracing << '\n';
    } else {
      WithColor::warning() << "Tracing disabled at compilation time\n";
    }
  }

  auto module = loadFile(argv[0], input_filename.getValue(), ctx);
  if (!module) {
    errs() << argv[0] << ": ";
    WithColor::error() << " loading file '" << input_filename.getValue()
                       << "'\n";
    return 2;
  }

  auto function = module->getFunction(entry.getValue());
  if (!function) {
    errs() << argv[0] << ": ";
    WithColor::error() << " no method '" << entry.getValue() << "'\n";
    return 2;
  }

  auto logger = CountingFailureLogger{std::cout, function};

  caffeine::ExecutorOptions options;
  options.num_threads =
      threads != 0 ? threads : std::thread::hardware_concurrency();

  std::unique_ptr<ExecutionContextStore> store;
  if (store_type == "queue")
    store = std::make_unique<QueueingContextStore>(options.num_threads);
  else if (store_type == "thread-queue")
    store = std::make_unique<ThreadQueueContextStore>(options.num_threads);
  else {
    WithColor::error() << " unknown store type '" << store_type << "'\n";
    return 2;
  }

  auto policy = caffeine::AlwaysAllowExecutionPolicy();
  auto builder = caffeine::SolverBuilder::with_default();
  auto exec =
      caffeine::Executor(&policy, store.get(), &logger, &builder, options);

  auto context = Context(function);
  context.heaps.set_concrete(!force_symbolic_allocator);
  store->add_context(std::move(context));

  exec.run();

  int exitcode = logger.num_failures == 0 ? 0 : 1;

  if (invert_exitcode)
    exitcode = !exitcode;

  return exitcode;
}

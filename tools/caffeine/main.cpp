
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/DiskFailureLogger.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Interpreter/Store/CountLimitedStore.h"
#include "caffeine/Interpreter/Store/TimeLimitedStore.h"
#include "caffeine/Interpreter/ThreadQueueStore.h"
#include "caffeine/Memory/BumpAllocator.h"
#include "caffeine/Solver/CachingSolver.h"
#include "caffeine/Solver/InterruptSolver.h"
#include "caffeine/Solver/LoggingSolver.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Coverage.h"
#include "caffeine/Support/DiagnosticHandler.h"
#include "caffeine/Support/Signal.h"
#include "caffeine/Support/SyncOStream.h"
#include "caffeine/Support/Tracing.h"
#include <atomic>
#include <boost/filesystem.hpp>
#include <csignal>
#include <cstdlib>
#include <exception>
#include <iostream>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/Signals.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Support/raw_os_ostream.h>
#include <memory>
#include <string>
#include <thread>

using namespace llvm;
using namespace caffeine;

class CountingFailureLogger : public caffeine::FailureLogger {
public:
  std::atomic<uint64_t> num_failures = 0;
  std::atomic<bool> any_unsupported = false;

  CountingFailureLogger() = default;

  void log_failure(const caffeine::Model*, const caffeine::Context&,
                   const caffeine::Failure& failure) override {
    if (failure.message == "internal error: unsupported operation") {
      any_unsupported.store(true);
    }

    num_failures += 1;
  }
};

// Any invalid function name works here
const char* default_entry_method = "main (caf)";

cl::OptionCategory caffeine_options("Caffeine options",
                                    "Options to control caffeine");
cl::opt<std::string> input_filename{cl::Positional, cl::Required,
                                    cl::cat(caffeine_options),
                                    cl::desc("<input file>")};
cl::opt<std::string> entry{
    "entry",
    cl::desc(
        "Entry method that will be executed by caffeine. [default = main]"),
    cl::value_desc("function"), cl::cat(caffeine_options),
    cl::init(default_entry_method)};
cl::opt<bool> invert_exitcode{
    "invert-exitcode",
    cl::desc("invert the exit code. 0 if the program returns a failure, 1 "
             "otherwise. All other exit codes remain the same."),
    cl::cat(caffeine_options),
};
cl::opt<bool> log_queries{
    "log-queries",
    cl::desc("whether to log queries before sending them to the solver."),
    cl::cat(caffeine_options), cl::init(false)};
cl::opt<size_t> threads{
    "t", cl::desc("the number of threads to use. 0 means num_cpus"),
    cl::cat(caffeine_options)};
cl::opt<bool> force_symbolic_allocator{
    "force-symbolic-allocator",
    cl::desc("force caffeine to only use the symbolic allocator. By default, "
             "caffeine will assign concrete addresses to allocations made by "
             "the program under test if possible. This option disables that "
             "and forces all allocations to have symbolic addresses. This "
             "may be much slower than allowing concrete addresses."),
    cl::cat(caffeine_options)};
cl::opt<std::string> enable_tracing{
    "trace",
    cl::desc("Enable tracing to the output log specified by this flag."),
    cl::value_desc("filename"), cl::cat(caffeine_options)};
cl::opt<std::string> store_type{
    "store",
    cl::desc("Choose which store caffeine will use. Should be one of: queue, "
             "thread-queue."),
    cl::value_desc("store"), cl::init("thread-queue"),
    cl::cat(caffeine_options)};
cl::opt<bool> enable_coverage{"coverage", cl::desc("Enable coverage tracking"),
                              cl::cat(caffeine_options)};
cl::opt<bool> no_progress{"no-progress",
                          cl::desc("Disable the progress bar output"),
                          cl::cat(caffeine_options)};
cl::opt<uint64_t> limit_contexts{
    "limit-contexts",
    cl::desc("Limit the number of contexts that caffeine will execute before "
             "exiting. This roughly corresponds to the number of times that "
             "caffeine ends up splitting a context into multiple and then "
             "executing both."),
    cl::cat(caffeine_options), cl::init(0)};
cl::opt<uint64_t> limit_time_seconds{
    "limit-time-seconds",
    cl::desc("Instructs caffeine to stop symbolic execution after the given "
             "number of seconds have elapsed."),
    cl::value_desc("seconds"), cl::cat(caffeine_options), cl::init(0)};
cl::opt<std::string> test_output_dir{
    "test-output-dir", cl::desc("The directory to output test case files to."),
    cl::cat(caffeine_options)};

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

  LLVMContext ctx;
  ctx.setDiagnosticHandler(
      std::make_unique<caffeine::CaffeineDiagnosticHandler>(), true);

  cl::HideUnrelatedOptions(caffeine_options);
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
    WithColor::error() << "loading file '" << input_filename.getValue()
                       << "'\n";
    return 2;
  }

  llvm::Function* function = nullptr;
  if (entry.getValue() == default_entry_method) {
    // Try main first, and then the mangles version
    function = module->getFunction("main");
    if (!function) {
      function = module->getFunction("_Z4mainiPPc");
    }

    if (!function) {
      WithColor::error() << "no method 'main'\n";
      return 2;
    }
  } else {
    function = module->getFunction(entry.getValue());

    if (!function) {
      WithColor::error() << "no method '" << entry.getValue() << "'\n";
      return 2;
    }
  }

  caffeine::ExecutorOptions options;
  options.num_threads =
      threads != 0 ? threads : std::thread::hardware_concurrency();

  std::unique_ptr<ExecutionContextStore> store;
  if (store_type == "queue") {
    store = std::make_unique<QueueingContextStore>(options.num_threads);
  } else if (store_type == "thread-queue") {
    store = std::make_unique<ThreadQueueContextStore>(options.num_threads);
  } else {
    WithColor::error() << " unknown store type '" << store_type << "'\n";
    return 2;
  }

  if (limit_contexts != 0) {
    store =
        std::make_unique<CountLimitedStore>(limit_contexts, std::move(store));
  }

  if (limit_time_seconds != 0) {
    store = std::make_unique<TimeLimitedStore>(
        std::chrono::steady_clock::now() +
            std::chrono::seconds(limit_time_seconds),
        std::move(store));
  }

  std::unique_ptr<CoverageTracker> cov = nullptr;
  if (enable_coverage)
    cov = std::make_unique<CoverageTracker>();

  std::shared_ptr<std::atomic_bool> should_stop =
      std::make_shared<std::atomic_bool>(false);

  auto solver_builder = SolverBuilder::with_default();
  if (log_queries)
    solver_builder.with<LoggingSolver>();

  boost::filesystem::create_directories(".cache/caffeine");
  solver_builder.with(CachingSolverBuilder(".cache/caffeine", MDB_NOMETASYNC));

  solver_builder.with<InterruptSolver>(should_stop);

  auto counter = std::make_unique<CountingFailureLogger>();
  auto logger = counter.get();

  std::vector<std::unique_ptr<FailureLogger>> loggers;
  loggers.push_back(std::move(counter));
  loggers.push_back(std::make_unique<PrintingFailureLogger>(std::cout));

  if (test_output_dir != "") {
    loggers.push_back(std::make_unique<DiskFailureLogger>(test_output_dir));
  }

  auto caffeine = CaffeineContext::builder()
                      .with_store(std::move(store))
                      .with_logger(std::make_unique<CombinedFailureLogger>(
                          std::move(loggers)))
                      .with_coverage(std::move(cov))
                      .with_solver_builder(std::move(solver_builder))
                      .build();
  auto exec = caffeine::Executor(&caffeine, options, should_stop);

  caffeine::signals::executor = &exec;

  ContextEventLogger ctx_logger(std::cout, no_progress);
  ContextEventObserver* ctx_observer = &ctx_logger;
  if (!no_progress) {
    caffeine.policy()->add_observer(ctx_observer);
    caffeine.store()->add_observer(ctx_observer);
  }

  auto context = Context(function);
  if (force_symbolic_allocator)
    context.heaps = MultiHeap();
  caffeine.store()->add_context(std::move(context));

  llvm::sys::SetInterruptFunction(&caffeine::signals::stop_context);

  exec.run();

  int exitcode = logger->num_failures == 0 ? EXIT_SUCCESS : EXIT_FAILURE;

  if (caffeine.coverage()) {
    caffeine.coverage()->report().print(std::cout);
  }

  if (invert_exitcode)
    exitcode = !exitcode;

  // We always want to exit with a failure when we run into an unsupported
  // operation.
  if (logger->any_unsupported)
    exitcode = EXIT_FAILURE;

  return exitcode;
}

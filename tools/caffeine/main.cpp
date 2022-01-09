
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/Interpreter.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Interpreter/Store/CountLimitedStore.h"
#include "caffeine/Interpreter/Store/TimeLimitedStore.h"
#include "caffeine/Interpreter/ThreadQueueStore.h"
#include "caffeine/Solver/LoggingSolver.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Support/Coverage.h"
#include "caffeine/Support/DiagnosticHandler.h"
#include "caffeine/Support/Signal.h"
#include "caffeine/Support/Tracing.h"
#include <atomic>
#include <cstdlib>
#include <divine/Passes/CppLsda.h>
#include <exception>
#include <iostream>
#include <llvm/IR/Module.h>
#include <llvm/IR/PassManager.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Support/raw_os_ostream.h>
#include <memory>
#include <signal.h>
#include <string>
#include <thread>
#include <z3++.h>

using namespace llvm;
using namespace caffeine;

class CountingFailureLogger : public caffeine::PrintingFailureLogger {
public:
  std::atomic<uint64_t> num_failures = 0;
  std::atomic<bool> any_unsupported = false;
  llvm::Function* func;

  CountingFailureLogger(std::ostream& os, llvm::Function* func)
      : PrintingFailureLogger(os), func{func} {}

  void log_failure(const caffeine::Model* model, const caffeine::Context& ctx,
                   const caffeine::Failure& failure) override {
    if (failure.message == "internal error: unsupported operation") {
      any_unsupported.store(true);
    }

    num_failures += 1;
    caffeine::PrintingFailureLogger::log_failure(model, ctx, failure);
  }
};

cl::OptionCategory caffeine_options("Caffeine options",
                                    "Options to control caffeine");
cl::opt<std::string> input_filename{cl::Positional, cl::Required,
                                    cl::cat(caffeine_options),
                                    cl::desc("<input file>")};
cl::opt<std::string> entry{
    "entry",
    cl::desc(
        "Entry method that will be executed by caffeine. [default = main]"),
    cl::value_desc("function"), cl::cat(caffeine_options), cl::init("main")};
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

  llvm::ModulePassManager mpm;
  llvm::ModuleAnalysisManager mam;
  mpm.addPass(divine::AddCppLSDA());

  llvm::PassBuilder passBuilder;
  passBuilder.registerModuleAnalyses(mam);
  mpm.run(*module, mam);

  auto function = module->getFunction(entry.getValue());
  if (!function) {
    WithColor::error() << "no method '" << entry.getValue() << "'\n";
    return 2;
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

  std::unique_ptr<CoverageTracker> cov = nullptr;
  if (enable_coverage)
    cov = std::make_unique<CoverageTracker>();

  auto solver_builder = SolverBuilder::with_default();
  if (log_queries)
    solver_builder.with<LoggingSolver>();

  auto caffeine = CaffeineContext::builder()
                      .with_store(std::move(store))
                      .with_logger(std::make_unique<CountingFailureLogger>(
                          std::cout, function))
                      .with_coverage(std::move(cov))
                      .with_solver_builder(std::move(solver_builder))
                      .build();
  auto exec = caffeine::Executor(&caffeine, options);

  ContextEventLogger ctx_logger(std::cout, no_progress);
  ContextEventObserver* ctx_observer = &ctx_logger;
  if (!no_progress) {
    caffeine.policy()->add_observer(ctx_observer);
    caffeine.store()->add_observer(ctx_observer);
  }

  auto context = Context(function);
  context.heaps.set_concrete(!force_symbolic_allocator);
  caffeine.store()->add_context(std::move(context));

  exec.run();

  auto logger = static_cast<CountingFailureLogger*>(caffeine.logger());
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

#include "caffeine/Interpreter/ExprEval.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Solver/Z3Solver.h"
#include <gtest/gtest.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>

using namespace caffeine;

class ExprEvaluatorTests : public ::testing::Test {
public:
  llvm::LLVMContext context;
  std::shared_ptr<Solver> solver;

  std::unique_ptr<llvm::Module> module_with_global;

public:
  void SetUp() override {
    solver = std::make_shared<Z3Solver>();

    module_with_global = loadFile("Interpreter/ir-with-global.ll");

    ASSERT_NE(module_with_global, nullptr);
  }

private:
  std::unique_ptr<llvm::Module> loadFile(const char* filename) {
    llvm::SMDiagnostic error;
    auto module = llvm::parseIRFile(filename, error, context);

    if (!module)
      error.print("unittest", llvm::errs());

    return module;
  }
};

TEST_F(ExprEvaluatorTests, does_not_create_allocation) {
  llvm::Module* m = module_with_global.get();

  Context ctx{m->getFunction("func")};
  ExprEvaluator::Options options;
  options.create_allocations = false;
  ExprEvaluator eval{&ctx, options};

  auto value = eval.try_visit(m->getNamedGlobal("data"));
  ASSERT_FALSE(value.has_value());
}

TEST_F(ExprEvaluatorTests, undef_global_fails) {
  llvm::Module* m = module_with_global.get();

  Context ctx{m->getFunction("func")};
  ExprEvaluator::Options options;
  options.create_allocations = true;
  ExprEvaluator eval{&ctx, options};

  auto value = eval.try_visit(m->getNamedGlobal("no_init"));
  ASSERT_FALSE(value.has_value());
}

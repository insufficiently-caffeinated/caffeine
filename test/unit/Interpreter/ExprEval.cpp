#include "caffeine/Interpreter/ExprEval.h"
#include "Util/CaptureOutput.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Solver.h"
#include "caffeine/Solver/Z3Solver.h"
#include "caffeine/Support/UnsupportedOperation.h"
#include <gtest/gtest.h>
#include <iostream>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>

using namespace caffeine;

class ExprEvaluatorTests : public ::testing::Test {
public:
  llvm::LLVMContext context;

  std::unique_ptr<llvm::Module> M;

  CaffeineContext caffeine;
  std::unique_ptr<InterpreterContext> interp;
  InterpreterContext::BackingList backing;
  std::shared_ptr<Solver> solver;

public:
  ExprEvaluatorTests()
      : caffeine(
            CaffeineContext::builder()
                .with_store(std::make_unique<NullContextStore>())
                .with_logger(std::make_unique<PrintingFailureLogger>(std::cout))
                .build()),
        solver(caffeine.build_solver()) {}

  void SetUp() override {
    solver = std::make_shared<Z3Solver>();

#ifndef CAFFEINE_BAZEL
    M = loadFile("Interpreter/ir-with-global.ll");
#else
    M = loadFile("test/unit/Interpreter/ir-with-global.ll");
#endif

    ASSERT_NE(M, nullptr);

    backing.push_back(std::make_unique<InterpreterContext::ContextQueueEntry>(
        Context{M->getFunction("func")}));
    interp =
        std::make_unique<InterpreterContext>(&backing, 0, solver, &caffeine);
  }

  void TearDown() override {
    if (HasFailure())
      capture.emit();
  }

private:
  std::unique_ptr<llvm::Module> loadFile(const char* filename) {
    llvm::SMDiagnostic error;
    auto module = llvm::parseIRFile(filename, error, context);

    if (!module)
      error.print("unittest", llvm::errs());

    return module;
  }

private:
  CaptureStderr capture;
};

TEST_F(ExprEvaluatorTests, does_not_create_allocation) {
  ExprEvaluator::Options options;
  options.create_allocations = false;
  ExprEvaluator eval{interp.get(), options};

  auto value = eval.try_visit(M->getNamedGlobal("data"));
  ASSERT_FALSE(value.has_value());
}

TEST_F(ExprEvaluatorTests, undef_global_fails) {
  ExprEvaluator::Options options;
  options.create_allocations = true;
  ExprEvaluator eval{interp.get(), options};

  auto value = eval.try_visit(M->getNamedGlobal("no_init"));
  ASSERT_FALSE(value.has_value());
}

TEST_F(ExprEvaluatorTests, visit_throws_when_on_nonexistant_allocation) {
  ExprEvaluator::Options options;
  options.create_allocations = false;
  ExprEvaluator eval{interp.get(), options};

  auto global = M->getNamedGlobal("data");

  try {
    eval.visit(*global);
    FAIL();
  } catch (ExprEvaluator::Unevaluatable& e) {
    std::string message = e.what();
    ASSERT_TRUE(message.find("evaluate expression") != std::string::npos);
    ASSERT_EQ(e.expr(), global);
  }
}

TEST_F(ExprEvaluatorTests, throw_on_unsupported_value_type) {
  auto func = M->getFunction("func");
  auto block = &func->getBasicBlockList().front();

  ExprEvaluator eval{interp.get()};

  ASSERT_THROW(eval.visit(block), UnsupportedOperationException);
}

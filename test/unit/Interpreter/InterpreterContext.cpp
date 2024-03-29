#include "caffeine/Interpreter/InterpreterContext.h"
#include "caffeine/Interpreter/CaffeineContext.h"
#include "caffeine/Interpreter/FailureLogger.h"
#include "caffeine/Interpreter/Policy.h"
#include "caffeine/Interpreter/Store.h"
#include "caffeine/Solver/Z3Solver.h"
#include <gtest/gtest.h>
#include <iostream>
#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>

using namespace caffeine;

class InterpreterContextTests : public ::testing::Test {
public:
  llvm::LLVMContext context;
  std::unique_ptr<llvm::Module> M;

  InterpreterContext::BackingList backing;
  CaffeineContext caffeine =
      CaffeineContext::builder()
          .with_logger(std::make_unique<PrintingFailureLogger>(std::cout))
          .with_store(std::make_unique<NullContextStore>())
          .build();

  std::shared_ptr<Solver> solver = caffeine.build_solver();

public:
  void SetUp() override {
    solver = std::make_shared<Z3Solver>();

#ifndef CAFFEINE_BAZEL
    M = loadFile("Interpreter/ir-with-global.ll");
#else
    M = loadFile("test/unit/Interpreter/ir-with-global.ll");
#endif

    ASSERT_NE(M, nullptr);

    Context ctx{M->getFunction("func")};
    ++ctx.stack_top().get_regular().current;

    backing.push_back(std::make_unique<InterpreterContext::ContextQueueEntry>(
        std::move(ctx)));
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

// This test verifies that repeated assignments to the same variable work
// as expected.
TEST_F(InterpreterContextTests, repeated_assign_to_variable) {
  InterpreterContext interp{&backing, 0, solver, &caffeine};

  OpRef a = ConstantInt::Create(llvm::APInt(16, 5));
  OpRef b = ConstantInt::Create(llvm::APInt(16, 8));

  llvm::Value* inst = interp.getCurrentInstruction();
  ASSERT_NE(inst, nullptr);

  interp.store(inst, LLVMValue{a});
  interp.store(inst, LLVMValue{b});

  auto val = interp.load(inst);
  auto scalar = val.scalar().expr();

  ASSERT_EQ(scalar, b);
}

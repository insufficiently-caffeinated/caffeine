#include "caffeine/Memory/MemHeap.h"
#include "caffeine/IR/Assertion.h"
#include "caffeine/Interpreter/Context.h"
#include "caffeine/Solver/Z3Solver.h"

#include <vector>

#include <gtest/gtest.h>

using namespace caffeine;

using llvm::LLVMContext;

// LLVM data layout string for x64_64-pc-linux-gnu
static const char* const X86_64_LINUX =
    "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128";

std::unique_ptr<llvm::Function> empty_function(llvm::LLVMContext& llvm) {
  auto function = llvm::Function::Create(
      llvm::FunctionType::get(llvm::Type::getVoidTy(llvm), false),
      llvm::GlobalValue::LinkageTypes::PrivateLinkage,
      0 // addrspace
  );

  llvm::BasicBlock::Create(llvm, "entry", function);

  return std::unique_ptr<llvm::Function>(function);
}

class MemHeapTests : public ::testing::Test {
protected:
  llvm::LLVMContext llvm;
  std::shared_ptr<Solver> solver = std::make_shared<Z3Solver>();
  llvm::DataLayout layout{X86_64_LINUX};
  std::unique_ptr<llvm::Function> function = empty_function(llvm);

  OpRef MakeInt(uint64_t value, unsigned AS = 0) {
    return ConstantInt::Create(
        llvm::APInt(layout.getIndexSizeInBits(AS), value));
  }

  OpRef MakeData(const OpRef& size) {
    return AllocOp::Create(size, ConstantInt::Create(llvm::APInt(8, 0xDD)));
  }
};

TEST_F(MemHeapTests, resolve_pointer_single) {
  MemHeapMgr heaps;
  Context context{function.get()};

  unsigned index_size = layout.getIndexSizeInBits(0);
  auto align = MakeInt(16);
  auto size = Constant::Create(Type::int_ty(index_size), "size");
  auto alloc =
      heaps[0].allocate(size, align, MakeData(size), AllocationKind::Alloca,
                        AllocationPermissions::ReadWrite, context);
  auto offset = Constant::Create(Type::int_ty(index_size), "offset");

  context.add(ICmpOp::CreateICmpULT(offset, size));

  auto ptr = Pointer(BinaryOp::CreateAdd(heaps[0][alloc].address(), offset), 0);

  ASSERT_EQ(context.check(solver, !heaps.check_valid(ptr, 0)),
            SolverResult::UNSAT);

  auto res = heaps.resolve(solver, ptr, context);

  ASSERT_EQ(res.size(), 1);
  ASSERT_EQ(res[0].alloc(), alloc);
  ASSERT_EQ(context.check(solver, res[0].check_null(heaps)),
            SolverResult::UNSAT);
}

TEST_F(MemHeapTests, resolve_pointer_mixed) {
  MemHeapMgr heaps;
  Context context{function.get()};

  unsigned index_size = layout.getIndexSizeInBits(0);
  auto align = MakeInt(16);
  auto size1 = Constant::Create(Type::int_ty(index_size), "size");
  auto size2 = ConstantInt::Create(llvm::APInt(index_size, 8));

  auto alloc1_id =
      heaps[0].allocate(size1, align, MakeData(size1), AllocationKind::Malloc,
                        AllocationPermissions::ReadWrite, context);
  auto alloc2_id =
      heaps[0].allocate(size2, align, MakeData(size2), AllocationKind::Malloc,
                        AllocationPermissions::ReadWrite, context);

  auto ptr = Pointer(heaps[0][alloc1_id].address(), 0);

  auto res = heaps.resolve(solver, ptr, context);

  ASSERT_EQ(res.size(), 1);
  ASSERT_EQ(res[0].alloc(), alloc1_id);
}


#include "caffeine/IR/Operation.h"
#include "caffeine/Memory/MemHeap.h"
#include "caffeine/Solver/Z3Solver.h"
#include <gtest/gtest.h>
#include <z3++.h>

using namespace caffeine;

// LLVM data layout string for x64_64-pc-linux-gnu
static const char* const X86_64_LINUX =
    "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128";

TEST(OperationTests, vtable_is_copied) {
  auto fixed_array = FixedArray::Create(Type::int_ty(32),
                                        {Constant::Create(Type::int_ty(1), 0)});

  auto copy =
      fixed_array->with_new_operands({Constant::Create(Type::int_ty(1), 1)});

  ASSERT_EQ(fixed_array->num_operands(), 1);
  ASSERT_EQ(copy->num_operands(), fixed_array->num_operands());
}

TEST(OperationTests, const_array_with_new_operands) {
  auto sym = Symbol("name");
  auto constant_array =
      ConstantArray::Create(sym, {Constant::Create(Type::int_ty(1), 0)});

  auto copy =
      constant_array->with_new_operands({Constant::Create(Type::int_ty(1), 1)});

  ASSERT_EQ(constant_array->num_operands(), 1);
  ASSERT_EQ(copy->num_operands(), constant_array->num_operands());
}

TEST(OperationTests, const_array_with_new_operands_into_ref) {
  auto constant_array = ConstantArray::Create(
      Symbol("name"), {Constant::Create(Type::int_ty(1), 4)});

  auto copy =
      constant_array->with_new_operands({Constant::Create(Type::int_ty(1), 4)});

  ASSERT_EQ(constant_array->num_operands(), 1);
  ASSERT_EQ(copy->num_operands(), constant_array->num_operands());
}

TEST(OperationTests, const_div_by_0_does_not_fault) {
  auto value = BinaryOp::CreateUDiv(1, ConstantInt::CreateZero(64));

  ASSERT_TRUE(llvm::isa<ConstantInt>(*value));
}

TEST(OperationTests, umul_overflow_is_valid) {
  Z3Solver solver;
  z3::context& ctx = solver.context();
  z3::solver z3solver{ctx};

  for (uint32_t bitwidth = 1; bitwidth <= 128; bitwidth += (bitwidth + 2) / 3) {
    auto c1 = Constant::Create(Type::int_ty(bitwidth), "a");
    auto c2 = Constant::Create(Type::int_ty(bitwidth), "b");
    auto ovf = BinaryOp::CreateUMulOverflow(c1, c2);
    auto new_expr = solver.evaluate(ovf, z3solver);

    auto ref_expr = !z3::bvmul_no_overflow(ctx.bv_const("a", bitwidth),
                                           ctx.bv_const("b", bitwidth), false);

    z3solver.add(new_expr != ref_expr);
    z3solver.add(new_expr == ctx.bool_const("new"));
    z3solver.add(ref_expr == ctx.bool_const("ref"));

    z3::check_result res = z3solver.check();

    ASSERT_EQ(res, z3::unsat) << "model:\n" << z3solver.get_model();
    z3solver.reset();
  }
}

// Prove that CreateSMulOverflow is valid
TEST(OperationTests, smul_overflow_is_valid) {
  Z3Solver solver;
  z3::context& ctx = solver.context();
  z3::solver z3solver{ctx};

  for (uint32_t bitwidth = 1; bitwidth <= 128; bitwidth += (bitwidth + 2) / 3) {
    auto c1 = Constant::Create(Type::int_ty(bitwidth), "a");
    auto c2 = Constant::Create(Type::int_ty(bitwidth), "b");
    auto ovf = BinaryOp::CreateSMulOverflow(c1, c2);
    auto new_expr = solver.evaluate(ovf, z3solver);

    auto ref_expr = !z3::bvmul_no_overflow(ctx.bv_const("a", bitwidth),
                                           ctx.bv_const("b", bitwidth), true);

    z3solver.add(new_expr != ref_expr);
    z3solver.add(new_expr == ctx.bool_const("new"));
    z3solver.add(ref_expr == ctx.bool_const("ref"));

    z3::check_result res = z3solver.check();

    ASSERT_EQ(res, z3::unsat) << "model:\n" << z3solver.get_model();
    z3solver.reset();
  }
}

TEST(OperationTests, create_trunc_or_zext_returns_trunc) {
  auto target = ConstantInt::Create(llvm::APInt(16, 1));
  auto source = Constant::Create(Type::int_ty(32), Symbol(1));
  auto oper = UnaryOp::CreateTruncOrZExt(target->type(), source);

  ASSERT_EQ(oper->opcode(), Operation::Trunc);
}

TEST(OperationTests, create_trunc_or_zext_returns_zext) {
  auto target = ConstantInt::Create(llvm::APInt(32, 5));
  auto source = Constant::Create(Type::int_ty(16), Symbol(1));
  auto oper = UnaryOp::CreateTruncOrZExt(target->type(), source);

  ASSERT_EQ(oper->opcode(), Operation::ZExt);
}

TEST(OperationTests, create_trunc_or_sext_returns_trunc) {
  auto target = ConstantInt::Create(llvm::APInt(16, 1));
  auto source = Constant::Create(Type::int_ty(32), Symbol(1));
  auto oper = UnaryOp::CreateTruncOrSExt(target->type(), source);

  ASSERT_EQ(oper->opcode(), Operation::Trunc);
}

TEST(OperationTests, create_trunc_or_sext_returns_sext) {
  auto target = ConstantInt::Create(llvm::APInt(32, 5));
  auto source = Constant::Create(Type::int_ty(16), Symbol(1));
  auto oper = UnaryOp::CreateTruncOrSExt(target->type(), source);

  ASSERT_EQ(oper->opcode(), Operation::SExt);
}

TEST(OperationTests, int_load_store_simplify_to_noop) {
  auto layout = llvm::DataLayout(X86_64_LINUX);
  auto value = Constant::Create(Type::int_ty(32), 0);
  auto alloc = Allocation(
      ConstantInt::CreateZero(64), ConstantInt::Create(llvm::APInt(64, 4)),
      AllocOp::Create(ConstantInt::Create(llvm::APInt(64, 4)),
                      ConstantInt::CreateZero(8)),
      AllocationKind::Alloca, AllocationPermissions::ReadWrite);

  alloc.write(ConstantInt::CreateZero(64), value, layout);
  auto read = alloc.read(ConstantInt::CreateZero(64), Type::int_ty(32), layout);

  ASSERT_EQ((Operation::Opcode)read->opcode(), Operation::ConstantNumbered);
  ASSERT_EQ(value, read) << read;
}

TEST(OperationTests, float_load_store_simplify_to_noop) {
  auto layout = llvm::DataLayout(X86_64_LINUX);
  auto value = Constant::Create(Type::type_of<float>(), 0);
  auto alloc = Allocation(
      ConstantInt::CreateZero(64), ConstantInt::Create(llvm::APInt(64, 4)),
      AllocOp::Create(ConstantInt::Create(llvm::APInt(64, 4)),
                      ConstantInt::CreateZero(8)),
      AllocationKind::Alloca, AllocationPermissions::ReadWrite);

  alloc.write(ConstantInt::CreateZero(64), value, layout);
  auto read =
      alloc.read(ConstantInt::CreateZero(64), Type::type_of<float>(), layout);

  ASSERT_EQ((Operation::Opcode)read->opcode(), Operation::ConstantNumbered);
  ASSERT_EQ(value, read) << read;
}

TEST(OperationTests, constant_int_has_correct_value) {
  auto v1 = ConstantInt::Create(llvm::APInt(37, 0));
  auto v2 = ConstantInt::Create(llvm::APInt(37, 14));
  uint64_t extracted =
      llvm::cast<ConstantInt>(v2.get())->value().getLimitedValue();

  ASSERT_EQ(extracted, 14);
}

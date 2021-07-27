#include "caffeine/IR/Type.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Value.h"

#include <llvm/IR/DataLayout.h>

#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Type.h>

#include <gtest/gtest.h>

using namespace caffeine;
using llvm::LLVMContext;

static const char* const X86_64_LINUX =
    "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128";

TEST(ir_type, byte_size_bool) {
  Type type = Type::bool_ty();
  llvm::DataLayout layout{X86_64_LINUX};
  ASSERT_EQ(type.byte_size(layout), 1);
}

TEST(ir_type, byte_size_void) {
  Type type = Type::void_ty();
  llvm::DataLayout layout{X86_64_LINUX};
  ASSERT_EQ(type.byte_size(layout), 0);
}

TEST(ir_type, print_void) {
  std::stringstream output;
  Type type = Type::void_ty();
  output << type;

  ASSERT_EQ(output.str(), "void");
}

TEST(ir_type, print_int) {
  std::stringstream output;
  Type type = Type::int_ty(1);
  output << type;

  ASSERT_EQ(output.str(), "i1");
}

TEST(ir_type, print_ptr) {
  std::stringstream output;
  Type type = Type::pointer_ty();
  output << type;

  ASSERT_EQ(output.str(), "void*");
}

TEST(ir_type, print_array) {
  std::stringstream output;
  Type type = Type::array_ty(4);
  output << type;

  ASSERT_EQ(output.str(), "array");
}

TEST(ir_type, print_vector) {
  std::stringstream output;
  Type type = Type::vector_ty();
  output << type;

  ASSERT_EQ(output.str(), "vector");
}

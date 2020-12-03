
#include <gtest/gtest.h>

#include <llvm/Support/InitLLVM.h>

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  llvm::InitLLVM X(argc, argv);
  return RUN_ALL_TESTS();
}

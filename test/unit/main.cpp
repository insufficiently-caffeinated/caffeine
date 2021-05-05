
#include <gtest/gtest.h>

#include "caffeine/Support/Signal.h"
#include <llvm/Support/InitLLVM.h>

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  llvm::InitLLVM X(argc, argv);

  caffeine::RegisterSignalHandlers();

  return RUN_ALL_TESTS();
}

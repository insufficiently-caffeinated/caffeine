
#include <gtest/gtest.h>

#include <boost/core/demangle.hpp>
#include <llvm/Support/InitLLVM.h>
#include <z3++.h>

std::terminate_handler llvm_handler = nullptr;

// z3::exception doesn't inherit from std::exception so we need to special case
// it so we can print the contained message.
static void custom_terminate_handler() {
  try {
    // special-case handling to print the contained message
    try {
      auto current = std::current_exception();

      if (!current) {
        llvm_handler();
        std::abort();
      }

      std::rethrow_exception(current);
    } catch (std::exception& e) {
      const auto& ty = typeid(e);
      std::cerr << "std::terminate called after throwing an instance of '"
                << boost::core::demangle(ty.name()) << "' and message\n  "
                << e.what() << std::endl;
      throw;
    } catch (z3::exception& e) {
      // Why oh why does z3::exception not inherit from std::exception??? :(
      const auto& ty = typeid(e);
      std::cerr << "std::terminate called after throwing an instance of '"
                << boost::core::demangle(ty.name()) << "' and message\n  "
                << e.msg() << std::endl;
      throw;
    }
  } catch (...) {
    // Use default llvm handling logic for the rest
    if (llvm_handler)
      llvm_handler();
  }
  std::abort();
}

int main(int argc, char** argv) {
  ::testing::InitGoogleTest(&argc, argv);
  llvm::InitLLVM X(argc, argv);

  llvm_handler = std::set_terminate(custom_terminate_handler);

  return RUN_ALL_TESTS();
}

#pragma once

#include <cstdint>
#include <llvm/IR/DerivedTypes.h>
#include <llvm/IR/Type.h>

namespace caffeine::setjmp {

/**
 * Implementing setjmp and longjmp
 * ===============================
 * To implement setjmp and longjmp on a normal architecture we need to somehow
 * record the current location of the thread and then return to it at a later
 * time (when longjmp is called). This is done by recording the registers at
 * that and then restoring them (mostly) when longjmp is called which has the
 * effect of returning to the call location.
 *
 * To implement these within caffeine we need to do much of the same thing.
 * Caffeine doesn't have any registers so all we really need to do is restore
 * the stack frame and the instruction pointer at the time setjmp was called.
 * The way that this is currently done is by saving two bits of info within the
 * jump buffer type:
 *
 * 1. The frame ID of the frame that first called setjmp. This is the frame we
 *    need to return to when longjmp is called.
 * 2. The llvm instruction pointer that corresponds to the call instruction to
 *    setjmp. This is the instruction we'll need to return to when longjmp is
 *    called.
 *
 * Then, when longjmp is called we search for the correct frame and instruction
 * pointer that we read from the interpreted program's memory. If we find them
 * then we drop all stack frames below the initial setjmp, reset the instruction
 * pointer, and set up the return value.
 *
 * Downsides
 * =========
 * This implementation has the problem that we are storing host-specific
 * pointers within the memory of the program being interpreted. At the moment,
 * this does not cause any issues. However, as soon as we want to go distributed
 * it's going to have to be changed to something that remains the same across
 * hosts.
 */

struct InstructionId {
  uint32_t block;
  uint32_t inst;
};

llvm::StructType* getJmpBufType(llvm::LLVMContext& ctx);

} // namespace caffeine::setjmp
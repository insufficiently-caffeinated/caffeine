#pragma once

#include <llvm/IR/Function.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>

namespace caffeine {

/**
 * Generate an implementation for an instance of the llvm.memset.* builtin and
 * replace the provided function with it within the parent module.
 *
 * This function takes a function pointer to a memset defintion within the
 * current module and generates the corresponding implementation.
 */
llvm::Function* generateMemset(llvm::Module* mod, llvm::Function* memsetDecl);

/**
 * Generate an implementation for an instance of the llvm.memcpy.* builtin and
 * replace the provided function with it within the parent module.
 *
 * This function takes a function pointer to a memcpy defintion within the
 * current module and generates the corresponding implementation.
 */
llvm::Function* generateMemcpy(llvm::Module* mod, llvm::Function* memcpyDecl);

/**
 * Get the existing declaration of a variant of the caffeine.resolve builtin. If
 * the requested variant is not available then generate it within the provided
 * module.
 *
 * The resolve builtin has the interpreter "prefault" an address range. This
 * makes so that subsequent accesses to that pointer can be quicker.
 */
llvm::FunctionCallee generateResolve(llvm::Module* module, llvm::Type* ptr_ty,
                                     llvm::Type* size_ty);

/**
 * Get the existing declaration of caffeine_assert. Creates one if it doesn't
 * exist.
 */
llvm::FunctionCallee generateAssert(llvm::Module* module);

} // namespace caffeine

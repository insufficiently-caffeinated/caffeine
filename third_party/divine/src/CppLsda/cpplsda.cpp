// -*- C++ -*- (c) 2017 Vladimír Štill <xstill@fi.muni.cz>

// Permission to use, copy, modify, and distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.

// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

#include "divine/Passes/CppLsda.h"
#include "divine/CppLsda/cppeh.h"

#include <llvm/Analysis/EHPersonalities.h>

/*
 * This file contains the `AddCppLSDA` pass that is responsible for insertion
 * of language specific data areas (LSDAs), which are used for exception
 * handling, into the module.
 *
 * A language-specific data area contains information used by a personality
 * function during exception handling. A personality function guides the
 * unwinding by looking into the LSDA of the function whose stack frame is
 * being discarded and decides, based on the information stored in the LSDA,
 * whether the current function can handle the thrown exception. In C++, the
 * LSDA also contains other information, such as whether there are any
 * destructors that have to be called before the stack frame is destroyed.
 *
 * The pass itself is relatively simple and works as follows: The module is
 * scanned for functions that have a personality function which we support
 * (that is `__gxx_personality_v0`) attached to them. For those functions,
 * we build a LSDA (using the `CppEhTab` struct), inject it into the bitcode
 * and then hook it to the function itself by storing a pointer to the LSDA
 * in the function's metadata.
 */

namespace divine {

llvm::PreservedAnalyses AddCppLSDA::run(llvm::Module& mod,
                                        llvm::ModuleAnalysisManager&) {
  auto& ctx = mod.getContext();
  auto vptr = llvm::Type::getInt8PtrTy(ctx);
  for (auto& fn : mod) {
    // We only care about functions that have the GNU_CXX  personality
    // function
    if (!fn.hasPersonalityFn() ||
        llvm::classifyEHPersonality(fn.getPersonalityFn()) !=
            llvm::EHPersonality::GNU_CXX)
      continue;

    CppEhTab ehtab(fn);
    auto* lsda = ehtab.getLSDAConst();
    if (!lsda)
      continue; // This function won't do any catching, filtering nor cleanup
                // and has no LSDA

    // Attach the LSDA as metadata of this function
    auto glo = new llvm::GlobalVariable(
        mod, lsda->getType(), true, llvm::GlobalValue::InternalLinkage, lsda,
        fn.getName() + std::string(".cpp_lsda"));
    auto* lsdap = llvm::ConstantExpr::getBitCast(glo, vptr);
    auto* lsdam = llvm::ConstantAsMetadata::get(lsdap);
    fn.setMetadata("lart.lsda", llvm::MDTuple::get(ctx, {lsdam}));
  }

  return llvm::PreservedAnalyses::all();
}

} // namespace divine

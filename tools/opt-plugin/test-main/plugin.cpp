#include "plugins.h"
#include <fmt/format.h>
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Transforms/Utils/ModuleUtils.h>

using namespace llvm;

namespace caffeine {
namespace {
  FunctionCallee generateMakeSymbolic(Module* module) {
    AttrBuilder builder;
    builder.addAttribute(Attribute::ArgMemOnly);
    builder.addAttribute(Attribute::NoUnwind);
    builder.addAttribute(Attribute::NoFree);
    builder.addAttribute(Attribute::WillReturn);

    AttributeList attrs = AttributeList::get(
        module->getContext(), AttributeList::FunctionIndex, builder);

    auto voidty = Type::getVoidTy(module->getContext());
    auto i8ptr = Type::getInt8PtrTy(module->getContext());
    auto isize = Type::getIntNTy(
        module->getContext(), module->getDataLayout().getPointerSizeInBits());

    return module->getOrInsertFunction("caffeine_make_symbolic", attrs, voidty,
                                       i8ptr, isize, i8ptr);
  }

  void generate(Module* m, Function* function) {
    auto make_symbolic = generateMakeSymbolic(m);

    FunctionType* functy =
        FunctionType::get(Type::getInt32Ty(m->getContext()),
                          {Type::getInt32Ty(m->getContext()),
                           Type::getInt8PtrTy(m->getContext())->getPointerTo()},
                          false);

    Function* main = Function::Create(
        functy, GlobalValue::LinkageTypes::ExternalLinkage, "main", m);

    BasicBlock* block = BasicBlock::Create(m->getContext(), "", main);
    std::vector<Value*> args;

    const DataLayout& layout = m->getDataLayout();
    IRBuilder builder{block};

    auto i8_p = Type::getInt8PtrTy(m->getContext());
    auto intptr =
        Type::getIntNTy(m->getContext(), layout.getPointerSizeInBits());

    size_t i = 0;
    for (const Argument& arg : function->args()) {
      std::string name = arg.getName().str();
      if (name.empty()) {
        name = fmt::format("arg{}", i);
      }

      // Note: need to include the nul terminator
      auto value = ConstantDataArray::getRaw(name, name.size() + 1,
                                             Type::getInt8Ty(m->getContext()));
      auto ident = new GlobalVariable(*m, value->getType(), true,
                                      GlobalVariable::InternalLinkage, value);
      auto idptr = ConstantExpr::getBitCast(ident, i8_p);
      auto size = ConstantInt::get(
          intptr, APInt(layout.getPointerSizeInBits(),
                        layout.getTypeStoreSize(arg.getType())));

      auto alloca = builder.CreateAlloca(arg.getType());
      auto casted = builder.CreateBitCast(alloca, i8_p);
      builder.CreateCall(make_symbolic, ArrayRef<Value*>{casted, size, idptr});
      auto loaded = builder.CreateLoad(alloca);

      args.push_back(loaded);

      i++;
    }

    builder.CreateCall(function, args);
    builder.CreateRet(ConstantInt::get(Type::getInt32Ty(m->getContext()),
                                       APInt::getNullValue(32)));
  }
} // namespace

bool GenTestMainPass::runOnModule(Module& module) {
  if (module.getFunction("main"))
    return false;

  auto test = module.getFunction("test");
  if (!test)
    return false;

  generate(&module, test);
  return true;
}

PreservedAnalyses GenTestMainPass::run(Module& M, ModuleAnalysisManager&) {
  return runOnModule(M) ? PreservedAnalyses::none() : PreservedAnalyses::all();
}

template <>
char LegacyModulePassAdapter<GenTestMainPass>::ID = 0;

namespace {
  static RegisterPass<LegacyModulePassAdapter<GenTestMainPass>>
      X(/* PassArg = */ GenTestMainPass::Name,
        /* Name    = */ "Generate a main method for caffeine run-tests",
        /* CFGonly = */ false,
        /* isAnalysis = */ false);
}

} // namespace caffeine

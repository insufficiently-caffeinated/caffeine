
#include <llvm/Bitcode/BitcodeWriter.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/InitLLVM.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/WithColor.h>
#include <llvm/Transforms/Utils/ModuleUtils.h>

#include <fmt/format.h>

using namespace llvm;

cl::opt<std::string> InputFilename(cl::Positional, cl::Required,
                                   cl::desc("<input file>"));
cl::opt<std::string> TestMethod(cl::Positional, cl::Required,
                                cl::desc("<method name>"));
cl::opt<std::string> OutputFilename("o", cl::desc("output filename"),
                                    cl::value_desc("filename"), cl::init("-"));
cl::opt<bool>
    Force("force",
          cl::desc("overwrite main if it already exists within the module"));
cl::alias ShortForce(
    "f", cl::desc("overwrite main if it already exists within the module"),
    cl::aliasopt(Force));
cl::opt<bool> SkipIfPresent(
    "skip-if-present",
    cl::desc("avoid generating a main method if one is already present"));

void generate(llvm::Module* m, llvm::Function* function,
              llvm::Function* make_symbolic) {
  llvm::FunctionType* functy = llvm::FunctionType::get(
      llvm::Type::getInt32Ty(m->getContext()),
      {llvm::Type::getInt32Ty(m->getContext()),
       llvm::Type::getInt8PtrTy(m->getContext())->getPointerTo()},
      false);

  llvm::Function* main = llvm::Function::Create(
      functy, llvm::GlobalValue::LinkageTypes::ExternalLinkage, UINT_MAX,
      "main", m);

  llvm::BasicBlock* block = llvm::BasicBlock::Create(m->getContext(), "", main);
  std::vector<llvm::Value*> args;

  const DataLayout& layout = m->getDataLayout();

  size_t i = 0;
  for (const Argument& arg : function->args()) {
    std::string name = arg.getName();
    if (name.empty()) {
      name = fmt::format("arg{}", i);
    }

    auto value = ConstantDataArray::getRaw(name, name.size(),
                                           Type::getInt8Ty(m->getContext()));
    auto ident = new GlobalVariable(*m, value->getType(), true,
                                    GlobalVariable::InternalLinkage, value);
    auto idptr =
        ConstantExpr::getBitCast(ident, Type::getInt8PtrTy(m->getContext()));

    auto alloca = new AllocaInst(arg.getType(), 0, "", block);
    auto casted =
        new BitCastInst(alloca, Type::getInt8PtrTy(m->getContext()), "", block);
    auto size = ConstantInt::get(
        Type::getIntNTy(m->getContext(), layout.getPointerSizeInBits()),
        APInt(layout.getPointerSizeInBits(),
              layout.getTypeAllocSize(arg.getType())));
    CallInst::Create(make_symbolic->getFunctionType(), make_symbolic,
                     ArrayRef<Value*>{casted, size, idptr}, "", block);
    auto loaded = new LoadInst(alloca, "", block);

    args.push_back(loaded);

    i++;
  }

  CallInst::Create(function->getFunctionType(), function, args, "", block);
  ReturnInst::Create(m->getContext(),
                     ConstantInt::get(Type::getInt32Ty(m->getContext()),
                                      APInt::getNullValue(32)),
                     block);

  appendToUsed(*m, {main});
}

int main(int argc, char** argv) {
  llvm::InitLLVM X{argc, argv};
  llvm::cl::ParseCommandLineOptions(
      argc, argv,
      "\n  Given a test method that takes symbolic parameters, generate a "
      "\n  main function that initializes them using caffeine_make_symbolic.");

  llvm::LLVMContext context;
  llvm::SMDiagnostic error;

  std::unique_ptr<llvm::Module> m =
      llvm::parseIRFile(InputFilename, error, context);
  if (!m) {
    errs() << argv[0] << ": ";
    WithColor::error() << " loading file '" << InputFilename << "'\n";
    return 1;
  }

  llvm::Function* function = m->getFunction(TestMethod);
  if (!function) {
    errs() << argv[0] << ": ";
    WithColor::error() << " no method '" << TestMethod << "'";
    return 1;
  }

  if (llvm::Function* mainfunc = m->getFunction("main")) {
    if (SkipIfPresent) {
      return 0;
    }

    if (!Force) {
      errs() << argv[0] << ": ";
      WithColor::error()
          << " main method already exists in module. Use --force "
             "to overwrite it anyway or --skip-if-present to avoid "
             "generating a main method if one is present.\n";
      return 1;
    }

    mainfunc->eraseFromParent();
  }

  llvm::Function* make_symbolic = m->getFunction("caffeine_make_symbolic");
  if (!make_symbolic) {
    // TODO: We should really just generate the appropriate method definition
    //       ourselves if it is not present.
    errs() << argv[0] << ": ";
    WithColor::error()
        << " module did not contain a caffeine_make_symbolic function.\n";
    return 1;
  }

  generate(m.get(), function, make_symbolic);

  // NOTE: WriteBitcodeToFile seems to produce something that llvm-dis can't
  // parse for LLVM 10.0.0. To work around that I'm printing using textual IR.
  if (OutputFilename == "-") {
    m->print(llvm::outs(), nullptr);
    // WriteBitcodeToFile(*m, llvm::outs());
  } else {
    std::error_code EC;
    llvm::raw_fd_ostream os(OutputFilename, EC);

    if (EC) {
      errs() << argv[0] << ": ";
      WithColor::error() << " unable to write to output file '"
                         << OutputFilename << "': " << EC.message() << "\n";
      return 1;
    }

    m->print(os, nullptr);
    // WriteBitcodeToFile(*m, os);
  }

  return 0;
}

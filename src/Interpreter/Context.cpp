#include "caffeine/Interpreter/Context.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/Type.h"
#include "caffeine/Interpreter/StackFrame.h"

#include <fmt/format.h>
#include <llvm/IR/Constants.h>
#include <llvm/IR/DataLayout.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Module.h>
#include <llvm/Support/raw_ostream.h>

#include <fmt/format.h>
#include <llvm/Support/raw_ostream.h>

namespace caffeine {

static void assert_valid_arg(llvm::Type* type) {
  if (type->isIntegerTy() || type->isFloatingPointTy()) {
    return;
  }

  std::string message;
  llvm::raw_string_ostream os{message};
  os << "Unsupported LLVM type: ";
  type->print(os);

  CAFFEINE_ABORT(message);
}

Context::Context(llvm::Function* function, std::shared_ptr<Solver> solver)
    : solver_(std::move(solver)), module_(function->front().getModule()) {
  stack.emplace_back(function);
  StackFrame& frame = stack_top();

  size_t i = 0;
  for (auto& arg : function->args()) {
    assert_valid_arg(arg.getType());

    std::string name = arg.getName().str();

    if (name.empty())
      name = fmt::format("arg{}", i);

    frame.insert(&arg, Constant::Create(Type::from_llvm(arg.getType()), name));

    i += 1;
  }
}

Context Context::fork() const {
  return Context{*this};
}

StackFrame& Context::stack_top() {
  CAFFEINE_ASSERT(!stack.empty());
  return stack.back();
}

void Context::push(const StackFrame& frame) {
  stack.push_back(frame);
}
void Context::push(StackFrame&& frame) {
  stack.push_back(frame);
}
void Context::pop() {
  CAFFEINE_ASSERT(!stack.empty());
  stack.pop_back();
}

bool Context::empty() const {
  return stack.empty();
}

std::shared_ptr<Solver> Context::solver() const {
  return solver_;
}

llvm::iterator_range<std::vector<Assertion>::const_iterator>
Context::assertions() const {
  return {std::begin(assertions_), std::end(assertions_)};
}

void Context::add(const Assertion& assertion) {
  assertions_.push_back(assertion);
}
void Context::add(Assertion&& assertion) {
  assertions_.push_back(std::move(assertion));
}

ContextValue Context::lookup(llvm::Value* value) {
  if (auto* constant = llvm::dyn_cast_or_null<llvm::Constant>(value))
    return evaluate_constant(constant);

  return stack_top().lookup(value);
}

SolverResult Context::check(const Assertion& extra) {
  return solver_->check(assertions_, extra);
}
std::unique_ptr<Model> Context::resolve(const Assertion& extra) {
  return solver_->resolve(assertions_, extra);
}

uint64_t Context::next_constant() {
  return constant_num_++;
}

ContextValue Context::evaluate_constant(llvm::Constant* constant) {
  if (auto* cnst = llvm::dyn_cast<llvm::ConstantInt>(constant))
    return ContextValue(ConstantInt::Create(cnst->getValue()));

  if (auto* cnst = llvm::dyn_cast<llvm::ConstantFP>(constant))
    return ContextValue(ConstantFloat::Create(cnst->getValueAPF()));

  if (auto* vec = llvm::dyn_cast<llvm::ConstantVector>(constant))
    return evaluate_vector(vec);

  if (auto* undef = llvm::dyn_cast<llvm::UndefValue>(constant))
    return evaluate_undef(undef);

  if (auto* global = llvm::dyn_cast<llvm::GlobalVariable>(constant))
    return evaluate_global(global);

  if (auto* vec = llvm::dyn_cast<llvm::ConstantDataVector>(constant)) {
    CAFFEINE_ASSERT(!vec->getType()->getVectorIsScalable(),
                    "scalable vectors are not supported");

    auto type = vec->getType();
    auto count = type->getVectorNumElements();

    std::vector<ContextValue> result;
    result.reserve(count);

    // TODO: This is inefficient, should be directly converting for known
    //       element types.
    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate_constant(vec->getElementAsConstant(i)));

    return ContextValue(std::move(result));
  }

  if (auto* zero = llvm::dyn_cast<llvm::ConstantAggregateZero>(constant)) {
    auto type = zero->getType();

    if (type->isVectorTy()) {
      CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                      "scalable vectors are not supported");

      size_t count = type->getVectorNumElements();
      std::vector<ContextValue> result;
      result.reserve(count);

      for (size_t i = 0; i < count; ++i)
        result.push_back(evaluate_constant(zero->getElementValue(i)));

      return ContextValue(std::move(result));
    }
  }

  std::string s = "Unsupported constant operand: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

ContextValue Context::evaluate_undef(llvm::UndefValue* undef) {
  auto type = undef->getType();

  if (type->isVectorTy()) {
    CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                    "scalable vectors are not supported");
    size_t count = type->getVectorNumElements();

    std::vector<ContextValue> result;
    result.reserve(count);

    auto inner = llvm::UndefValue::get(type->getVectorElementType());

    for (size_t i = 0; i < count; ++i)
      result.push_back(evaluate_undef(inner));

    return ContextValue(std::move(result));
  } else {
    return ContextValue(Undef::Create(Type::from_llvm(type)));
  }
}
ContextValue Context::evaluate_vector(llvm::ConstantVector* vec) {
  auto type = vec->getType();

  CAFFEINE_ASSERT(!type->getVectorIsScalable(),
                  "scalable vectors are not supported");

  size_t count = type->getVectorNumElements();
  std::vector<ContextValue> result;
  result.reserve(count);

  for (size_t i = 0; i < count; ++i)
    result.push_back(evaluate_constant(vec->getOperand(i)));

  return ContextValue(std::move(result));
}
// Note: This method should always return a pointer. (At least I think that's
//       how LLVM globals work)
ContextValue Context::evaluate_global(llvm::GlobalVariable* global) {
  auto it = globals_.find(global);
  if (it != globals_.end())
    return it->second;

  CAFFEINE_ASSERT(global->hasInitializer(),
                  "tried to evaluate global with no initializer");

  auto data = evaluate_global_data(global->getInitializer());
  const auto& array = llvm::cast<ConstantArray>(*data);

  const llvm::DataLayout& layout = module_->getDataLayout();
  unsigned bitwidth = layout.getPointerSizeInBits();
  unsigned alignment = global->getAlignment();

  auto alloc = heap_.allocate(
      ConstantInt::Create(llvm::APInt(bitwidth, array.data().size())),
      ConstantInt::Create(llvm::APInt(bitwidth, alignment)), data, *this);

  auto pointer = ContextValue(
      Pointer(alloc, ConstantInt::Create(llvm::APInt(bitwidth, 0))));

  globals_.emplace(global, pointer);

  return pointer;
}

ref<Operation> Context::evaluate_global_data(llvm::Constant* constant) {
  if (auto* data = llvm::dyn_cast<llvm::ConstantDataSequential>(constant)) {
    auto raw = data->getRawDataValues();
    auto idxty = Type::int_ty(module_->getDataLayout().getPointerSizeInBits());

    return ConstantArray::Create(idxty, SharedArray(raw.data(), raw.size()));
  }

  std::string s = "Unsupported global value initializer: ";
  llvm::raw_string_ostream os(s);
  constant->print(os, true);
  os.flush();

  CAFFEINE_UNIMPLEMENTED(s);
}

} // namespace caffeine

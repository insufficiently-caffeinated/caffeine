#include "caffeine/IR/OperationData.h"
#include "caffeine/IR/OperationBase.h"
#include "caffeine/IR/Symbol.h"
#include "caffeine/IR/Type.h"
#include <boost/config.hpp>
#include <llvm/IR/Function.h>
#include <memory>

// #include "caffeine/IR/Operation.h"

namespace caffeine {

OperationData::OperationData()
    : type_(Type::void_ty()), opcode_(Opcode::Invalid) {}
OperationData::OperationData(Opcode op, Type t) : type_(t), opcode_(op) {}

std::string_view OperationData::opcode_name() const {
  return opcode_name(opcode());
}
std::string_view OperationData::opcode_name(Opcode op) {
  return Operation::opcode_name(op);
}

bool OperationData::operator==(const OperationData& op) const {
  if (type_ != op.type_ || opcode_ != op.opcode_)
    return false;

  if (auto data = llvm::dyn_cast<ConstantData>(this))
    return data->symbol() == llvm::cast<ConstantData>(op).symbol();
  if (auto data = llvm::dyn_cast<ConstantIntData>(this))
    return data->value() == llvm::cast<ConstantIntData>(op).value();
  if (auto data = llvm::dyn_cast<ConstantFloatData>(this))
    return data->value() == llvm::cast<ConstantFloatData>(op).value();
  if (auto data = llvm::dyn_cast<FunctionObjectData>(this))
    return data->function() == llvm::cast<FunctionObjectData>(op).function();

#if !defined(BOOST_NO_RTTI)
  // If this assertion triggers then you have added a new derived class for
  // OperationData without adding the corresponding equality check to this
  // method.
  CAFFEINE_ASSERT(typeid(*this) == typeid(OperationData));
#endif

  return true;
}
bool OperationData::operator!=(const OperationData& op) const {
  return !(*this == op);
}

std::unique_ptr<OperationData> OperationData::clone() const {
  if (auto data = llvm::dyn_cast<ConstantData>(this))
    return std::make_unique<ConstantData>(data->type(), data->symbol());
  if (auto data = llvm::dyn_cast<ConstantIntData>(this))
    return std::make_unique<ConstantIntData>(data->value());
  if (auto data = llvm::dyn_cast<ConstantFloatData>(this))
    return std::make_unique<ConstantFloatData>(data->value());
  if (auto data = llvm::dyn_cast<FunctionObjectData>(this))
    return std::make_unique<FunctionObjectData>(data->function());

#if !defined(BOOST_NO_RTTI)
  // If this assertion triggers then you have added a new derived class for
  // OperationData without adding the corresponding clone implementation to this
  // method.
  CAFFEINE_ASSERT(typeid(*this) == typeid(OperationData));
#endif

  return std::make_unique<OperationData>(opcode(), type());
}

ConstantData::ConstantData(Type t, const Symbol& symbol)
    : OperationData(([&] {
                      if (t.is_array())
                        return Opcode::ConstantArray;
                      if (symbol.is_named())
                        return Opcode::ConstantNamed;
                      return Opcode::ConstantNumbered;
                    })(),
                    t),
      symbol_(symbol) {}

ConstantIntData::ConstantIntData(const llvm::APInt& val)
    : OperationData(Opcode::ConstantInt, Type::type_of(val)), value_(val) {}
ConstantIntData::ConstantIntData(llvm::APInt&& val)
    : OperationData(Opcode::ConstantInt, Type::type_of(val)),
      value_(std::move(val)) {}

ConstantFloatData::ConstantFloatData(const llvm::APFloat& val)
    : OperationData(Opcode::ConstantFloat, Type::type_of(val)), value_(val) {}
ConstantFloatData::ConstantFloatData(llvm::APFloat&& val)
    : OperationData(Opcode::ConstantFloat, Type::type_of(val)),
      value_(std::move(val)) {}

FunctionObjectData::FunctionObjectData(llvm::Function* func)
    : OperationData(Opcode::FunctionObject, Type::from_llvm(func->getType())),
      func_(func) {}

llvm::hash_code hash_value(const OperationData& op) {
  return llvm::hash_combine(op.hash(), op.type(), op.opcode());
}

using llvm::hash_value;

llvm::hash_code ConstantData::hash() const {
  return hash_value(symbol_);
}

llvm::hash_code ConstantIntData::hash() const {
  return hash_value(value_);
}

llvm::hash_code ConstantFloatData::hash() const {
  return hash_value(value_);
}

llvm::hash_code FunctionObjectData::hash() const {
  return hash_value(func_);
}

llvm::hash_code EGraphNodeData::hash() const {
  return hash_value(id_);
}

} // namespace caffeine

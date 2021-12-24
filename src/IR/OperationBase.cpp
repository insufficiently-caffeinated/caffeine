#include "caffeine/IR/OperationBase.h"
#include "caffeine/IR/Operation.h"
#include <llvm/IR/Function.h>

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
  return true;
}
bool OperationData::operator!=(const OperationData& op) const {
  return !(*this == op);
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

} // namespace caffeine

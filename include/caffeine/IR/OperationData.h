#pragma once

#include "caffeine/IR/OperationBase.h"

namespace caffeine {

/**
 * @brief OperationData for symbolic constants.
 */
class ConstantData : public OperationData {
public:
  ConstantData(Type t, const Symbol& symbol);

  const Symbol& symbol() const {
    return symbol_;
  }

  static bool classof(const OperationData* op) {
    return op->opcode() == Opcode::ConstantNamed ||
           op->opcode() == Opcode::ConstantNumbered ||
           op->opcode() == Opcode::ConstantArray;
  }

  llvm::hash_code hash() const override;

private:
  Symbol symbol_;
};

class ConstantIntData : public OperationData {
public:
  ConstantIntData(const llvm::APInt& val);
  ConstantIntData(llvm::APInt&& val);

  const llvm::APInt& value() const {
    return value_;
  }

  static bool classof(const OperationData* op) {
    return op->opcode() == Opcode::ConstantInt;
  }

  llvm::hash_code hash() const override;

private:
  llvm::APInt value_;
};

class ConstantFloatData : public OperationData {
public:
  ConstantFloatData(const llvm::APFloat& val);
  ConstantFloatData(llvm::APFloat&& val);

  const llvm::APFloat& value() const {
    return value_;
  }

  static bool classof(const OperationData* op) {
    return op->opcode() == Opcode::ConstantFloat;
  }

  llvm::hash_code hash() const override;

private:
  llvm::APFloat value_;
};

class FunctionObjectData : public OperationData {
public:
  FunctionObjectData(llvm::Function* func);

  llvm::Function* function() const {
    return func_;
  }

  static bool classof(const OperationData* op) {
    return op->opcode() == Opcode::FunctionObject;
  }

  llvm::hash_code hash() const override;

private:
  llvm::Function* func_;
};

class EGraphNodeData : public OperationData {
public:
  EGraphNodeData(Type t, size_t id);

  size_t id() const {
    return id_;
  }

  static bool classof(const OperationData* op) {
    return op->opcode() == Opcode::EGraphNode;
  }

  llvm::hash_code hash() const override;

private:
  size_t id_;
};

} // namespace caffeine

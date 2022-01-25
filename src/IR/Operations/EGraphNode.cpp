#include "../Operation.h"
#include "caffeine/IR/Operation.h"
#include "caffeine/IR/OperationData.h"

namespace caffeine {

EGraphNode::EGraphNode(Type t, size_t id)
    : Operation(std::make_unique<EGraphNodeData>(t, id)) {}

size_t EGraphNode::id() const {
  return llvm::cast<EGraphNodeData>(data_.get())->id();
}

OpRef EGraphNode::Create(Type t, size_t id) {
  return constant_fold(EGraphNode(t, id));
}

} // namespace caffeine

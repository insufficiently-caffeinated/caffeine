#pragma once

#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/Value.h"
#include "caffeine/IR/Visitor.h"

namespace caffeine {

class Model;

class ModelEvaluator : public ConstOpVisitor<ModelEvaluator, Value> {
private:
  const Model* model;
  const EGraph* egraph;

public:
  ModelEvaluator(const Model* model, const EGraph* egraph);

  Value visitOperation(const Operation& O);

#define HANDLE_OPCLASS(opname, opclass) Value visit##opname(const opclass& O);
#include "caffeine/IR/Operation.def"
};

} // namespace caffeine

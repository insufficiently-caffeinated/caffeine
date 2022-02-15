#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/OperationData.h"
#include <optional>
#include <queue>
#include <type_traits>

namespace caffeine {

class EGraphConstantPropagator {
public:
  EGraphConstantPropagator(EGraph* egraph) : egraph(egraph) {}

  void visit(size_t id) {
    if (id != egraph->find(id))
      return;

    if (constants.contains(id))
      return;

    EClass& eclass = *egraph->get(id);

    for (ENode& node : eclass.nodes) {
      if (auto merged = tryFoldNode(node)) {
        id = egraph->merge(*merged, id);
        constants.insert(id);
        egraph->worklist.push_back(id);
        break;
      }
    }
  }

private:
  std::optional<size_t> tryFoldNode(const ENode& node) {
#define INT_FOLD(expr)                                                         \
  return foldIntOp(node,                                                       \
                   [&](llvm::ArrayRef<llvm::APInt> args) { return (expr); })
#define BOOL_FOLD(expr)                                                        \
  return foldBoolOp(node,                                                      \
                    [&](llvm::ArrayRef<llvm::APInt> args) { return (expr); })

    // clang-format off
    switch (node.data->opcode()) {
      case Operation::Add:  INT_FOLD(args[0] + args[1]);
      case Operation::Sub:  INT_FOLD(args[0] - args[1]);
      case Operation::Mul:  INT_FOLD(args[0] * args[1]);
      case Operation::UDiv: INT_FOLD(args[1] == 0 ? args[0].udiv(args[1]) : args[1]);
      case Operation::SDiv: INT_FOLD(args[1] == 0 ? args[0].sdiv(args[1]) : args[1]);
      case Operation::URem: INT_FOLD(args[1] == 0 ? args[0].urem(args[1]) : args[1]);
      case Operation::SRem: INT_FOLD(args[1] == 0 ? args[0].srem(args[1]) : args[1]);

      case Operation::And:  INT_FOLD(args[0] & args[1]);
      case Operation::Or:   INT_FOLD(args[0] | args[1]);
      case Operation::Xor:  INT_FOLD(args[0] ^ args[1]);
      case Operation::Shl:  INT_FOLD(args[0].shl(args[1]));
      case Operation::LShr: INT_FOLD(args[0].lshr(args[1]));
      case Operation::AShr: INT_FOLD(args[0].ashr(args[1]));

      case Operation::ICmpEq:  BOOL_FOLD(args[0] == args[1]);
      case Operation::ICmpNe:  BOOL_FOLD(args[0] != args[1]);
      case Operation::ICmpUgt: BOOL_FOLD(args[0].ugt(args[1]));
      case Operation::ICmpUge: BOOL_FOLD(args[0].uge(args[1]));
      case Operation::ICmpUlt: BOOL_FOLD(args[0].ult(args[1]));
      case Operation::ICmpUle: BOOL_FOLD(args[0].ule(args[1]));
      case Operation::ICmpSgt: BOOL_FOLD(args[0].sgt(args[1]));
      case Operation::ICmpSge: BOOL_FOLD(args[0].sge(args[1]));
      case Operation::ICmpSlt: BOOL_FOLD(args[0].slt(args[1]));
      case Operation::ICmpSle: BOOL_FOLD(args[0].sle(args[1]));

      case Operation::Not:   INT_FOLD(~args[0]);
      
      case Operation::ZExt:  INT_FOLD(args[0].zext(node.type().bitwidth()));
      case Operation::SExt:  INT_FOLD(args[0].sext(node.type().bitwidth()));
      case Operation::Trunc: INT_FOLD(args[0].trunc(node.type().bitwidth()));
      // clang-format on

    default:
      return std::nullopt;
    }
  }
  std::optional<size_t> foldSelect(const ENode& node) {
    if (!constants.contains(egraph->find(node.operands[0])))
      return std::nullopt;

    bool value = llvm::cast<ConstantIntData>(
                     egraph->get(node.operands[0])->nodes.at(0).data.get())
                     ->value()
                     .getBoolValue();
    return value ? node.operands[1] : node.operands[2];
  }

  template <typename F>
  std::optional<size_t> foldIntOp(const ENode& node, F&& func) {
    std::optional<llvm::APInt> folded = tryFoldConstIntOperands(node, func);
    if (!folded)
      return std::nullopt;

    return egraph->add(ENode{std::make_shared<ConstantIntData>(*folded)});
  }
  template <typename F>
  std::optional<size_t> foldBoolOp(const ENode& node, F&& func) {
    std::optional<bool> folded = tryFoldConstIntOperands(node, func);
    if (!folded)
      return std::nullopt;

    return egraph->add(ENode{
        std::make_shared<ConstantIntData>(llvm::APInt(1, (uint64_t)*folded))});
  }

  template <typename F, typename R = std::decay_t<decltype(std::declval<F>()(
                            std::declval<llvm::ArrayRef<llvm::APInt>>()))>>
  std::optional<R> tryFoldConstIntOperands(const ENode& node, F&& func) {
    bool operands_are_constant = std::all_of(
        node.operands.begin(), node.operands.end(), [&](size_t operand) {
          return constants.contains(egraph->find(operand));
        });

    if (!operands_are_constant)
      return std::nullopt;

    llvm::SmallVector<llvm::APInt> operands;
    operands.reserve(node.operands.size());

    for (size_t opid : node.operands) {
      EClass* operand = egraph->get(opid);

      CAFFEINE_ASSERT(operand);
      CAFFEINE_ASSERT(operand->is_constant());

      operands.push_back(
          llvm::cast<ConstantIntData>(operand->nodes.at(0).data.get())
              ->value());
    }

    return func(operands);
  }

public:
  EGraph* egraph;
  tsl::hopscotch_set<size_t> constants;
};

void EGraph::constprop() {
  EGraphConstantPropagator propagator{this};
  std::queue<size_t> queue;

  for (auto it = classes.begin(); it != classes.end(); ++it) {
    auto& [id, eclass] = *it;

    if (eclass.is_constant()) {
      propagator.constants.insert(id);
    } else {
      queue.push(id);
    }
  }

  while (!queue.empty()) {
    size_t id = queue.front();
    queue.pop();

    propagator.visit(id);
  }
}

} // namespace caffeine

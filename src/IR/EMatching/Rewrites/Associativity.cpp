#include "caffeine/IR/EGraph.h"
#include "caffeine/IR/EGraphMatching.h"
#include "caffeine/IR/EMatching/Filters.h"
#include "caffeine/IR/OperationData.h"
#include <caffeine/IR/OperationBase.h>
#include <fmt/format.h>
#include <fmt/ranges.h>
#include <tsl/hopscotch_set.h>

namespace caffeine::ematching::reductions {

namespace {
  struct AssociativityRewriter {
    struct MatchItem {
      size_t eclass;
      size_t enode;
    };

    GraphAccessor* egraph;
    size_t clause;
    Operation::Opcode opcode;
    size_t original;

    std::vector<size_t> stack = {};

    void rewrite(size_t eclass_id) {
      const EClass* eclass = egraph->get(eclass_id);
      const ENode& enode = eclass->nodes[eclass->cache.cost->index];

      if (enode.opcode() == opcode) {
        rewrite(enode.operands[0]);
        rewrite(enode.operands[1]);
      } else {
        stack.push_back(eclass_id);
      }
    }
    void rewrite(const MatchItem& item) {
      EGraphExtractor extractor{egraph->graph()};
      extractor.update_cost(item.eclass);

      const EClass* eclass = egraph->get(item.eclass);
      const ENode& enode = eclass->nodes[item.enode];

      rewrite(enode.operands[0]);
      rewrite(enode.operands[1]);
      emit();
    }

    void emit() {
      auto items = stack;
      std::sort(items.begin(), items.end(),
                [&](size_t a, size_t b) { return compare(a, b); });

      size_t eclass = items.front();
      auto data =
          std::make_shared<OperationData>(opcode, egraph->get(eclass)->type());

      for (size_t i = 1; i < items.size(); ++i) {
        eclass = egraph->add(ENode{data, {eclass, items[i]}});
      }

      egraph->merge(original, eclass);
    }

    bool compare(size_t a, size_t b) {
      const EClass* aclass = egraph->get(a);
      const EClass* bclass = egraph->get(b);

      // We want to group all the constants together
      if (aclass->is_constant() ^ bclass->is_constant())
        return aclass->is_constant();

      // After that just try and group equivalent e-classes together
      return a < b;
    }
  };
} // namespace

void associativity(EMatcherBuilder& builder, Operation::Opcode opcode) {
  size_t clause = builder.add_clause(opcode);

  builder.add_matcher(
      clause, [=](GraphAccessor& egraph, size_t eclass_id, size_t enode_id) {
        AssociativityRewriter r{&egraph, clause, opcode, eclass_id};
        r.rewrite({eclass_id, enode_id});
      });
}
void associativity(EMatcherBuilder& builder) {
  Operation::Opcode valid[] = {Operation::Add,  Operation::Mul, Operation::And,
                               Operation::Or,   Operation::Xor, Operation::FAdd,
                               Operation::FSub, Operation::FMul};

  for (auto opcode : valid)
    associativity(builder, opcode);
}

} // namespace caffeine::ematching::reductions

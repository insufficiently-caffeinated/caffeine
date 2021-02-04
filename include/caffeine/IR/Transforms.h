#pragma once

/**
 * This header is meant to contain a number of transforms which can be used as
 * needed.
 *
 * Most of the time they will probably be used by various types of solvers but
 * since they're common functionality it is useful to have them all in one
 * place.
 *
 * To avoid polluting the caffeine namespace unnecessarily I've placed them
 * within the caffeine::transforms namespace.
 *
 * General Notes on Writing a Transform
 * ====================================
 * In some cases it is correct to perform an in-place substitution of an
 * expression node. For example, doing something like
 *     *expr = *UnaryOp::CreateNot(other_expr))
 * is only valid under certain conditions. In all other cases you need to
 * rebuild the expression tree with the replaced node.
 *
 * The required conditions for an in-place transform to be valid are:
 * 1. The transform can only use semantics local to the expression node being
 *    transformed. As an example, replacing not(not(x)) with x is fine, but
 *    taking an external x = true and using that to replace not(not(x)) in-place
 *    with true is not.
 * 2. The expression node is not being shared across threads. This is due to
 *    thread-safety concerns but is generally not something the internal
 *    implementation of a transform algorithm should have to worry about.
 */

#include <vector>

namespace caffeine {
class Assertion;
}

namespace caffeine::transforms {

/**
 * Attempts to break down large and complex assertions into multiple simpler
 * assertions that are equivalent to the larger one.
 */
void decompose(std::vector<Assertion>& assertions);

} // namespace caffeine::transforms

#ifndef CAFFEINE_INTERFACE_H
#define CAFFEINE_INTERFACE_H

#pragma once

#include <stdbool.h>

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Assert that the condition is true.
 *
 * In cases where the symbolic executor determines that the
 * condition could be false, it will produce a test case with
 * concrete inputs which reproduce the failure.
 */
void caffeine_assert(bool cond);

/**
 * Assume that a condition is true.
 *
 * This will silently remove any executions in which the condition
 * could evaluate to false.
 */
void caffeine_assume(bool cond);

#ifdef __cplusplus
}
#endif

#endif

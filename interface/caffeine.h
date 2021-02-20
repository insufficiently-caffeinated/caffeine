#ifndef CAFFEINE_INTERFACE_H
#define CAFFEINE_INTERFACE_H

#pragma once

#include <stdbool.h>
#include <stddef.h>

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

/**
 * Make size bytes pointed to by mem into symbolic memory. The resulting
 * symbolic values will be associated with the provided name.
 *
 * The name must not be symbolic. mem should be valid for a write of size or
 * else a failure will be generated.
 */
void caffeine_make_symbolic(void* mem, size_t size, const char* name);

#ifdef __cplusplus
}
#endif

#endif

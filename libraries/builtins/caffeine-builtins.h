#pragma once

#include "caffeine.h"

#include <stdlib.h>

/**
 * Non-public builtin functions implemented by caffeine. Any such builtin
 * functions should be put under the caffeine_builtin_XXX namespace.
 *
 * There are some exceptions for functions that were written before this
 * reorganization occurred.
 */

/***************************************************
 * Memory Allocation Functions                     *
 ***************************************************/

void* caffeine_calloc(size_t size);
// This is a version of malloc that allows users to specify alignment. It expects
// size != 0 && alignment % 2 == 0 && alignment % sizeof(void *) == 0
void* caffeine_malloc_aligned(size_t size, size_t alignment);

// This is a more limited version of free that expects mem != nullptr
void caffeine_free(void* mem);

// This creates an allocation with symbolic value and given size and associates
// it with the provided name
void* caffeine_builtin_symbolic_alloca(size_t size, const char* name);

/***************************************************
 * Pointer Functions                               *
 ***************************************************/

// Validate that mem is valid for a read/write of size and resolve the pointer
// to all of its possible allocations.
//
// If you're going to perform a lot of reads or writes through a pointer then
// this is probably something you'll want to do.
void* caffeine_builtin_resolve(void* mem, size_t size);

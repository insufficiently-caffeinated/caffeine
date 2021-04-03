# Intrinsics within caffeine

This document is meant to serve as documentation for the variety of intrinsic
functions that caffeine defines as well as what they do.

# Public Functions
These are functions that are expected to remain the same throughout caffeine
development. (Note that for now, as we are in active development, these may
still end up changing as we go).

## `caffeine_assume`
```c
void caffeine_assume(bool cond);
```
Assert a fact to the solver during symbolic execution. This guarantees that
`cond` (any anything implied by `cond`) will always be true for the rest of
the execution of this branch.

This is useful for constraining what types of test failures you want to check.
As an example, suppose we have a function `myfunc` that we want to verify is
valid when passed inputs in the range of 0 to 1024. Then that could be done
like this
```c
#include <stdint.h>

void myfunc(uint32_t x);

int main(int argc, char** argv) {
  uint32_t x;
  caffeine_make_symbolic(&x, sizeof(x), "x");

  // Only consider cases where x is less than 1024. Without this, we would
  // be checking myfunc with any possible value of x.
  caffeine_assume(x < 1024);

  myfunc(x);
}
```

At the top-level, it is possible to get the same behaviour as `caffeine_assume`
by using `if` statements to return immediately. i.e.
```c
if (x < 1024)
  return 0;
```
however, this becomes more unwieldy the farther you go down the call stack.

> ### Extra Note
> Calling `caffeine_assume` with `false` will stop the branch from executing any
> further.
>
> As an example, the code below will succeed with no errors:
> ```c
> uint32_t x;
> caffeine_make_symbolic(&x, sizeof(x), "x");
> 
> caffeine_assume(false); // Comment this out and the test fails
> caffeine_assert(false);
> ```

## `caffeine_assert`
**TODO**

## `caffeine_make_symbolic`
**TODO**

# Standard C Intrinsics
There are a number of functions present in the C library that caffeine treats as
intrinsics. Unless otherwise noted here, these are meant to have the same
behaviour as they would during normal program execution.

**TODO**

# Internal Functions
These are intrinsics that are defined and used internally by the caffeine
interpreter. They are subject to change at any time but are documented here for
reference. Many of these may have names that are not possible to call from C and
are instead meant to be used only from LLVM IR.

> ### Naming Conventions
> When there are multiple possible method definitions the naming convention
> is specified similar to LLVM's naming convention for intrinsic functions.

## `caffeine.resolve.*`
```llvm
declare i8* @caffeine.resolve.p0i8.i64(i8* %ptr, i64 %len)
```
This instructs the interpreter that we are going to be reading or writing to `%len`
bytes starting at `%ptr`. This allows memory accesses using the returned pointer to
be performed more efficiently since they can avoid having to query the underlying
SMT solver if constant folding works fully.

Semantically, this function will always return `%ptr`. However, if the pointer does
not point to a valid area then the entire path through the program will behave as if
there was an invalid pointer access.

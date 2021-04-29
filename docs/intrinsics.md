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
```c
void caffeine_assert(bool cond);
```

Verify a fact using the solver and emit a test case failure if one can be found
that fails the assertion. This is for checking facts that the program wants to
verify to be true.

This can be used to verify any property of the program that can be written as an
assertion on the program variables. As an example, suppose we want to verify that
the following two methods are equivalent:
```c
#include <stdint.h>

uint32_t mul2_a(uint32_t x) {
  return x << 1;
}

uint32_t mul2_b(uint32_t x) {
  if (x == 0xFFAAFF)
    return 5;
  return x + x;
}
```
Then we could do that with the following test harness
```c
uint32_t x;
caffeine_make_symbolic(&x, sizeof(x), "x");
caffeine_assert(mul2_a(x) == mul2_b(x));
```
and caffeine will try to find a value of `x` which causes the assertion to fail.
In this case, it immediately finds that `x = 0xFFAAFF` causes the test case to
and reports that back to us
```
Found assertion failure:
  x = "\xFF\xAA\xFF\0"
```

> ### Extra Note
> You can use `caffeine_assert(false)` to assert that a code path never occurs.
> As an example, if we wanted to verify that some C++ code never throws any
> exceptions then we could do
> ```cpp
> try {
>   ...
> } catch (...) {
>   caffeine_assert(false);
> }
> ```
> Then, if any code path throws an exception that reaches the top level then
> caffeine will generate the values of the inputs that correspond to that code
> path.

## `caffeine_make_symbolic`
```c
void caffeine_make_symbolic(void* mem, size_t size, const char* name);
```
Change `size` bytes pointed to by `mem` to be symbolic. The resulting symbolic
value will have name `name`. This is the only way to create symbolic values.
Note that `name` must not be symbolic. `mem` should be valid for a write of
`size` bytes or else an assertion failure will be generated. 

# Standard C Intrinsics
There are a number of functions present in the C library that caffeine treats as
intrinsics. Unless otherwise noted here, these are meant to have the same
behaviour as they would during normal program execution.

Here is an incomplete list:
- `malloc`
- `free`
- `calloc`

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
SMT solver if constant folding manages to fully simplify the request.

Semantically, this function will always return `%ptr`. However, if the pointer does
not point to a valid area then the entire path through the program will behave as if
there was an invalid pointer access.

# Caffeine - Prototype Symbolic Execution Engine

Caffeine is a [symbolic execution engine](https://en.wikipedia.org/wiki/Symbolic_execution)
that interprets LLVM IR. Caffeine currently supports `C` and `C++` (if no exceptions are
thrown, see [#458](https://github.com/insufficiently-caffeinated/caffeine/issues/458)).
In general, Caffeine can support any language that compiles down to LLVM IR provided
that the resulting IR does not use unimplemented functions or instructions.

# What does it do?
In short, caffeine will take an input program and try to find inputs that would
cause the program to fail an assertion or execute undefined behaviour. It does
this by building a model of your program and going backwards to find the inputs
that cause undefined behaviour or assertion failures. On its own, caffeine can
check for
- invalid pointer accesses
- divisions by zero
- null pointer dereferences
- and invalid control flow (e.g. setjmp/longjmp for C)

Beyond that, custom assertions can be used to do property based testing on
arbitrary code. By default, it doesn't check for other types of undefined
behaviour however ubsan can be used to add such checks to the program being
tested.

Caffeine works on LLVM IR and can be used to execute any code that can be
compiled down to LLVM IR. The big languages here are C, C++, and Rust, but
any other language that has an LLVM frontend can be made to work. Note,
however, that caffeine does not support all LLVM intrinsics so programs that
make use of them (lots of rust code, some C and C++ code) may not be able to
be executed by caffeine.

# Example
Suppose we would like to validate that the following two ways to count the
number of bits set within an integer. Both of these are taken from
[bit twiddling hacks](https://graphics.stanford.edu/~seander/bithacks.html)
but the fast version has been modified so that it's wrong for one specific
value.
```C
uint32_t bitcount_naive(uint32_t x) {
  uint32_t cnt = 0;
  for (; x != 0; x >>= 1)
    cnt += x & 1;
  return cnt;
}

uint32_t bitcount_fast(uint32_t v) {
  v = v - ((v >> 1) & 0x55555555);
  v = (v & 0x33333333) + ((v >> 2) & 0x33333333);
  v = ((v + (v >> 4) & 0xF0F0F0F) * 0x1010101) >> 24;
  return v & 31;
}
```

In order to test this, we need to write a test harness. In order to do this we
need two functions provided by caffeine: `caffeine_make_symbolic` and
`caffeine_assert`. `caffeine_make_symbolic` fills a memory location with
symbolic bytes of memory. Semantically this replaces it with one possible bit
pattern. `caffeine_assert` is used to validate that a condition is true, if its
argument could possibly evaluate to false then caffeine will print out a test
case to the terminal.

Together, we can use these two functions to write a test harness that will
check that `bitcount_naive` and `bitcount_fast` always return the same value.
```C
int main(int argc, char** argv) {
  uint32_t x;
  caffeine_make_symbolic(&x, sizeof(x), "x");

  caffeine_assert(bitcount_naive(x) == bitcount_fast(x));
}
```

We can then compile this down to bitcode (the full test file is available in
[`bench/bitcount.c`](bench/bitcount.c)), making sure to link in the code used
for the caffeine builtins, and then run it through caffeine.
```
$ clang-13 bench/bitcount.c -Iinterface -g -O3 -emit-llvm -o bitcount.bc
$ llvm-link-13 bitcount.bc bazel-bin/libraries/builtins.bc -o bitcount.bc
$ caffeine bitcount.c
Found assertion failure:
  x = "\xFF\xFF\xFF\xFF"
Backtrace:
 #0 main
    -> bench/bitcount.c:28:3
     | tail call void @caffeine_assert(i1 zeroext %13) #9, !dbg !1352
Reason:
  assertion failure
```

From this, caffeine finds that setting `x == 0xFFFFFFFFu` will cause the assertion
to fail. A deeper look will show that the final `v & 31` within `bitcount_fast`
means that when the bitcount is 32 it returns 0 instead.

# Building and Installing
As of yet, there are no binary releases of caffeine so it must be built and
installed from source. Note, however, that the build system is only tested on
linux so it may not work on other OSes (MacOS is a maybe, Windows most likely
not).

In order to build caffeine you will need the following
- A C++ compiler which supports C++17, and
- Bazel 5.0. See the [instructions here](https://bazel.build/install) on how
  to install bazel.

Once you have those you can build and install caffeine by running
```sh
bazel run -c opt //:install -- --destdir=<path/to/some/dir>
```
which will build and install caffeine and all its dependencies to the specified
directory. Note that this has to build LLVM so it will take a while. If you're
trying to install caffeine globally then passing `--destdir=/usr/local` will
work provided the command is invoked with admin priviledges.

## Running Caffeine
Once caffeine is installed, it will be available under `<prefix>/bin/caffeine`.
See `caffeine --help` to get started. There are also some examples provided
under the `bench` directory that can be built via bazel. For instance:
```sh
caffeine bazel-bin/bench/bench-maze.ll
```

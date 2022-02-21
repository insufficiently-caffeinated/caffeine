# Performance Optimization Within Caffeine

The performance situation of a symbolic execution engine such as caffeine is
somewhat different than the usual type of software that needs to be optimized.
Caffeine effectively has two different modes of operation:
1. (Almost) everything is constant-folded and all the CPU time is spent on
   building and constant-folding expressions.
2. A symbolic constant shows up at the bottom of one of the expressions and
   we continue to make larger and larger calls to the solver.

The first case, while it may not be particularly well optimized, is vastly
faster than the second one. Expression building and processing usually runs
on the time scale of microseconds to milliseconds whereas solver calls can
easily take seconds to hours depending on how complicated they get. There are
some exceptions to this: slow algorithms within expression creation and
simplification can explode but those are usually easily solvable.

> ### Note:
> Currently caffeine only uses Z3 as its solver. I'll only be talking about
> Z3's performance characteristics and how that affects caffeine. Other solvers
> will most likely behave in a somewhat similar way but that may not be the
> case.

## Path Conditions
At its core, caffeine interprets the program and builds a _path condition_ for
each path through the program. This is a collection of assertions that reflect
the conditions that would be required to reach the current instruction in the
program via the path we've been following.

> As an example, suppose our program contains
> ```c
> if (x == 5)
>   do_a(); // (1)
> else
>   do_b(); // (2)
> do_c(); // (3)
> ```
> At `(1)`, the path condition will assert `x == 5` and at `(2)` it will assert
> `!(x == 5)`. At `(3)` we will have two different paths, one which asserts
> `x == 5` and went through `(1)` and one which asserts `!(x == 5)` and went
> through `(2)`.

For a simple program the path condition will remain pretty simple since it just
won't run enough operations for the path condition to get fairly large. However,
as programs get larger the path condition blows up in two different ways:
1. As the program passes more and more conditional branches the number of
   assertions within the path condition increase.
2. As the program does more computation the expressions that make up these
   assertions get larger and larger.

This means that we both hand off more assertions to Z3 and that those
assertions end up containing more and more expressions. SAT solving is NP-HARD
and SMT solving is even harder (although most of what we do can be done as a
SAT problem, symbolic arrays excepted). This means that our runtime increases
exponentially as the amount of work Z3 has to do increases.

## Implemented Optimizations
This section covers optimizations that have been implemented within caffeine:

- Reduce the set of assertions to only those needed to prove any new assertions.
  This optimization only applies when we don't need to extract values for the
  symbolic constants. In that case, we can remove any assertion that doesn't
  share any symbolic constants with those that are unproven. Most programs
  generally constraints involving control flow and constraints that are needed
  to resolve pointers to allocations. These two are generally disjoint so this
  optimization can be quite effective.

- Simplifying expressions. Beyond constant folding there are a lot of possible
  simplifications that can result in Z3 queries taking less time.

## Potential Optimizations

- A fast path for resolving pointers. Lots of expressions for pointers end up
  having the form `a + c` where `a` is symbolic constant and `c` is a constant
  integer. In that case, we can quickly find the relevant allocation by just
  looking for ones whose address is $a$ and then checking whether an offset of
  `c` is within the allocation.

- Query caching. Different paths of execution can make result in making the
  same query. We should be able to reuse results of these queries in such a
  case. 

# Notes on Profiling

When trying to do profiling I've found it to be rather difficult to get to the
point where profiling actually gives useful call stacks. This document is meant
to record these options for the next time I need to do some profiling.

These steps are only verified to work on Ubuntu 20.04.

## Initial Setup
I've found that clang does not seem to emit debug information in a way that perf
is able to consume (not sure why). However, GCC works fine. So to configure
we'll do
```sh
CC=gcc CXX=g++ cmake <project dir> \
  '-DCMAKE_CXX_FLAGS=-g -gdwarf' \
  -DCMAKE_BUILD_TYPE=Release
make -j$(nproc)
```

## Recording
```sh
perf record --call-graph dwarf,16384 -F 100 ./caffeine bench/bench-maze.ll main -t 1
```
The call stacks that perf ends up recording can end up being rather large. If
you see `[unknown]` showing up in the stack trace try re-running perf with a
larger record size than `16384`.

## Flamegraphs
I prefer to view profiling results using flamegraphs. You can get the tools for
these from either [Brendan Gregg's site][0] or by using [inferno][1] which is a
rust port of the flamegraph tools. I'll be using inferno here since it's faster.

In the same directory as the `perf.out` data from the last step run
```sh
perf script | inferno-collapse-perf | inferno-flamegraph > flamegraph.svg
```
and then open `flamegraph.svg` with a browser of your choice:
```sh
firefox flamegraph.svg
```



[0]: http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
[1]: https://github.com/jonhoo/inferno

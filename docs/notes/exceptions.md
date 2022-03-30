# Notes on implementing C++ support in Caffeine

*Also mirrored on [Misha's blog](https://mishazharov.com/posts/2-caffeine-exceptions/)*

## Introduction
Engineers at the University of Waterloo complete a capstone project before graduating. Engineers make teams,
and decide on a project that they're interested in. Our team (Insufficiently Caffeinated) is working on
[Caffeine](https://github.com/insufficiently-caffeinated/caffeine), a [symbolic execution](https://en.wikipedia.org/wiki/Symbolic_execution)
engine.

Caffeine interprets [LLVM](https://llvm.org/) IR with symbolic variables as opposed to concrete values. That means
that if we have a register named `%1`, its value would not necessarily be concrete (eg. `%1 = 5`), but might be a symbolic constant with some
constraints, like `%1 = x, x > 10`. This is useful because we can find bugs over the whole range of the program state[^1], and
essentially prove that there are no divisions by 0, no out of bounds memory accesses, etc[^3].

Initially, we had written enough of the interpreter to execute LLVM IR that corresponded to C style programs (mostly linear
control flow, only included the C standard library via [musl libc](https://musl.libc.org/)). This took about 6 months, so adding C++
support would probably take even less time, right?[^10]

## Quickly getting the STL

First thing's first. What are some of the biggest advantages of C++ over C? Classes and the standard library!
[RAII](https://en.wikipedia.org/wiki/Resource_acquisition_is_initialization) is a very handy tool to help programmers not leak resources,
and the standard library has many useful containers like hashmaps and vectors.

How do we get the standard library linked with Caffeine's input? Actually rather easily[^2]. We use [gllvm](https://github.com/SRI-CSL/gllvm)
to compile [libcxx](https://github.com/llvm/llvm-project/tree/main/libcxx) and
[libcxxabi](https://github.com/llvm/llvm-project/tree/main/libcxxabi)
to LLVM IR, and then just use [llvm-link](https://llvm.org/docs/CommandGuide/llvm-link.html) to link the input binary with all of the
standard libraries.

Awesome! Now we can run simple examples like this, without crashing:

```cpp
#include "caffeine.h"
#include <vector>

extern "C" void test(int x) {
  std::vector<int> vec;
  vec.push_back(x);
  caffeine_assert(vec.at(0) == x);
}
```

## Failing to throw exceptions

Ok that's neat. What about this?
```cpp
#include <vector>

extern "C" void test(int x) {
  try {
      throw 1;
  } catch (...) {
  }
}

```

```bash
==================== Test output for //test/run-pass:exception:
Aborted with message: external function '_Unwind_RaiseException' not implemented
  location: src/Interpreter/Interpreter.cpp:447
  function: visitExternFunc
...
```

Essentially, we tried to call an external function that wasn't implemented. From the error message, we can see
that we tried to call `_Unwind_RaiseException()`.

Well, let's figure out what `_Unwind_RaiseException()` is, and who implements it. This could still be a simple
case of compiling another library to LLVM IR and linking it in.

After a cursory glance, we see that this is gonna be a lot of work[^4]. It turns out `_Unwind_RaiseException()` is part of the
[Itanium C++ ABI](https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html). The Itanium ABI defines the "zero
cost exception handling" model which essentially means that when code is running on the happy path, no overhead is required
to support exceptions. Instead, this overhead is incurred when the exception is actually thrown.

The Itanium Exception Handling ABI works by parsing information about the callstack to figure out
which frame can catch the current exception being thrown. That sounds simple, but we can already see some
problems:
* Caffeine's callstack is just a vector, no addresses are associated with it. Essentially, our execution model
  prevents us from just pulling in an existing library to do this
* We're not really sure what information `_Unwind_RaiseException()` wants or cares about, so Caffeine's job here
  is unclear right now

Another thing to note is that `_Unwind_RaiseException()` is meant to be language agnostic. As a result, it's implemented
by an [unwinder](https://clang.llvm.org/docs/Toolchain.html#unwind-library) (of which there are many). But how does
a language agnostic unwinder know whether a stackframe can or can't handle an exception? A callback!

## A vague description of the personality function and the unwinder

A callback? That doesn't sound so bad. In our case, the callback is called a "personality function". In order to understand
why this is useful, we should first familiarize ourselves with how `_Unwind_RaiseException()` works (by reading the docs and digging
through real implementations).

`_Unwind_RaiseException()` first checks whether the given exception can be handled by any frame[^5]. This is done by iterating
over the callstack using [libunwind](https://www.nongnu.org/libunwind/docs.html)'s `unw_step()` function. The
[personality function](https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html#cxx-personality) is called for every stackframe,
and indicates to the unwinder whether the stackframe can catch that exception.

After `_Unwind_RaiseException()` is satisfied that some frame can catch the thrown exception, it proceeds to unwind the stack. This
happens in much the same way that it checks if the exception can be caught. `_Unwind_RaiseException()` iterates through
frames and calls the personality function on each frame, until it reaches the catching frame. If the frame cannot catch the exception,
the personality function is called with arguments that indicate that. If it is the catching frame, then the personality function
will set the appropriate state necessary to resume at the catching frame, and `_Unwind_RaiseException()` will use that state and
jump to the frame.

## Great, how do we implement this?

We're able to use the existing implementation of the `__cxa_*()` methods which are called when exceptions are thrown but we still need
to implement `_Unwind_RaiseException()` and the personality function[^6]. The implementation of `_Unwind_RaiseException()` is fairly
mechanical for Caffeine, so I'm going to skip discussing that.

Instead, it's critical to figure out how we're going to implement the personality function since it's not immediately obvious.
One of the first insights is that LLVM generates try/catch blocks as [`invoke`](https://llvm.org/docs/LangRef.html#invoke-instruction)
and [`landingpad`](https://llvm.org/docs/LangRef.html#landingpad-instruction) instructions
([see the LLVM docs](https://llvm.org/docs/ExceptionHandling.html)).

The `invoke` instruction is fairly easy to understand, it is used to call a function exactly like the `call` instruction, but it
has two return destinations --- a "normal" one, and "unwind" one. If the function call succeeds, the normal label is jumped to,
otherwise, the unwind one. The normal return label is nothing to call home about, so I won't discuss it further, the unwind label
is where all the fun is.

These unwind labels start with the aforementioned `landingpad` instructions. Essentially, LLVM[^7] encodes all the information about the
stack that would be used by libunwind in `landingpad` instructions. The `landingpad` has a list of exception types that it can catch[^9], and
a return type. For C++, the return type is an aggregate which contains a pointer to the thrown `_Unwind_Exception`[^8], and a
*selector value*.

The selector value is the last little mystery I needed to solve before implementing this stuff.
What is the selector value? Who decides what the actual value is?
The [docs](https://llvm.org/docs/ExceptionHandling.html#try-catch) say:

> When this clause is matched, the selector value will be equal to the value returned by "`@llvm.eh.typeid.for(i8* @ExcType)`".
> This will always be a positive value.

So that seems pretty clear, it has to match up with what `@llvm.eh.typeid.for()` returns. And what does `@llvm.eh.typeid.for()` return?
Again, the [docs](https://llvm.org/docs/ExceptionHandling.html#try-catch):

> This intrinsic returns the type info index in the exception table of the current function. This value can be used to compare
> against the result of `landingpad` instruction. The single argument is a reference to a type info.

This is also pretty clear, if you already know what it means. If not, let's break it down:
* The paragraph mentions "type info". It means [`std::type_info`](https://en.cppreference.com/w/cpp/types/type_info) (it's useful to
remember that `std::type_info`s are all generated by the compiler, and `@llvm.eh.typeid.for()` is all compiler internals territory).
This might also seem related to [`std::type_index`](https://en.cppreference.com/w/cpp/types/type_index) but as far as I can tell, it is not.
* We see a mention of an "index in the exception table". This is essentially telling us that we need to keep a mapping of every
`std::type_info` to a positive integer, and then return that.

Okay, that mystery is resolved. So when `__cxa_throw()` calls our implementation of `_Unwind_RaiseException()` do we have all the info
we need to unwind / die? Let's see:
* We have the `_Unwind_Exception *` that we're supposed to return to the `landinpad` since it's passed in as the only argument
* We can create the *selector value* in the function by looking up the `std::type_info *` in a map or array or something like that
* Wait where does the `std::type_info *` come from?

Turns out that the `std::type_info` pointer is a member of the `__cxa_exception` struct called `exceptionType`. Where is the `__cxa_exception`?
Actually the `_Unwind_Exception *` that we got is embedded at the end of a `__cxa_exception`. Since it's at the end, this pointer
arithmetic suffices (see [libcxxabi](https://github.com/llvm/llvm-project/blob/af9bdcfc46ef73179797ebd406ab413cd047a8c7/libcxxabi/src/cxa_personality.cpp#L923-L924)):
```cpp
  __cxa_exception* exception_header =
    (__cxa_exception*)(unwind_exception + 1) - 1;
```
where `unwind_exception` is our `_Unwind_Exception *` argument.

## Alright, from the top!

Great, we've got all of the foundational knowledge that we need to implement this. Let's run through what happens when an exception is thrown:
1. An exception is allocated with `__cxa_allocate_exception()`. It is populated with the exception data
1. `__cxa_throw()` is invoked with the allocated memory, a pointer to the `std::type_info`, and the exception destructor
1. `__cxa_throw()` does some book keeping with the exception state, then it calls `_Unwind_RaiseException()` (our job)
1. Caffeine checks if the exception is caught by any of the `landingpad`s (ignoring cleanup clauses). If not, we return and `__cxa_throw()` eventually
calls abort
1. Caffeine begins unwinding by giving control to `landingpad`s that need to clean stuff up or the `landingpad` that actually catches
the exception. We pop off stackframes as we go
1. When a `landingpad` gets "returned to" we populate its return value with the *selector value* and `_Unwind_Exception *`. The `landingpad`
instruction never actually needs to do anything, it's just a vessel for the unwinding information (in fact it never runs in Caffeine).
1. Some other C++ specific stuff happens with `__cxa_begin_catch()` and `__cxa_end_catch()` which we're not particularly concerned with

So we basically implemented all that, and now Caffeine supports C++ exception handling! The test suite is a bit sparse, and there may be subtle bugs
(the real personality function does quite a lot, and we only approximate it[^11]) but the basics are there. We can throw and catch exceptions in
Caffeine, albeit slowly. Overall, I'm happy that we implemented as much as we did, and got out of the stack unwinding quagmire in one piece :)

[^1]: Of course there are limitations since this is an NP-complete problem, but it works for "reasonable" input sizes

[^2]: Some trivial issues popped up like disabling standard output and pthread support for libcxx and libcxxabi, but
were taken care of quickly

[^3]: [KLEE](https://klee.github.io/) does the same thing, and is more well know, but we're not claiming originality

[^4]: However, most of the work was conceptual, it didn't actually take that long to write the code to support exception handling

[^5]: If it cannot, the function returns to `__cxa_throw()` which then calls the terminate handler (which is usually `std::terminate()`)

[^6]: The C++ personality function is called `__gxx_personality_v0()` but that doesn't matter too much

[^7]: Clang in our case

[^8]:

    Sidenote: figuring out what the pointer was supposed to be was not easy? I couldn't find it in the docs so the source
    code provided the answer: see [set_registers()](https://github.com/llvm/llvm-project/blob/af9bdcfc46ef73179797ebd406ab413cd047a8c7/libcxxabi/src/cxa_personality.cpp#L548)
    which is used by `__gxx_personality_v0()` to set the return values. Register 0 is set to the value of the `_Unwind_Exception` object,
    and register 1 is set to the *selector value*.

    Granted the [docs](https://llvm.org/docs/ExceptionHandling.html#try-catch) said:

    > For C++, the `landingpad` instruction returns a pointer and integer pair corresponding to the pointer to the *exception structure*
    > and the *selector value* respectively.

    but the term "exception structure" is pretty vague and could mean `__cxa_exception` as well. That's half of the `landingpad`
    mystery solved. Let's move on to the selector value.

[^9]: The gist behind the list of exception types is that if the `landingpad` contains the exception that's currently being passed up the stack,
that `landingpad` can catch it and resume execution there. If not, then we continue up the stack. This is slightly simplified, but the
[docs](https://llvm.org/docs/ExceptionHandling.html) do a good job of explaining this (`catch`/`filter`/`cleanup` clauses etc.)

[^10]: This took around 6 months as well actually. If you've read the whole article and think that the ideas discussed aren't that complicated
and this could have been implemented faster, you might be right. However, I've also left out a bunch of complexity in Caffeine related to external
functions, and what happens if you call one that forks (in the symbolic execution sense, not the syscall sense).
There were some limitations to the original implementation, and it took a few
iterations to get it right. As a sidenote, as far as I can tell, we never throw symbolic exceptions, so the idea of forking during an external
call might be a bit far fetched.

[^11]: For instance, we're completely ignoring foreign exceptions

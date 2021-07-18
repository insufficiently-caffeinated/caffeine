; ModuleID = 'll/.atomic.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/atomic.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timespec = type { i64, i64 }
%"struct.std::__1::__cxx_atomic_impl" = type { %"struct.std::__1::__cxx_atomic_base_impl" }
%"struct.std::__1::__cxx_atomic_base_impl" = type { i32 }
%"struct.std::__1::__libcpp_contention_table_entry" = type { %"struct.std::__1::__cxx_atomic_impl", %"struct.std::__1::__cxx_atomic_impl", [56 x i8] }

@_ZNSt3__1L25__libcpp_contention_tableE = internal global [256 x { { i32 }, { i32 }, [56 x i8] }] [{ { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }, { { i32 }, { i32 }, [56 x i8] } { { i32 } zeroinitializer, { i32 } zeroinitializer, [56 x i8] undef }], align 64
@_ZZNSt3__1L33__libcpp_platform_wait_on_addressEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEEiE9__timeout = internal constant %struct.timespec { i64 2, i64 0 }, align 8

; Function Attrs: nounwind uwtable
define void @_ZNSt3__123__cxx_atomic_notify_oneEPVKv(i8* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 255
  %17 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 1
  %18 = getelementptr inbounds %"struct.std::__1::__cxx_atomic_impl", %"struct.std::__1::__cxx_atomic_impl"* %17, i64 0, i32 0, i32 0
  %19 = atomicrmw add i32* %18, i32 1 release
  %20 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 0, i32 0, i32 0
  %21 = load atomic i32, i32* %20 seq_cst, align 64
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %25, label %23

23:                                               ; preds = %1
  %24 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* nonnull %17, i32 129, i32 2147483647, i32 0, i32 0, i32 0) #3
  br label %25

25:                                               ; preds = %1, %23
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__123__cxx_atomic_notify_allEPVKv(i8* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 255
  %17 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 1
  %18 = getelementptr inbounds %"struct.std::__1::__cxx_atomic_impl", %"struct.std::__1::__cxx_atomic_impl"* %17, i64 0, i32 0, i32 0
  %19 = atomicrmw add i32* %18, i32 1 release
  %20 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 0, i32 0, i32 0
  %21 = load atomic i32, i32* %20 seq_cst, align 64
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %25, label %23

23:                                               ; preds = %1
  %24 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* nonnull %17, i32 129, i32 2147483647, i32 0, i32 0, i32 0) #3
  br label %25

25:                                               ; preds = %1, %23
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define i32 @_ZNSt3__123__libcpp_atomic_monitorEPVKv(i8* %0) local_unnamed_addr #1 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 255
  %17 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 1, i32 0, i32 0
  %18 = load atomic i32, i32* %17 acquire, align 4
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__120__libcpp_atomic_waitEPVKvi(i8* %0, i32 %1) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %3 = ptrtoint i8* %0 to i64
  %4 = lshr i64 %3, 32
  %5 = shl i64 %3, 3
  %6 = and i64 %5, 4294967288
  %7 = add nuw nsw i64 %6, 8
  %8 = xor i64 %7, %4
  %9 = mul i64 %8, -7070675565921424023
  %10 = lshr i64 %9, 47
  %11 = xor i64 %9, %4
  %12 = xor i64 %11, %10
  %13 = mul i64 %12, -7070675565921424023
  %14 = lshr i64 %13, 47
  %15 = xor i64 %14, %13
  %16 = mul i64 %15, -7070675565921424023
  %17 = and i64 %16, 255
  %18 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %17, i32 1
  %19 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %17, i32 0, i32 0, i32 0
  %20 = atomicrmw volatile add i32* %19, i32 1 seq_cst
  %21 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* nonnull %18, i32 128, i32 %1, %struct.timespec* nonnull @_ZZNSt3__1L33__libcpp_platform_wait_on_addressEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEEiE9__timeout, i32 0, i32 0) #3
  %22 = atomicrmw volatile sub i32* %19, i32 1 release
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__123__cxx_atomic_notify_oneEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEE(%"struct.std::__1::__cxx_atomic_impl"* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint %"struct.std::__1::__cxx_atomic_impl"* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 255
  %17 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 0, i32 0, i32 0
  %18 = load atomic i32, i32* %17 seq_cst, align 64
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %1
  %21 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* %0, i32 129, i32 1, i32 0, i32 0, i32 0) #3
  br label %22

22:                                               ; preds = %1, %20
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__123__cxx_atomic_notify_allEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEE(%"struct.std::__1::__cxx_atomic_impl"* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint %"struct.std::__1::__cxx_atomic_impl"* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 255
  %17 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %16, i32 0, i32 0, i32 0
  %18 = load atomic i32, i32* %17 seq_cst, align 64
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %22, label %20

20:                                               ; preds = %1
  %21 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* %0, i32 129, i32 2147483647, i32 0, i32 0, i32 0) #3
  br label %22

22:                                               ; preds = %1, %20
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define i32 @_ZNSt3__123__libcpp_atomic_monitorEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEE(%"struct.std::__1::__cxx_atomic_impl"* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %"struct.std::__1::__cxx_atomic_impl", %"struct.std::__1::__cxx_atomic_impl"* %0, i64 0, i32 0, i32 0
  %3 = load atomic i32, i32* %2 acquire, align 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__120__libcpp_atomic_waitEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEEi(%"struct.std::__1::__cxx_atomic_impl"* %0, i32 %1) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %3 = ptrtoint %"struct.std::__1::__cxx_atomic_impl"* %0 to i64
  %4 = lshr i64 %3, 32
  %5 = shl i64 %3, 3
  %6 = and i64 %5, 4294967288
  %7 = add nuw nsw i64 %6, 8
  %8 = xor i64 %7, %4
  %9 = mul i64 %8, -7070675565921424023
  %10 = lshr i64 %9, 47
  %11 = xor i64 %9, %4
  %12 = xor i64 %11, %10
  %13 = mul i64 %12, -7070675565921424023
  %14 = lshr i64 %13, 47
  %15 = xor i64 %14, %13
  %16 = mul i64 %15, -7070675565921424023
  %17 = and i64 %16, 255
  %18 = getelementptr inbounds [256 x %"struct.std::__1::__libcpp_contention_table_entry"], [256 x %"struct.std::__1::__libcpp_contention_table_entry"]* bitcast ([256 x { { i32 }, { i32 }, [56 x i8] }]* @_ZNSt3__1L25__libcpp_contention_tableE to [256 x %"struct.std::__1::__libcpp_contention_table_entry"]*), i64 0, i64 %17, i32 0, i32 0, i32 0
  %19 = atomicrmw volatile add i32* %18, i32 1 seq_cst
  %20 = tail call i64 (i64, ...) @syscall(i64 202, %"struct.std::__1::__cxx_atomic_impl"* %0, i32 128, i32 %1, %struct.timespec* nonnull @_ZZNSt3__1L33__libcpp_platform_wait_on_addressEPVKNS_17__cxx_atomic_implIiNS_22__cxx_atomic_base_implIiEEEEiE9__timeout, i32 0, i32 0) #3
  %21 = atomicrmw volatile sub i32* %18, i32 1 release
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}

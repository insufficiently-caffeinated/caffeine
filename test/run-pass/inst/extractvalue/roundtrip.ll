target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define void @test(i32 %x) {
  %a = insertvalue { i32, i8 } undef, i32 %x, 0
  %b = insertvalue { i32, i8 } %a, i8 1, 1
  %c = extractvalue { i32, i8 } %b, 0
  %d = icmp eq i32 %c, %x
  call void @caffeine_assert(i1 %d)
  %e = extractvalue { i32, i8 } %b, 1
  %f = icmp eq i8 %e, 1
  call void @caffeine_assert(i1 %f)
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr
declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

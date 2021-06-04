target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

define void @test(i64 %x) {
  %a = inttoptr i64 %x to i8*
  %b = ptrtoint i8* %a to i64
  %d = icmp eq i64 %b, %x
  call void @caffeine_assert(i1 %d)
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr
declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

source_filename   = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple     = "x86_64-pc-linux-gnu"

; The bug that this test case is trying to test occurs when we try to zext an i1
; for which Z3Solver has built a z3::expr that is a boolean.
;
; To hit this case, we call zext on the result of a comparison. The rest is just
; to make sure that the expression is placed within an assertion that we care
; about.
define dso_local void @test(i8 zeroext %x) local_unnamed_addr #0 {
  %1 = icmp ne i8 %x, 0
  %2 = zext i1 %1 to i8
  %3 = icmp eq i8 %2, 0
  %4 = icmp eq i8 %2, 1
  %5 = or i1 %3, %4
  call void @caffeine_assert(i1 zeroext %5)
  ret void
}

declare void @caffeine_assert(i1 zeroext) local_unnamed_addr #1


attributes #0 = { optnone noinline nounwind }
attributes #1 = { nounwind }


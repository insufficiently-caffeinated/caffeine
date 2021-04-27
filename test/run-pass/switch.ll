target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Here we sign extend an i8 to an i16
define dso_local void @test(i8 %x) local_unnamed_addr #0 {
  switch i8 %x, label %default [
    i8 0, label %case0
    i8 1, label %case1
    i8 2, label %case2
    i8 3, label %case3
  ]

case0:
  %v0 = icmp eq i8 %x, 0
  call void @caffeine_assert(i1 %v0)
  br label %exit

case1:
  %v1 = icmp eq i8 %x, 1
  call void @caffeine_assert(i1 %v1)
  br label %exit

case2:
  %v2 = icmp eq i8 %x, 2
  call void @caffeine_assert(i1 %v2)
  br label %exit

case3:
  %v3 = icmp eq i8 %x, 3
  call void @caffeine_assert(i1 %v3)
  br label %exit

default:
  %v4 = icmp ugt i8 %x, 3
  call void @caffeine_assert(i1 %v4)
  br label %exit

exit:
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Here we store then load a floating point value
define dso_local void @test() local_unnamed_addr #0 {
  %a = sub i32 5, 2
  %b = sub i32 %a, 1
  %c = icmp eq i32 %b, 2
  call void @caffeine_assert(i1 zeroext %c)

  ret void
}

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr
declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr

attributes #0 = { nounwind uwtable }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

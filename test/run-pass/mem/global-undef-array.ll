source_filename = "manual test"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = internal global [32 x i32] undef, align 4

define dso_local void @test(i32 %x) local_unnamed_addr #0 {
  %1 = getelementptr inbounds [32 x i32], [32 x i32]* @data, i64 0, i64 0
  store i32 5, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp eq i32 %2, 5
  %4 = icmp eq i32 %2, %x
  call void @caffeine_assume(i1 zeroext %4) #1
  call void @caffeine_assert(i1 zeroext %3) #1
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

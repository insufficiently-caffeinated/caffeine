source_filename = "manual test"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1
declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1

@data = internal global [32 x [4 x i32]] zeroinitializer, align 4

define dso_local void @test() local_unnamed_addr #0 {
  %a = extractelement <2 x i8*> zeroinitializer, i32 0
  %b = ptrtoint i8* %a to i64
  %c = icmp eq i64 %b, 0
  call void @caffeine_assert(i1 zeroext %c)
  ret void
}

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

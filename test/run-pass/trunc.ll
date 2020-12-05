target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Here we truncate i64 to each type
define dso_local void @test(i64 %0) local_unnamed_addr #0 {
  %2 = icmp eq i64 %0, 205255324057327
  tail call void @caffeine_assume(i1 zeroext %2) #2
  %3 = trunc i64 %0 to i32
  %4 = icmp eq i32 %3, -1163018513
  tail call void @caffeine_assert(i1 zeroext %4) #2
  %5 = trunc i64 %0 to i16
  %6 = icmp eq i16 %5, 48879
  tail call void @caffeine_assert(i1 zeroext %6) #2
  %7 = trunc i64 %0 to i8
  %8 = icmp eq i8 %7, 239
  tail call void @caffeine_assert(i1 zeroext %8) #2
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

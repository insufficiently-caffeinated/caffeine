; ModuleID = '/mnt/d/Projects/Projects/UWaterloo/caffeine/test/run-fail/interleave.c'
source_filename = "/mnt/d/Projects/Projects/UWaterloo/caffeine/test/run-fail/interleave.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @test(i32 zeroext %0, i32 zeroext %1, i32 zeroext %x) local_unnamed_addr #1 {
  ; Create vector with alternating %0 and %1 elements
  %v1 = insertelement <4 x i32> undef, i32 %0, i32 0
  %v2 = insertelement <4 x i32> undef, i32 %1, i32 1
  %v = shufflevector <4 x i32> %v1, <4 x i32> %v2, <4 x i32> <i32 0, i32 5, i32 0, i32 5>
  
  ; Cases where %0 == %1 aren't interesting
  %cmp1 = icmp ne i32 %0, %1
  call void @caffeine_assume(i1 zeroext %cmp1)  

  ; Need the select index to be within the vector
  %cmp2 = icmp ult i32 %x, 4
  call void @caffeine_assume(i1 zeroext %cmp2)

  %3 = extractelement <4 x i32> %v, i32 %x
  %4 = icmp ne i32 %3, %1
  call void @caffeine_assert(i1 zeroext %4)
  ret void
}

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #2
declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #2

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

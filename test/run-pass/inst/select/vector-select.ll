target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Here we perform a vector fcmp true operation
define dso_local void @test() local_unnamed_addr #0 {
  %a = select i1 false, i8 1, i8 2
  %b = select i1 true, <2 x i8> <i8 1, i8 1>, <2 x i8> <i8 2, i8 2>
  %c = select <2 x i1> <i1 true, i1 false>, <2 x i8> <i8 1, i8 1>, <2 x i8> <i8 2, i8 2>

  %a_eq_2 = icmp eq i8 %a, 2
  call void @caffeine_assert(i1 zeroext %a_eq_2)

  %b0 = extractelement <2 x i8> %b, i32 0
  %b1 = extractelement <2 x i8> %b, i32 1
  %b0_eq_1 = icmp eq i8 %b0, 1
  %b1_eq_1 = icmp eq i8 %b1, 1
  call void @caffeine_assert(i1 zeroext %b0_eq_1)
  call void @caffeine_assert(i1 zeroext %b1_eq_1)

  %c0 = extractelement <2 x i8> %c, i32 0
  %c1 = extractelement <2 x i8> %c, i32 1
  %c0_eq_1 = icmp eq i8 %c0, 1
  %c1_eq_2 = icmp eq i8 %c1, 2
  call void @caffeine_assert(i1 zeroext %c0_eq_1)
  call void @caffeine_assert(i1 zeroext %c1_eq_2)

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

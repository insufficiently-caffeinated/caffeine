; SKIP TEST
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i32, %struct.__sigset_t }
%struct.__sigset_t = type { [16 x i64] }

; Here we use invoke to call both setjmp and longjmp
define dso_local void @test() local_unnamed_addr #0
  personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*)
{
  %buf = alloca %struct.__jmp_buf_tag, align 16
  %res = invoke i32 @_setjmp(%struct.__jmp_buf_tag* nonnull %buf)
    to label %setjmp_normal unwind label %exception

setjmp_normal:
  switch i32 %res, label %failure [
    i32 0, label %setjmp_default
    i32 7, label %setjmp_landing
  ]

setjmp_default:
  invoke void @longjmp(%struct.__jmp_buf_tag* %buf, i32 7)
    to label %failure unwind label %exception

setjmp_landing:
  call void @caffeine_assert(i1 false)
  ret void

exception:
  %ex = landingpad { i8*, i32 } catch i8* null
  br label %failure

failure:
  ret void
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1
declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1
declare dso_local i32 @_setjmp(%struct.__jmp_buf_tag*) local_unnamed_addr #2
declare dso_local void @longjmp(%struct.__jmp_buf_tag*, i32) local_unnamed_addr #3
declare dso_local i32 @__gxx_personality_v0(...)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind returns_twice }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

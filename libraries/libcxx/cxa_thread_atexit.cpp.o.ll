; ModuleID = 'll/.cxa_thread_atexit.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_thread_atexit.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @__cxa_thread_atexit(void (i8*)* %0, i8* %1, i8* %2) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = invoke i32 @__cxa_thread_atexit_impl(void (i8*)* %0, i8* %1, i8* %2)
          to label %5 unwind label %6

5:                                                ; preds = %3
  ret i32 %4

6:                                                ; preds = %3
  %7 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %8 = extractvalue { i8*, i32 } %7, 0
  tail call void @__cxa_call_unexpected(i8* %8) #2
  unreachable
}

declare i32 @__cxa_thread_atexit_impl(void (i8*)*, i8*, i8*) local_unnamed_addr #1

declare i32 @__gxx_personality_v0(...)

declare void @__cxa_call_unexpected(i8*) local_unnamed_addr

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}

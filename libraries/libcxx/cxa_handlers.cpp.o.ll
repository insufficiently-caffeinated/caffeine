; ModuleID = 'll/.cxa_handlers.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_handlers.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.__cxxabiv1::__cxa_eh_globals" = type { %"struct.__cxxabiv1::__cxa_exception"*, i32 }
%"struct.__cxxabiv1::__cxa_exception" = type { i8*, i64, %"class.std::type_info"*, void (i8*)*, void ()*, void ()*, %"struct.__cxxabiv1::__cxa_exception"*, i32, i32, i8*, i8*, i8*, i8*, %struct._Unwind_Exception }
%"class.std::type_info" = type { i32 (...)**, i8* }
%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }

$__clang_call_terminate = comdat any

@__cxa_unexpected_handler = external local_unnamed_addr global void ()*, align 8
@.str = private unnamed_addr constant [41 x i8] c"unexpected_handler unexpectedly returned\00", align 1
@__cxa_terminate_handler = external local_unnamed_addr global void ()*, align 8
@.str.1 = private unnamed_addr constant [40 x i8] c"terminate_handler unexpectedly returned\00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"terminate_handler unexpectedly threw an exception\00", align 1
@__cxa_new_handler = global void ()* null, align 8

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt14get_unexpectedv() local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = load atomic i64, i64* bitcast (void ()** @__cxa_unexpected_handler to i64*) acquire, align 8
  %2 = inttoptr i64 %1 to void ()*
  ret void ()* %2
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #1 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #7
  tail call void @_ZSt9terminatev() #8
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

; Function Attrs: noreturn nounwind uwtable
define void @_ZSt9terminatev() local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
          to label %2 unwind label %15

2:                                                ; preds = %0
  %3 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %1, null
  br i1 %3, label %19, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 0
  %6 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %5, align 8, !tbaa !3
  %7 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %6, null
  br i1 %7, label %19, label %8

8:                                                ; preds = %4
  %9 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %6, i64 0, i32 13
  %10 = invoke zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %9)
          to label %11 unwind label %17

11:                                               ; preds = %8
  br i1 %10, label %12, label %19

12:                                               ; preds = %11
  %13 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %6, i64 0, i32 5
  %14 = load void ()*, void ()** %13, align 8, !tbaa !9
  tail call void @_ZSt11__terminatePFvvE(void ()* %14) #8
  unreachable

15:                                               ; preds = %0
  %16 = landingpad { i8*, i32 }
          catch i8* null
  br label %22

17:                                               ; preds = %8
  %18 = landingpad { i8*, i32 }
          catch i8* null
  br label %22

19:                                               ; preds = %4, %11, %2
  %20 = load atomic i64, i64* bitcast (void ()** @__cxa_terminate_handler to i64*) acquire, align 8
  %21 = inttoptr i64 %20 to void ()*
  tail call void @_ZSt11__terminatePFvvE(void ()* %21) #8
  unreachable

22:                                               ; preds = %17, %15
  %23 = phi { i8*, i32 } [ %18, %17 ], [ %16, %15 ]
  %24 = extractvalue { i8*, i32 } %23, 0
  tail call void @__clang_call_terminate(i8* %24) #8
  unreachable
}

; Function Attrs: noreturn uwtable
define hidden void @_ZSt12__unexpectedPFvvE(void ()* nocapture %0) local_unnamed_addr #3 {
  tail call void %0()
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i64 0, i64 0)) #9
  unreachable
}

; Function Attrs: noreturn
declare hidden void @abort_message(i8*, ...) local_unnamed_addr #4

; Function Attrs: noreturn uwtable
define void @_ZSt10unexpectedv() local_unnamed_addr #3 personality i32 (...)* @__gxx_personality_v0 {
  %1 = load atomic i64, i64* bitcast (void ()** @__cxa_unexpected_handler to i64*) acquire, align 8
  %2 = inttoptr i64 %1 to void ()*
  tail call void @_ZSt12__unexpectedPFvvE(void ()* %2) #9
  unreachable
}

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt13get_terminatev() local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = load atomic i64, i64* bitcast (void ()** @__cxa_terminate_handler to i64*) acquire, align 8
  %2 = inttoptr i64 %1 to void ()*
  ret void ()* %2
}

; Function Attrs: noreturn nounwind uwtable
define hidden void @_ZSt11__terminatePFvvE(void ()* nocapture %0) local_unnamed_addr #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  invoke void %0()
          to label %2 unwind label %4

2:                                                ; preds = %1
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.1, i64 0, i64 0)) #9
          to label %3 unwind label %4

3:                                                ; preds = %2
  unreachable

4:                                                ; preds = %2, %1
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  %7 = tail call i8* @__cxa_begin_catch(i8* %6) #7
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.2, i64 0, i64 0)) #9
          to label %8 unwind label %9

8:                                                ; preds = %4
  unreachable

9:                                                ; preds = %4
  %10 = landingpad { i8*, i32 }
          catch i8* null
  invoke void @__cxa_end_catch()
          to label %14 unwind label %11

11:                                               ; preds = %9
  %12 = landingpad { i8*, i32 }
          catch i8* null
  %13 = extractvalue { i8*, i32 } %12, 0
  tail call void @__clang_call_terminate(i8* %13) #8
  unreachable

14:                                               ; preds = %9
  %15 = extractvalue { i8*, i32 } %10, 0
  tail call void @__clang_call_terminate(i8* %15) #8
  unreachable
}

declare void @__cxa_end_catch() local_unnamed_addr

declare %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast() local_unnamed_addr #6

declare hidden zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception*) local_unnamed_addr #6

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt15set_new_handlerPFvvE(void ()* %0) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = ptrtoint void ()* %0 to i64
  %3 = atomicrmw xchg i64* bitcast (void ()** @__cxa_new_handler to i64*), i64 %2 acq_rel
  %4 = inttoptr i64 %3 to void ()*
  ret void ()* %4
}

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt15get_new_handlerv() local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = load atomic i64, i64* bitcast (void ()** @__cxa_new_handler to i64*) acquire, align 8
  %2 = inttoptr i64 %1 to void ()*
  ret void ()* %2
}

attributes #0 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline noreturn nounwind }
attributes #2 = { noreturn nounwind uwtable "min-legal-vector-width"="0" "no-jump-tables"="false" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" }
attributes #3 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_ZTSN10__cxxabiv116__cxa_eh_globalsE", !5, i64 0, !8, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!10, !5, i64 40}
!10 = !{!"_ZTSN10__cxxabiv115__cxa_exceptionE", !5, i64 0, !11, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !8, i64 56, !8, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !12, i64 96}
!11 = !{!"long", !6, i64 0}
!12 = !{!"_ZTS17_Unwind_Exception", !11, i64 0, !5, i64 8, !11, i64 16, !11, i64 24}

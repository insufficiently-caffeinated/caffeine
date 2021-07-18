; ModuleID = 'll/.cxa_exception_storage.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_exception_storage.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.__cxxabiv1::__cxa_eh_globals" = type { %"struct.__cxxabiv1::__cxa_exception"*, i32 }
%"struct.__cxxabiv1::__cxa_exception" = type { i8*, i64, %"class.std::type_info"*, void (i8*)*, void ()*, void ()*, %"struct.__cxxabiv1::__cxa_exception"*, i32, i32, i8*, i8*, i8*, i8*, %struct._Unwind_Exception }
%"class.std::type_info" = type opaque
%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }

@.str = private unnamed_addr constant [33 x i8] c"cannot allocate __cxa_eh_globals\00", align 1
@_ZN10__cxxabiv112_GLOBAL__N_14key_E = internal global i32 0, align 4
@.str.1 = private unnamed_addr constant [53 x i8] c"std::__libcpp_tls_set failure in __cxa_get_globals()\00", align 1
@_ZN10__cxxabiv112_GLOBAL__N_15flag_E = internal global i32 0, align 4
@.str.2 = private unnamed_addr constant [49 x i8] c"execute once failure in __cxa_get_globals_fast()\00", align 1
@.str.3 = private unnamed_addr constant [58 x i8] c"cannot create thread specific key for __cxa_get_globals()\00", align 1
@.str.4 = private unnamed_addr constant [53 x i8] c"cannot zero out thread value for __cxa_get_globals()\00", align 1

; Function Attrs: uwtable
define %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals() local_unnamed_addr #0 {
  %1 = tail call i32 @pthread_once(i32* nonnull @_ZN10__cxxabiv112_GLOBAL__N_15flag_E, void ()* nonnull @_ZN10__cxxabiv112_GLOBAL__N_110construct_Ev)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0)) #4
  unreachable

4:                                                ; preds = %0
  %5 = load i32, i32* @_ZN10__cxxabiv112_GLOBAL__N_14key_E, align 4, !tbaa !4
  %6 = tail call i8* @pthread_getspecific(i32 %5) #5
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %17

8:                                                ; preds = %4
  %9 = tail call i8* @_ZN10__cxxabiv122__calloc_with_fallbackEmm(i64 1, i64 16)
  %10 = icmp eq i8* %9, null
  br i1 %10, label %11, label %12

11:                                               ; preds = %8
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str, i64 0, i64 0)) #4
  unreachable

12:                                               ; preds = %8
  %13 = load i32, i32* @_ZN10__cxxabiv112_GLOBAL__N_14key_E, align 4, !tbaa !4
  %14 = tail call i32 @pthread_setspecific(i32 %13, i8* nonnull %9) #5
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %17, label %16

16:                                               ; preds = %12
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.1, i64 0, i64 0)) #4
  unreachable

17:                                               ; preds = %12, %4
  %18 = phi i8* [ %9, %12 ], [ %6, %4 ]
  %19 = bitcast i8* %18 to %"struct.__cxxabiv1::__cxa_eh_globals"*
  ret %"struct.__cxxabiv1::__cxa_eh_globals"* %19
}

; Function Attrs: uwtable
define %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast() local_unnamed_addr #0 {
  %1 = tail call i32 @pthread_once(i32* nonnull @_ZN10__cxxabiv112_GLOBAL__N_15flag_E, void ()* nonnull @_ZN10__cxxabiv112_GLOBAL__N_110construct_Ev)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0)) #4
  unreachable

4:                                                ; preds = %0
  %5 = load i32, i32* @_ZN10__cxxabiv112_GLOBAL__N_14key_E, align 4, !tbaa !4
  %6 = tail call i8* @pthread_getspecific(i32 %5) #5
  %7 = bitcast i8* %6 to %"struct.__cxxabiv1::__cxa_eh_globals"*
  ret %"struct.__cxxabiv1::__cxa_eh_globals"* %7
}

declare hidden i8* @_ZN10__cxxabiv122__calloc_with_fallbackEmm(i64, i64) local_unnamed_addr #1

; Function Attrs: noreturn
declare hidden void @abort_message(i8*, ...) local_unnamed_addr #2

; Function Attrs: uwtable
define internal void @_ZN10__cxxabiv112_GLOBAL__N_110construct_Ev() #0 {
  %1 = tail call i32 @pthread_key_create(i32* nonnull @_ZN10__cxxabiv112_GLOBAL__N_14key_E, void (i8*)* nonnull @_ZN10__cxxabiv112_GLOBAL__N_19destruct_EPv) #5
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %4, label %3

3:                                                ; preds = %0
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.3, i64 0, i64 0)) #4
  unreachable

4:                                                ; preds = %0
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_setspecific(i32, i8*) local_unnamed_addr #3

declare i32 @pthread_once(i32*, void ()*) local_unnamed_addr #1

; Function Attrs: uwtable
define internal void @_ZN10__cxxabiv112_GLOBAL__N_19destruct_EPv(i8* %0) #0 {
  tail call void @_ZN10__cxxabiv120__free_with_fallbackEPv(i8* %0)
  %2 = load i32, i32* @_ZN10__cxxabiv112_GLOBAL__N_14key_E, align 4, !tbaa !4
  %3 = tail call i32 @pthread_setspecific(i32 %2, i8* null) #5
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([53 x i8], [53 x i8]* @.str.4, i64 0, i64 0)) #4
  unreachable

6:                                                ; preds = %1
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_key_create(i32*, void (i8*)*) local_unnamed_addr #3

declare hidden void @_ZN10__cxxabiv120__free_with_fallbackEPv(i8*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i8* @pthread_getspecific(i32) local_unnamed_addr #3

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn }
attributes #5 = { nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}

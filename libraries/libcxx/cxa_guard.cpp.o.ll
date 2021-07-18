; ModuleID = 'll/.cxa_guard.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_guard.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar" = type { %union.pthread_cond_t }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [20 x i8] c"__cxa_guard_acquire\00", align 1
@.str.1 = private unnamed_addr constant [54 x i8] c"__cxa_guard_acquire detected recursive initialization\00", align 1
@_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_13LibcppCondVarEE8instanceE = internal global %"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar" zeroinitializer, align 8
@_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE = internal global %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex" zeroinitializer, align 8
@.str.2 = private unnamed_addr constant [27 x i8] c"%s failed to acquire mutex\00", align 1
@.str.3 = private unnamed_addr constant [27 x i8] c"%s failed to release mutex\00", align 1
@.str.4 = private unnamed_addr constant [20 x i8] c"__cxa_guard_release\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"%s failed to broadcast\00", align 1
@.str.6 = private unnamed_addr constant [18 x i8] c"__cxa_guard_abort\00", align 1

; Function Attrs: cold optsize uwtable
define i32 @__cxa_guard_acquire(i64* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast i64* %0 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 1
  %4 = bitcast i64* %0 to i32*
  %5 = getelementptr inbounds i32, i32* %4, i64 1
  %6 = load atomic i8, i8* %2 acquire, align 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %64

8:                                                ; preds = %1
  %9 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %8
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0)) #6
  unreachable

12:                                               ; preds = %8
  %13 = load i8, i8* %3, align 1, !tbaa !4
  %14 = and i8 %13, 2
  %15 = icmp eq i8 %14, 0
  br i1 %15, label %37, label %16

16:                                               ; preds = %12
  %17 = load i32, i32* %5, align 4, !tbaa !7
  %18 = tail call i64 (i64, ...) @syscall(i64 186) #5
  %19 = trunc i64 %18 to i32
  %20 = icmp eq i32 %17, %19
  br i1 %20, label %21, label %37

21:                                               ; preds = %16
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.1, i64 0, i64 0)) #6
          to label %22 unwind label %25

22:                                               ; preds = %21
  unreachable

23:                                               ; preds = %44
  %24 = landingpad { i8*, i32 }
          cleanup
  br label %27

25:                                               ; preds = %21
  %26 = landingpad { i8*, i32 }
          cleanup
  br label %27

27:                                               ; preds = %25, %23
  %28 = phi { i8*, i32 } [ %24, %23 ], [ %26, %25 ]
  %29 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %36, label %31

31:                                               ; preds = %27
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0)) #6
          to label %32 unwind label %33

32:                                               ; preds = %31
  unreachable

33:                                               ; preds = %31
  %34 = landingpad { i8*, i32 }
          catch i8* null
  %35 = extractvalue { i8*, i32 } %34, 0
  tail call void @__clang_call_terminate(i8* %35) #7
  unreachable

36:                                               ; preds = %27
  resume { i8*, i32 } %28

37:                                               ; preds = %16, %12
  %38 = phi i32 [ undef, %12 ], [ %19, %16 ]
  %39 = phi i1 [ true, %12 ], [ false, %16 ]
  br label %40

40:                                               ; preds = %44, %37
  %41 = load i8, i8* %3, align 1, !tbaa !4
  %42 = and i8 %41, 2
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %40
  %45 = or i8 %41, 4
  store i8 %45, i8* %3, align 1, !tbaa !4
  %46 = invoke i32 @pthread_cond_wait(%union.pthread_cond_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar", %"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_13LibcppCondVarEE8instanceE, i64 0, i32 0), %union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0))
          to label %40 unwind label %23

47:                                               ; preds = %40
  %48 = icmp eq i8 %41, 1
  br i1 %48, label %55, label %49

49:                                               ; preds = %47
  br i1 %39, label %50, label %53

50:                                               ; preds = %49
  %51 = tail call i64 (i64, ...) @syscall(i64 186) #5
  %52 = trunc i64 %51 to i32
  br label %53

53:                                               ; preds = %50, %49
  %54 = phi i32 [ %52, %50 ], [ %38, %49 ]
  store i32 %54, i32* %5, align 4, !tbaa !7
  store i8 2, i8* %3, align 1, !tbaa !4
  br label %55

55:                                               ; preds = %53, %47
  %56 = phi i32 [ 1, %53 ], [ 0, %47 ]
  %57 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %64, label %59

59:                                               ; preds = %55
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0)) #6
          to label %60 unwind label %61

60:                                               ; preds = %59
  unreachable

61:                                               ; preds = %59
  %62 = landingpad { i8*, i32 }
          catch i8* null
  %63 = extractvalue { i8*, i32 } %62, 0
  tail call void @__clang_call_terminate(i8* %63) #7
  unreachable

64:                                               ; preds = %1, %55
  %65 = phi i32 [ 0, %1 ], [ %56, %55 ]
  ret i32 %65
}

; Function Attrs: cold optsize uwtable
define void @__cxa_guard_release(i64* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast i64* %0 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 1
  store atomic i8 1, i8* %2 release, align 1
  %4 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0)) #6
  unreachable

7:                                                ; preds = %1
  %8 = load i8, i8* %3, align 1, !tbaa !4
  store i8 1, i8* %3, align 1, !tbaa !4
  %9 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %7
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0)) #6
          to label %12 unwind label %13

12:                                               ; preds = %11
  unreachable

13:                                               ; preds = %11
  %14 = landingpad { i8*, i32 }
          catch i8* null
  %15 = extractvalue { i8*, i32 } %14, 0
  tail call void @__clang_call_terminate(i8* %15) #7
  unreachable

16:                                               ; preds = %7
  %17 = and i8 %8, 4
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %16
  %20 = tail call i32 @pthread_cond_broadcast(%union.pthread_cond_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar", %"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_13LibcppCondVarEE8instanceE, i64 0, i32 0)) #5
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %23, label %22

22:                                               ; preds = %19
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.4, i64 0, i64 0)) #6
  unreachable

23:                                               ; preds = %16, %19
  ret void
}

; Function Attrs: cold optsize uwtable
define void @__cxa_guard_abort(i64* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast i64* %0 to i8*
  %3 = getelementptr inbounds i8, i8* %2, i64 1
  %4 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %1
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0)) #6
  unreachable

7:                                                ; preds = %1
  %8 = bitcast i64* %0 to i32*
  %9 = getelementptr inbounds i32, i32* %8, i64 1
  store i32 0, i32* %9, align 4, !tbaa !7
  %10 = load i8, i8* %3, align 1, !tbaa !4
  store i8 0, i8* %3, align 1, !tbaa !4
  %11 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex", %"struct.__cxxabiv1::(anonymous namespace)::LibcppMutex"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_11LibcppMutexEE8instanceE, i64 0, i32 0)) #5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %18, label %13

13:                                               ; preds = %7
  invoke void (i8*, ...) @abort_message(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0)) #6
          to label %14 unwind label %15

14:                                               ; preds = %13
  unreachable

15:                                               ; preds = %13
  %16 = landingpad { i8*, i32 }
          catch i8* null
  %17 = extractvalue { i8*, i32 } %16, 0
  tail call void @__clang_call_terminate(i8* %17) #7
  unreachable

18:                                               ; preds = %7
  %19 = and i8 %10, 4
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %25, label %21

21:                                               ; preds = %18
  %22 = tail call i32 @pthread_cond_broadcast(%union.pthread_cond_t* getelementptr inbounds (%"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar", %"struct.__cxxabiv1::(anonymous namespace)::LibcppCondVar"* @_ZN10__cxxabiv112_GLOBAL__N_112GlobalStaticINS0_13LibcppCondVarEE8instanceE, i64 0, i32 0)) #5
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %25, label %24

24:                                               ; preds = %21
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.6, i64 0, i64 0)) #6
  unreachable

25:                                               ; preds = %18, %21
  ret void
}

; Function Attrs: nounwind
declare i64 @syscall(i64, ...) local_unnamed_addr #1

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noreturn
declare hidden void @abort_message(i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #1

declare i32 @pthread_cond_wait(%union.pthread_cond_t*, %union.pthread_mutex_t*) local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #4 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #5
  tail call void @_ZSt9terminatev() #7
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #1

; Function Attrs: nounwind
declare i32 @pthread_cond_broadcast(%union.pthread_cond_t*) local_unnamed_addr #1

attributes #0 = { cold optsize uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { nounwind }
attributes #6 = { noreturn }
attributes #7 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}

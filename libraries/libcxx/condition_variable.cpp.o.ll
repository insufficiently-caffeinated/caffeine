; ModuleID = 'll/.condition_variable.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/condition_variable.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::condition_variable" = type { %union.pthread_cond_t }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%"class.std::__1::unique_lock" = type <{ %"class.std::__1::mutex"*, i8, [7 x i8] }>
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%struct.timespec = type { i64, i64 }
%"class.std::__1::__thread_specific_ptr" = type { i32 }
%"class.std::__1::__thread_struct" = type { %"class.std::__1::__thread_struct_imp"* }
%"class.std::__1::__thread_struct_imp" = type opaque

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [43 x i8] c"condition_variable::wait: mutex not locked\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"condition_variable wait failed\00", align 1
@.str.2 = private unnamed_addr constant [49 x i8] c"condition_variable::timed wait: mutex not locked\00", align 1
@.str.3 = private unnamed_addr constant [37 x i8] c"condition_variable timed_wait failed\00", align 1

; Function Attrs: nounwind uwtable
define void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* %0) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::condition_variable", %"class.std::__1::condition_variable"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_cond_signal(%union.pthread_cond_t* %2) #9
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #1 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #9
  tail call void @_ZSt9terminatev() #10
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind uwtable
define void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* %0) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::condition_variable", %"class.std::__1::condition_variable"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_cond_broadcast(%union.pthread_cond_t* %2) #9
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* %0, %"class.std::__1::unique_lock"* nocapture nonnull readonly align 8 dereferenceable(9) %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 1
  %4 = load i8, i8* %3, align 8, !tbaa !4, !range !10
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 1, i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0)) #11
          to label %7 unwind label %22

7:                                                ; preds = %6
  unreachable

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"class.std::__1::condition_variable", %"class.std::__1::condition_variable"* %0, i64 0, i32 0
  %10 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 0
  %11 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %10, align 8, !tbaa !11
  %12 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %11, i64 0, i32 0
  %13 = invoke i32 @pthread_cond_wait(%union.pthread_cond_t* %9, %union.pthread_mutex_t* %12)
          to label %14 unwind label %18

14:                                               ; preds = %8
  %15 = icmp eq i32 %13, 0
  br i1 %15, label %21, label %16

16:                                               ; preds = %14
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %13, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i64 0, i64 0)) #11
          to label %17 unwind label %18

17:                                               ; preds = %16
  unreachable

18:                                               ; preds = %8, %16
  %19 = landingpad { i8*, i32 }
          catch i8* null
  %20 = extractvalue { i8*, i32 } %19, 0
  tail call void @__clang_call_terminate(i8* %20) #10
  unreachable

21:                                               ; preds = %14
  ret void

22:                                               ; preds = %6
  %23 = landingpad { i8*, i32 }
          catch i8* null
  %24 = extractvalue { i8*, i32 } %23, 0
  tail call void @__clang_call_terminate(i8* %24) #10
  unreachable
}

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define void @_ZNSt3__118condition_variable15__do_timed_waitERNS_11unique_lockINS_5mutexEEENS_6chrono10time_pointINS5_12system_clockENS5_8durationIxNS_5ratioILl1ELl1000000000EEEEEEE(%"class.std::__1::condition_variable"* %0, %"class.std::__1::unique_lock"* nocapture nonnull readonly align 8 dereferenceable(9) %1, i64 %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %struct.timespec, align 8
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 1
  %6 = load i8, i8* %5, align 8, !tbaa !4, !range !10
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 1, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.2, i64 0, i64 0)) #11
          to label %9 unwind label %31

9:                                                ; preds = %8
  unreachable

10:                                               ; preds = %3
  %11 = icmp slt i64 %2, 6442450944000059713
  %12 = select i1 %11, i64 %2, i64 6442450944000059713
  %13 = bitcast %struct.timespec* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %13) #9
  %14 = sdiv i64 %12, 1000000000
  %15 = getelementptr inbounds %struct.timespec, %struct.timespec* %4, i64 0, i32 0
  store i64 %14, i64* %15, align 8, !tbaa !12
  %16 = mul nsw i64 %14, -1000000000
  %17 = add i64 %16, %12
  %18 = getelementptr inbounds %struct.timespec, %struct.timespec* %4, i64 0, i32 1
  store i64 %17, i64* %18, align 8, !tbaa !15
  %19 = getelementptr inbounds %"class.std::__1::condition_variable", %"class.std::__1::condition_variable"* %0, i64 0, i32 0
  %20 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 0
  %21 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %20, align 8, !tbaa !11
  %22 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %21, i64 0, i32 0
  %23 = invoke i32 @pthread_cond_timedwait(%union.pthread_cond_t* %19, %union.pthread_mutex_t* %22, %struct.timespec* nonnull %4)
          to label %24 unwind label %27

24:                                               ; preds = %10
  switch i32 %23, label %25 [
    i32 110, label %30
    i32 0, label %30
  ]

25:                                               ; preds = %24
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %23, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.3, i64 0, i64 0)) #11
          to label %26 unwind label %27

26:                                               ; preds = %25
  unreachable

27:                                               ; preds = %10, %25
  %28 = landingpad { i8*, i32 }
          catch i8* null
  %29 = extractvalue { i8*, i32 } %28, 0
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13) #9
  call void @__clang_call_terminate(i8* %29) #10
  unreachable

30:                                               ; preds = %24, %24
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %13) #9
  ret void

31:                                               ; preds = %8
  %32 = landingpad { i8*, i32 }
          catch i8* null
  %33 = extractvalue { i8*, i32 } %32, 0
  tail call void @__clang_call_terminate(i8* %33) #10
  unreachable
}

; Function Attrs: uwtable
define void @_ZNSt3__125notify_all_at_thread_exitERNS_18condition_variableENS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull align 8 dereferenceable(48) %0, %"class.std::__1::unique_lock"* nocapture %1) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = tail call nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv()
  %4 = getelementptr inbounds %"class.std::__1::__thread_specific_ptr", %"class.std::__1::__thread_specific_ptr"* %3, i64 0, i32 0
  %5 = load i32, i32* %4, align 4, !tbaa !16
  %6 = tail call i8* @pthread_getspecific(i32 %5) #9
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %16

8:                                                ; preds = %2
  %9 = tail call noalias nonnull dereferenceable(8) i8* @_Znwm(i64 8) #12
  %10 = bitcast i8* %9 to %"class.std::__1::__thread_struct"*
  invoke void @_ZNSt3__115__thread_structC1Ev(%"class.std::__1::__thread_struct"* nonnull %10)
          to label %11 unwind label %14

11:                                               ; preds = %8
  %12 = load i32, i32* %4, align 4, !tbaa !16
  %13 = tail call i32 @pthread_setspecific(i32 %12, i8* nonnull %9) #9
  br label %16

14:                                               ; preds = %8
  %15 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %9) #13
  resume { i8*, i32 } %15

16:                                               ; preds = %11, %2
  %17 = tail call nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv()
  %18 = getelementptr inbounds %"class.std::__1::__thread_specific_ptr", %"class.std::__1::__thread_specific_ptr"* %17, i64 0, i32 0
  %19 = load i32, i32* %18, align 4, !tbaa !16
  %20 = tail call i8* @pthread_getspecific(i32 %19) #9
  %21 = bitcast i8* %20 to %"class.std::__1::__thread_struct"*
  %22 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 0
  %23 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %22, align 8, !tbaa !11
  store %"class.std::__1::mutex"* null, %"class.std::__1::mutex"** %22, align 8, !tbaa !11
  %24 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 1
  store i8 0, i8* %24, align 8, !tbaa !4
  tail call void @_ZNSt3__115__thread_struct25notify_all_at_thread_exitEPNS_18condition_variableEPNS_5mutexE(%"class.std::__1::__thread_struct"* %21, %"class.std::__1::condition_variable"* nonnull %0, %"class.std::__1::mutex"* %23)
  ret void
}

declare nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv() local_unnamed_addr #5

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #6

declare void @_ZNSt3__115__thread_structC1Ev(%"class.std::__1::__thread_struct"*) unnamed_addr #5

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #7

declare void @_ZNSt3__115__thread_struct25notify_all_at_thread_exitEPNS_18condition_variableEPNS_5mutexE(%"class.std::__1::__thread_struct"*, %"class.std::__1::condition_variable"*, %"class.std::__1::mutex"*) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @pthread_cond_signal(%union.pthread_cond_t*) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @pthread_cond_broadcast(%union.pthread_cond_t*) local_unnamed_addr #8

declare i32 @pthread_cond_wait(%union.pthread_cond_t*, %union.pthread_mutex_t*) local_unnamed_addr #5

declare i32 @pthread_cond_timedwait(%union.pthread_cond_t*, %union.pthread_mutex_t*, %struct.timespec*) local_unnamed_addr #5

; Function Attrs: nounwind
declare i8* @pthread_getspecific(i32) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @pthread_setspecific(i32, i8*) local_unnamed_addr #8

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline noreturn nounwind }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind }
attributes #10 = { noreturn nounwind }
attributes #11 = { noreturn }
attributes #12 = { builtin allocsize(0) }
attributes #13 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !9, i64 8}
!5 = !{!"_ZTSNSt3__111unique_lockINS_5mutexEEE", !6, i64 0, !9, i64 8}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!"bool", !7, i64 0}
!10 = !{i8 0, i8 2}
!11 = !{!5, !6, i64 0}
!12 = !{!13, !14, i64 0}
!13 = !{!"_ZTS8timespec", !14, i64 0, !14, i64 8}
!14 = !{!"long", !7, i64 0}
!15 = !{!13, !14, i64 8}
!16 = !{!17, !18, i64 0}
!17 = !{!"_ZTSNSt3__121__thread_specific_ptrINS_15__thread_structEEE", !18, i64 0}
!18 = !{!"int", !7, i64 0}

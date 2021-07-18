; ModuleID = 'll/.thread.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/thread.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__thread_specific_ptr" = type { i32 }
%"class.std::__1::thread" = type { i64 }
%"class.std::__1::__thread_struct_imp" = type { %"class.std::__1::vector", %"class.std::__1::vector.3" }
%"class.std::__1::vector" = type { %"class.std::__1::__vector_base" }
%"class.std::__1::__vector_base" = type { %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__compressed_pair" }
%"class.std::__1::__assoc_sub_state" = type <{ %"class.std::__1::__shared_count", %"class.std::exception_ptr", %"class.std::__1::mutex", %"class.std::__1::condition_variable", i32, [4 x i8] }>
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::exception_ptr" = type { i8* }
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::condition_variable" = type { %union.pthread_cond_t }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"class.std::__1::__assoc_sub_state"** }
%"class.std::__1::vector.3" = type { %"class.std::__1::__vector_base.4" }
%"class.std::__1::__vector_base.4" = type { %"struct.std::__1::pair"*, %"struct.std::__1::pair"*, %"class.std::__1::__compressed_pair.5" }
%"struct.std::__1::pair" = type { %"class.std::__1::condition_variable"*, %"class.std::__1::mutex"* }
%"class.std::__1::__compressed_pair.5" = type { %"struct.std::__1::__compressed_pair_elem.6" }
%"struct.std::__1::__compressed_pair_elem.6" = type { %"struct.std::__1::pair"* }
%"class.std::__1::__thread_struct" = type { %"class.std::__1::__thread_struct_imp"* }
%"class.std::__1::chrono::duration" = type { i64 }
%struct.timespec = type { i64, i64 }
%"class.std::__1::__vector_base_common" = type { i8 }

$__clang_call_terminate = comdat any

$_ZNSt3__16vectorINS_4pairIPNS_18condition_variableEPNS_5mutexEEENS_18__hidden_allocatorIS6_EEED2Ev = comdat any

$_ZNSt3__16vectorIPNS_17__assoc_sub_stateENS_18__hidden_allocatorIS2_EEED2Ev = comdat any

$_ZNSt3__121__thread_specific_ptrINS_15__thread_structEE16__at_thread_exitEPv = comdat any

@.str = private unnamed_addr constant [20 x i8] c"thread::join failed\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"thread::detach failed\00", align 1
@_ZZNSt3__119__thread_local_dataEvE3__p = internal global %"class.std::__1::__thread_specific_ptr" zeroinitializer, align 4
@_ZGVZNSt3__119__thread_local_dataEvE3__p = internal global i64 0, align 8
@.str.2 = private unnamed_addr constant [42 x i8] c"__thread_specific_ptr construction failed\00", align 1

@_ZNSt3__16threadD1Ev = unnamed_addr alias void (%"class.std::__1::thread"*), void (%"class.std::__1::thread"*)* @_ZNSt3__16threadD2Ev
@_ZNSt3__119__thread_struct_impD1Ev = hidden unnamed_addr alias void (%"class.std::__1::__thread_struct_imp"*), void (%"class.std::__1::__thread_struct_imp"*)* @_ZNSt3__119__thread_struct_impD2Ev
@_ZNSt3__115__thread_structC1Ev = unnamed_addr alias void (%"class.std::__1::__thread_struct"*), void (%"class.std::__1::__thread_struct"*)* @_ZNSt3__115__thread_structC2Ev
@_ZNSt3__115__thread_structD1Ev = unnamed_addr alias void (%"class.std::__1::__thread_struct"*), void (%"class.std::__1::__thread_struct"*)* @_ZNSt3__115__thread_structD2Ev

; Function Attrs: nounwind uwtable
define void @_ZNSt3__16threadD2Ev(%"class.std::__1::thread"* nocapture readonly %0) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::thread", %"class.std::__1::thread"* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !4
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void @_ZSt9terminatev() #12
  unreachable

6:                                                ; preds = %1
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #1 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #13
  tail call void @_ZSt9terminatev() #12
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: uwtable
define void @_ZNSt3__16thread4joinEv(%"class.std::__1::thread"* nocapture %0) local_unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::thread", %"class.std::__1::thread"* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !4
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = tail call i32 @pthread_join(i64 %3, i8** null)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %1, %5
  %9 = phi i32 [ %6, %5 ], [ 22, %1 ]
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %9, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0)) #14
  unreachable

10:                                               ; preds = %5
  store i64 0, i64* %2, align 8, !tbaa !8
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: uwtable
define void @_ZNSt3__16thread6detachEv(%"class.std::__1::thread"* nocapture %0) local_unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::thread", %"class.std::__1::thread"* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !4
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = tail call i32 @pthread_detach(i64 %3) #13
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %1, %5
  %9 = phi i32 [ %6, %5 ], [ 22, %1 ]
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %9, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0)) #14
  unreachable

10:                                               ; preds = %5
  store i64 0, i64* %2, align 8, !tbaa !8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @_ZNSt3__16thread20hardware_concurrencyEv() local_unnamed_addr #0 align 2 {
  %1 = tail call i64 @sysconf(i32 84) #13
  %2 = icmp sgt i64 %1, 0
  %3 = select i1 %2, i64 %1, i64 0
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

; Function Attrs: nounwind
declare i64 @sysconf(i32) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_ZNSt3__111this_thread9sleep_forERKNS_6chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE(%"class.std::__1::chrono::duration"* nocapture nonnull readonly align 8 dereferenceable(8) %0) local_unnamed_addr #2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = alloca %struct.timespec, align 8
  %3 = getelementptr inbounds %"class.std::__1::chrono::duration", %"class.std::__1::chrono::duration"* %0, i64 0, i32 0
  %4 = load i64, i64* %3, align 8, !tbaa !10
  %5 = icmp sgt i64 %4, 0
  br i1 %5, label %6, label %21

6:                                                ; preds = %1
  %7 = bitcast %struct.timespec* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %7) #13
  %8 = udiv i64 %4, 1000000000
  %9 = mul nsw i64 %8, -1000000000
  %10 = add nsw i64 %9, %4
  %11 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 0
  store i64 %8, i64* %11, align 8
  %12 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 1
  store i64 %10, i64* %12, align 8
  br label %13

13:                                               ; preds = %16, %6
  %14 = call i32 @nanosleep(%struct.timespec* nonnull %2, %struct.timespec* nonnull %2)
  %15 = icmp eq i32 %14, -1
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = tail call i32* @__errno_location() #15
  %18 = load i32, i32* %17, align 4, !tbaa !13
  %19 = icmp eq i32 %18, 4
  br i1 %19, label %13, label %20

20:                                               ; preds = %13, %16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %7) #13
  br label %21

21:                                               ; preds = %20, %1
  ret void
}

; Function Attrs: uwtable
define nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv() local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__119__thread_local_dataEvE3__p to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %12, !prof !15

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__119__thread_local_dataEvE3__p) #13
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %12, label %6

6:                                                ; preds = %3
  %7 = tail call i32 @pthread_key_create(i32* getelementptr inbounds (%"class.std::__1::__thread_specific_ptr", %"class.std::__1::__thread_specific_ptr"* @_ZZNSt3__119__thread_local_dataEvE3__p, i64 0, i32 0), void (i8*)* nonnull @_ZNSt3__121__thread_specific_ptrINS_15__thread_structEE16__at_thread_exitEPv) #13
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %7, i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.2, i64 0, i64 0)) #14
          to label %10 unwind label %13

10:                                               ; preds = %9
  unreachable

11:                                               ; preds = %6
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__119__thread_local_dataEvE3__p) #13
  br label %12

12:                                               ; preds = %3, %11, %0
  ret %"class.std::__1::__thread_specific_ptr"* @_ZZNSt3__119__thread_local_dataEvE3__p

13:                                               ; preds = %9
  %14 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_guard_abort(i64* nonnull @_ZGVZNSt3__119__thread_local_dataEvE3__p) #13
  resume { i8*, i32 } %14
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare void @__cxa_guard_abort(i64*) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define hidden void @_ZNSt3__119__thread_struct_impD2Ev(%"class.std::__1::__thread_struct_imp"* %0) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 1
  %3 = getelementptr inbounds %"class.std::__1::vector.3", %"class.std::__1::vector.3"* %2, i64 0, i32 0, i32 0
  %4 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %3, align 8, !tbaa !16
  %5 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 1, i32 0, i32 1
  %6 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %5, align 8, !tbaa !20
  %7 = icmp eq %"struct.std::__1::pair"* %4, %6
  br i1 %7, label %8, label %14

8:                                                ; preds = %14, %1
  %9 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0, i32 0, i32 0
  %10 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %9, align 8, !tbaa !21
  %11 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0, i32 0, i32 1
  %12 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %11, align 8, !tbaa !24
  %13 = icmp eq %"class.std::__1::__assoc_sub_state"** %10, %12
  br i1 %13, label %22, label %37

14:                                               ; preds = %1, %14
  %15 = phi %"struct.std::__1::pair"* [ %20, %14 ], [ %4, %1 ]
  %16 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %15, i64 0, i32 1
  %17 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %16, align 8, !tbaa !25
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %17) #13
  %18 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %15, i64 0, i32 0
  %19 = load %"class.std::__1::condition_variable"*, %"class.std::__1::condition_variable"** %18, align 8, !tbaa !27
  tail call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* %19) #13
  %20 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %15, i64 1
  %21 = icmp eq %"struct.std::__1::pair"* %20, %6
  br i1 %21, label %8, label %14

22:                                               ; preds = %40, %8
  %23 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %3, align 8, !tbaa !16
  %24 = icmp eq %"struct.std::__1::pair"* %23, null
  br i1 %24, label %29, label %25

25:                                               ; preds = %22
  %26 = ptrtoint %"struct.std::__1::pair"* %23 to i64
  %27 = bitcast %"struct.std::__1::pair"** %5 to i64*
  store i64 %26, i64* %27, align 8, !tbaa !20
  %28 = bitcast %"struct.std::__1::pair"* %23 to i8*
  tail call void @_ZdlPv(i8* nonnull %28) #13
  br label %29

29:                                               ; preds = %22, %25
  %30 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %9, align 8, !tbaa !21
  %31 = icmp eq %"class.std::__1::__assoc_sub_state"** %30, null
  br i1 %31, label %36, label %32

32:                                               ; preds = %29
  %33 = ptrtoint %"class.std::__1::__assoc_sub_state"** %30 to i64
  %34 = bitcast %"class.std::__1::__assoc_sub_state"*** %11 to i64*
  store i64 %33, i64* %34, align 8, !tbaa !24
  %35 = bitcast %"class.std::__1::__assoc_sub_state"** %30 to i8*
  tail call void @_ZdlPv(i8* nonnull %35) #13
  br label %36

36:                                               ; preds = %29, %32
  ret void

37:                                               ; preds = %8, %40
  %38 = phi %"class.std::__1::__assoc_sub_state"** [ %44, %40 ], [ %10, %8 ]
  %39 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %38, align 8, !tbaa !28
  invoke void @_ZNSt3__117__assoc_sub_state12__make_readyEv(%"class.std::__1::__assoc_sub_state"* %39)
          to label %40 unwind label %46

40:                                               ; preds = %37
  %41 = bitcast %"class.std::__1::__assoc_sub_state"** %38 to %"class.std::__1::__shared_count"**
  %42 = load %"class.std::__1::__shared_count"*, %"class.std::__1::__shared_count"** %41, align 8, !tbaa !28
  %43 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %42) #13
  %44 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %38, i64 1
  %45 = icmp eq %"class.std::__1::__assoc_sub_state"** %44, %12
  br i1 %45, label %22, label %37

46:                                               ; preds = %37
  %47 = landingpad { i8*, i32 }
          catch i8* null
  %48 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0
  %49 = extractvalue { i8*, i32 } %47, 0
  tail call void @_ZNSt3__16vectorINS_4pairIPNS_18condition_variableEPNS_5mutexEEENS_18__hidden_allocatorIS6_EEED2Ev(%"class.std::__1::vector.3"* nonnull %2) #13
  tail call void @_ZNSt3__16vectorIPNS_17__assoc_sub_stateENS_18__hidden_allocatorIS2_EEED2Ev(%"class.std::__1::vector"* %48) #13
  tail call void @__clang_call_terminate(i8* %49) #12
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"*) local_unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"*) local_unnamed_addr #5

declare void @_ZNSt3__117__assoc_sub_state12__make_readyEv(%"class.std::__1::__assoc_sub_state"*) local_unnamed_addr #7

; Function Attrs: nounwind
declare zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__16vectorINS_4pairIPNS_18condition_variableEPNS_5mutexEEENS_18__hidden_allocatorIS6_EEED2Ev(%"class.std::__1::vector.3"* %0) unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.std::__1::vector.3", %"class.std::__1::vector.3"* %0, i64 0, i32 0, i32 0
  %3 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %2, align 8, !tbaa !16
  %4 = icmp eq %"struct.std::__1::pair"* %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = ptrtoint %"struct.std::__1::pair"* %3 to i64
  %7 = getelementptr inbounds %"class.std::__1::vector.3", %"class.std::__1::vector.3"* %0, i64 0, i32 0, i32 1
  %8 = bitcast %"struct.std::__1::pair"** %7 to i64*
  store i64 %6, i64* %8, align 8, !tbaa !20
  %9 = bitcast %"struct.std::__1::pair"* %3 to i8*
  tail call void @_ZdlPv(i8* nonnull %9) #13
  br label %10

10:                                               ; preds = %1, %5
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__16vectorIPNS_17__assoc_sub_stateENS_18__hidden_allocatorIS2_EEED2Ev(%"class.std::__1::vector"* %0) unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.std::__1::vector", %"class.std::__1::vector"* %0, i64 0, i32 0, i32 0
  %3 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %2, align 8, !tbaa !21
  %4 = icmp eq %"class.std::__1::__assoc_sub_state"** %3, null
  br i1 %4, label %10, label %5

5:                                                ; preds = %1
  %6 = ptrtoint %"class.std::__1::__assoc_sub_state"** %3 to i64
  %7 = getelementptr inbounds %"class.std::__1::vector", %"class.std::__1::vector"* %0, i64 0, i32 0, i32 1
  %8 = bitcast %"class.std::__1::__assoc_sub_state"*** %7 to i64*
  store i64 %6, i64* %8, align 8, !tbaa !24
  %9 = bitcast %"class.std::__1::__assoc_sub_state"** %3 to i8*
  tail call void @_ZdlPv(i8* nonnull %9) #13
  br label %10

10:                                               ; preds = %1, %5
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNSt3__119__thread_struct_imp25notify_all_at_thread_exitEPNS_18condition_variableEPNS_5mutexE(%"class.std::__1::__thread_struct_imp"* %0, %"class.std::__1::condition_variable"* %1, %"class.std::__1::mutex"* %2) local_unnamed_addr #2 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = ptrtoint %"class.std::__1::condition_variable"* %1 to i64
  %5 = ptrtoint %"class.std::__1::mutex"* %2 to i64
  %6 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 1
  %7 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 1, i32 0, i32 1
  %8 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %7, align 8, !tbaa !20
  %9 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 1, i32 0, i32 2, i32 0, i32 0
  %10 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %9, align 8, !tbaa !28
  %11 = icmp ult %"struct.std::__1::pair"* %8, %10
  %12 = ptrtoint %"struct.std::__1::pair"* %8 to i64
  %13 = ptrtoint %"struct.std::__1::pair"* %10 to i64
  br i1 %11, label %14, label %21

14:                                               ; preds = %3
  %15 = bitcast %"struct.std::__1::pair"* %8 to i64*
  store i64 %4, i64* %15, align 8, !tbaa.struct !29
  %16 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %8, i64 0, i32 1
  %17 = bitcast %"class.std::__1::mutex"** %16 to i64*
  store i64 %5, i64* %17, align 8, !tbaa.struct !29
  %18 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %8, i64 1
  %19 = ptrtoint %"struct.std::__1::pair"* %18 to i64
  %20 = bitcast %"struct.std::__1::pair"** %7 to i64*
  store i64 %19, i64* %20, align 8, !tbaa !20
  br label %75

21:                                               ; preds = %3
  %22 = bitcast %"struct.std::__1::pair"** %7 to i64*
  %23 = bitcast %"class.std::__1::vector.3"* %6 to i64*
  %24 = load i64, i64* %23, align 8, !tbaa !16
  %25 = sub i64 %12, %24
  %26 = ashr exact i64 %25, 4
  %27 = add nsw i64 %26, 1
  %28 = icmp ugt i64 %27, 1152921504606846975
  br i1 %28, label %29, label %31

29:                                               ; preds = %21
  %30 = bitcast %"class.std::__1::vector.3"* %6 to %"class.std::__1::__vector_base_common"*
  tail call void @_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__vector_base_common"* nonnull %30) #14
  unreachable

31:                                               ; preds = %21
  %32 = inttoptr i64 %24 to %"struct.std::__1::pair"*
  %33 = bitcast %"struct.std::__1::pair"** %9 to i64*
  %34 = sub i64 %13, %24
  %35 = ashr exact i64 %34, 4
  %36 = icmp ult i64 %35, 576460752303423487
  %37 = ashr exact i64 %34, 3
  %38 = icmp ult i64 %37, %27
  %39 = select i1 %38, i64 %27, i64 %37
  %40 = select i1 %36, i64 %39, i64 1152921504606846975
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %49, label %42

42:                                               ; preds = %31
  %43 = shl i64 %40, 4
  %44 = tail call noalias nonnull i8* @_Znwm(i64 %43) #16
  %45 = bitcast i8* %44 to %"struct.std::__1::pair"*
  %46 = getelementptr inbounds %"class.std::__1::vector.3", %"class.std::__1::vector.3"* %6, i64 0, i32 0, i32 0
  %47 = load %"struct.std::__1::pair"*, %"struct.std::__1::pair"** %46, align 8, !tbaa !16
  %48 = load i64, i64* %22, align 8, !tbaa !20
  br label %49

49:                                               ; preds = %42, %31
  %50 = phi %"struct.std::__1::pair"* [ %47, %42 ], [ %32, %31 ]
  %51 = phi i64 [ %48, %42 ], [ %12, %31 ]
  %52 = phi %"struct.std::__1::pair"* [ %45, %42 ], [ null, %31 ]
  %53 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %52, i64 %26
  %54 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %52, i64 %40
  %55 = ptrtoint %"struct.std::__1::pair"* %54 to i64
  %56 = bitcast %"struct.std::__1::pair"* %53 to i64*
  store i64 %4, i64* %56, align 8, !tbaa.struct !29
  %57 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %52, i64 %26, i32 1
  %58 = bitcast %"class.std::__1::mutex"** %57 to i64*
  store i64 %5, i64* %58, align 8, !tbaa.struct !29
  %59 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %53, i64 1
  %60 = ptrtoint %"struct.std::__1::pair"* %59 to i64
  %61 = ptrtoint %"struct.std::__1::pair"* %50 to i64
  %62 = sub i64 %51, %61
  %63 = ashr exact i64 %62, 4
  %64 = sub nsw i64 0, %63
  %65 = getelementptr inbounds %"struct.std::__1::pair", %"struct.std::__1::pair"* %53, i64 %64
  %66 = ptrtoint %"struct.std::__1::pair"* %65 to i64
  %67 = icmp sgt i64 %62, 0
  br i1 %67, label %68, label %71

68:                                               ; preds = %49
  %69 = bitcast %"struct.std::__1::pair"* %65 to i8*
  %70 = bitcast %"struct.std::__1::pair"* %50 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %69, i8* align 8 %70, i64 %62, i1 false) #13
  br label %71

71:                                               ; preds = %68, %49
  store i64 %66, i64* %23, align 8, !tbaa !28
  store i64 %60, i64* %22, align 8, !tbaa !28
  store i64 %55, i64* %33, align 8, !tbaa !28
  %72 = icmp eq %"struct.std::__1::pair"* %50, null
  br i1 %72, label %75, label %73

73:                                               ; preds = %71
  %74 = bitcast %"struct.std::__1::pair"* %50 to i8*
  tail call void @_ZdlPv(i8* nonnull %74) #13
  br label %75

75:                                               ; preds = %14, %71, %73
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNSt3__119__thread_struct_imp27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct_imp"* %0, %"class.std::__1::__assoc_sub_state"* %1) local_unnamed_addr #2 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = ptrtoint %"class.std::__1::__assoc_sub_state"* %1 to i64
  %4 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0, i32 0, i32 1
  %5 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %4, align 8, !tbaa !24
  %6 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %7 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %6, align 8, !tbaa !28
  %8 = icmp eq %"class.std::__1::__assoc_sub_state"** %5, %7
  %9 = ptrtoint %"class.std::__1::__assoc_sub_state"** %5 to i64
  %10 = ptrtoint %"class.std::__1::__assoc_sub_state"** %7 to i64
  br i1 %8, label %16, label %11

11:                                               ; preds = %2
  %12 = bitcast %"class.std::__1::__assoc_sub_state"** %5 to i64*
  store i64 %3, i64* %12, align 8, !tbaa !28
  %13 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %5, i64 1
  %14 = ptrtoint %"class.std::__1::__assoc_sub_state"** %13 to i64
  %15 = bitcast %"class.std::__1::__assoc_sub_state"*** %4 to i64*
  store i64 %14, i64* %15, align 8, !tbaa !24
  br label %68

16:                                               ; preds = %2
  %17 = bitcast %"class.std::__1::__assoc_sub_state"*** %4 to i64*
  %18 = bitcast %"class.std::__1::__thread_struct_imp"* %0 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !21
  %20 = sub i64 %9, %19
  %21 = ashr exact i64 %20, 3
  %22 = add nsw i64 %21, 1
  %23 = icmp ugt i64 %22, 2305843009213693951
  br i1 %23, label %24, label %26

24:                                               ; preds = %16
  %25 = bitcast %"class.std::__1::__thread_struct_imp"* %0 to %"class.std::__1::__vector_base_common"*
  tail call void @_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__vector_base_common"* %25) #14
  unreachable

26:                                               ; preds = %16
  %27 = inttoptr i64 %19 to %"class.std::__1::__assoc_sub_state"**
  %28 = bitcast %"class.std::__1::__assoc_sub_state"*** %6 to i64*
  %29 = sub i64 %10, %19
  %30 = ashr exact i64 %29, 3
  %31 = icmp ult i64 %30, 1152921504606846975
  %32 = ashr exact i64 %29, 2
  %33 = icmp ult i64 %32, %22
  %34 = select i1 %33, i64 %22, i64 %32
  %35 = select i1 %31, i64 %34, i64 2305843009213693951
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %44, label %37

37:                                               ; preds = %26
  %38 = shl i64 %35, 3
  %39 = tail call noalias nonnull i8* @_Znwm(i64 %38) #16
  %40 = bitcast i8* %39 to %"class.std::__1::__assoc_sub_state"**
  %41 = getelementptr inbounds %"class.std::__1::__thread_struct_imp", %"class.std::__1::__thread_struct_imp"* %0, i64 0, i32 0, i32 0, i32 0
  %42 = load %"class.std::__1::__assoc_sub_state"**, %"class.std::__1::__assoc_sub_state"*** %41, align 8, !tbaa !21
  %43 = load i64, i64* %17, align 8, !tbaa !24
  br label %44

44:                                               ; preds = %37, %26
  %45 = phi %"class.std::__1::__assoc_sub_state"** [ %42, %37 ], [ %27, %26 ]
  %46 = phi i64 [ %43, %37 ], [ %9, %26 ]
  %47 = phi %"class.std::__1::__assoc_sub_state"** [ %40, %37 ], [ null, %26 ]
  %48 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %47, i64 %21
  %49 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %47, i64 %35
  %50 = ptrtoint %"class.std::__1::__assoc_sub_state"** %49 to i64
  %51 = bitcast %"class.std::__1::__assoc_sub_state"** %48 to i64*
  store i64 %3, i64* %51, align 8, !tbaa !28
  %52 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %48, i64 1
  %53 = ptrtoint %"class.std::__1::__assoc_sub_state"** %52 to i64
  %54 = ptrtoint %"class.std::__1::__assoc_sub_state"** %45 to i64
  %55 = sub i64 %46, %54
  %56 = ashr exact i64 %55, 3
  %57 = sub nsw i64 0, %56
  %58 = getelementptr inbounds %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %48, i64 %57
  %59 = ptrtoint %"class.std::__1::__assoc_sub_state"** %58 to i64
  %60 = icmp sgt i64 %55, 0
  br i1 %60, label %61, label %64

61:                                               ; preds = %44
  %62 = bitcast %"class.std::__1::__assoc_sub_state"** %58 to i8*
  %63 = bitcast %"class.std::__1::__assoc_sub_state"** %45 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %62, i8* align 8 %63, i64 %55, i1 false) #13
  br label %64

64:                                               ; preds = %61, %44
  store i64 %59, i64* %18, align 8, !tbaa !28
  store i64 %53, i64* %17, align 8, !tbaa !28
  store i64 %50, i64* %28, align 8, !tbaa !28
  %65 = icmp eq %"class.std::__1::__assoc_sub_state"** %45, null
  br i1 %65, label %68, label %66

66:                                               ; preds = %64
  %67 = bitcast %"class.std::__1::__assoc_sub_state"** %45 to i8*
  tail call void @_ZdlPv(i8* nonnull %67) #13
  br label %68

68:                                               ; preds = %11, %64, %66
  %69 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %1, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"* %69) #13
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"*) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_ZNSt3__115__thread_structC2Ev(%"class.std::__1::__thread_struct"* nocapture %0) unnamed_addr #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call noalias nonnull dereferenceable(48) i8* @_Znwm(i64 48) #17
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) %2, i8 0, i64 48, i1 false) #13
  %3 = bitcast %"class.std::__1::__thread_struct"* %0 to i8**
  store i8* %2, i8** %3, align 8, !tbaa !30
  ret void
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #8

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define void @_ZNSt3__115__thread_structD2Ev(%"class.std::__1::__thread_struct"* nocapture readonly %0) unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__thread_struct", %"class.std::__1::__thread_struct"* %0, i64 0, i32 0
  %3 = load %"class.std::__1::__thread_struct_imp"*, %"class.std::__1::__thread_struct_imp"** %2, align 8, !tbaa !30
  %4 = icmp eq %"class.std::__1::__thread_struct_imp"* %3, null
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  tail call void @_ZNSt3__119__thread_struct_impD2Ev(%"class.std::__1::__thread_struct_imp"* nonnull %3) #13
  %6 = bitcast %"class.std::__1::__thread_struct_imp"* %3 to i8*
  tail call void @_ZdlPv(i8* %6) #18
  br label %7

7:                                                ; preds = %5, %1
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__115__thread_struct25notify_all_at_thread_exitEPNS_18condition_variableEPNS_5mutexE(%"class.std::__1::__thread_struct"* nocapture readonly %0, %"class.std::__1::condition_variable"* %1, %"class.std::__1::mutex"* %2) local_unnamed_addr #2 align 2 {
  %4 = getelementptr inbounds %"class.std::__1::__thread_struct", %"class.std::__1::__thread_struct"* %0, i64 0, i32 0
  %5 = load %"class.std::__1::__thread_struct_imp"*, %"class.std::__1::__thread_struct_imp"** %4, align 8, !tbaa !30
  tail call void @_ZNSt3__119__thread_struct_imp25notify_all_at_thread_exitEPNS_18condition_variableEPNS_5mutexE(%"class.std::__1::__thread_struct_imp"* %5, %"class.std::__1::condition_variable"* %1, %"class.std::__1::mutex"* %2)
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__115__thread_struct27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct"* nocapture readonly %0, %"class.std::__1::__assoc_sub_state"* %1) local_unnamed_addr #2 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::__thread_struct", %"class.std::__1::__thread_struct"* %0, i64 0, i32 0
  %4 = load %"class.std::__1::__thread_struct_imp"*, %"class.std::__1::__thread_struct_imp"** %3, align 8, !tbaa !30
  tail call void @_ZNSt3__119__thread_struct_imp27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct_imp"* %4, %"class.std::__1::__assoc_sub_state"* %1)
  ret void
}

declare i32 @pthread_join(i64, i8**) local_unnamed_addr #7

; Function Attrs: nounwind
declare i32 @pthread_detach(i64) local_unnamed_addr #5

declare i32 @nanosleep(%struct.timespec*, %struct.timespec*) local_unnamed_addr #7

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #10

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__121__thread_specific_ptrINS_15__thread_structEE16__at_thread_exitEPv(i8* %0) #0 comdat align 2 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %10, label %3

3:                                                ; preds = %1
  %4 = bitcast i8* %0 to %"class.std::__1::__thread_struct_imp"**
  %5 = load %"class.std::__1::__thread_struct_imp"*, %"class.std::__1::__thread_struct_imp"** %4, align 8, !tbaa !30
  %6 = icmp eq %"class.std::__1::__thread_struct_imp"* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  tail call void @_ZNSt3__119__thread_struct_impD2Ev(%"class.std::__1::__thread_struct_imp"* nonnull %5) #13
  %8 = bitcast %"class.std::__1::__thread_struct_imp"* %5 to i8*
  tail call void @_ZdlPv(i8* %8) #18
  br label %9

9:                                                ; preds = %3, %7
  tail call void @_ZdlPv(i8* nonnull %0) #18
  br label %10

10:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_key_create(i32*, void (i8*)*) local_unnamed_addr #5

; Function Attrs: noreturn
declare void @_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__vector_base_common"*) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #11

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline noreturn nounwind }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nofree nounwind }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { argmemonly nounwind willreturn writeonly }
attributes #12 = { noreturn nounwind }
attributes #13 = { nounwind }
attributes #14 = { noreturn }
attributes #15 = { nounwind readnone }
attributes #16 = { allocsize(0) }
attributes #17 = { builtin allocsize(0) }
attributes #18 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"_ZTSNSt3__16threadE", !5, i64 0}
!10 = !{!11, !12, i64 0}
!11 = !{!"_ZTSNSt3__16chrono8durationIxNS_5ratioILl1ELl1000000000EEEEE", !12, i64 0}
!12 = !{!"long long", !6, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !6, i64 0}
!15 = !{!"branch_weights", i32 1, i32 1048575}
!16 = !{!17, !18, i64 0}
!17 = !{!"_ZTSNSt3__113__vector_baseINS_4pairIPNS_18condition_variableEPNS_5mutexEEENS_18__hidden_allocatorIS6_EEEE", !18, i64 0, !18, i64 8, !19, i64 16}
!18 = !{!"any pointer", !6, i64 0}
!19 = !{!"_ZTSNSt3__117__compressed_pairIPNS_4pairIPNS_18condition_variableEPNS_5mutexEEENS_18__hidden_allocatorIS6_EEEE"}
!20 = !{!17, !18, i64 8}
!21 = !{!22, !18, i64 0}
!22 = !{!"_ZTSNSt3__113__vector_baseIPNS_17__assoc_sub_stateENS_18__hidden_allocatorIS2_EEEE", !18, i64 0, !18, i64 8, !23, i64 16}
!23 = !{!"_ZTSNSt3__117__compressed_pairIPPNS_17__assoc_sub_stateENS_18__hidden_allocatorIS2_EEEE"}
!24 = !{!22, !18, i64 8}
!25 = !{!26, !18, i64 8}
!26 = !{!"_ZTSNSt3__14pairIPNS_18condition_variableEPNS_5mutexEEE", !18, i64 0, !18, i64 8}
!27 = !{!26, !18, i64 0}
!28 = !{!18, !18, i64 0}
!29 = !{i64 0, i64 8, !28, i64 8, i64 8, !28}
!30 = !{!31, !18, i64 0}
!31 = !{!"_ZTSNSt3__115__thread_structE", !18, i64 0}

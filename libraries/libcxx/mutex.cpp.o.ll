; ModuleID = 'll/.mutex.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/mutex.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.std::__1::defer_lock_t" = type { i8 }
%"struct.std::__1::try_to_lock_t" = type { i8 }
%"struct.std::__1::adopt_lock_t" = type { i8 }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%"class.std::__1::recursive_mutex" = type { %union.pthread_mutex_t }
%"class.std::__1::timed_mutex" = type <{ %"class.std::__1::mutex", %"class.std::__1::condition_variable", i8, [7 x i8] }>
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%"class.std::__1::condition_variable" = type { %union.pthread_cond_t }
%"class.std::__1::recursive_timed_mutex" = type { %"class.std::__1::mutex", %"class.std::__1::condition_variable", i64, %"class.std::__1::__thread_id" }
%"class.std::__1::__thread_id" = type { i64 }
%union.pthread_mutexattr_t = type { i32 }
%"class.std::__1::unique_lock" = type <{ %"class.std::__1::mutex"*, i8, [7 x i8] }>

$__clang_call_terminate = comdat any

@_ZNSt3__110defer_lockE = local_unnamed_addr constant %"struct.std::__1::defer_lock_t" zeroinitializer, align 1
@_ZNSt3__111try_to_lockE = local_unnamed_addr constant %"struct.std::__1::try_to_lock_t" zeroinitializer, align 1
@_ZNSt3__110adopt_lockE = local_unnamed_addr constant %"struct.std::__1::adopt_lock_t" zeroinitializer, align 1
@.str = private unnamed_addr constant [18 x i8] c"mutex lock failed\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"recursive_mutex constructor failed\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"recursive_mutex lock failed\00", align 1
@.str.3 = private unnamed_addr constant [41 x i8] c"recursive_timed_mutex lock limit reached\00", align 1
@_ZNSt3__1L3mutE = internal global %union.pthread_mutex_t zeroinitializer, align 8
@_ZNSt3__1L2cvE = internal global %union.pthread_cond_t zeroinitializer, align 8

@_ZNSt3__115recursive_mutexC1Ev = unnamed_addr alias void (%"class.std::__1::recursive_mutex"*), void (%"class.std::__1::recursive_mutex"*)* @_ZNSt3__115recursive_mutexC2Ev
@_ZNSt3__115recursive_mutexD1Ev = unnamed_addr alias void (%"class.std::__1::recursive_mutex"*), void (%"class.std::__1::recursive_mutex"*)* @_ZNSt3__115recursive_mutexD2Ev
@_ZNSt3__111timed_mutexC1Ev = unnamed_addr alias void (%"class.std::__1::timed_mutex"*), void (%"class.std::__1::timed_mutex"*)* @_ZNSt3__111timed_mutexC2Ev
@_ZNSt3__111timed_mutexD1Ev = unnamed_addr alias void (%"class.std::__1::timed_mutex"*), void (%"class.std::__1::timed_mutex"*)* @_ZNSt3__111timed_mutexD2Ev
@_ZNSt3__121recursive_timed_mutexC1Ev = unnamed_addr alias void (%"class.std::__1::recursive_timed_mutex"*), void (%"class.std::__1::recursive_timed_mutex"*)* @_ZNSt3__121recursive_timed_mutexC2Ev
@_ZNSt3__121recursive_timed_mutexD1Ev = unnamed_addr alias void (%"class.std::__1::recursive_timed_mutex"*), void (%"class.std::__1::recursive_timed_mutex"*)* @_ZNSt3__121recursive_timed_mutexD2Ev

; Function Attrs: uwtable
define void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* %0) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
  unreachable

6:                                                ; preds = %1
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNSt3__15mutex8try_lockEv(%"class.std::__1::mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %2) #10
  %4 = icmp eq i32 %3, 0
  ret i1 %4
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #4 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #10
  tail call void @_ZSt9terminatev() #12
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind uwtable
define void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2) #10
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__115recursive_mutexC2Ev(%"class.std::__1::recursive_mutex"* %0) unnamed_addr #0 align 2 {
  %2 = alloca %union.pthread_mutexattr_t, align 4
  %3 = getelementptr inbounds %"class.std::__1::recursive_mutex", %"class.std::__1::recursive_mutex"* %0, i64 0, i32 0
  %4 = bitcast %union.pthread_mutexattr_t* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #10
  %5 = call i32 @pthread_mutexattr_init(%union.pthread_mutexattr_t* nonnull %2) #10
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %20

7:                                                ; preds = %1
  %8 = call i32 @pthread_mutexattr_settype(%union.pthread_mutexattr_t* nonnull %2, i32 1) #10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = call i32 @pthread_mutexattr_destroy(%union.pthread_mutexattr_t* nonnull %2) #10
  br label %20

12:                                               ; preds = %7
  %13 = call i32 @pthread_mutex_init(%union.pthread_mutex_t* %3, %union.pthread_mutexattr_t* nonnull %2) #10
  %14 = icmp eq i32 %13, 0
  %15 = call i32 @pthread_mutexattr_destroy(%union.pthread_mutexattr_t* nonnull %2) #10
  br i1 %14, label %16, label %20

16:                                               ; preds = %12
  %17 = icmp eq i32 %15, 0
  br i1 %17, label %22, label %18

18:                                               ; preds = %16
  %19 = call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* %3) #10
  br label %20

20:                                               ; preds = %10, %18, %1, %12
  %21 = phi i32 [ %13, %12 ], [ %5, %1 ], [ %15, %18 ], [ %8, %10 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #10
  call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %21, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0)) #11
  unreachable

22:                                               ; preds = %16
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #10
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__115recursive_mutexD2Ev(%"class.std::__1::recursive_mutex"* %0) unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::recursive_mutex", %"class.std::__1::recursive_mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_destroy(%union.pthread_mutex_t* %2) #10
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__115recursive_mutex4lockEv(%"class.std::__1::recursive_mutex"* %0) local_unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::recursive_mutex", %"class.std::__1::recursive_mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %1
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0)) #11
  unreachable

6:                                                ; preds = %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__115recursive_mutex6unlockEv(%"class.std::__1::recursive_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::recursive_mutex", %"class.std::__1::recursive_mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2) #10
  ret void
}

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNSt3__115recursive_mutex8try_lockEv(%"class.std::__1::recursive_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::recursive_mutex", %"class.std::__1::recursive_mutex"* %0, i64 0, i32 0
  %3 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %2) #10
  %4 = icmp eq i32 %3, 0
  ret i1 %4
}

; Function Attrs: nounwind uwtable writeonly
define void @_ZNSt3__111timed_mutexC2Ev(%"class.std::__1::timed_mutex"* nocapture %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::timed_mutex"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(89) %2, i8 0, i64 89, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__111timed_mutexD2Ev(%"class.std::__1::timed_mutex"* %0) unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
          to label %6 unwind label %10

6:                                                ; preds = %5
  unreachable

7:                                                ; preds = %1
  %8 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2) #10
  %9 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %9) #10
  ret void

10:                                               ; preds = %5
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  %13 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %13) #10
  tail call void @__clang_call_terminate(i8* %12) #12
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"*) unnamed_addr #6

; Function Attrs: uwtable
define void @_ZNSt3__111timed_mutex4lockEv(%"class.std::__1::timed_mutex"* %0) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #10
  %4 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !10
  %7 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 0, i32 0
  %8 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %7) #10
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 2
  %12 = load i8, i8* %11, align 8, !tbaa !11, !range !15
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %10
  store i8 1, i8* %11, align 8, !tbaa !11
  br label %24

15:                                               ; preds = %10
  %16 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 1
  br label %18

17:                                               ; preds = %1
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %8, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
  unreachable

18:                                               ; preds = %15, %18
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %16, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #10
  %19 = load i8, i8* %11, align 8, !tbaa !11, !range !15
  %20 = icmp eq i8 %19, 0
  br i1 %20, label %21, label %18

21:                                               ; preds = %18
  %22 = load i8, i8* %6, align 8, !tbaa !10, !range !15
  %23 = icmp eq i8 %22, 0
  store i8 1, i8* %11, align 8, !tbaa !11
  br i1 %23, label %28, label %24

24:                                               ; preds = %14, %21
  %25 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %26 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %25, i64 0, i32 0
  %27 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %26) #10
  br label %28

28:                                               ; preds = %21, %24
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #10
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"*, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9)) local_unnamed_addr #6

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNSt3__111timed_mutex8try_lockEv(%"class.std::__1::timed_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 0, i32 0
  %3 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* nonnull %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %13

5:                                                ; preds = %1
  %6 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 2
  %7 = load i8, i8* %6, align 8, !tbaa !11, !range !15
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %5
  store i8 1, i8* %6, align 8, !tbaa !11
  br label %10

10:                                               ; preds = %5, %9
  %11 = phi i1 [ false, %5 ], [ true, %9 ]
  %12 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull %2) #10
  br label %13

13:                                               ; preds = %1, %10
  %14 = phi i1 [ %11, %10 ], [ false, %1 ]
  ret i1 %14
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__111timed_mutex6unlockEv(%"class.std::__1::timed_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
          to label %6 unwind label %11

6:                                                ; preds = %5
  unreachable

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 2
  store i8 0, i8* %8, align 8, !tbaa !11
  %9 = getelementptr inbounds %"class.std::__1::timed_mutex", %"class.std::__1::timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %9) #10
  %10 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2) #10
  ret void

11:                                               ; preds = %5
  %12 = landingpad { i8*, i32 }
          catch i8* null
  %13 = extractvalue { i8*, i32 } %12, 0
  tail call void @__clang_call_terminate(i8* %13) #12
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"*) local_unnamed_addr #6

; Function Attrs: nounwind uwtable writeonly
define void @_ZNSt3__121recursive_timed_mutexC2Ev(%"class.std::__1::recursive_timed_mutex"* nocapture %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::recursive_timed_mutex"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(104) %2, i8 0, i64 104, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__121recursive_timed_mutexD2Ev(%"class.std::__1::recursive_timed_mutex"* %0) unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
          to label %6 unwind label %10

6:                                                ; preds = %5
  unreachable

7:                                                ; preds = %1
  %8 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %2) #10
  %9 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %9) #10
  ret void

10:                                               ; preds = %5
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  %13 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %13) #10
  tail call void @__clang_call_terminate(i8* %12) #12
  unreachable
}

; Function Attrs: uwtable
define void @_ZNSt3__121recursive_timed_mutex4lockEv(%"class.std::__1::recursive_timed_mutex"* %0) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = tail call i64 @pthread_self() #13
  %4 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #10
  %5 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 0
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %5, %"class.std::__1::mutex"** %6, align 8, !tbaa !4
  %7 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %7, align 8, !tbaa !10
  %8 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 0, i32 0
  %9 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %8) #10
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %11

11:                                               ; preds = %1
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %9, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
  unreachable

12:                                               ; preds = %1
  %13 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 3, i32 0
  %14 = load i64, i64* %13, align 8, !tbaa.struct !16
  %15 = icmp eq i64 %3, 0
  %16 = icmp eq i64 %14, 0
  %17 = or i1 %15, %16
  %18 = or i64 %14, %3
  %19 = icmp eq i64 %18, 0
  %20 = icmp eq i64 %3, %14
  %21 = select i1 %17, i1 %19, i1 %20
  %22 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 2
  %23 = load i64, i64* %22, align 8, !tbaa !19
  br i1 %21, label %29, label %24

24:                                               ; preds = %12
  %25 = icmp eq i64 %23, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %24
  store i64 1, i64* %22, align 8, !tbaa !19
  store i64 %3, i64* %13, align 8, !tbaa.struct !16
  br label %50

27:                                               ; preds = %24
  %28 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 1
  br label %44

29:                                               ; preds = %12
  %30 = icmp eq i64 %23, -1
  br i1 %30, label %31, label %42

31:                                               ; preds = %29
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 11, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.3, i64 0, i64 0)) #11
          to label %32 unwind label %33

32:                                               ; preds = %31
  unreachable

33:                                               ; preds = %31
  %34 = landingpad { i8*, i32 }
          cleanup
  %35 = load i8, i8* %7, align 8, !tbaa !10, !range !15
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %41, label %37

37:                                               ; preds = %33
  %38 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %6, align 8, !tbaa !4
  %39 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %38, i64 0, i32 0
  %40 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %39) #10
  br label %41

41:                                               ; preds = %33, %37
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #10
  resume { i8*, i32 } %34

42:                                               ; preds = %29
  %43 = add nuw i64 %23, 1
  store i64 %43, i64* %22, align 8, !tbaa !19
  br label %50

44:                                               ; preds = %27, %44
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %28, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #10
  %45 = load i64, i64* %22, align 8, !tbaa !19
  %46 = icmp eq i64 %45, 0
  br i1 %46, label %47, label %44

47:                                               ; preds = %44
  %48 = load i8, i8* %7, align 8, !tbaa !10, !range !15
  store i64 1, i64* %22, align 8, !tbaa !19
  store i64 %3, i64* %13, align 8, !tbaa.struct !16
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %54, label %50

50:                                               ; preds = %26, %42, %47
  %51 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %6, align 8, !tbaa !4
  %52 = getelementptr inbounds %"class.std::__1::mutex", %"class.std::__1::mutex"* %51, i64 0, i32 0
  %53 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %52) #10
  br label %54

54:                                               ; preds = %47, %50
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #10
  ret void
}

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNSt3__121recursive_timed_mutex8try_lockEv(%"class.std::__1::recursive_timed_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i64 @pthread_self() #13
  %3 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 0, i32 0
  %4 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* nonnull %3) #10
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %28

6:                                                ; preds = %1
  %7 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 2
  %8 = load i64, i64* %7, align 8, !tbaa !19
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %22, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 3, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa.struct !16
  %13 = icmp eq i64 %2, 0
  %14 = icmp eq i64 %12, 0
  %15 = or i1 %13, %14
  %16 = or i64 %12, %2
  %17 = icmp ne i64 %16, 0
  %18 = icmp ne i64 %2, %12
  %19 = select i1 %15, i1 %17, i1 %18
  %20 = icmp eq i64 %8, -1
  %21 = or i1 %20, %19
  br i1 %21, label %25, label %22

22:                                               ; preds = %10, %6
  %23 = add nuw i64 %8, 1
  store i64 %23, i64* %7, align 8, !tbaa !19
  %24 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 3, i32 0
  store i64 %2, i64* %24, align 8, !tbaa.struct !16
  br label %25

25:                                               ; preds = %10, %22
  %26 = phi i1 [ false, %10 ], [ true, %22 ]
  %27 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull %3) #10
  br label %28

28:                                               ; preds = %1, %25
  %29 = phi i1 [ %26, %25 ], [ false, %1 ]
  ret i1 %29
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__121recursive_timed_mutex6unlockEv(%"class.std::__1::recursive_timed_mutex"* %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 0, i32 0
  %3 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull %2) #10
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %3, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)) #11
          to label %6 unwind label %19

6:                                                ; preds = %5
  unreachable

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 2
  %9 = load i64, i64* %8, align 8, !tbaa !19
  %10 = add i64 %9, -1
  store i64 %10, i64* %8, align 8, !tbaa !19
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %16

12:                                               ; preds = %7
  %13 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 3, i32 0
  store i64 0, i64* %13, align 8, !tbaa !22
  %14 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull %2) #10
  %15 = getelementptr inbounds %"class.std::__1::recursive_timed_mutex", %"class.std::__1::recursive_timed_mutex"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %15) #10
  br label %18

16:                                               ; preds = %7
  %17 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull %2) #10
  br label %18

18:                                               ; preds = %12, %16
  ret void

19:                                               ; preds = %5
  %20 = landingpad { i8*, i32 }
          catch i8* null
  %21 = extractvalue { i8*, i32 } %20, 0
  tail call void @__clang_call_terminate(i8* %21) #12
  unreachable
}

; Function Attrs: uwtable
define void @_ZNSt3__111__call_onceERVmPvPFvS2_E(i64* nonnull align 8 dereferenceable(8) %0, i8* %1, void (i8*)* nocapture %2) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  %5 = load volatile i64, i64* %0, align 8, !tbaa !17
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %7, label %11

7:                                                ; preds = %3, %7
  %8 = tail call i32 @pthread_cond_wait(%union.pthread_cond_t* nonnull @_ZNSt3__1L2cvE, %union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE)
  %9 = load volatile i64, i64* %0, align 8, !tbaa !17
  %10 = icmp eq i64 %9, 1
  br i1 %10, label %7, label %11

11:                                               ; preds = %7, %3
  %12 = load volatile i64, i64* %0, align 8, !tbaa !17
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %29

14:                                               ; preds = %11
  store atomic volatile i64 1, i64* %0 monotonic, align 8
  %15 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  invoke void %2(i8* %1)
          to label %16 unwind label %20

16:                                               ; preds = %14
  %17 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  store atomic volatile i64 -1, i64* %0 release, align 8
  %18 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  %19 = tail call i32 @pthread_cond_broadcast(%union.pthread_cond_t* nonnull @_ZNSt3__1L2cvE) #10
  br label %31

20:                                               ; preds = %14
  %21 = landingpad { i8*, i32 }
          catch i8* null
  %22 = extractvalue { i8*, i32 } %21, 0
  %23 = tail call i8* @__cxa_begin_catch(i8* %22) #10
  %24 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  store atomic volatile i64 0, i64* %0 monotonic, align 8
  %25 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  %26 = tail call i32 @pthread_cond_broadcast(%union.pthread_cond_t* nonnull @_ZNSt3__1L2cvE) #10
  invoke void @__cxa_rethrow() #11
          to label %36 unwind label %27

27:                                               ; preds = %20
  %28 = landingpad { i8*, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %32 unwind label %33

29:                                               ; preds = %11
  %30 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L3mutE) #10
  br label %31

31:                                               ; preds = %29, %16
  ret void

32:                                               ; preds = %27
  resume { i8*, i32 } %28

33:                                               ; preds = %27
  %34 = landingpad { i8*, i32 }
          catch i8* null
  %35 = extractvalue { i8*, i32 } %34, 0
  tail call void @__clang_call_terminate(i8* %35) #12
  unreachable

36:                                               ; preds = %20
  unreachable
}

declare void @__cxa_rethrow() local_unnamed_addr

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutex_trylock(%union.pthread_mutex_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutexattr_init(%union.pthread_mutexattr_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutexattr_settype(%union.pthread_mutexattr_t*, i32) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutexattr_destroy(%union.pthread_mutexattr_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutex_init(%union.pthread_mutex_t*, %union.pthread_mutexattr_t*) local_unnamed_addr #6

; Function Attrs: nounwind
declare i32 @pthread_mutex_destroy(%union.pthread_mutex_t*) local_unnamed_addr #6

; Function Attrs: nounwind readnone
declare i64 @pthread_self() local_unnamed_addr #7

declare i32 @pthread_cond_wait(%union.pthread_cond_t*, %union.pthread_mutex_t*) local_unnamed_addr #8

; Function Attrs: nounwind
declare i32 @pthread_cond_broadcast(%union.pthread_cond_t*) local_unnamed_addr #6

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #9

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { argmemonly nounwind willreturn writeonly }
attributes #10 = { nounwind }
attributes #11 = { noreturn }
attributes #12 = { noreturn nounwind }
attributes #13 = { nounwind readnone }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !6, i64 0}
!5 = !{!"_ZTSNSt3__111unique_lockINS_5mutexEEE", !6, i64 0, !9, i64 8}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!"bool", !7, i64 0}
!10 = !{!5, !9, i64 8}
!11 = !{!12, !9, i64 88}
!12 = !{!"_ZTSNSt3__111timed_mutexE", !13, i64 0, !14, i64 40, !9, i64 88}
!13 = !{!"_ZTSNSt3__15mutexE", !7, i64 0}
!14 = !{!"_ZTSNSt3__118condition_variableE", !7, i64 0}
!15 = !{i8 0, i8 2}
!16 = !{i64 0, i64 8, !17}
!17 = !{!18, !18, i64 0}
!18 = !{!"long", !7, i64 0}
!19 = !{!20, !18, i64 88}
!20 = !{!"_ZTSNSt3__121recursive_timed_mutexE", !13, i64 0, !14, i64 40, !18, i64 88, !21, i64 96}
!21 = !{!"_ZTSNSt3__111__thread_idE", !18, i64 0}
!22 = !{!21, !18, i64 0}

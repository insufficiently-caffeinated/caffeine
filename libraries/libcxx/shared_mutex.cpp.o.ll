; ModuleID = 'll/.shared_mutex.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/shared_mutex.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.std::__1::__shared_mutex_base" = type <{ %"class.std::__1::mutex", %"class.std::__1::condition_variable", %"class.std::__1::condition_variable", i32, [4 x i8] }>
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::condition_variable" = type { %union.pthread_cond_t }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon, %union.anon.0, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon = type { i64 }
%union.anon.0 = type { i64 }
%"class.std::__1::shared_timed_mutex" = type { %"struct.std::__1::__shared_mutex_base" }
%"class.std::__1::unique_lock" = type <{ %"class.std::__1::mutex"*, i8, [7 x i8] }>

@_ZNSt3__119__shared_mutex_baseC1Ev = unnamed_addr alias void (%"struct.std::__1::__shared_mutex_base"*), void (%"struct.std::__1::__shared_mutex_base"*)* @_ZNSt3__119__shared_mutex_baseC2Ev
@_ZNSt3__118shared_timed_mutexC1Ev = unnamed_addr alias void (%"class.std::__1::shared_timed_mutex"*), void (%"class.std::__1::shared_timed_mutex"*)* @_ZNSt3__118shared_timed_mutexC2Ev

; Function Attrs: nounwind uwtable writeonly
define void @_ZNSt3__119__shared_mutex_baseC2Ev(%"struct.std::__1::__shared_mutex_base"* nocapture %0) unnamed_addr #0 align 2 {
  %2 = bitcast %"struct.std::__1::__shared_mutex_base"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(140) %2, i8 0, i64 140, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__119__shared_mutex_base4lockEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #6
  %4 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !10
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %7 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  %8 = load i32, i32* %7, align 8, !tbaa !11
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %15, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 1
  br label %12

12:                                               ; preds = %10, %12
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %11, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %13 = load i32, i32* %7, align 8, !tbaa !11
  %14 = icmp sgt i32 %13, -1
  br i1 %14, label %15, label %12

15:                                               ; preds = %12, %1
  %16 = phi i32 [ %8, %1 ], [ %13, %12 ]
  %17 = or i32 %16, -2147483648
  store i32 %17, i32* %7, align 8, !tbaa !11
  %18 = icmp eq i32 %16, 0
  br i1 %18, label %25, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 2
  br label %21

21:                                               ; preds = %19, %21
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %20, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %22 = load i32, i32* %7, align 8, !tbaa !11
  %23 = and i32 %22, 2147483647
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %21

25:                                               ; preds = %21, %15
  %26 = load i8, i8* %6, align 8, !tbaa !10, !range !16
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %30, label %28

28:                                               ; preds = %25
  %29 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %29) #6
  br label %30

30:                                               ; preds = %25, %28
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #6
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"*, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9)) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__119__shared_mutex_base8try_lockEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 -2147483648, i32* %3, align 8, !tbaa !11
  br label %7

7:                                                ; preds = %1, %6
  %8 = phi i1 [ true, %6 ], [ false, %1 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret i1 %8
}

; Function Attrs: uwtable
define void @_ZNSt3__119__shared_mutex_base6unlockEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  store i32 0, i32* %3, align 8, !tbaa !11
  %4 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %4) #6
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"*) local_unnamed_addr #3

; Function Attrs: uwtable
define void @_ZNSt3__119__shared_mutex_base11lock_sharedEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #6
  %4 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !10
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %7 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  %8 = load i32, i32* %7, align 8, !tbaa !11
  %9 = icmp ugt i32 %8, 2147483646
  br i1 %9, label %12, label %10

10:                                               ; preds = %1
  %11 = add nuw nsw i32 %8, 1
  store i32 %11, i32* %7, align 8, !tbaa !11
  br label %21

12:                                               ; preds = %1
  %13 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 1
  br label %14

14:                                               ; preds = %12, %14
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %13, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %15 = load i32, i32* %7, align 8, !tbaa !11
  %16 = icmp ugt i32 %15, 2147483646
  br i1 %16, label %14, label %17

17:                                               ; preds = %14
  %18 = load i8, i8* %6, align 8, !tbaa !10, !range !16
  %19 = icmp eq i8 %18, 0
  %20 = add nuw nsw i32 %15, 1
  store i32 %20, i32* %7, align 8, !tbaa !11
  br i1 %19, label %23, label %21

21:                                               ; preds = %10, %17
  %22 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %22) #6
  br label %23

23:                                               ; preds = %17, %21
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #6
  ret void
}

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__119__shared_mutex_base15try_lock_sharedEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = and i32 %4, 2147483647
  %6 = icmp sgt i32 %4, -1
  %7 = icmp ne i32 %5, 2147483647
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = add nuw nsw i32 %5, 1
  store i32 %10, i32* %3, align 8, !tbaa !11
  br label %11

11:                                               ; preds = %1, %9
  %12 = phi i1 [ true, %9 ], [ false, %1 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret i1 %12
}

; Function Attrs: uwtable
define void @_ZNSt3__119__shared_mutex_base13unlock_sharedEv(%"struct.std::__1::__shared_mutex_base"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = and i32 %4, 2147483647
  %6 = add nsw i32 %5, -1
  %7 = and i32 %4, -2147483648
  %8 = or i32 %6, %7
  store i32 %8, i32* %3, align 8, !tbaa !11
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %14, label %10

10:                                               ; preds = %1
  %11 = icmp eq i32 %6, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %10
  %13 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 2
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %13) #6
  br label %18

14:                                               ; preds = %1
  %15 = icmp eq i32 %6, 2147483646
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = getelementptr inbounds %"struct.std::__1::__shared_mutex_base", %"struct.std::__1::__shared_mutex_base"* %0, i64 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %17) #6
  br label %18

18:                                               ; preds = %14, %16, %10, %12
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"*) local_unnamed_addr #3

; Function Attrs: nounwind uwtable writeonly
define void @_ZNSt3__118shared_timed_mutexC2Ev(%"class.std::__1::shared_timed_mutex"* nocapture %0) unnamed_addr #0 align 2 {
  %2 = bitcast %"class.std::__1::shared_timed_mutex"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(140) %2, i8 0, i64 140, i1 false) #6
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__118shared_timed_mutex4lockEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #6
  %4 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !10
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %7 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  %8 = load i32, i32* %7, align 8, !tbaa !11
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %15, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 1
  br label %12

12:                                               ; preds = %12, %10
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %11, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %13 = load i32, i32* %7, align 8, !tbaa !11
  %14 = icmp sgt i32 %13, -1
  br i1 %14, label %15, label %12

15:                                               ; preds = %12, %1
  %16 = phi i32 [ %8, %1 ], [ %13, %12 ]
  %17 = or i32 %16, -2147483648
  store i32 %17, i32* %7, align 8, !tbaa !11
  %18 = icmp eq i32 %16, 0
  br i1 %18, label %25, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 2
  br label %21

21:                                               ; preds = %21, %19
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %20, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %22 = load i32, i32* %7, align 8, !tbaa !11
  %23 = and i32 %22, 2147483647
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %21

25:                                               ; preds = %21, %15
  %26 = load i8, i8* %6, align 8, !tbaa !10, !range !16
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %30, label %28

28:                                               ; preds = %25
  %29 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %29) #6
  br label %30

30:                                               ; preds = %25, %28
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #6
  ret void
}

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__118shared_timed_mutex8try_lockEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  store i32 -2147483648, i32* %3, align 8, !tbaa !11
  br label %7

7:                                                ; preds = %1, %6
  %8 = phi i1 [ true, %6 ], [ false, %1 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret i1 %8
}

; Function Attrs: uwtable
define void @_ZNSt3__118shared_timed_mutex6unlockEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  store i32 0, i32* %3, align 8, !tbaa !11
  %4 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %4) #6
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__118shared_timed_mutex11lock_sharedEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #6
  %4 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !10
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %7 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  %8 = load i32, i32* %7, align 8, !tbaa !11
  %9 = icmp ugt i32 %8, 2147483646
  br i1 %9, label %12, label %10

10:                                               ; preds = %1
  %11 = add nuw nsw i32 %8, 1
  store i32 %11, i32* %7, align 8, !tbaa !11
  br label %23

12:                                               ; preds = %1
  %13 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 1
  br label %14

14:                                               ; preds = %14, %12
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %13, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #6
  %15 = load i32, i32* %7, align 8, !tbaa !11
  %16 = icmp ugt i32 %15, 2147483646
  br i1 %16, label %14, label %17

17:                                               ; preds = %14
  %18 = load i8, i8* %6, align 8, !tbaa !10, !range !16
  %19 = icmp eq i8 %18, 0
  %20 = add nuw nsw i32 %15, 1
  store i32 %20, i32* %7, align 8, !tbaa !11
  br i1 %19, label %25, label %21

21:                                               ; preds = %17
  %22 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !4
  br label %23

23:                                               ; preds = %21, %10
  %24 = phi %"class.std::__1::mutex"* [ %22, %21 ], [ %4, %10 ]
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %24) #6
  br label %25

25:                                               ; preds = %17, %23
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #6
  ret void
}

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__118shared_timed_mutex15try_lock_sharedEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = and i32 %4, 2147483647
  %6 = icmp sgt i32 %4, -1
  %7 = icmp ne i32 %5, 2147483647
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %11

9:                                                ; preds = %1
  %10 = add nuw nsw i32 %5, 1
  store i32 %10, i32* %3, align 8, !tbaa !11
  br label %11

11:                                               ; preds = %1, %9
  %12 = phi i1 [ true, %9 ], [ false, %1 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret i1 %12
}

; Function Attrs: uwtable
define void @_ZNSt3__118shared_timed_mutex13unlock_sharedEv(%"class.std::__1::shared_timed_mutex"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 3
  %4 = load i32, i32* %3, align 8, !tbaa !11
  %5 = and i32 %4, 2147483647
  %6 = add nsw i32 %5, -1
  %7 = and i32 %4, -2147483648
  %8 = or i32 %6, %7
  store i32 %8, i32* %3, align 8, !tbaa !11
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %14, label %10

10:                                               ; preds = %1
  %11 = icmp eq i32 %6, 0
  br i1 %11, label %12, label %18

12:                                               ; preds = %10
  %13 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 2
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %13) #6
  br label %18

14:                                               ; preds = %1
  %15 = icmp eq i32 %6, 2147483646
  br i1 %15, label %16, label %18

16:                                               ; preds = %14
  %17 = getelementptr inbounds %"class.std::__1::shared_timed_mutex", %"class.std::__1::shared_timed_mutex"* %0, i64 0, i32 0, i32 1
  tail call void @_ZNSt3__118condition_variable10notify_oneEv(%"class.std::__1::condition_variable"* nonnull %17) #6
  br label %18

18:                                               ; preds = %10, %12, %14, %16
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %2) #6
  ret void
}

declare void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"*) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"*) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

attributes #0 = { nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn writeonly }
attributes #6 = { nounwind }

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
!11 = !{!12, !15, i64 136}
!12 = !{!"_ZTSNSt3__119__shared_mutex_baseE", !13, i64 0, !14, i64 40, !14, i64 88, !15, i64 136}
!13 = !{!"_ZTSNSt3__15mutexE", !7, i64 0}
!14 = !{!"_ZTSNSt3__118condition_variableE", !7, i64 0}
!15 = !{!"int", !7, i64 0}
!16 = !{i8 0, i8 2}

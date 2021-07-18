; ModuleID = 'll/.fallback_malloc.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/fallback_malloc.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"struct.(anonymous namespace)::heap_node" = type { i16, i16 }

@_ZN12_GLOBAL__N_110heap_mutexE = internal global %union.pthread_mutex_t zeroinitializer, align 8
@_ZN12_GLOBAL__N_18freelistE = internal unnamed_addr global %"struct.(anonymous namespace)::heap_node"* null, align 8
@_ZN12_GLOBAL__N_14heapE = internal global [512 x i8] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define hidden i8* @_ZN10__cxxabiv130__aligned_malloc_with_fallbackEm(i64 %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = alloca i8*, align 8
  %3 = icmp eq i64 %0, 0
  %4 = select i1 %3, i64 1, i64 %0
  %5 = bitcast i8** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #5
  store i8* null, i8** %2, align 8, !tbaa !4
  %6 = call i32 @posix_memalign(i8** nonnull %2, i64 16, i64 %4) #5
  %7 = load i8*, i8** %2, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #5
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %64

9:                                                ; preds = %1
  %10 = add i64 %4, 3
  %11 = lshr i64 %10, 2
  %12 = add nuw nsw i64 %11, 1
  %13 = call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  %14 = load %"struct.(anonymous namespace)::heap_node"*, %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  %15 = icmp eq %"struct.(anonymous namespace)::heap_node"* %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %9
  store %"struct.(anonymous namespace)::heap_node"* bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to %"struct.(anonymous namespace)::heap_node"*), %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  store i16 128, i16* bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i16*), align 16, !tbaa !8
  store i16 128, i16* bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 2) to i16*), align 2, !tbaa !11
  br label %19

17:                                               ; preds = %9
  %18 = icmp eq %"struct.(anonymous namespace)::heap_node"* %14, bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0) to %"struct.(anonymous namespace)::heap_node"*)
  br i1 %18, label %61, label %19

19:                                               ; preds = %16, %17
  %20 = phi %"struct.(anonymous namespace)::heap_node"* [ %14, %17 ], [ bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to %"struct.(anonymous namespace)::heap_node"*), %16 ]
  br label %21

21:                                               ; preds = %19, %53
  %22 = phi %"struct.(anonymous namespace)::heap_node"* [ %59, %53 ], [ %20, %19 ]
  %23 = phi %"struct.(anonymous namespace)::heap_node"* [ %22, %53 ], [ null, %19 ]
  %24 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 0, i32 1
  %25 = load i16, i16* %24, align 2, !tbaa !11
  %26 = zext i16 %25 to i64
  %27 = icmp ult i64 %12, %26
  br i1 %27, label %28, label %38

28:                                               ; preds = %21
  %29 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 0, i32 1
  %30 = trunc i64 %12 to i16
  %31 = sub i16 %25, %30
  store i16 %31, i16* %29, align 2, !tbaa !11
  %32 = zext i16 %31 to i64
  %33 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 %32
  %34 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %33, i64 0, i32 0
  store i16 0, i16* %34, align 2, !tbaa !8
  %35 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 %32, i32 1
  store i16 %30, i16* %35, align 2, !tbaa !11
  %36 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %33, i64 1
  %37 = bitcast %"struct.(anonymous namespace)::heap_node"* %36 to i8*
  br label %61

38:                                               ; preds = %21
  %39 = icmp eq i64 %12, %26
  br i1 %39, label %40, label %53

40:                                               ; preds = %38
  %41 = icmp eq %"struct.(anonymous namespace)::heap_node"* %23, null
  %42 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 0, i32 0
  %43 = load i16, i16* %42, align 2, !tbaa !8
  br i1 %41, label %44, label %48

44:                                               ; preds = %40
  %45 = zext i16 %43 to i64
  %46 = shl nuw nsw i64 %45, 2
  %47 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %46
  store i8* %47, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  br label %50

48:                                               ; preds = %40
  %49 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %23, i64 0, i32 0
  store i16 %43, i16* %49, align 2, !tbaa !8
  br label %50

50:                                               ; preds = %48, %44
  store i16 0, i16* %42, align 2, !tbaa !8
  %51 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 1
  %52 = bitcast %"struct.(anonymous namespace)::heap_node"* %51 to i8*
  br label %61

53:                                               ; preds = %38
  %54 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %22, i64 0, i32 0
  %55 = load i16, i16* %54, align 2, !tbaa !8
  %56 = zext i16 %55 to i64
  %57 = shl nuw nsw i64 %56, 2
  %58 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %57
  %59 = bitcast i8* %58 to %"struct.(anonymous namespace)::heap_node"*
  %60 = icmp eq i8* %58, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  br i1 %60, label %61, label %21

61:                                               ; preds = %53, %17, %28, %50
  %62 = phi i8* [ %37, %28 ], [ %52, %50 ], [ null, %17 ], [ null, %53 ]
  %63 = call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  br label %64

64:                                               ; preds = %1, %61
  %65 = phi i8* [ %62, %61 ], [ %7, %1 ]
  ret i8* %65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define hidden i8* @_ZN10__cxxabiv122__calloc_with_fallbackEmm(i64 %0, i64 %1) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %3 = tail call noalias i8* @calloc(i64 %0, i64 %1) #5
  %4 = icmp eq i8* %3, null
  br i1 %4, label %5, label %61

5:                                                ; preds = %2
  %6 = mul i64 %1, %0
  %7 = add i64 %6, 3
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %10 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  %11 = load %"struct.(anonymous namespace)::heap_node"*, %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  %12 = icmp eq %"struct.(anonymous namespace)::heap_node"* %11, null
  br i1 %12, label %13, label %14

13:                                               ; preds = %5
  store %"struct.(anonymous namespace)::heap_node"* bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to %"struct.(anonymous namespace)::heap_node"*), %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  store i16 128, i16* bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i16*), align 16, !tbaa !8
  store i16 128, i16* bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 2) to i16*), align 2, !tbaa !11
  br label %16

14:                                               ; preds = %5
  %15 = icmp eq %"struct.(anonymous namespace)::heap_node"* %11, bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0) to %"struct.(anonymous namespace)::heap_node"*)
  br i1 %15, label %54, label %16

16:                                               ; preds = %13, %14
  %17 = phi %"struct.(anonymous namespace)::heap_node"* [ %11, %14 ], [ bitcast ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to %"struct.(anonymous namespace)::heap_node"*), %13 ]
  br label %18

18:                                               ; preds = %16, %46
  %19 = phi %"struct.(anonymous namespace)::heap_node"* [ %52, %46 ], [ %17, %16 ]
  %20 = phi %"struct.(anonymous namespace)::heap_node"* [ %19, %46 ], [ null, %16 ]
  %21 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 0, i32 1
  %22 = load i16, i16* %21, align 2, !tbaa !11
  %23 = zext i16 %22 to i64
  %24 = icmp ult i64 %9, %23
  br i1 %24, label %25, label %33

25:                                               ; preds = %18
  %26 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 0, i32 1
  %27 = trunc i64 %9 to i16
  %28 = sub i16 %22, %27
  store i16 %28, i16* %26, align 2, !tbaa !11
  %29 = zext i16 %28 to i64
  %30 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 %29
  %31 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %30, i64 0, i32 0
  store i16 0, i16* %31, align 2, !tbaa !8
  %32 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 %29, i32 1
  store i16 %27, i16* %32, align 2, !tbaa !11
  br label %56

33:                                               ; preds = %18
  %34 = icmp eq i64 %9, %23
  br i1 %34, label %35, label %46

35:                                               ; preds = %33
  %36 = icmp eq %"struct.(anonymous namespace)::heap_node"* %20, null
  %37 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 0, i32 0
  %38 = load i16, i16* %37, align 2, !tbaa !8
  br i1 %36, label %39, label %43

39:                                               ; preds = %35
  %40 = zext i16 %38 to i64
  %41 = shl nuw nsw i64 %40, 2
  %42 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %41
  store i8* %42, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  br label %45

43:                                               ; preds = %35
  %44 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %20, i64 0, i32 0
  store i16 %38, i16* %44, align 2, !tbaa !8
  br label %45

45:                                               ; preds = %43, %39
  store i16 0, i16* %37, align 2, !tbaa !8
  br label %56

46:                                               ; preds = %33
  %47 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %19, i64 0, i32 0
  %48 = load i16, i16* %47, align 2, !tbaa !8
  %49 = zext i16 %48 to i64
  %50 = shl nuw nsw i64 %49, 2
  %51 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %50
  %52 = bitcast i8* %51 to %"struct.(anonymous namespace)::heap_node"*
  %53 = icmp eq i8* %51, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  br i1 %53, label %54, label %18

54:                                               ; preds = %46, %14
  %55 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  br label %61

56:                                               ; preds = %45, %25
  %57 = phi %"struct.(anonymous namespace)::heap_node"* [ %30, %25 ], [ %19, %45 ]
  %58 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %57, i64 1
  %59 = bitcast %"struct.(anonymous namespace)::heap_node"* %58 to i8*
  %60 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %59, i8 0, i64 %6, i1 false)
  br label %61

61:                                               ; preds = %54, %56, %2
  %62 = phi i8* [ %3, %2 ], [ %59, %56 ], [ null, %54 ]
  ret i8* %62
}

; Function Attrs: nofree nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = icmp uge i8* %0, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 0)
  %3 = icmp ult i8* %0, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  %4 = and i1 %2, %3
  br i1 %4, label %5, label %61

5:                                                ; preds = %1
  %6 = getelementptr inbounds i8, i8* %0, i64 -4
  %7 = bitcast i8* %6 to %"struct.(anonymous namespace)::heap_node"*
  %8 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  %9 = load %"struct.(anonymous namespace)::heap_node"*, %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  %10 = icmp ne %"struct.(anonymous namespace)::heap_node"* %9, null
  %11 = icmp ne %"struct.(anonymous namespace)::heap_node"* %9, bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0) to %"struct.(anonymous namespace)::heap_node"*)
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %53

13:                                               ; preds = %5
  %14 = getelementptr inbounds i8, i8* %0, i64 -2
  %15 = bitcast i8* %14 to i16*
  %16 = load i16, i16* %15, align 2, !tbaa !11
  %17 = zext i16 %16 to i64
  %18 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %7, i64 %17
  br label %19

19:                                               ; preds = %45, %13
  %20 = phi %"struct.(anonymous namespace)::heap_node"* [ null, %13 ], [ %21, %45 ]
  %21 = phi %"struct.(anonymous namespace)::heap_node"* [ %9, %13 ], [ %51, %45 ]
  %22 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 1
  %23 = load i16, i16* %22, align 2, !tbaa !11
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 %24
  %26 = icmp eq %"struct.(anonymous namespace)::heap_node"* %25, %7
  br i1 %26, label %27, label %30

27:                                               ; preds = %19
  %28 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 1
  %29 = add i16 %23, %16
  store i16 %29, i16* %28, align 2, !tbaa !11
  br label %59

30:                                               ; preds = %19
  %31 = icmp eq %"struct.(anonymous namespace)::heap_node"* %18, %21
  br i1 %31, label %32, label %45

32:                                               ; preds = %30
  %33 = add i16 %23, %16
  store i16 %33, i16* %15, align 2, !tbaa !11
  %34 = icmp eq %"struct.(anonymous namespace)::heap_node"* %20, null
  br i1 %34, label %35, label %39

35:                                               ; preds = %32
  store i8* %6, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  %36 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %18, i64 0, i32 0
  %37 = load i16, i16* %36, align 2, !tbaa !8
  %38 = bitcast i8* %6 to i16*
  store i16 %37, i16* %38, align 2, !tbaa !8
  br label %59

39:                                               ; preds = %32
  %40 = ptrtoint i8* %6 to i64
  %41 = sub i64 %40, ptrtoint ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i64)
  %42 = lshr i64 %41, 2
  %43 = trunc i64 %42 to i16
  %44 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %20, i64 0, i32 0
  store i16 %43, i16* %44, align 2, !tbaa !8
  br label %59

45:                                               ; preds = %30
  %46 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 0
  %47 = load i16, i16* %46, align 2, !tbaa !8
  %48 = zext i16 %47 to i64
  %49 = shl nuw nsw i64 %48, 2
  %50 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %49
  %51 = bitcast i8* %50 to %"struct.(anonymous namespace)::heap_node"*
  %52 = icmp eq i8* %50, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  br i1 %52, label %53, label %19

53:                                               ; preds = %45, %5
  %54 = ptrtoint %"struct.(anonymous namespace)::heap_node"* %9 to i64
  %55 = sub i64 %54, ptrtoint ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i64)
  %56 = lshr i64 %55, 2
  %57 = trunc i64 %56 to i16
  %58 = bitcast i8* %6 to i16*
  store i16 %57, i16* %58, align 2, !tbaa !8
  store i8* %6, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  br label %59

59:                                               ; preds = %27, %35, %39, %53
  %60 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  br label %62

61:                                               ; preds = %1
  tail call void @free(i8* %0) #5
  br label %62

62:                                               ; preds = %61, %59
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv120__free_with_fallbackEPv(i8* %0) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %2 = icmp uge i8* %0, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 0)
  %3 = icmp ult i8* %0, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  %4 = and i1 %2, %3
  br i1 %4, label %5, label %61

5:                                                ; preds = %1
  %6 = getelementptr inbounds i8, i8* %0, i64 -4
  %7 = bitcast i8* %6 to %"struct.(anonymous namespace)::heap_node"*
  %8 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  %9 = load %"struct.(anonymous namespace)::heap_node"*, %"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE, align 8, !tbaa !4
  %10 = icmp ne %"struct.(anonymous namespace)::heap_node"* %9, null
  %11 = icmp ne %"struct.(anonymous namespace)::heap_node"* %9, bitcast (i8* getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0) to %"struct.(anonymous namespace)::heap_node"*)
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %53

13:                                               ; preds = %5
  %14 = getelementptr inbounds i8, i8* %0, i64 -2
  %15 = bitcast i8* %14 to i16*
  %16 = load i16, i16* %15, align 2, !tbaa !11
  %17 = zext i16 %16 to i64
  %18 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %7, i64 %17
  br label %19

19:                                               ; preds = %45, %13
  %20 = phi %"struct.(anonymous namespace)::heap_node"* [ null, %13 ], [ %21, %45 ]
  %21 = phi %"struct.(anonymous namespace)::heap_node"* [ %9, %13 ], [ %51, %45 ]
  %22 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 1
  %23 = load i16, i16* %22, align 2, !tbaa !11
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 %24
  %26 = icmp eq %"struct.(anonymous namespace)::heap_node"* %25, %7
  br i1 %26, label %27, label %30

27:                                               ; preds = %19
  %28 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 1
  %29 = add i16 %23, %16
  store i16 %29, i16* %28, align 2, !tbaa !11
  br label %59

30:                                               ; preds = %19
  %31 = icmp eq %"struct.(anonymous namespace)::heap_node"* %18, %21
  br i1 %31, label %32, label %45

32:                                               ; preds = %30
  %33 = add i16 %23, %16
  store i16 %33, i16* %15, align 2, !tbaa !11
  %34 = icmp eq %"struct.(anonymous namespace)::heap_node"* %20, null
  br i1 %34, label %35, label %39

35:                                               ; preds = %32
  store i8* %6, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  %36 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %18, i64 0, i32 0
  %37 = load i16, i16* %36, align 2, !tbaa !8
  %38 = bitcast i8* %6 to i16*
  store i16 %37, i16* %38, align 2, !tbaa !8
  br label %59

39:                                               ; preds = %32
  %40 = ptrtoint i8* %6 to i64
  %41 = sub i64 %40, ptrtoint ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i64)
  %42 = lshr i64 %41, 2
  %43 = trunc i64 %42 to i16
  %44 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %20, i64 0, i32 0
  store i16 %43, i16* %44, align 2, !tbaa !8
  br label %59

45:                                               ; preds = %30
  %46 = getelementptr inbounds %"struct.(anonymous namespace)::heap_node", %"struct.(anonymous namespace)::heap_node"* %21, i64 0, i32 0
  %47 = load i16, i16* %46, align 2, !tbaa !8
  %48 = zext i16 %47 to i64
  %49 = shl nuw nsw i64 %48, 2
  %50 = getelementptr inbounds [512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 0, i64 %49
  %51 = bitcast i8* %50 to %"struct.(anonymous namespace)::heap_node"*
  %52 = icmp eq i8* %50, getelementptr inbounds ([512 x i8], [512 x i8]* @_ZN12_GLOBAL__N_14heapE, i64 1, i64 0)
  br i1 %52, label %53, label %19

53:                                               ; preds = %45, %5
  %54 = ptrtoint %"struct.(anonymous namespace)::heap_node"* %9 to i64
  %55 = sub i64 %54, ptrtoint ([512 x i8]* @_ZN12_GLOBAL__N_14heapE to i64)
  %56 = lshr i64 %55, 2
  %57 = trunc i64 %56 to i16
  %58 = bitcast i8* %6 to i16*
  store i16 %57, i16* %58, align 2, !tbaa !8
  store i8* %6, i8** bitcast (%"struct.(anonymous namespace)::heap_node"** @_ZN12_GLOBAL__N_18freelistE to i8**), align 8, !tbaa !4
  br label %59

59:                                               ; preds = %27, %35, %39, %53
  %60 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZN12_GLOBAL__N_110heap_mutexE) #5
  br label %62

61:                                               ; preds = %1
  tail call void @free(i8* %0) #5
  br label %62

62:                                               ; preds = %61, %59
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn writeonly }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !10, i64 0}
!9 = !{!"_ZTSN12_GLOBAL__N_19heap_nodeE", !10, i64 0, !10, i64 2}
!10 = !{!"short", !6, i64 0}
!11 = !{!9, !10, i64 2}

; ModuleID = 'll/.memory.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/memory.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.std::__1::allocator_arg_t" = type { i8 }
%"class.std::__1::__sp_mut" = type { i8* }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::bad_weak_ptr" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::__1::__shared_weak_count" = type { %"class.std::__1::__shared_count", i64 }
%"class.std::type_info" = type { i32 (...)**, i8* }

@_ZNSt3__113allocator_argE = local_unnamed_addr constant %"struct.std::__1::allocator_arg_t" undef, align 1
@.str = private unnamed_addr constant [13 x i8] c"bad_weak_ptr\00", align 1
@_ZZNSt3__112__get_sp_mutEPKvE4muts = internal global [16 x %"class.std::__1::__sp_mut"] [%"class.std::__1::__sp_mut" { i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 40) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 80) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 120) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 160) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 200) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 240) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 280) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 320) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 360) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 400) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 440) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 480) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 520) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 560) }, %"class.std::__1::__sp_mut" { i8* getelementptr (i8, i8* bitcast ([16 x %union.pthread_mutex_t]* @_ZNSt3__1L8mut_backE to i8*), i64 600) }], align 16
@_ZNSt3__1L8mut_backE = internal global [16 x %union.pthread_mutex_t] zeroinitializer, align 16
@_ZTVNSt3__112bad_weak_ptrE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112bad_weak_ptrE to i8*), i8* bitcast (void (%"class.std::__1::bad_weak_ptr"*)* @_ZNSt3__112bad_weak_ptrD2Ev to i8*), i8* bitcast (void (%"class.std::__1::bad_weak_ptr"*)* @_ZNSt3__112bad_weak_ptrD0Ev to i8*), i8* bitcast (i8* (%"class.std::__1::bad_weak_ptr"*)* @_ZNKSt3__112bad_weak_ptr4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__112bad_weak_ptrE = constant [23 x i8] c"NSt3__112bad_weak_ptrE\00", align 1
@_ZTISt9exception = external constant i8*
@_ZTINSt3__112bad_weak_ptrE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSNSt3__112bad_weak_ptrE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8
@_ZTVNSt3__114__shared_countE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTINSt3__114__shared_countE to i8*), i8* bitcast (void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSNSt3__114__shared_countE = constant [25 x i8] c"NSt3__114__shared_countE\00", align 1
@_ZTINSt3__114__shared_countE = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSNSt3__114__shared_countE, i32 0, i32 0) }, align 8
@_ZTVNSt3__119__shared_weak_countE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i32, i32, i8*, i64 }* @_ZTINSt3__119__shared_weak_countE to i8*), i8* bitcast (void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__shared_weak_count"*)* @_ZNSt3__119__shared_weak_countD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (i8* (%"class.std::__1::__shared_weak_count"*, %"class.std::type_info"*)* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)] }, align 8
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = external global i8*
@_ZTSNSt3__119__shared_weak_countE = constant [30 x i8] c"NSt3__119__shared_weak_countE\00", align 1
@_ZTINSt3__119__shared_weak_countE = constant { i8*, i8*, i32, i32, i8*, i64 } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv121__vmi_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @_ZTSNSt3__119__shared_weak_countE, i32 0, i32 0), i32 0, i32 1, i8* bitcast ({ i8*, i8* }* @_ZTINSt3__114__shared_countE to i8*), i64 0 }, align 8

@_ZNSt3__112bad_weak_ptrD1Ev = unnamed_addr alias void (%"class.std::__1::bad_weak_ptr"*), void (%"class.std::__1::bad_weak_ptr"*)* @_ZNSt3__112bad_weak_ptrD2Ev
@_ZNSt3__114__shared_countD1Ev = unnamed_addr alias void (%"class.std::__1::__shared_count"*), void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD2Ev
@_ZNSt3__119__shared_weak_countD2Ev = unnamed_addr alias void (%"class.std::__1::__shared_weak_count"*), bitcast (void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD2Ev to void (%"class.std::__1::__shared_weak_count"*)*)
@_ZNSt3__119__shared_weak_countD1Ev = unnamed_addr alias void (%"class.std::__1::__shared_weak_count"*), bitcast (void (%"class.std::__1::__shared_count"*)* @_ZNSt3__114__shared_countD2Ev to void (%"class.std::__1::__shared_weak_count"*)*)

; Function Attrs: nounwind
declare void @_ZNSt9exceptionD2Ev(%"class.std::exception"*) unnamed_addr #0

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112bad_weak_ptrD2Ev(%"class.std::__1::bad_weak_ptr"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::__1::bad_weak_ptr", %"class.std::__1::bad_weak_ptr"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #8
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112bad_weak_ptrD0Ev(%"class.std::__1::bad_weak_ptr"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::__1::bad_weak_ptr", %"class.std::__1::bad_weak_ptr"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #8
  %3 = bitcast %"class.std::__1::bad_weak_ptr"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #9
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt3__112bad_weak_ptr4whatEv(%"class.std::__1::bad_weak_ptr"* nocapture readnone %0) unnamed_addr #3 align 2 {
  ret i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__114__shared_countD2Ev(%"class.std::__1::__shared_count"* nocapture %0) unnamed_addr #3 align 2 {
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define void @_ZNSt3__114__shared_countD0Ev(%"class.std::__1::__shared_count"* nocapture readnone %0) unnamed_addr #4 align 2 {
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #5

; Function Attrs: noreturn nounwind uwtable
define void @_ZNSt3__119__shared_weak_countD0Ev(%"class.std::__1::__shared_weak_count"* nocapture readnone %0) unnamed_addr #4 align 2 {
  tail call void @llvm.trap() #10
  unreachable
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"* nocapture %0) local_unnamed_addr #6 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__shared_count", %"class.std::__1::__shared_count"* %0, i64 0, i32 1
  %3 = atomicrmw add i64* %2, i64 1 monotonic
  ret void
}

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__shared_count", %"class.std::__1::__shared_count"* %0, i64 0, i32 1
  %3 = atomicrmw add i64* %2, i64 -1 acq_rel
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = bitcast %"class.std::__1::__shared_count"* %0 to void (%"class.std::__1::__shared_count"*)***
  %7 = load void (%"class.std::__1::__shared_count"*)**, void (%"class.std::__1::__shared_count"*)*** %6, align 8, !tbaa !4
  %8 = getelementptr inbounds void (%"class.std::__1::__shared_count"*)*, void (%"class.std::__1::__shared_count"*)** %7, i64 2
  %9 = load void (%"class.std::__1::__shared_count"*)*, void (%"class.std::__1::__shared_count"*)** %8, align 8
  tail call void %9(%"class.std::__1::__shared_count"* %0) #8
  br label %10

10:                                               ; preds = %1, %5
  %11 = phi i1 [ true, %5 ], [ false, %1 ]
  ret i1 %11
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt3__119__shared_weak_count12__add_sharedEv(%"class.std::__1::__shared_weak_count"* nocapture %0) local_unnamed_addr #6 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 0, i32 1
  %3 = atomicrmw add i64* %2, i64 1 monotonic
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt3__119__shared_weak_count10__add_weakEv(%"class.std::__1::__shared_weak_count"* nocapture %0) local_unnamed_addr #6 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 1
  %3 = atomicrmw add i64* %2, i64 1 monotonic
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* %0) local_unnamed_addr #1 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 0, i32 1
  %3 = atomicrmw add i64* %2, i64 -1 acq_rel
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %27

5:                                                ; preds = %1
  %6 = getelementptr %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 0
  %7 = bitcast %"class.std::__1::__shared_weak_count"* %0 to void (%"class.std::__1::__shared_count"*)***
  %8 = load void (%"class.std::__1::__shared_count"*)**, void (%"class.std::__1::__shared_count"*)*** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds void (%"class.std::__1::__shared_count"*)*, void (%"class.std::__1::__shared_count"*)** %8, i64 2
  %10 = load void (%"class.std::__1::__shared_count"*)*, void (%"class.std::__1::__shared_count"*)** %9, align 8
  tail call void %10(%"class.std::__1::__shared_count"* %6) #8
  %11 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 1
  %12 = load atomic i64, i64* %11 acquire, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %19

14:                                               ; preds = %5
  %15 = bitcast %"class.std::__1::__shared_weak_count"* %0 to void (%"class.std::__1::__shared_weak_count"*)***
  %16 = load void (%"class.std::__1::__shared_weak_count"*)**, void (%"class.std::__1::__shared_weak_count"*)*** %15, align 8, !tbaa !4
  %17 = getelementptr inbounds void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %16, i64 4
  %18 = load void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %17, align 8
  tail call void %18(%"class.std::__1::__shared_weak_count"* nonnull %0) #8
  br label %27

19:                                               ; preds = %5
  %20 = atomicrmw add i64* %11, i64 -1 acq_rel
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %27

22:                                               ; preds = %19
  %23 = bitcast %"class.std::__1::__shared_weak_count"* %0 to void (%"class.std::__1::__shared_weak_count"*)***
  %24 = load void (%"class.std::__1::__shared_weak_count"*)**, void (%"class.std::__1::__shared_weak_count"*)*** %23, align 8, !tbaa !4
  %25 = getelementptr inbounds void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %24, i64 4
  %26 = load void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %25, align 8
  tail call void %26(%"class.std::__1::__shared_weak_count"* nonnull %0) #8
  br label %27

27:                                               ; preds = %22, %19, %14, %1
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__119__shared_weak_count14__release_weakEv(%"class.std::__1::__shared_weak_count"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 1
  %3 = load atomic i64, i64* %2 acquire, align 8
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %10

5:                                                ; preds = %1
  %6 = bitcast %"class.std::__1::__shared_weak_count"* %0 to void (%"class.std::__1::__shared_weak_count"*)***
  %7 = load void (%"class.std::__1::__shared_weak_count"*)**, void (%"class.std::__1::__shared_weak_count"*)*** %6, align 8, !tbaa !4
  %8 = getelementptr inbounds void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %7, i64 4
  %9 = load void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %8, align 8
  tail call void %9(%"class.std::__1::__shared_weak_count"* nonnull %0) #8
  br label %18

10:                                               ; preds = %1
  %11 = atomicrmw add i64* %2, i64 -1 acq_rel
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %13, label %18

13:                                               ; preds = %10
  %14 = bitcast %"class.std::__1::__shared_weak_count"* %0 to void (%"class.std::__1::__shared_weak_count"*)***
  %15 = load void (%"class.std::__1::__shared_weak_count"*)**, void (%"class.std::__1::__shared_weak_count"*)*** %14, align 8, !tbaa !4
  %16 = getelementptr inbounds void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %15, i64 4
  %17 = load void (%"class.std::__1::__shared_weak_count"*)*, void (%"class.std::__1::__shared_weak_count"*)** %16, align 8
  tail call void %17(%"class.std::__1::__shared_weak_count"* nonnull %0) #8
  br label %18

18:                                               ; preds = %10, %13, %5
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define %"class.std::__1::__shared_weak_count"* @_ZNSt3__119__shared_weak_count4lockEv(%"class.std::__1::__shared_weak_count"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::__shared_weak_count", %"class.std::__1::__shared_weak_count"* %0, i64 0, i32 0, i32 1
  %3 = load atomic i64, i64* %2 seq_cst, align 8
  %4 = icmp eq i64 %3, -1
  br i1 %4, label %13, label %5

5:                                                ; preds = %1, %10
  %6 = phi i64 [ %11, %10 ], [ %3, %1 ]
  %7 = add nuw nsw i64 %6, 1
  %8 = cmpxchg weak i64* %2, i64 %6, i64 %7 seq_cst seq_cst
  %9 = extractvalue { i64, i1 } %8, 1
  br i1 %9, label %13, label %10

10:                                               ; preds = %5
  %11 = extractvalue { i64, i1 } %8, 0
  %12 = icmp eq i64 %11, -1
  br i1 %12, label %13, label %5

13:                                               ; preds = %10, %5, %1
  %14 = phi %"class.std::__1::__shared_weak_count"* [ null, %1 ], [ %0, %5 ], [ null, %10 ]
  ret %"class.std::__1::__shared_weak_count"* %14
}

; Function Attrs: norecurse nounwind readnone uwtable
define noalias i8* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info(%"class.std::__1::__shared_weak_count"* nocapture readnone %0, %"class.std::type_info"* nocapture nonnull readnone align 8 dereferenceable(16) %1) unnamed_addr #3 align 2 {
  ret i8* null
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18__sp_mut4lockEv(%"class.std::__1::__sp_mut"* nocapture readonly %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = bitcast %"class.std::__1::__sp_mut"* %0 to %union.pthread_mutex_t**
  %3 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %2, align 8, !tbaa !7
  %4 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %3) #8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %16, label %6

6:                                                ; preds = %1, %11
  %7 = phi i32 [ %12, %11 ], [ 0, %1 ]
  %8 = icmp eq i32 %7, 16
  br i1 %8, label %9, label %11

9:                                                ; preds = %6
  %10 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* %3) #8
  br label %16

11:                                               ; preds = %6
  %12 = add nuw nsw i32 %7, 1
  %13 = tail call i32 @sched_yield() #8
  %14 = tail call i32 @pthread_mutex_trylock(%union.pthread_mutex_t* %3) #8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %6

16:                                               ; preds = %11, %1, %9
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18__sp_mut6unlockEv(%"class.std::__1::__sp_mut"* nocapture readonly %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = bitcast %"class.std::__1::__sp_mut"* %0 to %union.pthread_mutex_t**
  %3 = load %union.pthread_mutex_t*, %union.pthread_mutex_t** %2, align 8, !tbaa !7
  %4 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* %3) #8
  ret void
}

; Function Attrs: nounwind readnone uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::__sp_mut"* @_ZNSt3__112__get_sp_mutEPKv(i8* %0) local_unnamed_addr #7 personality i32 (...)* @__gxx_personality_v0 {
  %2 = ptrtoint i8* %0 to i64
  %3 = lshr i64 %2, 32
  %4 = shl i64 %2, 3
  %5 = and i64 %4, 4294967288
  %6 = add nuw nsw i64 %5, 8
  %7 = xor i64 %6, %3
  %8 = mul i64 %7, -7070675565921424023
  %9 = lshr i64 %8, 47
  %10 = xor i64 %8, %3
  %11 = xor i64 %10, %9
  %12 = mul i64 %11, -7070675565921424023
  %13 = lshr i64 %12, 47
  %14 = xor i64 %13, %12
  %15 = mul i64 %14, -7070675565921424023
  %16 = and i64 %15, 15
  %17 = getelementptr inbounds [16 x %"class.std::__1::__sp_mut"], [16 x %"class.std::__1::__sp_mut"]* @_ZZNSt3__112__get_sp_mutEPKvE4muts, i64 0, i64 %16
  ret %"class.std::__1::__sp_mut"* %17
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__117declare_reachableEPv(i8* nocapture %0) local_unnamed_addr #3 {
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__119declare_no_pointersEPcm(i8* nocapture %0, i64 %1) local_unnamed_addr #3 {
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__121undeclare_no_pointersEPcm(i8* nocapture %0, i64 %1) local_unnamed_addr #3 {
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNSt3__121__undeclare_reachableEPv(i8* readnone returned %0) local_unnamed_addr #3 {
  ret i8* %0
}

; Function Attrs: nofree norecurse nounwind uwtable
define i8* @_ZNSt3__15alignEmmRPvRm(i64 %0, i64 %1, i8** nocapture nonnull align 8 dereferenceable(8) %2, i64* nocapture nonnull align 8 dereferenceable(8) %3) local_unnamed_addr #6 {
  %5 = load i64, i64* %3, align 8, !tbaa !11
  %6 = icmp ult i64 %5, %1
  br i1 %6, label %21, label %7

7:                                                ; preds = %4
  %8 = load i8*, i8** %2, align 8, !tbaa !13
  %9 = add i64 %0, -1
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  %11 = ptrtoint i8* %10 to i64
  %12 = sub i64 0, %0
  %13 = and i64 %11, %12
  %14 = inttoptr i64 %13 to i8*
  %15 = ptrtoint i8* %8 to i64
  %16 = sub i64 %13, %15
  %17 = sub i64 %5, %1
  %18 = icmp ugt i64 %16, %17
  br i1 %18, label %21, label %19

19:                                               ; preds = %7
  store i8* %14, i8** %2, align 8, !tbaa !13
  %20 = sub i64 %5, %16
  store i64 %20, i64* %3, align 8, !tbaa !11
  br label %21

21:                                               ; preds = %19, %7, %4
  %22 = phi i8* [ null, %4 ], [ %14, %19 ], [ null, %7 ]
  ret i8* %22
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nounwind
declare i32 @pthread_mutex_trylock(%union.pthread_mutex_t*) local_unnamed_addr #0

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #0

; Function Attrs: nounwind
declare i32 @sched_yield() local_unnamed_addr #0

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #0

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { cold noreturn nounwind }
attributes #6 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind }
attributes #9 = { builtin nounwind }
attributes #10 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"vtable pointer", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !9, i64 0}
!8 = !{!"_ZTSNSt3__18__sp_mutE", !9, i64 0}
!9 = !{!"any pointer", !10, i64 0}
!10 = !{!"omnipotent char", !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !10, i64 0}
!13 = !{!9, !9, i64 0}

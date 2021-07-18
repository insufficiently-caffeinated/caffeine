; ModuleID = 'll/.cxa_exception.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_exception.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"struct.__cxxabiv1::__cxa_eh_globals" = type { %"struct.__cxxabiv1::__cxa_exception"*, i32 }
%"struct.__cxxabiv1::__cxa_exception" = type { i8*, i64, %"class.std::type_info"*, void (i8*)*, void ()*, void ()*, %"struct.__cxxabiv1::__cxa_exception"*, i32, i32, i8*, i8*, i8*, i8*, %struct._Unwind_Exception }

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define hidden void @_ZN10__cxxabiv119__setExceptionClassEP17_Unwind_Exceptionm(%struct._Unwind_Exception* nocapture %0, i64 %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %0, i64 0, i32 0
  store i64 %1, i64* %3, align 16
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define hidden i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 16
  ret i64 %3
}

; Function Attrs: norecurse nounwind readonly uwtable
define hidden zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nocapture readonly %0) local_unnamed_addr #1 {
  %2 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %0, i64 0, i32 0
  %3 = load i64, i64* %2, align 16
  %4 = and i64 %3, -256
  %5 = icmp eq i64 %4, 4849336966747728640
  ret i1 %5
}

; Function Attrs: nounwind uwtable
define nonnull i8* @__cxa_allocate_exception(i64 %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = add i64 %0, 143
  %3 = and i64 %2, -16
  %4 = invoke i8* @_ZN10__cxxabiv130__aligned_malloc_with_fallbackEm(i64 %3)
          to label %5 unwind label %10

5:                                                ; preds = %1
  %6 = icmp eq i8* %4, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %5
  tail call void @_ZSt9terminatev() #11
  unreachable

8:                                                ; preds = %5
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 %4, i8 0, i64 %3, i1 false)
  %9 = getelementptr inbounds i8, i8* %4, i64 128
  ret i8* %9

10:                                               ; preds = %1
  %11 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %12 = extractvalue { i8*, i32 } %11, 0
  tail call void @__cxa_call_unexpected(i8* %12) #11
  unreachable
}

declare i32 @__gxx_personality_v0(...)

declare hidden i8* @_ZN10__cxxabiv130__aligned_malloc_with_fallbackEm(i64) local_unnamed_addr #3

; Function Attrs: noreturn nounwind
declare void @_ZSt9terminatev() local_unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

declare void @__cxa_call_unexpected(i8*) local_unnamed_addr

; Function Attrs: nounwind uwtable
define void @__cxa_free_exception(i8* %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds i8, i8* %0, i64 -128
  invoke void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %2)
          to label %3 unwind label %4

3:                                                ; preds = %1
  ret void

4:                                                ; preds = %1
  %5 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %6 = extractvalue { i8*, i32 } %5, 0
  tail call void @__cxa_call_unexpected(i8* %6) #11
  unreachable
}

declare hidden void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8*) local_unnamed_addr #3

; Function Attrs: uwtable
define i8* @__cxa_allocate_dependent_exception() local_unnamed_addr #6 {
  %1 = tail call i8* @_ZN10__cxxabiv130__aligned_malloc_with_fallbackEm(i64 128)
  %2 = icmp eq i8* %1, null
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  tail call void @_ZSt9terminatev() #11
  unreachable

4:                                                ; preds = %0
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(128) %1, i8 0, i64 128, i1 false)
  ret i8* %1
}

; Function Attrs: uwtable
define void @__cxa_free_dependent_exception(i8* %0) local_unnamed_addr #6 {
  tail call void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* %0)
  ret void
}

; Function Attrs: noreturn uwtable
define void @__cxa_throw(i8* %0, %"class.std::type_info"* %1, void (i8*)* %2) local_unnamed_addr #7 {
  %4 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
  %5 = getelementptr inbounds i8, i8* %0, i64 -128
  %6 = bitcast i8* %5 to %"struct.__cxxabiv1::__cxa_exception"*
  %7 = tail call void ()* @_ZSt14get_unexpectedv() #12
  %8 = getelementptr inbounds i8, i8* %0, i64 -96
  %9 = bitcast i8* %8 to void ()**
  store void ()* %7, void ()** %9, align 16, !tbaa !3
  %10 = tail call void ()* @_ZSt13get_terminatev() #12
  %11 = getelementptr inbounds i8, i8* %0, i64 -88
  %12 = bitcast i8* %11 to void ()**
  store void ()* %10, void ()** %12, align 8, !tbaa !11
  %13 = getelementptr inbounds i8, i8* %0, i64 -112
  %14 = bitcast i8* %13 to %"class.std::type_info"**
  store %"class.std::type_info"* %1, %"class.std::type_info"** %14, align 16, !tbaa !12
  %15 = getelementptr inbounds i8, i8* %0, i64 -104
  %16 = bitcast i8* %15 to void (i8*)**
  store void (i8*)* %2, void (i8*)** %16, align 8, !tbaa !13
  %17 = getelementptr inbounds i8, i8* %0, i64 -32
  %18 = bitcast i8* %17 to %struct._Unwind_Exception*
  %19 = bitcast i8* %17 to i64*
  store i64 4849336966747728640, i64* %19, align 16
  %20 = getelementptr inbounds i8, i8* %0, i64 -120
  %21 = bitcast i8* %20 to i64*
  store i64 1, i64* %21, align 8, !tbaa !14
  %22 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %4, i64 0, i32 1
  %23 = load i32, i32* %22, align 8, !tbaa !15
  %24 = add i32 %23, 1
  store i32 %24, i32* %22, align 8, !tbaa !15
  %25 = getelementptr inbounds i8, i8* %0, i64 -24
  %26 = bitcast i8* %25 to void (i32, %struct._Unwind_Exception*)**
  store void (i32, %struct._Unwind_Exception*)* @_ZN10__cxxabiv1L22exception_cleanup_funcE19_Unwind_Reason_CodeP17_Unwind_Exception, void (i32, %struct._Unwind_Exception*)** %26, align 8, !tbaa !17
  %27 = tail call i32 @_Unwind_RaiseException(%struct._Unwind_Exception* nonnull %18)
  tail call fastcc void @_ZN10__cxxabiv1L12failed_throwEPNS_15__cxa_exceptionE(%"struct.__cxxabiv1::__cxa_exception"* nonnull %6) #13
  unreachable
}

declare %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals() local_unnamed_addr #3

; Function Attrs: nounwind
declare void ()* @_ZSt14get_unexpectedv() local_unnamed_addr #8

; Function Attrs: nounwind
declare void ()* @_ZSt13get_terminatev() local_unnamed_addr #8

; Function Attrs: nounwind uwtable
define internal void @_ZN10__cxxabiv1L22exception_cleanup_funcE19_Unwind_Reason_CodeP17_Unwind_Exception(i32 %0, %struct._Unwind_Exception* %1) #2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = icmp eq i32 %0, 1
  br i1 %3, label %8, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -2, i32 1
  %6 = bitcast void (i32, %struct._Unwind_Exception*)** %5 to void ()**
  %7 = load void ()*, void ()** %6, align 8, !tbaa !11
  tail call void @_ZSt11__terminatePFvvE(void ()* %7) #11
  unreachable

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 1
  %10 = bitcast %struct._Unwind_Exception* %9 to i8*
  %11 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -3
  %12 = bitcast %struct._Unwind_Exception* %11 to i8*
  %13 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -3, i32 1
  %14 = bitcast void (i32, %struct._Unwind_Exception*)** %13 to i64*
  %15 = atomicrmw add i64* %14, i64 -1 seq_cst
  %16 = icmp eq i64 %15, 1
  br i1 %16, label %17, label %30

17:                                               ; preds = %8
  %18 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -3, i32 3
  %19 = bitcast i64* %18 to void (i8*)**
  %20 = load void (i8*)*, void (i8*)** %19, align 8, !tbaa !13
  %21 = icmp eq void (i8*)* %20, null
  br i1 %21, label %26, label %22

22:                                               ; preds = %17
  invoke void %20(i8* nonnull %10)
          to label %26 unwind label %23

23:                                               ; preds = %22
  %24 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %25 = extractvalue { i8*, i32 } %24, 0
  tail call void @__cxa_call_unexpected(i8* %25) #11
  unreachable

26:                                               ; preds = %22, %17
  invoke void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %12)
          to label %30 unwind label %27

27:                                               ; preds = %26
  %28 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %29 = extractvalue { i8*, i32 } %28, 0
  tail call void @__cxa_call_unexpected(i8* %29) #11
  unreachable

30:                                               ; preds = %8, %26
  ret void
}

declare i32 @_Unwind_RaiseException(%struct._Unwind_Exception*) local_unnamed_addr #3

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @_ZN10__cxxabiv1L12failed_throwEPNS_15__cxa_exceptionE(%"struct.__cxxabiv1::__cxa_exception"* %0) unnamed_addr #9 {
  %2 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %0, i64 0, i32 13
  %3 = bitcast %struct._Unwind_Exception* %2 to i8*
  %4 = tail call i8* @__cxa_begin_catch(i8* nonnull %3) #12
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %0, i64 0, i32 5
  %6 = load void ()*, void ()** %5, align 8, !tbaa !11
  tail call void @_ZSt11__terminatePFvvE(void ()* %6) #11
  unreachable
}

; Function Attrs: norecurse nounwind readonly uwtable
define i8* @__cxa_get_exception_ptr(i8* nocapture readonly %0) local_unnamed_addr #1 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds i8, i8* %0, i64 -8
  %3 = bitcast i8* %2 to i8**
  %4 = load i8*, i8** %3, align 8, !tbaa !18
  ret i8* %4
}

; Function Attrs: nounwind uwtable
define i8* @__cxa_begin_catch(i8* %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = bitcast i8* %0 to i64*
  %3 = load i64, i64* %2, align 16
  %4 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
          to label %5 unwind label %25

5:                                                ; preds = %1
  %6 = and i64 %3, -256
  %7 = icmp eq i64 %6, 4849336966747728640
  %8 = getelementptr inbounds i8, i8* %0, i64 -96
  br i1 %7, label %9, label %35

9:                                                ; preds = %5
  %10 = bitcast i8* %8 to %"struct.__cxxabiv1::__cxa_exception"*
  %11 = getelementptr inbounds i8, i8* %0, i64 -40
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 8, !tbaa !19
  %14 = icmp slt i32 %13, 0
  %15 = sub i32 0, %13
  %16 = select i1 %14, i32 %15, i32 %13
  %17 = add nuw i32 %16, 1
  store i32 %17, i32* %12, align 8, !tbaa !19
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %4, i64 0, i32 0
  %19 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %18, align 8, !tbaa !20
  %20 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %19, %10
  br i1 %20, label %28, label %21

21:                                               ; preds = %9
  %22 = getelementptr inbounds i8, i8* %0, i64 -48
  %23 = bitcast i8* %22 to %"struct.__cxxabiv1::__cxa_exception"**
  store %"struct.__cxxabiv1::__cxa_exception"* %19, %"struct.__cxxabiv1::__cxa_exception"** %23, align 16, !tbaa !21
  %24 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %4 to i8**
  store i8* %8, i8** %24, align 8, !tbaa !20
  br label %28

25:                                               ; preds = %1
  %26 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %27 = extractvalue { i8*, i32 } %26, 0
  tail call void @__cxa_call_unexpected(i8* %27) #11
  unreachable

28:                                               ; preds = %9, %21
  %29 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %4, i64 0, i32 1
  %30 = load i32, i32* %29, align 8, !tbaa !15
  %31 = add i32 %30, -1
  store i32 %31, i32* %29, align 8, !tbaa !15
  %32 = getelementptr inbounds i8, i8* %0, i64 -8
  %33 = bitcast i8* %32 to i8**
  %34 = load i8*, i8** %33, align 8, !tbaa !18
  br label %43

35:                                               ; preds = %5
  %36 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %4, i64 0, i32 0
  %37 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %36, align 8, !tbaa !20
  %38 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %37, null
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  tail call void @_ZSt9terminatev() #11
  unreachable

40:                                               ; preds = %35
  %41 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %4 to i8**
  store i8* %8, i8** %41, align 8, !tbaa !20
  %42 = getelementptr inbounds i8, i8* %0, i64 32
  br label %43

43:                                               ; preds = %40, %28
  %44 = phi i8* [ %34, %28 ], [ %42, %40 ]
  ret i8* %44
}

; Function Attrs: uwtable
define void @__cxa_end_catch() local_unnamed_addr #6 personality i32 (...)* @__gxx_personality_v0 {
  %1 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
  %2 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 0
  %3 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %2, align 8, !tbaa !20
  %4 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %3, null
  br i1 %4, label %62, label %5

5:                                                ; preds = %0
  %6 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 13
  %7 = getelementptr %struct._Unwind_Exception, %struct._Unwind_Exception* %6, i64 0, i32 0
  %8 = load i64, i64* %7, align 16
  %9 = and i64 %8, -256
  %10 = icmp eq i64 %9, 4849336966747728640
  br i1 %10, label %11, label %61

11:                                               ; preds = %5
  %12 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 7
  %13 = load i32, i32* %12, align 8, !tbaa !19
  %14 = icmp slt i32 %13, 0
  br i1 %14, label %15, label %23

15:                                               ; preds = %11
  %16 = add nsw i32 %13, 1
  store i32 %16, i32* %12, align 8, !tbaa !19
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %62

18:                                               ; preds = %15
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 6
  %20 = bitcast %"struct.__cxxabiv1::__cxa_exception"** %19 to i64*
  %21 = load i64, i64* %20, align 16, !tbaa !21
  %22 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %1 to i64*
  store i64 %21, i64* %22, align 8, !tbaa !20
  br label %62

23:                                               ; preds = %11
  %24 = add nsw i32 %13, -1
  store i32 %24, i32* %12, align 8, !tbaa !19
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %62

26:                                               ; preds = %23
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 6
  %28 = bitcast %"struct.__cxxabiv1::__cxa_exception"** %27 to i64*
  %29 = load i64, i64* %28, align 16, !tbaa !21
  %30 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %1 to i64*
  store i64 %29, i64* %30, align 8, !tbaa !20
  %31 = load i64, i64* %7, align 16
  %32 = and i64 %31, 255
  %33 = icmp eq i64 %32, 1
  br i1 %33, label %34, label %41

34:                                               ; preds = %26
  %35 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 1
  %36 = bitcast i64* %35 to i8**
  %37 = load i8*, i8** %36, align 8, !tbaa !22
  %38 = getelementptr inbounds i8, i8* %37, i64 -128
  %39 = bitcast i8* %38 to %"struct.__cxxabiv1::__cxa_exception"*
  %40 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %3 to i8*
  tail call void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %40)
  br label %41

41:                                               ; preds = %34, %26
  %42 = phi %"struct.__cxxabiv1::__cxa_exception"* [ %39, %34 ], [ %3, %26 ]
  %43 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %42, i64 1
  %44 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %43 to i8*
  %45 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %42 to i8*
  %46 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %42, i64 0, i32 1
  %47 = atomicrmw add i64* %46, i64 -1 seq_cst
  %48 = icmp eq i64 %47, 1
  br i1 %48, label %49, label %62

49:                                               ; preds = %41
  %50 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %42, i64 0, i32 3
  %51 = load void (i8*)*, void (i8*)** %50, align 8, !tbaa !13
  %52 = icmp eq void (i8*)* %51, null
  br i1 %52, label %57, label %53

53:                                               ; preds = %49
  invoke void %51(i8* nonnull %44)
          to label %57 unwind label %54

54:                                               ; preds = %53
  %55 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %56 = extractvalue { i8*, i32 } %55, 0
  tail call void @__cxa_call_unexpected(i8* %56) #11
  unreachable

57:                                               ; preds = %53, %49
  invoke void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %45)
          to label %62 unwind label %58

58:                                               ; preds = %57
  %59 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %60 = extractvalue { i8*, i32 } %59, 0
  tail call void @__cxa_call_unexpected(i8* %60) #11
  unreachable

61:                                               ; preds = %5
  tail call void @_Unwind_DeleteException(%struct._Unwind_Exception* nonnull %6)
  store %"struct.__cxxabiv1::__cxa_exception"* null, %"struct.__cxxabiv1::__cxa_exception"** %2, align 8, !tbaa !20
  br label %62

62:                                               ; preds = %57, %41, %61, %23, %15, %18, %0
  ret void
}

declare %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast() local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @__cxa_decrement_exception_refcount(i8* %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %22, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds i8, i8* %0, i64 -128
  %5 = getelementptr inbounds i8, i8* %0, i64 -120
  %6 = bitcast i8* %5 to i64*
  %7 = atomicrmw add i64* %6, i64 -1 seq_cst
  %8 = icmp eq i64 %7, 1
  br i1 %8, label %9, label %22

9:                                                ; preds = %3
  %10 = getelementptr inbounds i8, i8* %0, i64 -104
  %11 = bitcast i8* %10 to void (i8*)**
  %12 = load void (i8*)*, void (i8*)** %11, align 8, !tbaa !13
  %13 = icmp eq void (i8*)* %12, null
  br i1 %13, label %18, label %14

14:                                               ; preds = %9
  invoke void %12(i8* nonnull %0)
          to label %18 unwind label %15

15:                                               ; preds = %14
  %16 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %17 = extractvalue { i8*, i32 } %16, 0
  tail call void @__cxa_call_unexpected(i8* %17) #11
  unreachable

18:                                               ; preds = %9, %14
  invoke void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %4)
          to label %22 unwind label %19

19:                                               ; preds = %18
  %20 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %21 = extractvalue { i8*, i32 } %20, 0
  tail call void @__cxa_call_unexpected(i8* %21) #11
  unreachable

22:                                               ; preds = %18, %3, %1
  ret void
}

declare void @_Unwind_DeleteException(%struct._Unwind_Exception*) local_unnamed_addr #3

; Function Attrs: uwtable
define %"class.std::type_info"* @__cxa_current_exception_type() local_unnamed_addr #6 {
  %1 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
  %2 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %1, null
  br i1 %2, label %15, label %3

3:                                                ; preds = %0
  %4 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 0
  %5 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %4, align 8, !tbaa !20
  %6 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %5, null
  br i1 %6, label %15, label %7

7:                                                ; preds = %3
  %8 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %5, i64 0, i32 13, i32 0
  %9 = load i64, i64* %8, align 16
  %10 = and i64 %9, -256
  %11 = icmp eq i64 %10, 4849336966747728640
  br i1 %11, label %12, label %15

12:                                               ; preds = %7
  %13 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %5, i64 0, i32 2
  %14 = load %"class.std::type_info"*, %"class.std::type_info"** %13, align 16, !tbaa !12
  br label %15

15:                                               ; preds = %12, %3, %7, %0
  %16 = phi %"class.std::type_info"* [ null, %0 ], [ %14, %12 ], [ null, %3 ], [ null, %7 ]
  ret %"class.std::type_info"* %16
}

; Function Attrs: noreturn uwtable
define void @__cxa_rethrow() local_unnamed_addr #7 personality i32 (...)* @__gxx_personality_v0 {
  %1 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
  %2 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 0
  %3 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %2, align 8, !tbaa !20
  %4 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %0
  tail call void @_ZSt9terminatev() #11
  unreachable

6:                                                ; preds = %0
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 13
  %8 = getelementptr %struct._Unwind_Exception, %struct._Unwind_Exception* %7, i64 0, i32 0
  %9 = load i64, i64* %8, align 16
  %10 = and i64 %9, -256
  %11 = icmp eq i64 %10, 4849336966747728640
  br i1 %11, label %12, label %19

12:                                               ; preds = %6
  %13 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 7
  %14 = load i32, i32* %13, align 8, !tbaa !19
  %15 = sub nsw i32 0, %14
  store i32 %15, i32* %13, align 8, !tbaa !19
  %16 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 1
  %17 = load i32, i32* %16, align 8, !tbaa !15
  %18 = add i32 %17, 1
  store i32 %18, i32* %16, align 8, !tbaa !15
  br label %20

19:                                               ; preds = %6
  store %"struct.__cxxabiv1::__cxa_exception"* null, %"struct.__cxxabiv1::__cxa_exception"** %2, align 8, !tbaa !20
  br label %20

20:                                               ; preds = %19, %12
  %21 = tail call i32 @_Unwind_RaiseException(%struct._Unwind_Exception* nonnull %7)
  %22 = load i64, i64* %8, align 16
  %23 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
          to label %24 unwind label %44

24:                                               ; preds = %20
  %25 = and i64 %22, -256
  %26 = icmp eq i64 %25, 4849336966747728640
  %27 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %7, i64 -3
  br i1 %26, label %28, label %51

28:                                               ; preds = %24
  %29 = bitcast %struct._Unwind_Exception* %27 to %"struct.__cxxabiv1::__cxa_exception"*
  %30 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %7, i64 -2, i32 3
  %31 = bitcast i64* %30 to i32*
  %32 = load i32, i32* %31, align 8, !tbaa !19
  %33 = icmp slt i32 %32, 0
  %34 = sub i32 0, %32
  %35 = select i1 %33, i32 %34, i32 %32
  %36 = add nuw i32 %35, 1
  store i32 %36, i32* %31, align 8, !tbaa !19
  %37 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %23, i64 0, i32 0
  %38 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %37, align 8, !tbaa !20
  %39 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %38, %29
  br i1 %39, label %47, label %40

40:                                               ; preds = %28
  %41 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %7, i64 -2, i32 2
  %42 = bitcast i64* %41 to %"struct.__cxxabiv1::__cxa_exception"**
  store %"struct.__cxxabiv1::__cxa_exception"* %38, %"struct.__cxxabiv1::__cxa_exception"** %42, align 16, !tbaa !21
  %43 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %23 to %struct._Unwind_Exception**
  store %struct._Unwind_Exception* %27, %struct._Unwind_Exception** %43, align 8, !tbaa !20
  br label %47

44:                                               ; preds = %20
  %45 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %46 = extractvalue { i8*, i32 } %45, 0
  tail call void @__cxa_call_unexpected(i8* %46) #11
  unreachable

47:                                               ; preds = %40, %28
  %48 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %23, i64 0, i32 1
  %49 = load i32, i32* %48, align 8, !tbaa !15
  %50 = add i32 %49, -1
  store i32 %50, i32* %48, align 8, !tbaa !15
  br label %58

51:                                               ; preds = %24
  %52 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %23, i64 0, i32 0
  %53 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %52, align 8, !tbaa !20
  %54 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %53, null
  br i1 %54, label %56, label %55

55:                                               ; preds = %51
  tail call void @_ZSt9terminatev() #11
  unreachable

56:                                               ; preds = %51
  %57 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %23 to %struct._Unwind_Exception**
  store %struct._Unwind_Exception* %27, %struct._Unwind_Exception** %57, align 8, !tbaa !20
  br label %58

58:                                               ; preds = %47, %56
  br i1 %11, label %59, label %62

59:                                               ; preds = %58
  %60 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %3, i64 0, i32 5
  %61 = load void ()*, void ()** %60, align 8, !tbaa !11
  tail call void @_ZSt11__terminatePFvvE(void ()* %61) #11
  unreachable

62:                                               ; preds = %58
  tail call void @_ZSt9terminatev() #11
  unreachable
}

; Function Attrs: noreturn nounwind
declare hidden void @_ZSt11__terminatePFvvE(void ()*) local_unnamed_addr #4

; Function Attrs: nofree norecurse nounwind uwtable
define void @__cxa_increment_exception_refcount(i8* %0) local_unnamed_addr #10 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %7, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds i8, i8* %0, i64 -120
  %5 = bitcast i8* %4 to i64*
  %6 = atomicrmw add i64* %5, i64 1 seq_cst
  br label %7

7:                                                ; preds = %1, %3
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @__cxa_current_primary_exception() local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
          to label %2 unwind label %4

2:                                                ; preds = %0
  %3 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %1, null
  br i1 %3, label %31, label %7

4:                                                ; preds = %0
  %5 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %6 = extractvalue { i8*, i32 } %5, 0
  tail call void @__cxa_call_unexpected(i8* %6) #11
  unreachable

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 0
  %9 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %8, align 8, !tbaa !20
  %10 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %9, null
  br i1 %10, label %31, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 0, i32 13, i32 0
  %13 = load i64, i64* %12, align 16
  %14 = and i64 %13, -256
  %15 = icmp eq i64 %14, 4849336966747728640
  br i1 %15, label %16, label %31

16:                                               ; preds = %11
  %17 = and i64 %13, 255
  %18 = icmp eq i64 %17, 1
  br i1 %18, label %19, label %25

19:                                               ; preds = %16
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 0, i32 1
  %21 = bitcast i64* %20 to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !22
  %23 = getelementptr inbounds i8, i8* %22, i64 -128
  %24 = bitcast i8* %23 to %"struct.__cxxabiv1::__cxa_exception"*
  br label %25

25:                                               ; preds = %19, %16
  %26 = phi %"struct.__cxxabiv1::__cxa_exception"* [ %24, %19 ], [ %9, %16 ]
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %26, i64 1
  %28 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %27 to i8*
  %29 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %26, i64 0, i32 1
  %30 = atomicrmw add i64* %29, i64 1 seq_cst
  br label %31

31:                                               ; preds = %25, %7, %11, %2
  %32 = phi i8* [ null, %2 ], [ %28, %25 ], [ null, %7 ], [ null, %11 ]
  ret i8* %32
}

; Function Attrs: uwtable
define void @__cxa_rethrow_primary_exception(i8* %0) local_unnamed_addr #6 personality i32 (...)* @__gxx_personality_v0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %69, label %3

3:                                                ; preds = %1
  %4 = tail call i8* @_ZN10__cxxabiv130__aligned_malloc_with_fallbackEm(i64 128)
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  tail call void @_ZSt9terminatev() #11
  unreachable

7:                                                ; preds = %3
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 1 dereferenceable(128) %4, i8 0, i64 128, i1 false)
  %8 = getelementptr inbounds i8, i8* %4, i64 8
  %9 = bitcast i8* %8 to i8**
  store i8* %0, i8** %9, align 8, !tbaa !22
  %10 = getelementptr inbounds i8, i8* %0, i64 -120
  %11 = bitcast i8* %10 to i64*
  %12 = atomicrmw add i64* %11, i64 1 seq_cst
  %13 = getelementptr inbounds i8, i8* %0, i64 -112
  %14 = bitcast i8* %13 to i64*
  %15 = load i64, i64* %14, align 16, !tbaa !12
  %16 = getelementptr inbounds i8, i8* %4, i64 16
  %17 = bitcast i8* %16 to i64*
  store i64 %15, i64* %17, align 16, !tbaa !24
  %18 = tail call void ()* @_ZSt14get_unexpectedv() #12
  %19 = getelementptr inbounds i8, i8* %4, i64 32
  %20 = bitcast i8* %19 to void ()**
  store void ()* %18, void ()** %20, align 16, !tbaa !25
  %21 = tail call void ()* @_ZSt13get_terminatev() #12
  %22 = getelementptr inbounds i8, i8* %4, i64 40
  %23 = bitcast i8* %22 to void ()**
  store void ()* %21, void ()** %23, align 8, !tbaa !26
  %24 = getelementptr inbounds i8, i8* %4, i64 96
  %25 = bitcast i8* %24 to %struct._Unwind_Exception*
  %26 = bitcast i8* %24 to i64*
  store i64 4849336966747728641, i64* %26, align 16
  %27 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %27, i64 0, i32 1
  %29 = load i32, i32* %28, align 8, !tbaa !15
  %30 = add i32 %29, 1
  store i32 %30, i32* %28, align 8, !tbaa !15
  %31 = getelementptr inbounds i8, i8* %4, i64 104
  %32 = bitcast i8* %31 to void (i32, %struct._Unwind_Exception*)**
  store void (i32, %struct._Unwind_Exception*)* @_ZN10__cxxabiv1L27dependent_exception_cleanupE19_Unwind_Reason_CodeP17_Unwind_Exception, void (i32, %struct._Unwind_Exception*)** %32, align 8, !tbaa !27
  %33 = tail call i32 @_Unwind_RaiseException(%struct._Unwind_Exception* nonnull %25)
  %34 = load i64, i64* %26, align 16
  %35 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals()
          to label %36 unwind label %55

36:                                               ; preds = %7
  %37 = and i64 %34, -256
  %38 = icmp eq i64 %37, 4849336966747728640
  br i1 %38, label %39, label %62

39:                                               ; preds = %36
  %40 = bitcast i8* %4 to %"struct.__cxxabiv1::__cxa_exception"*
  %41 = getelementptr inbounds i8, i8* %4, i64 56
  %42 = bitcast i8* %41 to i32*
  %43 = load i32, i32* %42, align 8, !tbaa !19
  %44 = icmp slt i32 %43, 0
  %45 = sub i32 0, %43
  %46 = select i1 %44, i32 %45, i32 %43
  %47 = add nuw i32 %46, 1
  store i32 %47, i32* %42, align 8, !tbaa !19
  %48 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %35, i64 0, i32 0
  %49 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %48, align 8, !tbaa !20
  %50 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %49, %40
  br i1 %50, label %58, label %51

51:                                               ; preds = %39
  %52 = getelementptr inbounds i8, i8* %4, i64 48
  %53 = bitcast i8* %52 to %"struct.__cxxabiv1::__cxa_exception"**
  store %"struct.__cxxabiv1::__cxa_exception"* %49, %"struct.__cxxabiv1::__cxa_exception"** %53, align 16, !tbaa !21
  %54 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %35 to i8**
  store i8* %4, i8** %54, align 8, !tbaa !20
  br label %58

55:                                               ; preds = %7
  %56 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %57 = extractvalue { i8*, i32 } %56, 0
  tail call void @__cxa_call_unexpected(i8* %57) #11
  unreachable

58:                                               ; preds = %51, %39
  %59 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %35, i64 0, i32 1
  %60 = load i32, i32* %59, align 8, !tbaa !15
  %61 = add i32 %60, -1
  store i32 %61, i32* %59, align 8, !tbaa !15
  br label %69

62:                                               ; preds = %36
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %35, i64 0, i32 0
  %64 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %63, align 8, !tbaa !20
  %65 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %64, null
  br i1 %65, label %67, label %66

66:                                               ; preds = %62
  tail call void @_ZSt9terminatev() #11
  unreachable

67:                                               ; preds = %62
  %68 = bitcast %"struct.__cxxabiv1::__cxa_eh_globals"* %35 to i8**
  store i8* %4, i8** %68, align 8, !tbaa !20
  br label %69

69:                                               ; preds = %67, %58, %1
  ret void
}

; Function Attrs: uwtable
define internal void @_ZN10__cxxabiv1L27dependent_exception_cleanupE19_Unwind_Reason_CodeP17_Unwind_Exception(i32 %0, %struct._Unwind_Exception* %1) #6 personality i32 (...)* @__gxx_personality_v0 {
  %3 = icmp eq i32 %0, 1
  br i1 %3, label %8, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -2, i32 1
  %6 = bitcast void (i32, %struct._Unwind_Exception*)** %5 to void ()**
  %7 = load void ()*, void ()** %6, align 8, !tbaa !26
  tail call void @_ZSt11__terminatePFvvE(void ()* %7) #11
  unreachable

8:                                                ; preds = %2
  %9 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -3, i32 1
  %10 = bitcast void (i32, %struct._Unwind_Exception*)** %9 to i8**
  %11 = load i8*, i8** %10, align 8, !tbaa !22
  %12 = icmp eq i8* %11, null
  br i1 %12, label %32, label %13

13:                                               ; preds = %8
  %14 = getelementptr inbounds i8, i8* %11, i64 -128
  %15 = getelementptr inbounds i8, i8* %11, i64 -120
  %16 = bitcast i8* %15 to i64*
  %17 = atomicrmw add i64* %16, i64 -1 seq_cst
  %18 = icmp eq i64 %17, 1
  br i1 %18, label %19, label %32

19:                                               ; preds = %13
  %20 = getelementptr inbounds i8, i8* %11, i64 -104
  %21 = bitcast i8* %20 to void (i8*)**
  %22 = load void (i8*)*, void (i8*)** %21, align 8, !tbaa !13
  %23 = icmp eq void (i8*)* %22, null
  br i1 %23, label %28, label %24

24:                                               ; preds = %19
  invoke void %22(i8* nonnull %11)
          to label %28 unwind label %25

25:                                               ; preds = %24
  %26 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %27 = extractvalue { i8*, i32 } %26, 0
  tail call void @__cxa_call_unexpected(i8* %27) #11
  unreachable

28:                                               ; preds = %24, %19
  invoke void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %14)
          to label %32 unwind label %29

29:                                               ; preds = %28
  %30 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %31 = extractvalue { i8*, i32 } %30, 0
  tail call void @__cxa_call_unexpected(i8* %31) #11
  unreachable

32:                                               ; preds = %8, %13, %28
  %33 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -3
  %34 = bitcast %struct._Unwind_Exception* %33 to i8*
  tail call void @_ZN10__cxxabiv128__aligned_free_with_fallbackEPv(i8* nonnull %34)
  ret void
}

; Function Attrs: nounwind uwtable
define zeroext i1 @__cxa_uncaught_exception() local_unnamed_addr #2 personality i32 (...)* @__gxx_personality_v0 {
  %1 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
          to label %2 unwind label %4

2:                                                ; preds = %0
  %3 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %1, null
  br i1 %3, label %11, label %7

4:                                                ; preds = %0
  %5 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %6 = extractvalue { i8*, i32 } %5, 0
  tail call void @__cxa_call_unexpected(i8* %6) #11
  unreachable

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 1
  %9 = load i32, i32* %8, align 8, !tbaa !15
  %10 = icmp ne i32 %9, 0
  br label %11

11:                                               ; preds = %2, %7
  %12 = phi i1 [ %10, %7 ], [ false, %2 ]
  ret i1 %12
}

; Function Attrs: nounwind uwtable
define i32 @__cxa_uncaught_exceptions() local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
          to label %2 unwind label %4

2:                                                ; preds = %0
  %3 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %1, null
  br i1 %3, label %10, label %7

4:                                                ; preds = %0
  %5 = landingpad { i8*, i32 }
          filter [0 x i8*] zeroinitializer
  %6 = extractvalue { i8*, i32 } %5, 0
  tail call void @__cxa_call_unexpected(i8* %6) #11
  unreachable

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %1, i64 0, i32 1
  %9 = load i32, i32* %8, align 8, !tbaa !15
  br label %10

10:                                               ; preds = %2, %7
  %11 = phi i32 [ %9, %7 ], [ 0, %2 ]
  ret i32 %11
}

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn writeonly }
attributes #6 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind }
attributes #12 = { nounwind }
attributes #13 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 32}
!4 = !{!"_ZTSN10__cxxabiv115__cxa_exceptionE", !5, i64 0, !8, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !9, i64 56, !9, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !10, i64 96}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"_ZTS17_Unwind_Exception", !8, i64 0, !5, i64 8, !8, i64 16, !8, i64 24}
!11 = !{!4, !5, i64 40}
!12 = !{!4, !5, i64 16}
!13 = !{!4, !5, i64 24}
!14 = !{!4, !8, i64 8}
!15 = !{!16, !9, i64 8}
!16 = !{!"_ZTSN10__cxxabiv116__cxa_eh_globalsE", !5, i64 0, !9, i64 8}
!17 = !{!4, !5, i64 104}
!18 = !{!4, !5, i64 88}
!19 = !{!4, !9, i64 56}
!20 = !{!16, !5, i64 0}
!21 = !{!4, !5, i64 48}
!22 = !{!23, !5, i64 8}
!23 = !{!"_ZTSN10__cxxabiv125__cxa_dependent_exceptionE", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !9, i64 56, !9, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !10, i64 96}
!24 = !{!23, !5, i64 16}
!25 = !{!23, !5, i64 32}
!26 = !{!23, !5, i64 40}
!27 = !{!23, !5, i64 104}

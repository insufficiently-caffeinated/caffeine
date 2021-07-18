; ModuleID = 'll/.cxa_personality.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_personality.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }
%struct._Unwind_Context = type opaque
%"struct.__cxxabiv1::(anonymous namespace)::scan_results" = type { i64, i8*, i8*, i64, i8*, i32 }
%"struct.__cxxabiv1::__cxa_exception" = type { i8*, i64, %"class.std::type_info"*, void (i8*)*, void ()*, void ()*, %"struct.__cxxabiv1::__cxa_exception"*, i32, i32, i8*, i8*, i8*, i8*, %struct._Unwind_Exception }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"class.__cxxabiv1::__shim_type_info" = type { %"class.std::type_info" }
%"class.std::bad_exception" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"struct.__cxxabiv1::__cxa_eh_globals" = type { %"struct.__cxxabiv1::__cxa_exception"*, i32 }

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [37 x i8] c"results.reason == _URC_HANDLER_FOUND\00", align 1
@.str.1 = private unnamed_addr constant [86 x i8] c"/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_personality.cpp\00", align 1
@__PRETTY_FUNCTION__.__gxx_personality_v0 = private unnamed_addr constant [124 x i8] c"_Unwind_Reason_Code __cxxabiv1::__gxx_personality_v0(int, _Unwind_Action, uint64_t, _Unwind_Exception *, _Unwind_Context *)\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"actions & _UA_CLEANUP_PHASE\00", align 1
@_ZTISt13bad_exception = external constant i8*
@.str.3 = private unnamed_addr constant [68 x i8] c"actions & (_UA_SEARCH_PHASE | _UA_HANDLER_FRAME | _UA_FORCE_UNWIND)\00", align 1
@__PRETTY_FUNCTION__._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context = private unnamed_addr constant [142 x i8] c"void __cxxabiv1::scan_eh_tab(__cxxabiv1::(anonymous namespace)::scan_results &, _Unwind_Action, bool, _Unwind_Exception *, _Unwind_Context *)\00", align 1
@.str.4 = private unnamed_addr constant [48 x i8] c"actions & (_UA_SEARCH_PHASE | _UA_FORCE_UNWIND)\00", align 1
@.str.5 = private unnamed_addr constant [27 x i8] c"actions & _UA_SEARCH_PHASE\00", align 1
@.str.7 = private unnamed_addr constant [62 x i8] c"(base != 0) && \22DW_EH_PE_datarel is invalid with a base of 0\22\00", align 1
@__PRETTY_FUNCTION__._ZN10__cxxabiv1L18readEncodedPointerEPPKhhm = private unnamed_addr constant [79 x i8] c"uintptr_t __cxxabiv1::readEncodedPointer(const uint8_t **, uint8_t, uintptr_t)\00", align 1
@_ZTVSt13bad_exception = external unnamed_addr constant { [5 x i8*] }, align 8
@switch.table._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context = private unnamed_addr constant [13 x i64] [i64 3, i64 3, i64 1, i64 2, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 1, i64 2, i64 3], align 8
@switch.table.__cxa_call_unexpected.9 = private unnamed_addr constant [11 x i64] [i64 1, i64 2, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 1, i64 2, i64 3], align 8

; Function Attrs: uwtable
define i32 @__gxx_personality_v0(i32 %0, i32 %1, i64 %2, %struct._Unwind_Exception* %3, %struct._Unwind_Context* %4) #0 {
  %6 = alloca %"struct.__cxxabiv1::(anonymous namespace)::scan_results", align 8
  %7 = icmp ne i32 %0, 1
  %8 = icmp eq %struct._Unwind_Exception* %3, null
  %9 = or i1 %7, %8
  %10 = icmp eq %struct._Unwind_Context* %4, null
  %11 = or i1 %9, %10
  br i1 %11, label %83, label %12

12:                                               ; preds = %5
  %13 = and i64 %2, -256
  %14 = icmp eq i64 %13, 4849336966747728640
  %15 = bitcast %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %15) #11
  %16 = icmp eq i32 %1, 6
  br i1 %16, label %18, label %17

17:                                               ; preds = %12
  call fastcc void @_ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context(%"struct.__cxxabiv1::(anonymous namespace)::scan_results"* nonnull align 8 dereferenceable(48) %6, i32 %1, i1 zeroext %14, %struct._Unwind_Exception* nonnull %3, %struct._Unwind_Context* nonnull %4)
  br label %42

18:                                               ; preds = %12
  br i1 %14, label %20, label %19

19:                                               ; preds = %18
  call fastcc void @_ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context(%"struct.__cxxabiv1::(anonymous namespace)::scan_results"* nonnull align 8 dereferenceable(48) %6, i32 6, i1 zeroext false, %struct._Unwind_Exception* nonnull %3, %struct._Unwind_Context* nonnull %4)
  br label %42

20:                                               ; preds = %18
  %21 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -3
  %22 = bitcast %struct._Unwind_Exception* %21 to %"struct.__cxxabiv1::__cxa_exception"*
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %22, i64 0, i32 8
  %24 = load i32, i32* %23, align 4, !tbaa !3
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 0
  store i64 %25, i64* %26, align 8, !tbaa !11
  %27 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -1, i32 0
  %28 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 1
  %29 = bitcast i64* %27 to <2 x i64>*
  %30 = load <2 x i64>, <2 x i64>* %29, align 16, !tbaa !14
  %31 = bitcast i8** %28 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %31, align 8, !tbaa !14
  %32 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -1, i32 2
  %33 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 3
  %34 = bitcast i64* %32 to <2 x i64>*
  %35 = load <2 x i64>, <2 x i64>* %34, align 16, !tbaa !14
  %36 = bitcast i64* %33 to <2 x i64>*
  store <2 x i64> %35, <2 x i64>* %36, align 8, !tbaa !15
  %37 = ptrtoint %struct._Unwind_Exception* %3 to i64
  tail call void @_Unwind_SetGR(%struct._Unwind_Context* nonnull %4, i32 0, i64 %37)
  tail call void @_Unwind_SetGR(%struct._Unwind_Context* nonnull %4, i32 1, i64 %25)
  %38 = extractelement <2 x i64> %35, i32 0
  tail call void @_Unwind_SetIP(%struct._Unwind_Context* nonnull %4, i64 %38)
  %39 = icmp slt i32 %24, 0
  br i1 %39, label %40, label %81

40:                                               ; preds = %20
  %41 = bitcast i64* %32 to i8**
  store i8* null, i8** %41, align 16, !tbaa !16
  br label %81

42:                                               ; preds = %19, %17
  %43 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 5
  %44 = load i32, i32* %43, align 8, !tbaa !17
  switch i32 %44, label %45 [
    i32 8, label %81
    i32 3, label %81
  ]

45:                                               ; preds = %42
  %46 = and i32 %1, 1
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %64, label %48

48:                                               ; preds = %45
  %49 = icmp eq i32 %44, 6
  br i1 %49, label %51, label %50

50:                                               ; preds = %48
  tail call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 956, i8* getelementptr inbounds ([124 x i8], [124 x i8]* @__PRETTY_FUNCTION__.__gxx_personality_v0, i64 0, i64 0)) #12
  unreachable

51:                                               ; preds = %48
  br i1 %14, label %52, label %81

52:                                               ; preds = %51
  %53 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -3
  %54 = bitcast %struct._Unwind_Exception* %53 to %"struct.__cxxabiv1::__cxa_exception"*
  %55 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 0
  %56 = load i64, i64* %55, align 8, !tbaa !11
  %57 = trunc i64 %56 to i32
  %58 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %54, i64 0, i32 8
  store i32 %57, i32* %58, align 4, !tbaa !3
  %59 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 1
  %60 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -1, i32 0
  %61 = bitcast i8** %59 to <4 x i64>*
  %62 = load <4 x i64>, <4 x i64>* %61, align 8, !tbaa !15
  %63 = bitcast i64* %60 to <4 x i64>*
  store <4 x i64> %62, <4 x i64>* %63, align 16, !tbaa !14
  br label %81

64:                                               ; preds = %45
  %65 = and i32 %1, 2
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %68

67:                                               ; preds = %64
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 969, i8* getelementptr inbounds ([124 x i8], [124 x i8]* @__PRETTY_FUNCTION__.__gxx_personality_v0, i64 0, i64 0)) #12
  unreachable

68:                                               ; preds = %64
  %69 = icmp eq i32 %44, 6
  br i1 %69, label %71, label %70

70:                                               ; preds = %68
  tail call void @__assert_fail(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 970, i8* getelementptr inbounds ([124 x i8], [124 x i8]* @__PRETTY_FUNCTION__.__gxx_personality_v0, i64 0, i64 0)) #12
  unreachable

71:                                               ; preds = %68
  %72 = ptrtoint %struct._Unwind_Exception* %3 to i64
  tail call void @_Unwind_SetGR(%struct._Unwind_Context* nonnull %4, i32 0, i64 %72)
  %73 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 0
  %74 = load i64, i64* %73, align 8, !tbaa !11
  tail call void @_Unwind_SetGR(%struct._Unwind_Context* nonnull %4, i32 1, i64 %74)
  %75 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %6, i64 0, i32 3
  %76 = load i64, i64* %75, align 8, !tbaa !18
  tail call void @_Unwind_SetIP(%struct._Unwind_Context* nonnull %4, i64 %76)
  %77 = icmp slt i64 %74, 0
  br i1 %77, label %78, label %81

78:                                               ; preds = %71
  %79 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -1, i32 2
  %80 = bitcast i64* %79 to i8**
  store i8* null, i8** %80, align 16, !tbaa !16
  br label %81

81:                                               ; preds = %42, %42, %71, %78, %51, %52, %20, %40
  %82 = phi i32 [ 7, %40 ], [ 7, %20 ], [ 6, %52 ], [ 6, %51 ], [ 7, %78 ], [ 7, %71 ], [ %44, %42 ], [ %44, %42 ]
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %15) #11
  br label %83

83:                                               ; preds = %5, %81
  %84 = phi i32 [ %82, %81 ], [ 3, %5 ]
  ret i32 %84
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: uwtable
define internal fastcc void @_ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context(%"struct.__cxxabiv1::(anonymous namespace)::scan_results"* nocapture nonnull align 8 dereferenceable(48) %0, i32 %1, i1 zeroext %2, %struct._Unwind_Exception* %3, %struct._Unwind_Context* %4) unnamed_addr #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 0
  %13 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 1
  %14 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 2
  %15 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 3
  %16 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 4
  %17 = getelementptr inbounds %"struct.__cxxabiv1::(anonymous namespace)::scan_results", %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0, i64 0, i32 5
  %18 = bitcast %"struct.__cxxabiv1::(anonymous namespace)::scan_results"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(40) %18, i8 0, i64 40, i1 false)
  store i32 3, i32* %17, align 8, !tbaa !17
  %19 = and i32 %1, 1
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %25, label %21

21:                                               ; preds = %5
  %22 = and i32 %1, 14
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %33, label %24

24:                                               ; preds = %21
  store i32 3, i32* %17, align 8, !tbaa !17
  br label %397

25:                                               ; preds = %5
  %26 = and i32 %1, 2
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %32, label %28

28:                                               ; preds = %25
  %29 = and i32 %1, 12
  %30 = icmp eq i32 %29, 12
  br i1 %30, label %31, label %33

31:                                               ; preds = %28
  store i32 2, i32* %17, align 8, !tbaa !17
  br label %397

32:                                               ; preds = %25
  store i32 3, i32* %17, align 8, !tbaa !17
  br label %397

33:                                               ; preds = %28, %21
  %34 = bitcast i8** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %34) #11
  %35 = tail call i8* @_Unwind_GetLanguageSpecificData(%struct._Unwind_Context* %4)
  store i8* %35, i8** %9, align 8, !tbaa !14
  %36 = icmp eq i8* %35, null
  br i1 %36, label %37, label %38

37:                                               ; preds = %33
  store i32 8, i32* %17, align 8, !tbaa !17
  br label %396

38:                                               ; preds = %33
  store i8* %35, i8** %14, align 8, !tbaa !19
  %39 = tail call i64 @_Unwind_GetIP(%struct._Unwind_Context* %4)
  %40 = tail call i64 @_Unwind_GetRegionStart(%struct._Unwind_Context* %4)
  %41 = xor i64 %40, -1
  %42 = add i64 %39, %41
  %43 = getelementptr inbounds i8, i8* %35, i64 1
  store i8* %43, i8** %9, align 8, !tbaa !14
  %44 = load i8, i8* %35, align 1, !tbaa !15
  %45 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %9, i8 zeroext %44, i64 0)
  %46 = icmp eq i64 %45, 0
  %47 = select i1 %46, i64 %40, i64 %45
  %48 = load i8*, i8** %9, align 8, !tbaa !14
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  store i8* %49, i8** %9, align 8, !tbaa !14
  %50 = load i8, i8* %48, align 1, !tbaa !15
  %51 = icmp eq i8 %50, -1
  br i1 %51, label %66, label %52

52:                                               ; preds = %38, %52
  %53 = phi i64 [ %62, %52 ], [ 0, %38 ]
  %54 = phi i64 [ %61, %52 ], [ 0, %38 ]
  %55 = phi i8* [ %56, %52 ], [ %49, %38 ]
  %56 = getelementptr inbounds i8, i8* %55, i64 1
  %57 = load i8, i8* %55, align 1, !tbaa !15
  %58 = and i8 %57, 127
  %59 = zext i8 %58 to i64
  %60 = shl i64 %59, %53
  %61 = or i64 %60, %54
  %62 = add i64 %53, 7
  %63 = icmp sgt i8 %57, -1
  br i1 %63, label %64, label %52

64:                                               ; preds = %52
  store i8* %56, i8** %9, align 8, !tbaa !14
  %65 = getelementptr inbounds i8, i8* %56, i64 %61
  br label %66

66:                                               ; preds = %38, %64
  %67 = phi i8* [ %56, %64 ], [ %49, %38 ]
  %68 = phi i8* [ %65, %64 ], [ null, %38 ]
  %69 = getelementptr inbounds i8, i8* %67, i64 1
  store i8* %69, i8** %9, align 8, !tbaa !14
  %70 = load i8, i8* %67, align 1, !tbaa !15
  br label %71

71:                                               ; preds = %71, %66
  %72 = phi i64 [ 0, %66 ], [ %81, %71 ]
  %73 = phi i64 [ 0, %66 ], [ %80, %71 ]
  %74 = phi i8* [ %69, %66 ], [ %75, %71 ]
  %75 = getelementptr inbounds i8, i8* %74, i64 1
  %76 = load i8, i8* %74, align 1, !tbaa !15
  %77 = and i8 %76, 127
  %78 = zext i8 %77 to i64
  %79 = shl i64 %78, %72
  %80 = or i64 %79, %73
  %81 = add i64 %72, 7
  %82 = icmp sgt i8 %76, -1
  br i1 %82, label %83, label %71

83:                                               ; preds = %71
  store i8* %75, i8** %9, align 8, !tbaa !14
  %84 = and i64 %80, 4294967295
  %85 = getelementptr inbounds i8, i8* %75, i64 %84
  %86 = bitcast i8** %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %86) #11
  store i8* %75, i8** %10, align 8, !tbaa !14
  br label %87

87:                                               ; preds = %391, %83
  %88 = phi i8* [ %99, %391 ], [ %75, %83 ]
  %89 = icmp ult i8* %88, %85
  br i1 %89, label %90, label %394

90:                                               ; preds = %87
  %91 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %10, i8 zeroext %70, i64 0)
  %92 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %10, i8 zeroext %70, i64 0)
  %93 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %10, i8 zeroext %70, i64 0)
  %94 = load i8*, i8** %10, align 8, !tbaa !14
  br label %95

95:                                               ; preds = %95, %90
  %96 = phi i64 [ 0, %90 ], [ %105, %95 ]
  %97 = phi i64 [ 0, %90 ], [ %104, %95 ]
  %98 = phi i8* [ %94, %90 ], [ %99, %95 ]
  %99 = getelementptr inbounds i8, i8* %98, i64 1
  %100 = load i8, i8* %98, align 1, !tbaa !15
  %101 = and i8 %100, 127
  %102 = zext i8 %101 to i64
  %103 = shl i64 %102, %96
  %104 = or i64 %103, %97
  %105 = add i64 %96, 7
  %106 = icmp sgt i8 %100, -1
  br i1 %106, label %107, label %95

107:                                              ; preds = %95
  store i8* %99, i8** %10, align 8, !tbaa !14
  %108 = icmp ule i64 %91, %42
  %109 = add i64 %92, %91
  %110 = icmp ult i64 %42, %109
  %111 = and i1 %108, %110
  br i1 %111, label %112, label %391

112:                                              ; preds = %107
  %113 = icmp eq i64 %93, 0
  br i1 %113, label %114, label %115

114:                                              ; preds = %112
  store i32 8, i32* %17, align 8, !tbaa !17
  br label %395

115:                                              ; preds = %112
  %116 = add i64 %93, %47
  store i64 %116, i64* %15, align 8, !tbaa !18
  %117 = icmp eq i64 %104, 0
  br i1 %117, label %118, label %120

118:                                              ; preds = %115
  %119 = select i1 %20, i32 6, i32 8
  store i32 %119, i32* %17, align 8, !tbaa !17
  br label %395

120:                                              ; preds = %115
  %121 = add i64 %104, -1
  %122 = getelementptr inbounds i8, i8* %85, i64 %121
  %123 = and i32 %1, 8
  %124 = icmp ne i32 %123, 0
  %125 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 1
  %126 = bitcast %struct._Unwind_Exception* %125 to i8*
  %127 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -3, i32 1
  %128 = bitcast void (i32, %struct._Unwind_Exception*)** %127 to i8**
  %129 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %3, i64 -3, i32 2
  %130 = bitcast i64* %129 to %"class.__cxxabiv1::__shim_type_info"**
  %131 = icmp eq i8* %68, null
  %132 = bitcast i8** %8 to i8*
  %133 = bitcast i8** %7 to i8*
  %134 = and i8 %50, 15
  %135 = zext i8 %134 to i32
  %136 = bitcast i8** %6 to i8*
  %137 = bitcast i8** %11 to i8*
  %138 = add nsw i32 %135, -2
  %139 = icmp ult i32 %138, 11
  %140 = trunc i32 %138 to i16
  %141 = lshr i16 1799, %140
  %142 = and i16 %141, 1
  %143 = icmp eq i16 %142, 0
  %144 = sext i32 %138 to i64
  %145 = getelementptr inbounds [11 x i64], [11 x i64]* @switch.table.__cxa_call_unexpected.9, i64 0, i64 %144
  %146 = icmp ult i8 %134, 13
  %147 = zext i8 %134 to i16
  %148 = lshr i16 7197, %147
  %149 = and i16 %148, 1
  %150 = icmp eq i16 %149, 0
  %151 = zext i8 %134 to i64
  %152 = getelementptr inbounds [13 x i64], [13 x i64]* @switch.table._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context, i64 0, i64 %151
  br label %153

153:                                              ; preds = %389, %120
  %154 = phi i8* [ %122, %120 ], [ %390, %389 ]
  %155 = phi i8 [ 0, %120 ], [ %360, %389 ]
  br label %156

156:                                              ; preds = %156, %153
  %157 = phi i64 [ 0, %153 ], [ %166, %156 ]
  %158 = phi i64 [ 0, %153 ], [ %165, %156 ]
  %159 = phi i8* [ %154, %153 ], [ %160, %156 ]
  %160 = getelementptr inbounds i8, i8* %159, i64 1
  %161 = load i8, i8* %159, align 1, !tbaa !15
  %162 = and i8 %161, 127
  %163 = zext i8 %162 to i64
  %164 = shl i64 %163, %157
  %165 = or i64 %164, %158
  %166 = add i64 %157, 7
  %167 = icmp sgt i8 %161, -1
  br i1 %167, label %168, label %156

168:                                              ; preds = %156
  %169 = and i8 %161, 64
  %170 = icmp ne i8 %169, 0
  %171 = icmp ult i64 %166, 64
  %172 = and i1 %171, %170
  %173 = shl nsw i64 -1, %166
  %174 = select i1 %172, i64 %173, i64 0
  %175 = or i64 %165, %174
  %176 = icmp sgt i64 %175, 0
  br i1 %176, label %177, label %234

177:                                              ; preds = %168
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %136)
  store i8* %68, i8** %6, align 8, !tbaa !14
  br i1 %131, label %178, label %179

178:                                              ; preds = %177
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext %2, %struct._Unwind_Exception* %3) #11
  unreachable

179:                                              ; preds = %177
  %180 = xor i1 %146, true
  %181 = or i1 %180, %150
  br i1 %181, label %182, label %183

182:                                              ; preds = %179
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext %2, %struct._Unwind_Exception* %3) #11
  unreachable

183:                                              ; preds = %179
  %184 = load i64, i64* %152, align 8
  %185 = shl i64 %175, %184
  %186 = sub i64 0, %185
  %187 = getelementptr inbounds i8, i8* %68, i64 %186
  store i8* %187, i8** %6, align 8, !tbaa !14
  %188 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %6, i8 zeroext %50, i64 0) #11
  %189 = inttoptr i64 %188 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %136)
  %190 = icmp eq i64 %188, 0
  br i1 %190, label %191, label %204

191:                                              ; preds = %183
  %192 = and i32 %1, 13
  %193 = icmp eq i32 %192, 0
  br i1 %193, label %194, label %195

194:                                              ; preds = %191
  call void @__assert_fail(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 740, i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context, i64 0, i64 0)) #12
  unreachable

195:                                              ; preds = %191
  %196 = ptrtoint i8* %154 to i64
  store i64 %175, i64* %12, align 8, !tbaa !11
  %197 = bitcast i8** %13 to i64*
  store i64 %196, i64* %197, align 8, !tbaa !20
  %198 = call i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* %3)
  %199 = icmp eq i64 %198, 4849336966747728641
  br i1 %199, label %200, label %202

200:                                              ; preds = %195
  %201 = load i8*, i8** %128, align 8, !tbaa !21
  br label %202

202:                                              ; preds = %195, %200
  %203 = phi i8* [ %201, %200 ], [ %126, %195 ]
  store i8* %203, i8** %16, align 8, !tbaa !23
  store i32 6, i32* %17, align 8, !tbaa !17
  br label %395

204:                                              ; preds = %183
  br i1 %2, label %205, label %359

205:                                              ; preds = %204
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %137) #11
  %206 = call i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* %3)
  %207 = icmp eq i64 %206, 4849336966747728641
  br i1 %207, label %208, label %210

208:                                              ; preds = %205
  %209 = load i8*, i8** %128, align 8, !tbaa !21
  br label %210

210:                                              ; preds = %205, %208
  %211 = phi i8* [ %209, %208 ], [ %126, %205 ]
  store i8* %211, i8** %11, align 8, !tbaa !14
  %212 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %130, align 16, !tbaa !24
  %213 = icmp eq i8* %211, null
  %214 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %212, null
  %215 = or i1 %213, %214
  br i1 %215, label %216, label %217

216:                                              ; preds = %210
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext true, %struct._Unwind_Exception* nonnull %3)
  unreachable

217:                                              ; preds = %210
  %218 = inttoptr i64 %188 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %219 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %218, align 8, !tbaa !25
  %220 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %219, i64 4
  %221 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %220, align 8
  %222 = call zeroext i1 %221(%"class.__cxxabiv1::__shim_type_info"* nonnull %189, %"class.__cxxabiv1::__shim_type_info"* nonnull %212, i8** nonnull align 8 dereferenceable(8) %11)
  br i1 %222, label %223, label %233

223:                                              ; preds = %217
  %224 = and i32 %1, 9
  %225 = icmp eq i32 %224, 0
  br i1 %225, label %226, label %227

226:                                              ; preds = %223
  call void @__assert_fail(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 766, i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context, i64 0, i64 0)) #12
  unreachable

227:                                              ; preds = %223
  %228 = ptrtoint i8* %154 to i64
  store i64 %175, i64* %12, align 8, !tbaa !11
  %229 = bitcast i8** %13 to i64*
  store i64 %228, i64* %229, align 8, !tbaa !20
  %230 = bitcast i8** %11 to i64*
  %231 = load i64, i64* %230, align 8, !tbaa !14
  %232 = bitcast i8** %16 to i64*
  store i64 %231, i64* %232, align 8, !tbaa !23
  store i32 6, i32* %17, align 8, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %137) #11
  br label %395

233:                                              ; preds = %217
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %137) #11
  br label %359

234:                                              ; preds = %168
  %235 = icmp eq i64 %175, 0
  %236 = or i1 %235, %124
  %237 = select i1 %235, i8 1, i8 %155
  br i1 %236, label %359, label %238

238:                                              ; preds = %234
  br i1 %2, label %239, label %350

239:                                              ; preds = %238
  %240 = call i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* %3)
  %241 = icmp eq i64 %240, 4849336966747728641
  br i1 %241, label %242, label %244

242:                                              ; preds = %239
  %243 = load i8*, i8** %128, align 8, !tbaa !21
  br label %244

244:                                              ; preds = %239, %242
  %245 = phi i8* [ %243, %242 ], [ %126, %239 ]
  %246 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %130, align 16, !tbaa !24
  %247 = icmp eq i8* %245, null
  %248 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %246, null
  %249 = or i1 %247, %248
  br i1 %249, label %250, label %251

250:                                              ; preds = %244
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext true, %struct._Unwind_Exception* nonnull %3)
  unreachable

251:                                              ; preds = %244
  br i1 %131, label %252, label %253

252:                                              ; preds = %251
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext false, %struct._Unwind_Exception* nonnull %3)
  unreachable

253:                                              ; preds = %251
  %254 = xor i64 %175, -1
  %255 = getelementptr inbounds i8, i8* %68, i64 %254
  switch i32 %135, label %312 [
    i32 0, label %256
    i32 2, label %284
  ]

256:                                              ; preds = %253, %268
  %257 = phi i64 [ %269, %268 ], [ 0, %253 ]
  %258 = phi i64 [ %270, %268 ], [ 0, %253 ]
  %259 = phi i8* [ %260, %268 ], [ %255, %253 ]
  %260 = getelementptr inbounds i8, i8* %259, i64 1
  %261 = load i8, i8* %259, align 1, !tbaa !15
  %262 = and i8 %261, 127
  %263 = zext i8 %262 to i64
  %264 = shl i64 %263, %257
  %265 = or i64 %264, %258
  %266 = add i64 %257, 7
  %267 = icmp sgt i8 %261, -1
  br i1 %267, label %271, label %268

268:                                              ; preds = %256, %273
  %269 = phi i64 [ %266, %256 ], [ 0, %273 ]
  %270 = phi i64 [ %265, %256 ], [ 0, %273 ]
  br label %256

271:                                              ; preds = %256
  %272 = icmp eq i64 %265, 0
  br i1 %272, label %345, label %273

273:                                              ; preds = %271
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %133)
  %274 = shl i64 %265, 3
  %275 = sub i64 0, %274
  %276 = getelementptr inbounds i8, i8* %68, i64 %275
  store i8* %276, i8** %7, align 8, !tbaa !14
  %277 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %7, i8 zeroext %50, i64 0) #11
  %278 = inttoptr i64 %277 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %133)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %132) #11
  store i8* %245, i8** %8, align 8, !tbaa !14
  %279 = inttoptr i64 %277 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %280 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %279, align 8, !tbaa !25
  %281 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %280, i64 4
  %282 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %281, align 8
  %283 = call zeroext i1 %282(%"class.__cxxabiv1::__shim_type_info"* %278, %"class.__cxxabiv1::__shim_type_info"* %246, i8** nonnull align 8 dereferenceable(8) %8)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %132) #11
  br i1 %283, label %359, label %268

284:                                              ; preds = %253, %296
  %285 = phi i64 [ %297, %296 ], [ 0, %253 ]
  %286 = phi i64 [ %298, %296 ], [ 0, %253 ]
  %287 = phi i8* [ %288, %296 ], [ %255, %253 ]
  %288 = getelementptr inbounds i8, i8* %287, i64 1
  %289 = load i8, i8* %287, align 1, !tbaa !15
  %290 = and i8 %289, 127
  %291 = zext i8 %290 to i64
  %292 = shl i64 %291, %285
  %293 = or i64 %292, %286
  %294 = add i64 %285, 7
  %295 = icmp sgt i8 %289, -1
  br i1 %295, label %299, label %296

296:                                              ; preds = %284, %301
  %297 = phi i64 [ %294, %284 ], [ 0, %301 ]
  %298 = phi i64 [ %293, %284 ], [ 0, %301 ]
  br label %284

299:                                              ; preds = %284
  %300 = icmp eq i64 %293, 0
  br i1 %300, label %345, label %301

301:                                              ; preds = %299
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %133)
  %302 = shl i64 %293, 1
  %303 = sub i64 0, %302
  %304 = getelementptr inbounds i8, i8* %68, i64 %303
  store i8* %304, i8** %7, align 8, !tbaa !14
  %305 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %7, i8 zeroext %50, i64 0) #11
  %306 = inttoptr i64 %305 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %133)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %132) #11
  store i8* %245, i8** %8, align 8, !tbaa !14
  %307 = inttoptr i64 %305 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %308 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %307, align 8, !tbaa !25
  %309 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %308, i64 4
  %310 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %309, align 8
  %311 = call zeroext i1 %310(%"class.__cxxabiv1::__shim_type_info"* %306, %"class.__cxxabiv1::__shim_type_info"* %246, i8** nonnull align 8 dereferenceable(8) %8)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %132) #11
  br i1 %311, label %359, label %296

312:                                              ; preds = %253, %324
  %313 = phi i64 [ %325, %324 ], [ 0, %253 ]
  %314 = phi i64 [ %326, %324 ], [ 0, %253 ]
  %315 = phi i8* [ %316, %324 ], [ %255, %253 ]
  %316 = getelementptr inbounds i8, i8* %315, i64 1
  %317 = load i8, i8* %315, align 1, !tbaa !15
  %318 = and i8 %317, 127
  %319 = zext i8 %318 to i64
  %320 = shl i64 %319, %313
  %321 = or i64 %320, %314
  %322 = add i64 %313, 7
  %323 = icmp sgt i8 %317, -1
  br i1 %323, label %327, label %324

324:                                              ; preds = %312, %333
  %325 = phi i64 [ %322, %312 ], [ 0, %333 ]
  %326 = phi i64 [ %321, %312 ], [ 0, %333 ]
  br label %312

327:                                              ; preds = %312
  %328 = icmp eq i64 %321, 0
  br i1 %328, label %345, label %329

329:                                              ; preds = %327
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %133)
  store i8* %68, i8** %7, align 8, !tbaa !14
  %330 = xor i1 %139, true
  %331 = or i1 %330, %143
  br i1 %331, label %332, label %333

332:                                              ; preds = %329
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext true, %struct._Unwind_Exception* %3) #11
  unreachable

333:                                              ; preds = %329
  %334 = load i64, i64* %145, align 8
  %335 = shl i64 %321, %334
  %336 = sub i64 0, %335
  %337 = getelementptr inbounds i8, i8* %68, i64 %336
  store i8* %337, i8** %7, align 8, !tbaa !14
  %338 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %7, i8 zeroext %50, i64 0) #11
  %339 = inttoptr i64 %338 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %133)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %132) #11
  store i8* %245, i8** %8, align 8, !tbaa !14
  %340 = inttoptr i64 %338 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %341 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %340, align 8, !tbaa !25
  %342 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %341, i64 4
  %343 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %342, align 8
  %344 = call zeroext i1 %343(%"class.__cxxabiv1::__shim_type_info"* %339, %"class.__cxxabiv1::__shim_type_info"* %246, i8** nonnull align 8 dereferenceable(8) %8)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %132) #11
  br i1 %344, label %359, label %324

345:                                              ; preds = %299, %271, %327
  br i1 %20, label %346, label %347

346:                                              ; preds = %345
  call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 799, i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__PRETTY_FUNCTION__._ZN10__cxxabiv1L11scan_eh_tabERNS_12_GLOBAL__N_112scan_resultsE14_Unwind_ActionbP17_Unwind_ExceptionP15_Unwind_Context, i64 0, i64 0)) #12
  unreachable

347:                                              ; preds = %345
  %348 = ptrtoint i8* %154 to i64
  store i64 %175, i64* %12, align 8, !tbaa !11
  %349 = bitcast i8** %13 to i64*
  store i64 %348, i64* %349, align 8, !tbaa !20
  store i8* %245, i8** %16, align 8, !tbaa !23
  store i32 6, i32* %17, align 8, !tbaa !17
  br label %395

350:                                              ; preds = %238
  %351 = ptrtoint i8* %154 to i64
  store i64 %175, i64* %12, align 8, !tbaa !11
  %352 = bitcast i8** %13 to i64*
  store i64 %351, i64* %352, align 8, !tbaa !20
  %353 = call i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* %3)
  %354 = icmp eq i64 %353, 4849336966747728641
  br i1 %354, label %355, label %357

355:                                              ; preds = %350
  %356 = load i8*, i8** %128, align 8, !tbaa !21
  br label %357

357:                                              ; preds = %350, %355
  %358 = phi i8* [ %356, %355 ], [ %126, %350 ]
  store i8* %358, i8** %16, align 8, !tbaa !23
  store i32 6, i32* %17, align 8, !tbaa !17
  br label %395

359:                                              ; preds = %301, %273, %333, %234, %233, %204
  %360 = phi i8 [ %155, %204 ], [ %155, %233 ], [ %237, %234 ], [ %155, %333 ], [ %155, %273 ], [ %155, %301 ]
  br label %361

361:                                              ; preds = %361, %359
  %362 = phi i64 [ 0, %359 ], [ %371, %361 ]
  %363 = phi i64 [ 0, %359 ], [ %370, %361 ]
  %364 = phi i8* [ %160, %359 ], [ %365, %361 ]
  %365 = getelementptr inbounds i8, i8* %364, i64 1
  %366 = load i8, i8* %364, align 1, !tbaa !15
  %367 = and i8 %366, 127
  %368 = zext i8 %367 to i64
  %369 = shl i64 %368, %362
  %370 = or i64 %369, %363
  %371 = add i64 %362, 7
  %372 = icmp sgt i8 %366, -1
  br i1 %372, label %373, label %361

373:                                              ; preds = %361
  %374 = and i8 %366, 64
  %375 = icmp ne i8 %374, 0
  %376 = icmp ult i64 %371, 64
  %377 = and i1 %376, %375
  %378 = shl nsw i64 -1, %371
  %379 = select i1 %377, i64 %378, i64 0
  %380 = or i64 %370, %379
  %381 = icmp eq i64 %380, 0
  br i1 %381, label %382, label %389

382:                                              ; preds = %373
  %383 = and i8 %360, 1
  %384 = icmp ne i8 %383, 0
  %385 = and i32 %1, 2
  %386 = icmp ne i32 %385, 0
  %387 = and i1 %386, %384
  %388 = select i1 %387, i32 6, i32 8
  store i32 %388, i32* %17, align 8, !tbaa !17
  br label %395

389:                                              ; preds = %373
  %390 = getelementptr inbounds i8, i8* %160, i64 %380
  br label %153

391:                                              ; preds = %107
  %392 = icmp ult i64 %42, %91
  br i1 %392, label %393, label %87

393:                                              ; preds = %391
  tail call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext %2, %struct._Unwind_Exception* %3)
  unreachable

394:                                              ; preds = %87
  tail call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext %2, %struct._Unwind_Exception* %3)
  unreachable

395:                                              ; preds = %382, %347, %227, %202, %357, %114, %118
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %86) #11
  br label %396

396:                                              ; preds = %395, %37
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %34) #11
  br label %397

397:                                              ; preds = %396, %24, %31, %32
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

; Function Attrs: noreturn uwtable
define void @__cxa_call_unexpected(i8* %0) local_unnamed_addr #3 personality i8* bitcast (i32 (i32, i32, i64, %struct._Unwind_Exception*, %struct._Unwind_Context*)* @__gxx_personality_v0 to i8*) {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::bad_exception", align 8
  %8 = bitcast i8* %0 to %struct._Unwind_Exception*
  %9 = icmp eq i8* %0, null
  br i1 %9, label %10, label %11

10:                                               ; preds = %1
  tail call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext false, %struct._Unwind_Exception* null)
  unreachable

11:                                               ; preds = %1
  %12 = tail call i8* @__cxa_begin_catch(i8* nonnull %0) #11
  %13 = tail call zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %8)
  %14 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #11
  br i1 %13, label %15, label %37

15:                                               ; preds = %11
  %16 = getelementptr inbounds i8, i8* %0, i64 -96
  %17 = bitcast i8* %16 to %"struct.__cxxabiv1::__cxa_exception"*
  %18 = getelementptr inbounds i8, i8* %0, i64 -56
  %19 = bitcast i8* %18 to void ()**
  %20 = load void ()*, void ()** %19, align 8, !tbaa !27
  %21 = getelementptr inbounds i8, i8* %0, i64 -64
  %22 = bitcast i8* %21 to void ()**
  %23 = load void ()*, void ()** %22, align 16, !tbaa !28
  %24 = getelementptr inbounds i8, i8* %0, i64 -36
  %25 = bitcast i8* %24 to i32*
  %26 = load i32, i32* %25, align 4, !tbaa !3
  %27 = getelementptr inbounds i8, i8* %0, i64 -24
  %28 = bitcast i8* %27 to i64*
  %29 = load i64, i64* %28, align 8, !tbaa !29
  %30 = bitcast i8** %6 to i64*
  store i64 %29, i64* %30, align 8, !tbaa !14
  %31 = getelementptr inbounds i8, i8* %0, i64 -16
  %32 = bitcast i8* %31 to i64*
  %33 = load i64, i64* %32, align 16, !tbaa !16
  %34 = xor i32 %26, -1
  %35 = sext i32 %34 to i64
  %36 = inttoptr i64 %29 to i8*
  br label %40

37:                                               ; preds = %11
  %38 = tail call void ()* @_ZSt13get_terminatev() #11
  %39 = tail call void ()* @_ZSt14get_unexpectedv() #11
  br label %40

40:                                               ; preds = %37, %15
  %41 = phi i8* [ %36, %15 ], [ undef, %37 ]
  %42 = phi i64 [ %33, %15 ], [ 0, %37 ]
  %43 = phi i64 [ %35, %15 ], [ undef, %37 ]
  %44 = phi %"struct.__cxxabiv1::__cxa_exception"* [ %17, %15 ], [ null, %37 ]
  %45 = phi void ()* [ %20, %15 ], [ %38, %37 ]
  %46 = phi void ()* [ %23, %15 ], [ %39, %37 ]
  invoke void @_ZSt12__unexpectedPFvvE(void ()* %46) #13
          to label %47 unwind label %48

47:                                               ; preds = %40
  unreachable

48:                                               ; preds = %40
  %49 = landingpad { i8*, i32 }
          catch i8* null
  %50 = extractvalue { i8*, i32 } %49, 0
  %51 = tail call i8* @__cxa_begin_catch(i8* %50) #11
  br i1 %13, label %52, label %404

52:                                               ; preds = %48
  %53 = getelementptr inbounds i8, i8* %41, i64 1
  store i8* %53, i8** %6, align 8, !tbaa !14
  %54 = load i8, i8* %41, align 1, !tbaa !15
  %55 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %6, i8 zeroext %54, i64 %42)
  %56 = load i8*, i8** %6, align 8, !tbaa !14
  %57 = getelementptr inbounds i8, i8* %56, i64 1
  store i8* %57, i8** %6, align 8, !tbaa !14
  %58 = load i8, i8* %56, align 1, !tbaa !15
  %59 = icmp eq i8 %58, -1
  br i1 %59, label %60, label %61

60:                                               ; preds = %52
  tail call void @_ZSt11__terminatePFvvE(void ()* %45) #12
  unreachable

61:                                               ; preds = %52, %61
  %62 = phi i64 [ %71, %61 ], [ 0, %52 ]
  %63 = phi i64 [ %70, %61 ], [ 0, %52 ]
  %64 = phi i8* [ %65, %61 ], [ %57, %52 ]
  %65 = getelementptr inbounds i8, i8* %64, i64 1
  %66 = load i8, i8* %64, align 1, !tbaa !15
  %67 = and i8 %66, 127
  %68 = zext i8 %67 to i64
  %69 = shl i64 %68, %62
  %70 = or i64 %69, %63
  %71 = add i64 %62, 7
  %72 = icmp sgt i8 %66, -1
  br i1 %72, label %73, label %61

73:                                               ; preds = %61
  store i8* %65, i8** %6, align 8, !tbaa !14
  %74 = getelementptr inbounds i8, i8* %65, i64 %70
  %75 = invoke %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
          to label %76 unwind label %81

76:                                               ; preds = %73
  %77 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %75, i64 0, i32 0
  %78 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %77, align 8, !tbaa !30
  %79 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %78, null
  br i1 %79, label %80, label %85

80:                                               ; preds = %76
  tail call void @_ZSt11__terminatePFvvE(void ()* %45) #12
  unreachable

81:                                               ; preds = %73
  %82 = landingpad { i8*, i32 }
          cleanup
  %83 = extractvalue { i8*, i32 } %82, 0
  %84 = extractvalue { i8*, i32 } %82, 1
  br label %401

85:                                               ; preds = %76
  %86 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %78, i64 0, i32 13
  %87 = invoke zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %86)
          to label %88 unwind label %246

88:                                               ; preds = %85
  %89 = xor i1 %87, true
  %90 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %78, %44
  %91 = or i1 %90, %89
  br i1 %91, label %92, label %95

92:                                               ; preds = %88
  %93 = and i8 %58, 15
  %94 = zext i8 %93 to i32
  br label %258

95:                                               ; preds = %88
  %96 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %78, i64 0, i32 2
  %97 = bitcast %"class.std::type_info"** %96 to %"class.__cxxabiv1::__shim_type_info"**
  %98 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %97, align 16, !tbaa !24
  %99 = invoke i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %86)
          to label %100 unwind label %252

100:                                              ; preds = %95
  %101 = icmp eq i64 %99, 4849336966747728641
  br i1 %101, label %102, label %106

102:                                              ; preds = %100
  %103 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %78, i64 0, i32 1
  %104 = bitcast i64* %103 to i8**
  %105 = load i8*, i8** %104, align 8, !tbaa !21
  br label %109

106:                                              ; preds = %100
  %107 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %78, i64 1
  %108 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %107 to i8*
  br label %109

109:                                              ; preds = %102, %106
  %110 = phi i8* [ %105, %102 ], [ %108, %106 ]
  %111 = getelementptr inbounds i8, i8* %74, i64 %43
  %112 = bitcast i8** %5 to i8*
  %113 = bitcast i8** %4 to i8*
  %114 = and i8 %58, 15
  %115 = zext i8 %114 to i32
  switch i32 %115, label %116 [
    i32 0, label %125
    i32 2, label %163
  ]

116:                                              ; preds = %109
  %117 = add nsw i32 %115, -2
  %118 = icmp ult i32 %117, 11
  %119 = trunc i32 %117 to i16
  %120 = lshr i16 1799, %119
  %121 = and i16 %120, 1
  %122 = icmp eq i16 %121, 0
  %123 = sext i32 %117 to i64
  %124 = getelementptr inbounds [11 x i64], [11 x i64]* @switch.table.__cxa_call_unexpected.9, i64 0, i64 %123
  br label %201

125:                                              ; preds = %109, %137
  %126 = phi i64 [ %138, %137 ], [ 0, %109 ]
  %127 = phi i64 [ %139, %137 ], [ 0, %109 ]
  %128 = phi i8* [ %129, %137 ], [ %111, %109 ]
  %129 = getelementptr inbounds i8, i8* %128, i64 1
  %130 = load i8, i8* %128, align 1, !tbaa !15
  %131 = and i8 %130, 127
  %132 = zext i8 %131 to i64
  %133 = shl i64 %132, %126
  %134 = or i64 %133, %127
  %135 = add i64 %126, 7
  %136 = icmp sgt i8 %130, -1
  br i1 %136, label %140, label %137

137:                                              ; preds = %125, %160
  %138 = phi i64 [ %135, %125 ], [ 0, %160 ]
  %139 = phi i64 [ %134, %125 ], [ 0, %160 ]
  br label %125

140:                                              ; preds = %125
  %141 = icmp eq i64 %134, 0
  br i1 %141, label %142, label %149

142:                                              ; preds = %140
  %143 = bitcast %"class.std::bad_exception"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %143) #11
  %144 = getelementptr inbounds %"class.std::bad_exception", %"class.std::bad_exception"* %7, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13bad_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %144, align 8, !tbaa !25
  %145 = getelementptr inbounds i8, i8* %74, i64 %43
  %146 = bitcast i8** %3 to i8*
  %147 = bitcast i8** %2 to i8*
  %148 = bitcast i8** %3 to %"class.std::bad_exception"**
  br label %273

149:                                              ; preds = %140
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %113)
  %150 = shl i64 %134, 3
  %151 = sub i64 0, %150
  %152 = getelementptr inbounds i8, i8* %74, i64 %151
  store i8* %152, i8** %4, align 8, !tbaa !14
  %153 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %4, i8 zeroext %58, i64 %42) #11
  %154 = inttoptr i64 %153 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %113)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %112) #11
  store i8* %110, i8** %5, align 8, !tbaa !14
  %155 = inttoptr i64 %153 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %156 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %155, align 8, !tbaa !25
  %157 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %156, i64 4
  %158 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %157, align 8
  %159 = invoke zeroext i1 %158(%"class.__cxxabiv1::__shim_type_info"* %154, %"class.__cxxabiv1::__shim_type_info"* %98, i8** nonnull align 8 dereferenceable(8) %5)
          to label %160 unwind label %161

160:                                              ; preds = %149
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %112) #11
  br i1 %159, label %235, label %137

161:                                              ; preds = %149
  %162 = landingpad { i8*, i32 }
          cleanup
  br label %254

163:                                              ; preds = %109, %175
  %164 = phi i64 [ %176, %175 ], [ 0, %109 ]
  %165 = phi i64 [ %177, %175 ], [ 0, %109 ]
  %166 = phi i8* [ %167, %175 ], [ %111, %109 ]
  %167 = getelementptr inbounds i8, i8* %166, i64 1
  %168 = load i8, i8* %166, align 1, !tbaa !15
  %169 = and i8 %168, 127
  %170 = zext i8 %169 to i64
  %171 = shl i64 %170, %164
  %172 = or i64 %171, %165
  %173 = add i64 %164, 7
  %174 = icmp sgt i8 %168, -1
  br i1 %174, label %178, label %175

175:                                              ; preds = %163, %198
  %176 = phi i64 [ %173, %163 ], [ 0, %198 ]
  %177 = phi i64 [ %172, %163 ], [ 0, %198 ]
  br label %163

178:                                              ; preds = %163
  %179 = icmp eq i64 %172, 0
  br i1 %179, label %180, label %187

180:                                              ; preds = %178
  %181 = bitcast %"class.std::bad_exception"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %181) #11
  %182 = getelementptr inbounds %"class.std::bad_exception", %"class.std::bad_exception"* %7, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13bad_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %182, align 8, !tbaa !25
  %183 = getelementptr inbounds i8, i8* %74, i64 %43
  %184 = bitcast i8** %3 to i8*
  %185 = bitcast i8** %2 to i8*
  %186 = bitcast i8** %3 to %"class.std::bad_exception"**
  br label %267

187:                                              ; preds = %178
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %113)
  %188 = shl i64 %172, 1
  %189 = sub i64 0, %188
  %190 = getelementptr inbounds i8, i8* %74, i64 %189
  store i8* %190, i8** %4, align 8, !tbaa !14
  %191 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %4, i8 zeroext %58, i64 %42) #11
  %192 = inttoptr i64 %191 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %113)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %112) #11
  store i8* %110, i8** %5, align 8, !tbaa !14
  %193 = inttoptr i64 %191 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %194 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %193, align 8, !tbaa !25
  %195 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %194, i64 4
  %196 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %195, align 8
  %197 = invoke zeroext i1 %196(%"class.__cxxabiv1::__shim_type_info"* %192, %"class.__cxxabiv1::__shim_type_info"* %98, i8** nonnull align 8 dereferenceable(8) %5)
          to label %198 unwind label %199

198:                                              ; preds = %187
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %112) #11
  br i1 %197, label %235, label %175

199:                                              ; preds = %187
  %200 = landingpad { i8*, i32 }
          cleanup
  br label %254

201:                                              ; preds = %213, %116
  %202 = phi i64 [ 0, %116 ], [ %214, %213 ]
  %203 = phi i64 [ 0, %116 ], [ %215, %213 ]
  %204 = phi i8* [ %111, %116 ], [ %205, %213 ]
  %205 = getelementptr inbounds i8, i8* %204, i64 1
  %206 = load i8, i8* %204, align 1, !tbaa !15
  %207 = and i8 %206, 127
  %208 = zext i8 %207 to i64
  %209 = shl i64 %208, %202
  %210 = or i64 %209, %203
  %211 = add i64 %202, 7
  %212 = icmp sgt i8 %206, -1
  br i1 %212, label %216, label %213

213:                                              ; preds = %201, %234
  %214 = phi i64 [ %211, %201 ], [ 0, %234 ]
  %215 = phi i64 [ %210, %201 ], [ 0, %234 ]
  br label %201

216:                                              ; preds = %201
  %217 = icmp eq i64 %210, 0
  br i1 %217, label %258, label %218

218:                                              ; preds = %216
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %113)
  store i8* %74, i8** %4, align 8, !tbaa !14
  %219 = xor i1 %118, true
  %220 = or i1 %219, %122
  br i1 %220, label %221, label %222

221:                                              ; preds = %218
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext true, %struct._Unwind_Exception* nonnull %8) #11
  unreachable

222:                                              ; preds = %218
  %223 = load i64, i64* %124, align 8
  %224 = shl i64 %210, %223
  %225 = sub i64 0, %224
  %226 = getelementptr inbounds i8, i8* %74, i64 %225
  store i8* %226, i8** %4, align 8, !tbaa !14
  %227 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %4, i8 zeroext %58, i64 %42) #11
  %228 = inttoptr i64 %227 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %113)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %112) #11
  store i8* %110, i8** %5, align 8, !tbaa !14
  %229 = inttoptr i64 %227 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %230 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %229, align 8, !tbaa !25
  %231 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %230, i64 4
  %232 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %231, align 8
  %233 = invoke zeroext i1 %232(%"class.__cxxabiv1::__shim_type_info"* %228, %"class.__cxxabiv1::__shim_type_info"* %98, i8** nonnull align 8 dereferenceable(8) %5)
          to label %234 unwind label %250

234:                                              ; preds = %222
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %112) #11
  br i1 %233, label %235, label %213

235:                                              ; preds = %198, %160, %234
  %236 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %78, i64 0, i32 7
  %237 = load i32, i32* %236, align 8, !tbaa !32
  %238 = sub nsw i32 0, %237
  store i32 %238, i32* %236, align 8, !tbaa !32
  %239 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %75, i64 0, i32 1
  %240 = load i32, i32* %239, align 8, !tbaa !33
  %241 = add i32 %240, 1
  store i32 %241, i32* %239, align 8, !tbaa !33
  invoke void @__cxa_end_catch()
          to label %242 unwind label %252

242:                                              ; preds = %235
  invoke void @__cxa_end_catch()
          to label %243 unwind label %252

243:                                              ; preds = %242
  %244 = bitcast %struct._Unwind_Exception* %86 to i8*
  %245 = call i8* @__cxa_begin_catch(i8* nonnull %244) #11
  invoke void @__cxa_rethrow() #13
          to label %411 unwind label %252

246:                                              ; preds = %85
  %247 = landingpad { i8*, i32 }
          cleanup
  %248 = extractvalue { i8*, i32 } %247, 0
  %249 = extractvalue { i8*, i32 } %247, 1
  br label %401

250:                                              ; preds = %222
  %251 = landingpad { i8*, i32 }
          cleanup
  br label %254

252:                                              ; preds = %95, %235, %242, %243
  %253 = landingpad { i8*, i32 }
          cleanup
  br label %254

254:                                              ; preds = %161, %199, %250, %252
  %255 = phi { i8*, i32 } [ %253, %252 ], [ %162, %161 ], [ %200, %199 ], [ %251, %250 ]
  %256 = extractvalue { i8*, i32 } %255, 0
  %257 = extractvalue { i8*, i32 } %255, 1
  br label %401

258:                                              ; preds = %216, %92
  %259 = phi i32 [ %94, %92 ], [ %115, %216 ]
  %260 = bitcast %"class.std::bad_exception"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %260) #11
  %261 = getelementptr inbounds %"class.std::bad_exception", %"class.std::bad_exception"* %7, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13bad_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %261, align 8, !tbaa !25
  %262 = getelementptr inbounds i8, i8* %74, i64 %43
  %263 = bitcast i8** %3 to i8*
  %264 = bitcast i8** %2 to i8*
  %265 = bitcast i8** %3 to %"class.std::bad_exception"**
  %266 = trunc i32 %259 to i8
  switch i8 %266, label %279 [
    i8 0, label %273
    i8 2, label %267
  ]

267:                                              ; preds = %180, %258
  %268 = phi %"class.std::bad_exception"** [ %186, %180 ], [ %265, %258 ]
  %269 = phi i8* [ %185, %180 ], [ %264, %258 ]
  %270 = phi i8* [ %184, %180 ], [ %263, %258 ]
  %271 = phi i8* [ %183, %180 ], [ %262, %258 ]
  %272 = phi i8* [ %181, %180 ], [ %260, %258 ]
  br label %320

273:                                              ; preds = %142, %258
  %274 = phi %"class.std::bad_exception"** [ %148, %142 ], [ %265, %258 ]
  %275 = phi i8* [ %147, %142 ], [ %264, %258 ]
  %276 = phi i8* [ %146, %142 ], [ %263, %258 ]
  %277 = phi i8* [ %145, %142 ], [ %262, %258 ]
  %278 = phi i8* [ %143, %142 ], [ %260, %258 ]
  br label %289

279:                                              ; preds = %258
  %280 = trunc i32 %259 to i8
  %281 = add i8 %280, -2
  %282 = icmp ult i8 %281, 11
  %283 = zext i8 %281 to i16
  %284 = lshr i16 1799, %283
  %285 = and i16 %284, 1
  %286 = icmp eq i16 %285, 0
  %287 = sext i8 %281 to i64
  %288 = getelementptr inbounds [11 x i64], [11 x i64]* @switch.table.__cxa_call_unexpected.9, i64 0, i64 %287
  br label %351

289:                                              ; preds = %301, %273
  %290 = phi i64 [ 0, %273 ], [ %302, %301 ]
  %291 = phi i64 [ 0, %273 ], [ %303, %301 ]
  %292 = phi i8* [ %277, %273 ], [ %293, %301 ]
  %293 = getelementptr inbounds i8, i8* %292, i64 1
  %294 = load i8, i8* %292, align 1, !tbaa !15
  %295 = and i8 %294, 127
  %296 = zext i8 %295 to i64
  %297 = shl i64 %296, %290
  %298 = or i64 %297, %291
  %299 = add i64 %290, 7
  %300 = icmp sgt i8 %294, -1
  br i1 %300, label %304, label %301

301:                                              ; preds = %289, %317
  %302 = phi i64 [ %299, %289 ], [ 0, %317 ]
  %303 = phi i64 [ %298, %289 ], [ 0, %317 ]
  br label %289

304:                                              ; preds = %289
  %305 = icmp eq i64 %298, 0
  br i1 %305, label %399, label %306

306:                                              ; preds = %304
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %275)
  %307 = shl i64 %298, 3
  %308 = sub i64 0, %307
  %309 = getelementptr inbounds i8, i8* %74, i64 %308
  store i8* %309, i8** %2, align 8, !tbaa !14
  %310 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %2, i8 zeroext %58, i64 %42) #11
  %311 = inttoptr i64 %310 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %275)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %276) #11
  store %"class.std::bad_exception"* %7, %"class.std::bad_exception"** %274, align 8, !tbaa !14
  %312 = inttoptr i64 %310 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %313 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %312, align 8, !tbaa !25
  %314 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %313, i64 4
  %315 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %314, align 8
  %316 = invoke zeroext i1 %315(%"class.__cxxabiv1::__shim_type_info"* %311, %"class.__cxxabiv1::__shim_type_info"* bitcast (i8** @_ZTISt13bad_exception to %"class.__cxxabiv1::__shim_type_info"*), i8** nonnull align 8 dereferenceable(8) %3)
          to label %317 unwind label %318

317:                                              ; preds = %306
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %276) #11
  br i1 %316, label %385, label %301

318:                                              ; preds = %306
  %319 = landingpad { i8*, i32 }
          cleanup
  br label %394

320:                                              ; preds = %332, %267
  %321 = phi i64 [ 0, %267 ], [ %333, %332 ]
  %322 = phi i64 [ 0, %267 ], [ %334, %332 ]
  %323 = phi i8* [ %271, %267 ], [ %324, %332 ]
  %324 = getelementptr inbounds i8, i8* %323, i64 1
  %325 = load i8, i8* %323, align 1, !tbaa !15
  %326 = and i8 %325, 127
  %327 = zext i8 %326 to i64
  %328 = shl i64 %327, %321
  %329 = or i64 %328, %322
  %330 = add i64 %321, 7
  %331 = icmp sgt i8 %325, -1
  br i1 %331, label %335, label %332

332:                                              ; preds = %320, %348
  %333 = phi i64 [ %330, %320 ], [ 0, %348 ]
  %334 = phi i64 [ %329, %320 ], [ 0, %348 ]
  br label %320

335:                                              ; preds = %320
  %336 = icmp eq i64 %329, 0
  br i1 %336, label %399, label %337

337:                                              ; preds = %335
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %269)
  %338 = shl i64 %329, 1
  %339 = sub i64 0, %338
  %340 = getelementptr inbounds i8, i8* %74, i64 %339
  store i8* %340, i8** %2, align 8, !tbaa !14
  %341 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %2, i8 zeroext %58, i64 %42) #11
  %342 = inttoptr i64 %341 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %269)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %270) #11
  store %"class.std::bad_exception"* %7, %"class.std::bad_exception"** %268, align 8, !tbaa !14
  %343 = inttoptr i64 %341 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %344 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %343, align 8, !tbaa !25
  %345 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %344, i64 4
  %346 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %345, align 8
  %347 = invoke zeroext i1 %346(%"class.__cxxabiv1::__shim_type_info"* %342, %"class.__cxxabiv1::__shim_type_info"* bitcast (i8** @_ZTISt13bad_exception to %"class.__cxxabiv1::__shim_type_info"*), i8** nonnull align 8 dereferenceable(8) %3)
          to label %348 unwind label %349

348:                                              ; preds = %337
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %270) #11
  br i1 %347, label %385, label %332

349:                                              ; preds = %337
  %350 = landingpad { i8*, i32 }
          cleanup
  br label %394

351:                                              ; preds = %363, %279
  %352 = phi i64 [ 0, %279 ], [ %364, %363 ]
  %353 = phi i64 [ 0, %279 ], [ %365, %363 ]
  %354 = phi i8* [ %262, %279 ], [ %355, %363 ]
  %355 = getelementptr inbounds i8, i8* %354, i64 1
  %356 = load i8, i8* %354, align 1, !tbaa !15
  %357 = and i8 %356, 127
  %358 = zext i8 %357 to i64
  %359 = shl i64 %358, %352
  %360 = or i64 %359, %353
  %361 = add i64 %352, 7
  %362 = icmp sgt i8 %356, -1
  br i1 %362, label %366, label %363

363:                                              ; preds = %351, %384
  %364 = phi i64 [ %361, %351 ], [ 0, %384 ]
  %365 = phi i64 [ %360, %351 ], [ 0, %384 ]
  br label %351

366:                                              ; preds = %351
  %367 = icmp eq i64 %360, 0
  br i1 %367, label %399, label %368

368:                                              ; preds = %366
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %264)
  store i8* %74, i8** %2, align 8, !tbaa !14
  %369 = xor i1 %282, true
  %370 = or i1 %369, %286
  br i1 %370, label %371, label %372

371:                                              ; preds = %368
  call fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext true, %struct._Unwind_Exception* nonnull %8) #11
  unreachable

372:                                              ; preds = %368
  %373 = load i64, i64* %288, align 8
  %374 = shl i64 %360, %373
  %375 = sub i64 0, %374
  %376 = getelementptr inbounds i8, i8* %74, i64 %375
  store i8* %376, i8** %2, align 8, !tbaa !14
  %377 = call fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nonnull %2, i8 zeroext %58, i64 %42) #11
  %378 = inttoptr i64 %377 to %"class.__cxxabiv1::__shim_type_info"*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %264)
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %263) #11
  store %"class.std::bad_exception"* %7, %"class.std::bad_exception"** %265, align 8, !tbaa !14
  %379 = inttoptr i64 %377 to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***
  %380 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** %379, align 8, !tbaa !25
  %381 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %380, i64 4
  %382 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %381, align 8
  %383 = invoke zeroext i1 %382(%"class.__cxxabiv1::__shim_type_info"* %378, %"class.__cxxabiv1::__shim_type_info"* bitcast (i8** @_ZTISt13bad_exception to %"class.__cxxabiv1::__shim_type_info"*), i8** nonnull align 8 dereferenceable(8) %3)
          to label %384 unwind label %390

384:                                              ; preds = %372
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %263) #11
  br i1 %383, label %385, label %363

385:                                              ; preds = %348, %317, %384
  %386 = phi i8* [ %260, %384 ], [ %278, %317 ], [ %272, %348 ]
  invoke void @__cxa_end_catch()
          to label %387 unwind label %392

387:                                              ; preds = %385
  %388 = call i8* @__cxa_allocate_exception(i64 8) #11
  %389 = bitcast i8* %388 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13bad_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %389, align 8, !tbaa !25
  invoke void @__cxa_throw(i8* %388, i8* bitcast (i8** @_ZTISt13bad_exception to i8*), i8* bitcast (void (%"class.std::bad_exception"*)* @_ZNSt13bad_exceptionD1Ev to i8*)) #13
          to label %411 unwind label %392

390:                                              ; preds = %372
  %391 = landingpad { i8*, i32 }
          cleanup
  br label %394

392:                                              ; preds = %385, %387
  %393 = landingpad { i8*, i32 }
          cleanup
  br label %394

394:                                              ; preds = %318, %349, %390, %392
  %395 = phi i8* [ %386, %392 ], [ %278, %318 ], [ %272, %349 ], [ %260, %390 ]
  %396 = phi { i8*, i32 } [ %393, %392 ], [ %319, %318 ], [ %350, %349 ], [ %391, %390 ]
  %397 = extractvalue { i8*, i32 } %396, 0
  %398 = extractvalue { i8*, i32 } %396, 1
  call void @_ZNSt13bad_exceptionD1Ev(%"class.std::bad_exception"* nonnull %7) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %395) #11
  br label %401

399:                                              ; preds = %335, %304, %366
  %400 = phi i8* [ %260, %366 ], [ %278, %304 ], [ %272, %335 ]
  call void @_ZNSt13bad_exceptionD1Ev(%"class.std::bad_exception"* nonnull %7) #11
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %400) #11
  br label %404

401:                                              ; preds = %81, %254, %394, %246
  %402 = phi i32 [ %84, %81 ], [ %249, %246 ], [ %398, %394 ], [ %257, %254 ]
  %403 = phi i8* [ %83, %81 ], [ %248, %246 ], [ %397, %394 ], [ %256, %254 ]
  invoke void @__cxa_end_catch()
          to label %405 unwind label %408

404:                                              ; preds = %399, %48
  call void @__cxa_end_catch()
  call void @_ZSt11__terminatePFvvE(void ()* %45) #12
  unreachable

405:                                              ; preds = %401
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #11
  %406 = insertvalue { i8*, i32 } undef, i8* %403, 0
  %407 = insertvalue { i8*, i32 } %406, i32 %402, 1
  resume { i8*, i32 } %407

408:                                              ; preds = %401
  %409 = landingpad { i8*, i32 }
          catch i8* null
  %410 = extractvalue { i8*, i32 } %409, 0
  call void @__clang_call_terminate(i8* %410) #12
  unreachable

411:                                              ; preds = %387, %243
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define internal fastcc void @_ZN10__cxxabiv1L14call_terminateEbP17_Unwind_Exception(i1 zeroext %0, %struct._Unwind_Exception* %1) unnamed_addr #4 {
  %3 = bitcast %struct._Unwind_Exception* %1 to i8*
  %4 = tail call i8* @__cxa_begin_catch(i8* %3) #11
  br i1 %0, label %5, label %9

5:                                                ; preds = %2
  %6 = getelementptr inbounds %struct._Unwind_Exception, %struct._Unwind_Exception* %1, i64 -2, i32 1
  %7 = bitcast void (i32, %struct._Unwind_Exception*)** %6 to void ()**
  %8 = load void ()*, void ()** %7, align 8, !tbaa !27
  tail call void @_ZSt11__terminatePFvvE(void ()* %8) #12
  unreachable

9:                                                ; preds = %2
  tail call void @_ZSt9terminatev() #12
  unreachable
}

; Function Attrs: nounwind
declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr #5

declare hidden zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception*) local_unnamed_addr #6

; Function Attrs: nounwind
declare void ()* @_ZSt13get_terminatev() local_unnamed_addr #5

; Function Attrs: nounwind
declare void ()* @_ZSt14get_unexpectedv() local_unnamed_addr #5

; Function Attrs: noreturn
declare hidden void @_ZSt12__unexpectedPFvvE(void ()*) local_unnamed_addr #7

; Function Attrs: nounwind uwtable
define internal fastcc i64 @_ZN10__cxxabiv1L18readEncodedPointerEPPKhhm(i8** nocapture %0, i8 zeroext %1, i64 %2) unnamed_addr #8 {
  %4 = zext i8 %1 to i32
  %5 = icmp eq i8 %1, -1
  br i1 %5, label %113, label %6

6:                                                ; preds = %3
  %7 = bitcast i8** %0 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !14
  %9 = and i32 %4, 15
  switch i32 %9, label %85 [
    i32 0, label %10
    i32 1, label %15
    i32 9, label %29
    i32 2, label %51
    i32 3, label %57
    i32 4, label %63
    i32 10, label %68
    i32 11, label %74
    i32 12, label %80
  ]

10:                                               ; preds = %6
  %11 = inttoptr i64 %8 to i8*
  %12 = inttoptr i64 %8 to i64*
  %13 = load i64, i64* %12, align 1
  %14 = getelementptr inbounds i8, i8* %11, i64 8
  br label %86

15:                                               ; preds = %6
  %16 = inttoptr i64 %8 to i8*
  br label %17

17:                                               ; preds = %17, %15
  %18 = phi i64 [ 0, %15 ], [ %27, %17 ]
  %19 = phi i64 [ 0, %15 ], [ %26, %17 ]
  %20 = phi i8* [ %16, %15 ], [ %21, %17 ]
  %21 = getelementptr inbounds i8, i8* %20, i64 1
  %22 = load i8, i8* %20, align 1, !tbaa !15
  %23 = and i8 %22, 127
  %24 = zext i8 %23 to i64
  %25 = shl i64 %24, %18
  %26 = or i64 %25, %19
  %27 = add i64 %18, 7
  %28 = icmp sgt i8 %22, -1
  br i1 %28, label %86, label %17

29:                                               ; preds = %6
  %30 = inttoptr i64 %8 to i8*
  br label %31

31:                                               ; preds = %31, %29
  %32 = phi i64 [ 0, %29 ], [ %41, %31 ]
  %33 = phi i64 [ 0, %29 ], [ %40, %31 ]
  %34 = phi i8* [ %30, %29 ], [ %35, %31 ]
  %35 = getelementptr inbounds i8, i8* %34, i64 1
  %36 = load i8, i8* %34, align 1, !tbaa !15
  %37 = and i8 %36, 127
  %38 = zext i8 %37 to i64
  %39 = shl i64 %38, %32
  %40 = or i64 %39, %33
  %41 = add i64 %32, 7
  %42 = icmp sgt i8 %36, -1
  br i1 %42, label %43, label %31

43:                                               ; preds = %31
  %44 = and i8 %36, 64
  %45 = icmp ne i8 %44, 0
  %46 = icmp ult i64 %41, 64
  %47 = and i1 %46, %45
  %48 = shl nsw i64 -1, %41
  %49 = select i1 %47, i64 %48, i64 0
  %50 = or i64 %40, %49
  br label %86

51:                                               ; preds = %6
  %52 = inttoptr i64 %8 to i8*
  %53 = inttoptr i64 %8 to i16*
  %54 = load i16, i16* %53, align 1
  %55 = getelementptr inbounds i8, i8* %52, i64 2
  %56 = zext i16 %54 to i64
  br label %86

57:                                               ; preds = %6
  %58 = inttoptr i64 %8 to i8*
  %59 = inttoptr i64 %8 to i32*
  %60 = load i32, i32* %59, align 1
  %61 = getelementptr inbounds i8, i8* %58, i64 4
  %62 = zext i32 %60 to i64
  br label %86

63:                                               ; preds = %6
  %64 = inttoptr i64 %8 to i8*
  %65 = inttoptr i64 %8 to i64*
  %66 = load i64, i64* %65, align 1
  %67 = getelementptr inbounds i8, i8* %64, i64 8
  br label %86

68:                                               ; preds = %6
  %69 = inttoptr i64 %8 to i8*
  %70 = inttoptr i64 %8 to i16*
  %71 = load i16, i16* %70, align 1
  %72 = getelementptr inbounds i8, i8* %69, i64 2
  %73 = sext i16 %71 to i64
  br label %86

74:                                               ; preds = %6
  %75 = inttoptr i64 %8 to i8*
  %76 = inttoptr i64 %8 to i32*
  %77 = load i32, i32* %76, align 1
  %78 = getelementptr inbounds i8, i8* %75, i64 4
  %79 = sext i32 %77 to i64
  br label %86

80:                                               ; preds = %6
  %81 = inttoptr i64 %8 to i8*
  %82 = inttoptr i64 %8 to i64*
  %83 = load i64, i64* %82, align 1
  %84 = getelementptr inbounds i8, i8* %81, i64 8
  br label %86

85:                                               ; preds = %6
  tail call void @abort() #12
  unreachable

86:                                               ; preds = %17, %80, %74, %68, %63, %57, %51, %43, %10
  %87 = phi i8* [ %84, %80 ], [ %78, %74 ], [ %72, %68 ], [ %67, %63 ], [ %61, %57 ], [ %55, %51 ], [ %35, %43 ], [ %14, %10 ], [ %21, %17 ]
  %88 = phi i64 [ %83, %80 ], [ %79, %74 ], [ %73, %68 ], [ %66, %63 ], [ %62, %57 ], [ %56, %51 ], [ %50, %43 ], [ %13, %10 ], [ %26, %17 ]
  %89 = ptrtoint i8* %87 to i64
  %90 = lshr i32 %4, 4
  %91 = and i32 %90, 7
  switch i32 %91, label %102 [
    i32 0, label %103
    i32 1, label %92
    i32 3, label %96
  ]

92:                                               ; preds = %86
  %93 = icmp eq i64 %88, 0
  br i1 %93, label %111, label %94

94:                                               ; preds = %92
  %95 = add i64 %88, %8
  br label %103

96:                                               ; preds = %86
  %97 = icmp eq i64 %2, 0
  br i1 %97, label %98, label %99

98:                                               ; preds = %96
  tail call void @__assert_fail(i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.1, i64 0, i64 0), i32 300, i8* getelementptr inbounds ([79 x i8], [79 x i8]* @__PRETTY_FUNCTION__._ZN10__cxxabiv1L18readEncodedPointerEPPKhhm, i64 0, i64 0)) #12
  unreachable

99:                                               ; preds = %96
  %100 = icmp eq i64 %88, 0
  %101 = add i64 %88, %2
  br i1 %100, label %111, label %103

102:                                              ; preds = %86
  tail call void @abort() #12
  unreachable

103:                                              ; preds = %99, %94, %86
  %104 = phi i64 [ %95, %94 ], [ %88, %86 ], [ %101, %99 ]
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %111, label %106

106:                                              ; preds = %103
  %107 = icmp sgt i8 %1, -1
  br i1 %107, label %111, label %108

108:                                              ; preds = %106
  %109 = inttoptr i64 %104 to i64*
  %110 = load i64, i64* %109, align 8, !tbaa !34
  br label %111

111:                                              ; preds = %99, %92, %106, %103, %108
  %112 = phi i64 [ %110, %108 ], [ %104, %106 ], [ 0, %103 ], [ 0, %92 ], [ 0, %99 ]
  store i64 %89, i64* %7, align 8, !tbaa !14
  br label %113

113:                                              ; preds = %3, %111
  %114 = phi i64 [ %112, %111 ], [ 0, %3 ]
  ret i64 %114
}

; Function Attrs: noreturn nounwind
declare hidden void @_ZSt11__terminatePFvvE(void ()*) local_unnamed_addr #2

declare %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast() local_unnamed_addr #6

declare hidden i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception*) local_unnamed_addr #6

declare void @__cxa_end_catch() local_unnamed_addr #6

declare void @__cxa_rethrow() local_unnamed_addr

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt13bad_exceptionD1Ev(%"class.std::bad_exception"*) unnamed_addr #5

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #9 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #11
  tail call void @_ZSt9terminatev() #12
  unreachable
}

declare void @_ZSt9terminatev() local_unnamed_addr

declare void @_Unwind_SetGR(%struct._Unwind_Context*, i32, i64) local_unnamed_addr #6

declare void @_Unwind_SetIP(%struct._Unwind_Context*, i64) local_unnamed_addr #6

declare i8* @_Unwind_GetLanguageSpecificData(%struct._Unwind_Context*) local_unnamed_addr #6

declare i64 @_Unwind_GetIP(%struct._Unwind_Context*) local_unnamed_addr #6

declare i64 @_Unwind_GetRegionStart(%struct._Unwind_Context*) local_unnamed_addr #6

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #10

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline noreturn nounwind }
attributes #10 = { argmemonly nounwind willreturn writeonly }
attributes #11 = { nounwind }
attributes #12 = { noreturn nounwind }
attributes #13 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !9, i64 60}
!4 = !{!"_ZTSN10__cxxabiv115__cxa_exceptionE", !5, i64 0, !8, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !9, i64 56, !9, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !10, i64 96}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!"_ZTS17_Unwind_Exception", !8, i64 0, !5, i64 8, !8, i64 16, !8, i64 24}
!11 = !{!12, !8, i64 0}
!12 = !{!"_ZTSN10__cxxabiv112_GLOBAL__N_112scan_resultsE", !8, i64 0, !5, i64 8, !5, i64 16, !8, i64 24, !5, i64 32, !13, i64 40}
!13 = !{!"_ZTS19_Unwind_Reason_Code", !6, i64 0}
!14 = !{!5, !5, i64 0}
!15 = !{!6, !6, i64 0}
!16 = !{!4, !5, i64 80}
!17 = !{!12, !13, i64 40}
!18 = !{!12, !8, i64 24}
!19 = !{!12, !5, i64 16}
!20 = !{!12, !5, i64 8}
!21 = !{!22, !5, i64 8}
!22 = !{!"_ZTSN10__cxxabiv125__cxa_dependent_exceptionE", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !9, i64 56, !9, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !10, i64 96}
!23 = !{!12, !5, i64 32}
!24 = !{!4, !5, i64 16}
!25 = !{!26, !26, i64 0}
!26 = !{!"vtable pointer", !7, i64 0}
!27 = !{!4, !5, i64 40}
!28 = !{!4, !5, i64 32}
!29 = !{!4, !5, i64 72}
!30 = !{!31, !5, i64 0}
!31 = !{!"_ZTSN10__cxxabiv116__cxa_eh_globalsE", !5, i64 0, !9, i64 8}
!32 = !{!4, !9, i64 56}
!33 = !{!31, !9, i64 8}
!34 = !{!8, !8, i64 0}

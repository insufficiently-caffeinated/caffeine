; ModuleID = 'll/.valarray.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/valarray.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::valarray" = type { i64*, i64* }
%"class.std::__1::gslice" = type { %"class.std::__1::valarray", %"class.std::__1::valarray", %"class.std::__1::valarray" }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }

$_ZNSt3__18valarrayImEC5Em = comdat any

$_ZNSt3__18valarrayImED5Ev = comdat any

$_ZNSt3__18valarrayImE6resizeEmm = comdat any

$_ZNSt3__120__throw_length_errorEPKc = comdat any

$_ZNSt12length_errorC2EPKc = comdat any

@.str = private unnamed_addr constant [68 x i8] c"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size\00", align 1
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8

@_ZNSt3__18valarrayImEC1Em = weak_odr unnamed_addr alias void (%"class.std::__1::valarray"*, i64), void (%"class.std::__1::valarray"*, i64)* @_ZNSt3__18valarrayImEC2Em
@_ZNSt3__18valarrayImED1Ev = weak_odr unnamed_addr alias void (%"class.std::__1::valarray"*), void (%"class.std::__1::valarray"*)* @_ZNSt3__18valarrayImED2Ev

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__18valarrayImEC2Em(%"class.std::__1::valarray"* %0, i64 %1) unnamed_addr #0 comdat($_ZNSt3__18valarrayImEC5Em) align 2 {
  %3 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %0, i64 0, i32 1
  %4 = icmp eq i64 %1, 0
  %5 = bitcast %"class.std::__1::valarray"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %5, i8 0, i64 16, i1 false)
  br i1 %4, label %39, label %6

6:                                                ; preds = %2
  %7 = icmp ugt i64 %1, 2305843009213693951
  br i1 %7, label %8, label %9

8:                                                ; preds = %6
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i64 0, i64 0)) #9
  unreachable

9:                                                ; preds = %6
  %10 = shl nuw i64 %1, 3
  %11 = tail call noalias nonnull i8* @_Znwm(i64 %10) #10
  %12 = bitcast i64** %3 to i8**
  store i8* %11, i8** %12, align 8, !tbaa !3
  %13 = bitcast %"class.std::__1::valarray"* %0 to i8**
  store i8* %11, i8** %13, align 8, !tbaa !8
  %14 = bitcast i8* %11 to i64*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %11, i8 0, i64 %10, i1 false)
  %15 = add i64 %1, -1
  %16 = and i64 %1, 7
  %17 = icmp eq i64 %16, 0
  br i1 %17, label %26, label %18

18:                                               ; preds = %9, %18
  %19 = phi i64* [ %23, %18 ], [ %14, %9 ]
  %20 = phi i64 [ %22, %18 ], [ %1, %9 ]
  %21 = phi i64 [ %24, %18 ], [ %16, %9 ]
  %22 = add i64 %20, -1
  %23 = getelementptr inbounds i64, i64* %19, i64 1
  %24 = add i64 %21, -1
  %25 = icmp eq i64 %24, 0
  br i1 %25, label %26, label %18, !llvm.loop !9

26:                                               ; preds = %18, %9
  %27 = phi i64* [ undef, %9 ], [ %23, %18 ]
  %28 = phi i64* [ %14, %9 ], [ %23, %18 ]
  %29 = phi i64 [ %1, %9 ], [ %22, %18 ]
  %30 = icmp ult i64 %15, 7
  br i1 %30, label %37, label %31

31:                                               ; preds = %26, %31
  %32 = phi i64* [ %35, %31 ], [ %28, %26 ]
  %33 = phi i64 [ %34, %31 ], [ %29, %26 ]
  %34 = add i64 %33, -8
  %35 = getelementptr inbounds i64, i64* %32, i64 8
  %36 = icmp eq i64 %34, 0
  br i1 %36, label %37, label %31

37:                                               ; preds = %31, %26
  %38 = phi i64* [ %27, %26 ], [ %35, %31 ]
  store i64* %38, i64** %3, align 8, !tbaa !3
  br label %39

39:                                               ; preds = %37, %2
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define weak_odr void @_ZNSt3__18valarrayImED2Ev(%"class.std::__1::valarray"* %0) unnamed_addr #1 comdat($_ZNSt3__18valarrayImED5Ev) align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %0, i64 0, i32 1
  %3 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %0, i64 0, i32 0
  %4 = load i64*, i64** %3, align 8, !tbaa !8
  %5 = ptrtoint i64* %4 to i64
  %6 = icmp eq i64* %4, null
  br i1 %6, label %20, label %7

7:                                                ; preds = %1
  %8 = load i64*, i64** %2, align 8, !tbaa !3
  %9 = icmp eq i64* %8, %4
  br i1 %9, label %17, label %10

10:                                               ; preds = %7
  %11 = getelementptr i64, i64* %8, i64 -1
  %12 = ptrtoint i64* %11 to i64
  %13 = sub i64 %12, %5
  %14 = lshr i64 %13, 3
  %15 = xor i64 %14, -1
  %16 = getelementptr i64, i64* %8, i64 %15
  store i64* %16, i64** %2, align 8, !tbaa !3
  br label %17

17:                                               ; preds = %10, %7
  %18 = bitcast i64* %4 to i8*
  tail call void @_ZdlPv(i8* %18) #11
  %19 = bitcast %"class.std::__1::valarray"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %19, i8 0, i64 16, i1 false) #12
  br label %20

20:                                               ; preds = %1, %17
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__18valarrayImE6resizeEmm(%"class.std::__1::valarray"* %0, i64 %1, i64 %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %0, i64 0, i32 0
  %6 = load i64*, i64** %5, align 8, !tbaa !8
  %7 = ptrtoint i64* %6 to i64
  %8 = icmp eq i64* %6, null
  br i1 %8, label %22, label %9

9:                                                ; preds = %3
  %10 = load i64*, i64** %4, align 8, !tbaa !3
  %11 = icmp eq i64* %10, %6
  br i1 %11, label %19, label %12

12:                                               ; preds = %9
  %13 = getelementptr i64, i64* %10, i64 -1
  %14 = ptrtoint i64* %13 to i64
  %15 = sub i64 %14, %7
  %16 = lshr i64 %15, 3
  %17 = xor i64 %16, -1
  %18 = getelementptr i64, i64* %10, i64 %17
  store i64* %18, i64** %4, align 8, !tbaa !3
  br label %19

19:                                               ; preds = %12, %9
  %20 = bitcast i64* %6 to i8*
  tail call void @_ZdlPv(i8* %20) #11
  %21 = bitcast %"class.std::__1::valarray"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %21, i8 0, i64 16, i1 false) #12
  br label %22

22:                                               ; preds = %3, %19
  %23 = icmp eq i64 %1, 0
  br i1 %23, label %120, label %24

24:                                               ; preds = %22
  %25 = icmp ugt i64 %1, 2305843009213693951
  br i1 %25, label %26, label %27

26:                                               ; preds = %24
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i64 0, i64 0)) #9
  unreachable

27:                                               ; preds = %24
  %28 = shl nuw i64 %1, 3
  %29 = tail call noalias nonnull i8* @_Znwm(i64 %28) #10
  %30 = bitcast i64** %4 to i8**
  store i8* %29, i8** %30, align 8, !tbaa !3
  %31 = bitcast %"class.std::__1::valarray"* %0 to i8**
  store i8* %29, i8** %31, align 8, !tbaa !8
  %32 = bitcast i8* %29 to i64*
  %33 = icmp ult i64 %1, 4
  br i1 %33, label %109, label %34

34:                                               ; preds = %27
  %35 = and i64 %1, -4
  %36 = getelementptr i64, i64* %32, i64 %35
  %37 = and i64 %1, 3
  %38 = insertelement <2 x i64> undef, i64 %2, i32 0
  %39 = shufflevector <2 x i64> %38, <2 x i64> undef, <2 x i32> zeroinitializer
  %40 = insertelement <2 x i64> undef, i64 %2, i32 0
  %41 = shufflevector <2 x i64> %40, <2 x i64> undef, <2 x i32> zeroinitializer
  %42 = add i64 %35, -4
  %43 = lshr exact i64 %42, 2
  %44 = add nuw nsw i64 %43, 1
  %45 = and i64 %44, 7
  %46 = icmp ult i64 %42, 28
  br i1 %46, label %94, label %47

47:                                               ; preds = %34
  %48 = and i64 %44, 9223372036854775800
  br label %49

49:                                               ; preds = %49, %47
  %50 = phi i64 [ 0, %47 ], [ %91, %49 ]
  %51 = phi i64 [ %48, %47 ], [ %92, %49 ]
  %52 = getelementptr i64, i64* %32, i64 %50
  %53 = bitcast i64* %52 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %53, align 8, !tbaa !11
  %54 = getelementptr i64, i64* %52, i64 2
  %55 = bitcast i64* %54 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %55, align 8, !tbaa !11
  %56 = or i64 %50, 4
  %57 = getelementptr i64, i64* %32, i64 %56
  %58 = bitcast i64* %57 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %58, align 8, !tbaa !11
  %59 = getelementptr i64, i64* %57, i64 2
  %60 = bitcast i64* %59 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %60, align 8, !tbaa !11
  %61 = or i64 %50, 8
  %62 = getelementptr i64, i64* %32, i64 %61
  %63 = bitcast i64* %62 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %63, align 8, !tbaa !11
  %64 = getelementptr i64, i64* %62, i64 2
  %65 = bitcast i64* %64 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %65, align 8, !tbaa !11
  %66 = or i64 %50, 12
  %67 = getelementptr i64, i64* %32, i64 %66
  %68 = bitcast i64* %67 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %68, align 8, !tbaa !11
  %69 = getelementptr i64, i64* %67, i64 2
  %70 = bitcast i64* %69 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %70, align 8, !tbaa !11
  %71 = or i64 %50, 16
  %72 = getelementptr i64, i64* %32, i64 %71
  %73 = bitcast i64* %72 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %73, align 8, !tbaa !11
  %74 = getelementptr i64, i64* %72, i64 2
  %75 = bitcast i64* %74 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %75, align 8, !tbaa !11
  %76 = or i64 %50, 20
  %77 = getelementptr i64, i64* %32, i64 %76
  %78 = bitcast i64* %77 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %78, align 8, !tbaa !11
  %79 = getelementptr i64, i64* %77, i64 2
  %80 = bitcast i64* %79 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %80, align 8, !tbaa !11
  %81 = or i64 %50, 24
  %82 = getelementptr i64, i64* %32, i64 %81
  %83 = bitcast i64* %82 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %83, align 8, !tbaa !11
  %84 = getelementptr i64, i64* %82, i64 2
  %85 = bitcast i64* %84 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %85, align 8, !tbaa !11
  %86 = or i64 %50, 28
  %87 = getelementptr i64, i64* %32, i64 %86
  %88 = bitcast i64* %87 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %88, align 8, !tbaa !11
  %89 = getelementptr i64, i64* %87, i64 2
  %90 = bitcast i64* %89 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %90, align 8, !tbaa !11
  %91 = add i64 %50, 32
  %92 = add i64 %51, -8
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %94, label %49, !llvm.loop !13

94:                                               ; preds = %49, %34
  %95 = phi i64 [ 0, %34 ], [ %91, %49 ]
  %96 = icmp eq i64 %45, 0
  br i1 %96, label %107, label %97

97:                                               ; preds = %94, %97
  %98 = phi i64 [ %104, %97 ], [ %95, %94 ]
  %99 = phi i64 [ %105, %97 ], [ %45, %94 ]
  %100 = getelementptr i64, i64* %32, i64 %98
  %101 = bitcast i64* %100 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %101, align 8, !tbaa !11
  %102 = getelementptr i64, i64* %100, i64 2
  %103 = bitcast i64* %102 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %103, align 8, !tbaa !11
  %104 = add i64 %98, 4
  %105 = add i64 %99, -1
  %106 = icmp eq i64 %105, 0
  br i1 %106, label %107, label %97, !llvm.loop !15

107:                                              ; preds = %97, %94
  %108 = icmp eq i64 %35, %1
  br i1 %108, label %118, label %109

109:                                              ; preds = %107, %27
  %110 = phi i64* [ %32, %27 ], [ %36, %107 ]
  %111 = phi i64 [ %1, %27 ], [ %37, %107 ]
  br label %112

112:                                              ; preds = %109, %112
  %113 = phi i64* [ %116, %112 ], [ %110, %109 ]
  %114 = phi i64 [ %115, %112 ], [ %111, %109 ]
  store i64 %2, i64* %113, align 8, !tbaa !11
  %115 = add i64 %114, -1
  %116 = getelementptr inbounds i64, i64* %113, i64 1
  %117 = icmp eq i64 %115, 0
  br i1 %117, label %118, label %112, !llvm.loop !16

118:                                              ; preds = %112, %107
  %119 = phi i64* [ %36, %107 ], [ %116, %112 ]
  store i64* %119, i64** %4, align 8, !tbaa !3
  br label %120

120:                                              ; preds = %118, %22
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__16gslice6__initEm(%"class.std::__1::gslice"* nocapture %0, i64 %1) local_unnamed_addr #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr inbounds %"class.std::__1::gslice", %"class.std::__1::gslice"* %0, i64 0, i32 0, i32 1
  %4 = bitcast i64** %3 to i64*
  %5 = load i64, i64* %4, align 8, !tbaa !3
  %6 = bitcast %"class.std::__1::gslice"* %0 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !8
  %8 = sub i64 %5, %7
  %9 = ashr exact i64 %8, 3
  %10 = icmp eq i64 %8, 0
  %11 = inttoptr i64 %7 to i64*
  br i1 %10, label %42, label %12

12:                                               ; preds = %2
  %13 = icmp ugt i64 %9, 2305843009213693951
  br i1 %13, label %14, label %15

14:                                               ; preds = %12
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i64 0, i64 0)) #9
  unreachable

15:                                               ; preds = %12
  %16 = tail call noalias nonnull i8* @_Znwm(i64 %8) #10
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %16, i8 0, i64 %8, i1 false)
  %17 = getelementptr i8, i8* %16, i64 %8
  %18 = ptrtoint i8* %16 to i64
  %19 = ptrtoint i8* %17 to i64
  %20 = icmp ugt i64 %9, 1
  %21 = select i1 %20, i64 %9, i64 1
  %22 = add nsw i64 %21, -1
  %23 = and i64 %21, 7
  %24 = icmp ult i64 %22, 7
  br i1 %24, label %27, label %25

25:                                               ; preds = %15
  %26 = and i64 %21, -8
  br label %114

27:                                               ; preds = %114, %15
  %28 = phi i64 [ undef, %15 ], [ %148, %114 ]
  %29 = phi i64 [ 0, %15 ], [ %149, %114 ]
  %30 = phi i64 [ 1, %15 ], [ %148, %114 ]
  %31 = icmp eq i64 %23, 0
  br i1 %31, label %42, label %32

32:                                               ; preds = %27, %32
  %33 = phi i64 [ %39, %32 ], [ %29, %27 ]
  %34 = phi i64 [ %38, %32 ], [ %30, %27 ]
  %35 = phi i64 [ %40, %32 ], [ %23, %27 ]
  %36 = getelementptr inbounds i64, i64* %11, i64 %33
  %37 = load i64, i64* %36, align 8, !tbaa !11
  %38 = mul i64 %37, %34
  %39 = add nuw i64 %33, 1
  %40 = add i64 %35, -1
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %42, label %32, !llvm.loop !18

42:                                               ; preds = %27, %32, %2
  %43 = phi i64 [ 0, %2 ], [ %19, %32 ], [ %19, %27 ]
  %44 = phi i64 [ 0, %2 ], [ %18, %32 ], [ %18, %27 ]
  %45 = phi i64 [ 0, %2 ], [ %28, %27 ], [ %38, %32 ]
  %46 = getelementptr inbounds %"class.std::__1::gslice", %"class.std::__1::gslice"* %0, i64 0, i32 2
  %47 = getelementptr inbounds %"class.std::__1::gslice", %"class.std::__1::gslice"* %0, i64 0, i32 2, i32 1
  %48 = getelementptr inbounds %"class.std::__1::valarray", %"class.std::__1::valarray"* %46, i64 0, i32 0
  %49 = load i64*, i64** %48, align 8, !tbaa !8
  %50 = ptrtoint i64* %49 to i64
  %51 = icmp eq i64* %49, null
  br i1 %51, label %65, label %52

52:                                               ; preds = %42
  %53 = load i64*, i64** %47, align 8, !tbaa !3
  %54 = icmp eq i64* %53, %49
  br i1 %54, label %62, label %55

55:                                               ; preds = %52
  %56 = getelementptr i64, i64* %53, i64 -1
  %57 = ptrtoint i64* %56 to i64
  %58 = sub i64 %57, %50
  %59 = lshr i64 %58, 3
  %60 = xor i64 %59, -1
  %61 = getelementptr i64, i64* %53, i64 %60
  store i64* %61, i64** %47, align 8, !tbaa !3
  br label %62

62:                                               ; preds = %55, %52
  %63 = bitcast i64* %49 to i8*
  tail call void @_ZdlPv(i8* %63) #11
  %64 = bitcast %"class.std::__1::valarray"* %46 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %64, i8 0, i64 16, i1 false) #12
  br label %65

65:                                               ; preds = %62, %42
  %66 = phi i64 [ 0, %62 ], [ %50, %42 ]
  %67 = icmp eq i64 %45, 0
  br i1 %67, label %68, label %71

68:                                               ; preds = %65
  %69 = bitcast i64** %47 to i64*
  %70 = load i64, i64* %69, align 8, !tbaa !3
  br label %152

71:                                               ; preds = %65
  %72 = icmp ugt i64 %45, 2305843009213693951
  br i1 %72, label %73, label %75

73:                                               ; preds = %71
  invoke void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str, i64 0, i64 0)) #9
          to label %74 unwind label %108

74:                                               ; preds = %73
  unreachable

75:                                               ; preds = %71
  %76 = shl nuw i64 %45, 3
  %77 = invoke noalias nonnull i8* @_Znwm(i64 %76) #10
          to label %78 unwind label %108

78:                                               ; preds = %75
  %79 = bitcast i64** %47 to i8**
  store i8* %77, i8** %79, align 8, !tbaa !3
  %80 = bitcast %"class.std::__1::valarray"* %46 to i8**
  store i8* %77, i8** %80, align 8, !tbaa !8
  %81 = bitcast i8* %77 to i64*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 %77, i8 0, i64 %76, i1 false)
  %82 = ptrtoint i8* %77 to i64
  %83 = add i64 %45, -1
  %84 = and i64 %45, 7
  %85 = icmp eq i64 %84, 0
  br i1 %85, label %94, label %86

86:                                               ; preds = %78, %86
  %87 = phi i64* [ %91, %86 ], [ %81, %78 ]
  %88 = phi i64 [ %90, %86 ], [ %45, %78 ]
  %89 = phi i64 [ %92, %86 ], [ %84, %78 ]
  %90 = add i64 %88, -1
  %91 = getelementptr inbounds i64, i64* %87, i64 1
  %92 = add i64 %89, -1
  %93 = icmp eq i64 %92, 0
  br i1 %93, label %94, label %86, !llvm.loop !19

94:                                               ; preds = %86, %78
  %95 = phi i64* [ undef, %78 ], [ %91, %86 ]
  %96 = phi i64* [ %81, %78 ], [ %91, %86 ]
  %97 = phi i64 [ %45, %78 ], [ %90, %86 ]
  %98 = icmp ult i64 %83, 7
  br i1 %98, label %105, label %99

99:                                               ; preds = %94, %99
  %100 = phi i64* [ %103, %99 ], [ %96, %94 ]
  %101 = phi i64 [ %102, %99 ], [ %97, %94 ]
  %102 = add i64 %101, -8
  %103 = getelementptr inbounds i64, i64* %100, i64 8
  %104 = icmp eq i64 %102, 0
  br i1 %104, label %105, label %99

105:                                              ; preds = %99, %94
  %106 = phi i64* [ %95, %94 ], [ %103, %99 ]
  store i64* %106, i64** %47, align 8, !tbaa !3
  %107 = ptrtoint i64* %106 to i64
  br label %152

108:                                              ; preds = %75, %73
  %109 = landingpad { i8*, i32 }
          cleanup
  %110 = icmp eq i64 %44, 0
  br i1 %110, label %113, label %111

111:                                              ; preds = %108
  %112 = inttoptr i64 %44 to i8*
  tail call void @_ZdlPv(i8* %112) #11
  br label %113

113:                                              ; preds = %108, %111
  resume { i8*, i32 } %109

114:                                              ; preds = %114, %25
  %115 = phi i64 [ 0, %25 ], [ %149, %114 ]
  %116 = phi i64 [ 1, %25 ], [ %148, %114 ]
  %117 = phi i64 [ %26, %25 ], [ %150, %114 ]
  %118 = getelementptr inbounds i64, i64* %11, i64 %115
  %119 = load i64, i64* %118, align 8, !tbaa !11
  %120 = mul i64 %119, %116
  %121 = or i64 %115, 1
  %122 = getelementptr inbounds i64, i64* %11, i64 %121
  %123 = load i64, i64* %122, align 8, !tbaa !11
  %124 = mul i64 %123, %120
  %125 = or i64 %115, 2
  %126 = getelementptr inbounds i64, i64* %11, i64 %125
  %127 = load i64, i64* %126, align 8, !tbaa !11
  %128 = mul i64 %127, %124
  %129 = or i64 %115, 3
  %130 = getelementptr inbounds i64, i64* %11, i64 %129
  %131 = load i64, i64* %130, align 8, !tbaa !11
  %132 = mul i64 %131, %128
  %133 = or i64 %115, 4
  %134 = getelementptr inbounds i64, i64* %11, i64 %133
  %135 = load i64, i64* %134, align 8, !tbaa !11
  %136 = mul i64 %135, %132
  %137 = or i64 %115, 5
  %138 = getelementptr inbounds i64, i64* %11, i64 %137
  %139 = load i64, i64* %138, align 8, !tbaa !11
  %140 = mul i64 %139, %136
  %141 = or i64 %115, 6
  %142 = getelementptr inbounds i64, i64* %11, i64 %141
  %143 = load i64, i64* %142, align 8, !tbaa !11
  %144 = mul i64 %143, %140
  %145 = or i64 %115, 7
  %146 = getelementptr inbounds i64, i64* %11, i64 %145
  %147 = load i64, i64* %146, align 8, !tbaa !11
  %148 = mul i64 %147, %144
  %149 = add nuw i64 %115, 8
  %150 = add i64 %117, -8
  %151 = icmp eq i64 %150, 0
  br i1 %151, label %27, label %114

152:                                              ; preds = %68, %105
  %153 = phi i64* [ null, %68 ], [ %81, %105 ]
  %154 = phi i64 [ %66, %68 ], [ %82, %105 ]
  %155 = phi i64 [ %70, %68 ], [ %107, %105 ]
  %156 = icmp eq i64 %155, %154
  br i1 %156, label %237, label %157

157:                                              ; preds = %152
  store i64 %1, i64* %153, align 8, !tbaa !11
  %158 = sub i64 %43, %44
  %159 = ashr exact i64 %158, 3
  %160 = add nsw i64 %159, -1
  %161 = inttoptr i64 %44 to i64*
  %162 = getelementptr inbounds i64, i64* %161, i64 %160
  %163 = getelementptr inbounds %"class.std::__1::gslice", %"class.std::__1::gslice"* %0, i64 0, i32 0, i32 0
  %164 = load i64*, i64** %163, align 8, !tbaa !8
  %165 = getelementptr inbounds i64, i64* %164, i64 %160
  %166 = getelementptr inbounds %"class.std::__1::gslice", %"class.std::__1::gslice"* %0, i64 0, i32 1, i32 0
  %167 = add nsw i64 %159, -2
  br label %168

168:                                              ; preds = %186, %157
  %169 = phi i64 [ 0, %157 ], [ %176, %186 ]
  %170 = load i64, i64* %162, align 8, !tbaa !11
  %171 = add i64 %170, 1
  store i64 %171, i64* %162, align 8, !tbaa !11
  %172 = load i64, i64* %165, align 8, !tbaa !11
  %173 = icmp ult i64 %171, %172
  br i1 %173, label %174, label %225

174:                                              ; preds = %228, %168
  %175 = phi i64 [ %160, %168 ], [ %229, %228 ]
  %176 = add i64 %169, 1
  %177 = getelementptr inbounds i64, i64* %153, i64 %169
  %178 = load i64, i64* %177, align 8, !tbaa !11
  %179 = load i64*, i64** %166, align 8, !tbaa !8
  %180 = getelementptr inbounds i64, i64* %179, i64 %175
  %181 = load i64, i64* %180, align 8, !tbaa !11
  %182 = add i64 %181, %178
  %183 = getelementptr inbounds i64, i64* %153, i64 %176
  store i64 %182, i64* %183, align 8, !tbaa !11
  %184 = add i64 %175, 1
  %185 = icmp eq i64 %184, %159
  br i1 %185, label %186, label %187

186:                                              ; preds = %201, %205, %174
  br label %168

187:                                              ; preds = %174
  %188 = xor i64 %175, 1
  %189 = add i64 %159, %188
  %190 = and i64 %189, 1
  %191 = icmp eq i64 %190, 0
  br i1 %191, label %201, label %192

192:                                              ; preds = %187
  %193 = getelementptr inbounds i64, i64* %179, i64 %184
  %194 = load i64, i64* %193, align 8, !tbaa !11
  %195 = getelementptr inbounds i64, i64* %164, i64 %184
  %196 = load i64, i64* %195, align 8, !tbaa !11
  %197 = add i64 %196, -1
  %198 = mul i64 %197, %194
  %199 = sub i64 %182, %198
  store i64 %199, i64* %183, align 8, !tbaa !11
  %200 = add i64 %175, 2
  br label %201

201:                                              ; preds = %192, %187
  %202 = phi i64 [ %199, %192 ], [ %182, %187 ]
  %203 = phi i64 [ %200, %192 ], [ %184, %187 ]
  %204 = icmp eq i64 %167, %175
  br i1 %204, label %186, label %205

205:                                              ; preds = %201, %205
  %206 = phi i64 [ %222, %205 ], [ %202, %201 ]
  %207 = phi i64 [ %223, %205 ], [ %203, %201 ]
  %208 = getelementptr inbounds i64, i64* %179, i64 %207
  %209 = load i64, i64* %208, align 8, !tbaa !11
  %210 = getelementptr inbounds i64, i64* %164, i64 %207
  %211 = load i64, i64* %210, align 8, !tbaa !11
  %212 = add i64 %211, -1
  %213 = mul i64 %212, %209
  %214 = sub i64 %206, %213
  store i64 %214, i64* %183, align 8, !tbaa !11
  %215 = add i64 %207, 1
  %216 = getelementptr inbounds i64, i64* %179, i64 %215
  %217 = load i64, i64* %216, align 8, !tbaa !11
  %218 = getelementptr inbounds i64, i64* %164, i64 %215
  %219 = load i64, i64* %218, align 8, !tbaa !11
  %220 = add i64 %219, -1
  %221 = mul i64 %220, %217
  %222 = sub i64 %214, %221
  store i64 %222, i64* %183, align 8, !tbaa !11
  %223 = add i64 %207, 2
  %224 = icmp eq i64 %223, %159
  br i1 %224, label %186, label %205

225:                                              ; preds = %168, %228
  %226 = phi i64 [ %229, %228 ], [ %160, %168 ]
  %227 = icmp eq i64 %226, 0
  br i1 %227, label %237, label %228

228:                                              ; preds = %225
  %229 = add i64 %226, -1
  %230 = getelementptr inbounds i64, i64* %161, i64 %226
  store i64 0, i64* %230, align 8, !tbaa !11
  %231 = getelementptr inbounds i64, i64* %161, i64 %229
  %232 = load i64, i64* %231, align 8, !tbaa !11
  %233 = add i64 %232, 1
  store i64 %233, i64* %231, align 8, !tbaa !11
  %234 = getelementptr inbounds i64, i64* %164, i64 %229
  %235 = load i64, i64* %234, align 8, !tbaa !11
  %236 = icmp ult i64 %233, %235
  br i1 %236, label %174, label %225

237:                                              ; preds = %225, %152
  %238 = icmp eq i64 %44, 0
  br i1 %238, label %241, label %239

239:                                              ; preds = %237
  %240 = inttoptr i64 %44 to i8*
  tail call void @_ZdlPv(i8* %240) #11
  br label %241

241:                                              ; preds = %237, %239
  ret void
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorEPKc(i8* %0) local_unnamed_addr #3 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #12
  %3 = bitcast i8* %2 to %"class.std::length_error"*
  invoke void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #9
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #12
  resume { i8*, i32 } %6
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %0, i8* %1) unnamed_addr #2 comdat align 2 {
  %3 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !20
  ret void
}

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD1Ev(%"class.std::length_error"*) unnamed_addr #4

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"*, i8*) unnamed_addr #5

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #6

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #7

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

attributes #0 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind willreturn writeonly }
attributes #9 = { noreturn }
attributes #10 = { builtin allocsize(0) }
attributes #11 = { builtin nounwind }
attributes #12 = { nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 8}
!4 = !{!"_ZTSNSt3__18valarrayImEE", !5, i64 0, !5, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!4, !5, i64 0}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !6, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.isvectorized", i32 1}
!15 = distinct !{!15, !10}
!16 = distinct !{!16, !17, !14}
!17 = !{!"llvm.loop.unroll.runtime.disable"}
!18 = distinct !{!18, !10}
!19 = distinct !{!19, !10}
!20 = !{!21, !21, i64 0}
!21 = !{!"vtable pointer", !7, i64 0}

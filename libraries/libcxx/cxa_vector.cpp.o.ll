; ModuleID = 'll/.cxa_vector.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_vector.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }

$__clang_call_terminate = comdat any

@_ZTISt20bad_array_new_length = external constant i8*

; Function Attrs: uwtable
define nonnull i8* @__cxa_vec_new(i64 %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*)* %4) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %6 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1) #7
  %7 = extractvalue { i64, i1 } %6, 1
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

9:                                                ; preds = %5
  %10 = extractvalue { i64, i1 } %6, 0
  %11 = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %10, i64 %2) #7
  %12 = extractvalue { i64, i1 } %11, 1
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

14:                                               ; preds = %9
  %15 = extractvalue { i64, i1 } %11, 0
  %16 = tail call i8* @_Znam(i64 %15)
  %17 = icmp eq i64 %2, 0
  br i1 %17, label %23, label %18

18:                                               ; preds = %14
  %19 = getelementptr inbounds i8, i8* %16, i64 %2
  %20 = getelementptr inbounds i8, i8* %19, i64 -8
  %21 = bitcast i8* %20 to i64*
  store i64 %0, i64* %21, align 8, !tbaa !3
  br label %23

22:                                               ; preds = %42, %35
  tail call void @_ZdaPv(i8* nonnull %16)
  resume { i8*, i32 } %36

23:                                               ; preds = %18, %14
  %24 = phi i8* [ %19, %18 ], [ %16, %14 ]
  %25 = icmp ne void (i8*)* %3, null
  %26 = icmp ne i64 %0, 0
  %27 = and i1 %26, %25
  br i1 %27, label %28, label %51

28:                                               ; preds = %23, %31
  %29 = phi i8* [ %33, %31 ], [ %24, %23 ]
  %30 = phi i64 [ %32, %31 ], [ 0, %23 ]
  invoke void %3(i8* %29)
          to label %31 unwind label %35

31:                                               ; preds = %28
  %32 = add nuw i64 %30, 1
  %33 = getelementptr inbounds i8, i8* %29, i64 %1
  %34 = icmp eq i64 %32, %0
  br i1 %34, label %51, label %28

35:                                               ; preds = %28
  %36 = landingpad { i8*, i32 }
          cleanup
  %37 = icmp eq void (i8*)* %4, null
  br i1 %37, label %22, label %38

38:                                               ; preds = %35
  %39 = mul i64 %30, %1
  %40 = getelementptr inbounds i8, i8* %24, i64 %39
  %41 = sub i64 0, %1
  br label %42

42:                                               ; preds = %46, %38
  %43 = phi i64 [ %30, %38 ], [ %47, %46 ]
  %44 = phi i8* [ %40, %38 ], [ %48, %46 ]
  %45 = icmp eq i64 %43, 0
  br i1 %45, label %22, label %46

46:                                               ; preds = %42
  %47 = add i64 %43, -1
  %48 = getelementptr inbounds i8, i8* %44, i64 %41
  invoke void %4(i8* %48)
          to label %42 unwind label %49

49:                                               ; preds = %46
  %50 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

51:                                               ; preds = %31, %23
  ret i8* %24
}

; Function Attrs: uwtable
define i8* @__cxa_vec_new2(i64 %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*)* %4, i8* (i64)* nocapture %5, void (i8*)* %6) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %8 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1) #7
  %9 = extractvalue { i64, i1 } %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

11:                                               ; preds = %7
  %12 = extractvalue { i64, i1 } %8, 0
  %13 = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %12, i64 %2) #7
  %14 = extractvalue { i64, i1 } %13, 1
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

16:                                               ; preds = %11
  %17 = extractvalue { i64, i1 } %13, 0
  %18 = tail call i8* %5(i64 %17)
  %19 = icmp eq i8* %18, null
  br i1 %19, label %59, label %20

20:                                               ; preds = %16
  %21 = icmp eq i64 %2, 0
  br i1 %21, label %31, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds i8, i8* %18, i64 %2
  %24 = getelementptr inbounds i8, i8* %23, i64 -8
  %25 = bitcast i8* %24 to i64*
  store i64 %0, i64* %25, align 8, !tbaa !3
  br label %31

26:                                               ; preds = %50, %43
  invoke void %6(i8* nonnull %18)
          to label %30 unwind label %27

27:                                               ; preds = %26
  %28 = landingpad { i8*, i32 }
          catch i8* null
  %29 = extractvalue { i8*, i32 } %28, 0
  tail call void @__clang_call_terminate(i8* %29) #9
  unreachable

30:                                               ; preds = %26
  resume { i8*, i32 } %44

31:                                               ; preds = %20, %22
  %32 = phi i8* [ %23, %22 ], [ %18, %20 ]
  %33 = icmp ne void (i8*)* %3, null
  %34 = icmp ne i64 %0, 0
  %35 = and i1 %34, %33
  br i1 %35, label %36, label %59

36:                                               ; preds = %31, %39
  %37 = phi i8* [ %41, %39 ], [ %32, %31 ]
  %38 = phi i64 [ %40, %39 ], [ 0, %31 ]
  invoke void %3(i8* %37)
          to label %39 unwind label %43

39:                                               ; preds = %36
  %40 = add nuw i64 %38, 1
  %41 = getelementptr inbounds i8, i8* %37, i64 %1
  %42 = icmp eq i64 %40, %0
  br i1 %42, label %59, label %36

43:                                               ; preds = %36
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = icmp eq void (i8*)* %4, null
  br i1 %45, label %26, label %46

46:                                               ; preds = %43
  %47 = mul i64 %38, %1
  %48 = getelementptr inbounds i8, i8* %32, i64 %47
  %49 = sub i64 0, %1
  br label %50

50:                                               ; preds = %54, %46
  %51 = phi i64 [ %38, %46 ], [ %55, %54 ]
  %52 = phi i8* [ %48, %46 ], [ %56, %54 ]
  %53 = icmp eq i64 %51, 0
  br i1 %53, label %26, label %54

54:                                               ; preds = %50
  %55 = add i64 %51, -1
  %56 = getelementptr inbounds i8, i8* %52, i64 %49
  invoke void %4(i8* %56)
          to label %50 unwind label %57

57:                                               ; preds = %54
  %58 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

59:                                               ; preds = %39, %31, %16
  %60 = phi i8* [ null, %16 ], [ %32, %31 ], [ %32, %39 ]
  ret i8* %60
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znam(i64) local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) local_unnamed_addr #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable
define void @__cxa_vec_ctor(i8* %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*)* %4) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %6 = icmp ne void (i8*)* %3, null
  %7 = icmp ne i64 %1, 0
  %8 = and i1 %6, %7
  br i1 %8, label %9, label %33

9:                                                ; preds = %5, %12
  %10 = phi i8* [ %14, %12 ], [ %0, %5 ]
  %11 = phi i64 [ %13, %12 ], [ 0, %5 ]
  invoke void %3(i8* %10)
          to label %12 unwind label %16

12:                                               ; preds = %9
  %13 = add nuw i64 %11, 1
  %14 = getelementptr inbounds i8, i8* %10, i64 %2
  %15 = icmp eq i64 %13, %1
  br i1 %15, label %33, label %9

16:                                               ; preds = %9
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = icmp eq void (i8*)* %4, null
  br i1 %18, label %32, label %19

19:                                               ; preds = %16
  %20 = mul i64 %11, %2
  %21 = getelementptr inbounds i8, i8* %0, i64 %20
  %22 = sub i64 0, %2
  br label %23

23:                                               ; preds = %27, %19
  %24 = phi i64 [ %11, %19 ], [ %28, %27 ]
  %25 = phi i8* [ %21, %19 ], [ %29, %27 ]
  %26 = icmp eq i64 %24, 0
  br i1 %26, label %32, label %27

27:                                               ; preds = %23
  %28 = add i64 %24, -1
  %29 = getelementptr inbounds i8, i8* %25, i64 %22
  invoke void %4(i8* %29)
          to label %23 unwind label %30

30:                                               ; preds = %27
  %31 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

32:                                               ; preds = %23, %16
  resume { i8*, i32 } %17

33:                                               ; preds = %12, %5
  ret void
}

; Function Attrs: uwtable
define i8* @__cxa_vec_new3(i64 %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*)* %4, i8* (i64)* nocapture %5, void (i8*, i64)* %6) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %8 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %0, i64 %1) #7
  %9 = extractvalue { i64, i1 } %8, 1
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

11:                                               ; preds = %7
  %12 = extractvalue { i64, i1 } %8, 0
  %13 = tail call { i64, i1 } @llvm.uadd.with.overflow.i64(i64 %12, i64 %2) #7
  %14 = extractvalue { i64, i1 } %13, 1
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  tail call fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() #8
  unreachable

16:                                               ; preds = %11
  %17 = extractvalue { i64, i1 } %13, 0
  %18 = tail call i8* %5(i64 %17)
  %19 = icmp eq i8* %18, null
  br i1 %19, label %59, label %20

20:                                               ; preds = %16
  %21 = icmp eq i64 %2, 0
  br i1 %21, label %31, label %22

22:                                               ; preds = %20
  %23 = getelementptr inbounds i8, i8* %18, i64 %2
  %24 = getelementptr inbounds i8, i8* %23, i64 -8
  %25 = bitcast i8* %24 to i64*
  store i64 %0, i64* %25, align 8, !tbaa !3
  br label %31

26:                                               ; preds = %50, %43
  invoke void %6(i8* nonnull %18, i64 %17)
          to label %30 unwind label %27

27:                                               ; preds = %26
  %28 = landingpad { i8*, i32 }
          catch i8* null
  %29 = extractvalue { i8*, i32 } %28, 0
  tail call void @__clang_call_terminate(i8* %29) #9
  unreachable

30:                                               ; preds = %26
  resume { i8*, i32 } %44

31:                                               ; preds = %20, %22
  %32 = phi i8* [ %23, %22 ], [ %18, %20 ]
  %33 = icmp ne void (i8*)* %3, null
  %34 = icmp ne i64 %0, 0
  %35 = and i1 %34, %33
  br i1 %35, label %36, label %59

36:                                               ; preds = %31, %39
  %37 = phi i8* [ %41, %39 ], [ %32, %31 ]
  %38 = phi i64 [ %40, %39 ], [ 0, %31 ]
  invoke void %3(i8* %37)
          to label %39 unwind label %43

39:                                               ; preds = %36
  %40 = add nuw i64 %38, 1
  %41 = getelementptr inbounds i8, i8* %37, i64 %1
  %42 = icmp eq i64 %40, %0
  br i1 %42, label %59, label %36

43:                                               ; preds = %36
  %44 = landingpad { i8*, i32 }
          cleanup
  %45 = icmp eq void (i8*)* %4, null
  br i1 %45, label %26, label %46

46:                                               ; preds = %43
  %47 = mul i64 %38, %1
  %48 = getelementptr inbounds i8, i8* %32, i64 %47
  %49 = sub i64 0, %1
  br label %50

50:                                               ; preds = %54, %46
  %51 = phi i64 [ %38, %46 ], [ %55, %54 ]
  %52 = phi i8* [ %48, %46 ], [ %56, %54 ]
  %53 = icmp eq i64 %51, 0
  br i1 %53, label %26, label %54

54:                                               ; preds = %50
  %55 = add i64 %51, -1
  %56 = getelementptr inbounds i8, i8* %52, i64 %49
  invoke void %4(i8* %56)
          to label %50 unwind label %57

57:                                               ; preds = %54
  %58 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

59:                                               ; preds = %39, %31, %16
  %60 = phi i8* [ null, %16 ], [ %32, %31 ], [ %32, %39 ]
  ret i8* %60
}

; Function Attrs: uwtable
define void @__cxa_vec_cctor(i8* %0, i8* %1, i64 %2, i64 %3, void (i8*, i8*)* %4, void (i8*)* %5) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %7 = icmp ne void (i8*, i8*)* %4, null
  %8 = icmp ne i64 %2, 0
  %9 = and i1 %7, %8
  br i1 %9, label %10, label %36

10:                                               ; preds = %6, %14
  %11 = phi i8* [ %16, %14 ], [ %1, %6 ]
  %12 = phi i8* [ %17, %14 ], [ %0, %6 ]
  %13 = phi i64 [ %15, %14 ], [ 0, %6 ]
  invoke void %4(i8* %12, i8* %11)
          to label %14 unwind label %19

14:                                               ; preds = %10
  %15 = add nuw i64 %13, 1
  %16 = getelementptr inbounds i8, i8* %11, i64 %3
  %17 = getelementptr inbounds i8, i8* %12, i64 %3
  %18 = icmp eq i64 %15, %2
  br i1 %18, label %36, label %10

19:                                               ; preds = %10
  %20 = landingpad { i8*, i32 }
          cleanup
  %21 = icmp eq void (i8*)* %5, null
  br i1 %21, label %35, label %22

22:                                               ; preds = %19
  %23 = mul i64 %13, %3
  %24 = getelementptr inbounds i8, i8* %0, i64 %23
  %25 = sub i64 0, %3
  br label %26

26:                                               ; preds = %30, %22
  %27 = phi i64 [ %13, %22 ], [ %31, %30 ]
  %28 = phi i8* [ %24, %22 ], [ %32, %30 ]
  %29 = icmp eq i64 %27, 0
  br i1 %29, label %35, label %30

30:                                               ; preds = %26
  %31 = add i64 %27, -1
  %32 = getelementptr inbounds i8, i8* %28, i64 %25
  invoke void %5(i8* %32)
          to label %26 unwind label %33

33:                                               ; preds = %30
  %34 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

35:                                               ; preds = %26, %19
  resume { i8*, i32 } %20

36:                                               ; preds = %14, %6
  ret void
}

; Function Attrs: uwtable
define void @__cxa_vec_dtor(i8* %0, i64 %1, i64 %2, void (i8*)* %3) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = icmp eq void (i8*)* %3, null
  br i1 %5, label %34, label %6

6:                                                ; preds = %4
  %7 = tail call zeroext i1 @__cxa_uncaught_exception() #7
  %8 = mul i64 %2, %1
  %9 = getelementptr inbounds i8, i8* %0, i64 %8
  %10 = sub i64 0, %2
  br label %11

11:                                               ; preds = %16, %6
  %12 = phi i64 [ %1, %6 ], [ %14, %16 ]
  %13 = phi i8* [ %9, %6 ], [ %17, %16 ]
  %14 = add i64 %12, -1
  %15 = icmp eq i64 %12, 0
  br i1 %15, label %34, label %16

16:                                               ; preds = %11
  %17 = getelementptr inbounds i8, i8* %13, i64 %10
  invoke void %3(i8* %17)
          to label %11 unwind label %18

18:                                               ; preds = %16
  %19 = landingpad { i8*, i32 }
          cleanup
  br i1 %7, label %20, label %21

20:                                               ; preds = %18
  tail call void @_ZSt9terminatev() #9
  unreachable

21:                                               ; preds = %18
  %22 = mul i64 %14, %2
  %23 = getelementptr inbounds i8, i8* %0, i64 %22
  br label %24

24:                                               ; preds = %28, %21
  %25 = phi i64 [ %14, %21 ], [ %29, %28 ]
  %26 = phi i8* [ %23, %21 ], [ %30, %28 ]
  %27 = icmp eq i64 %25, 0
  br i1 %27, label %33, label %28

28:                                               ; preds = %24
  %29 = add i64 %25, -1
  %30 = getelementptr inbounds i8, i8* %26, i64 %10
  invoke void %3(i8* %30)
          to label %24 unwind label %31

31:                                               ; preds = %28
  %32 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

33:                                               ; preds = %24
  resume { i8*, i32 } %19

34:                                               ; preds = %11, %4
  ret void
}

; Function Attrs: nounwind
declare zeroext i1 @__cxa_uncaught_exception() local_unnamed_addr #3

; Function Attrs: uwtable
define void @__cxa_vec_cleanup(i8* %0, i64 %1, i64 %2, void (i8*)* %3) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = icmp eq void (i8*)* %3, null
  br i1 %5, label %19, label %6

6:                                                ; preds = %4
  %7 = mul i64 %2, %1
  %8 = getelementptr inbounds i8, i8* %0, i64 %7
  %9 = sub i64 0, %2
  br label %10

10:                                               ; preds = %14, %6
  %11 = phi i64 [ %1, %6 ], [ %15, %14 ]
  %12 = phi i8* [ %8, %6 ], [ %16, %14 ]
  %13 = icmp eq i64 %11, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %10
  %15 = add i64 %11, -1
  %16 = getelementptr inbounds i8, i8* %12, i64 %9
  invoke void %3(i8* %16)
          to label %10 unwind label %17

17:                                               ; preds = %14
  %18 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZSt9terminatev() #9
  unreachable

19:                                               ; preds = %10, %4
  ret void
}

; Function Attrs: uwtable
define void @__cxa_vec_delete(i8* %0, i64 %1, i64 %2, void (i8*)* %3) local_unnamed_addr #0 personality i32 (...)* @__gxx_personality_v0 {
  %5 = icmp eq i8* %0, null
  br i1 %5, label %44, label %6

6:                                                ; preds = %4
  %7 = sub i64 0, %2
  %8 = getelementptr inbounds i8, i8* %0, i64 %7
  %9 = icmp ne i64 %2, 0
  %10 = icmp ne void (i8*)* %3, null
  %11 = and i1 %9, %10
  br i1 %11, label %12, label %43

12:                                               ; preds = %6
  %13 = getelementptr inbounds i8, i8* %0, i64 -8
  %14 = bitcast i8* %13 to i64*
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = tail call zeroext i1 @__cxa_uncaught_exception() #7
  %17 = mul i64 %15, %1
  %18 = getelementptr inbounds i8, i8* %0, i64 %17
  %19 = sub i64 0, %1
  br label %20

20:                                               ; preds = %25, %12
  %21 = phi i64 [ %15, %12 ], [ %23, %25 ]
  %22 = phi i8* [ %18, %12 ], [ %26, %25 ]
  %23 = add i64 %21, -1
  %24 = icmp eq i64 %21, 0
  br i1 %24, label %43, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds i8, i8* %22, i64 %19
  invoke void %3(i8* %26)
          to label %20 unwind label %27

27:                                               ; preds = %25
  %28 = landingpad { i8*, i32 }
          cleanup
  br i1 %16, label %29, label %30

29:                                               ; preds = %27
  tail call void @_ZSt9terminatev() #9
  unreachable

30:                                               ; preds = %27
  %31 = mul i64 %23, %1
  %32 = getelementptr inbounds i8, i8* %0, i64 %31
  br label %33

33:                                               ; preds = %37, %30
  %34 = phi i64 [ %23, %30 ], [ %38, %37 ]
  %35 = phi i8* [ %32, %30 ], [ %39, %37 ]
  %36 = icmp eq i64 %34, 0
  br i1 %36, label %42, label %37

37:                                               ; preds = %33
  %38 = add i64 %34, -1
  %39 = getelementptr inbounds i8, i8* %35, i64 %19
  invoke void %3(i8* %39)
          to label %33 unwind label %40

40:                                               ; preds = %37
  %41 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

42:                                               ; preds = %33
  tail call void @_ZdaPv(i8* nonnull %8)
  resume { i8*, i32 } %28

43:                                               ; preds = %20, %6
  tail call void @_ZdaPv(i8* nonnull %8)
  br label %44

44:                                               ; preds = %43, %4
  ret void
}

; Function Attrs: uwtable
define void @__cxa_vec_delete2(i8* %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*)* %4) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %6 = icmp eq i8* %0, null
  br i1 %6, label %52, label %7

7:                                                ; preds = %5
  %8 = sub i64 0, %2
  %9 = getelementptr inbounds i8, i8* %0, i64 %8
  %10 = icmp ne i64 %2, 0
  %11 = icmp ne void (i8*)* %3, null
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %48

13:                                               ; preds = %7
  %14 = getelementptr inbounds i8, i8* %0, i64 -8
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = tail call zeroext i1 @__cxa_uncaught_exception() #7
  %18 = mul i64 %16, %1
  %19 = getelementptr inbounds i8, i8* %0, i64 %18
  %20 = sub i64 0, %1
  br label %21

21:                                               ; preds = %26, %13
  %22 = phi i64 [ %16, %13 ], [ %24, %26 ]
  %23 = phi i8* [ %19, %13 ], [ %27, %26 ]
  %24 = add i64 %22, -1
  %25 = icmp eq i64 %22, 0
  br i1 %25, label %48, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds i8, i8* %23, i64 %20
  invoke void %3(i8* %27)
          to label %21 unwind label %28

28:                                               ; preds = %26
  %29 = landingpad { i8*, i32 }
          cleanup
  br i1 %17, label %30, label %31

30:                                               ; preds = %28
  tail call void @_ZSt9terminatev() #9
  unreachable

31:                                               ; preds = %28
  %32 = mul i64 %24, %1
  %33 = getelementptr inbounds i8, i8* %0, i64 %32
  br label %34

34:                                               ; preds = %38, %31
  %35 = phi i64 [ %24, %31 ], [ %39, %38 ]
  %36 = phi i8* [ %33, %31 ], [ %40, %38 ]
  %37 = icmp eq i64 %35, 0
  br i1 %37, label %43, label %38

38:                                               ; preds = %34
  %39 = add i64 %35, -1
  %40 = getelementptr inbounds i8, i8* %36, i64 %20
  invoke void %3(i8* %40)
          to label %34 unwind label %41

41:                                               ; preds = %38
  %42 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

43:                                               ; preds = %34
  invoke void %4(i8* nonnull %9)
          to label %47 unwind label %44

44:                                               ; preds = %43
  %45 = landingpad { i8*, i32 }
          catch i8* null
  %46 = extractvalue { i8*, i32 } %45, 0
  tail call void @__clang_call_terminate(i8* %46) #9
  unreachable

47:                                               ; preds = %43
  resume { i8*, i32 } %29

48:                                               ; preds = %21, %7
  invoke void %4(i8* nonnull %9)
          to label %52 unwind label %49

49:                                               ; preds = %48
  %50 = landingpad { i8*, i32 }
          catch i8* null
  %51 = extractvalue { i8*, i32 } %50, 0
  tail call void @__clang_call_terminate(i8* %51) #9
  unreachable

52:                                               ; preds = %48, %5
  ret void
}

; Function Attrs: uwtable
define void @__cxa_vec_delete3(i8* %0, i64 %1, i64 %2, void (i8*)* %3, void (i8*, i64)* %4) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %6 = icmp eq i8* %0, null
  br i1 %6, label %54, label %7

7:                                                ; preds = %5
  %8 = sub i64 0, %2
  %9 = getelementptr inbounds i8, i8* %0, i64 %8
  %10 = icmp eq i64 %2, 0
  br i1 %10, label %49, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds i8, i8* %0, i64 -8
  %13 = bitcast i8* %12 to i64*
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = mul i64 %14, %1
  %16 = add i64 %15, %2
  %17 = icmp eq void (i8*)* %3, null
  br i1 %17, label %49, label %18

18:                                               ; preds = %11
  %19 = tail call zeroext i1 @__cxa_uncaught_exception() #7
  %20 = getelementptr inbounds i8, i8* %0, i64 %15
  %21 = sub i64 0, %1
  br label %22

22:                                               ; preds = %27, %18
  %23 = phi i64 [ %14, %18 ], [ %25, %27 ]
  %24 = phi i8* [ %20, %18 ], [ %28, %27 ]
  %25 = add i64 %23, -1
  %26 = icmp eq i64 %23, 0
  br i1 %26, label %49, label %27

27:                                               ; preds = %22
  %28 = getelementptr inbounds i8, i8* %24, i64 %21
  invoke void %3(i8* %28)
          to label %22 unwind label %29

29:                                               ; preds = %27
  %30 = landingpad { i8*, i32 }
          cleanup
  br i1 %19, label %31, label %32

31:                                               ; preds = %29
  tail call void @_ZSt9terminatev() #9
  unreachable

32:                                               ; preds = %29
  %33 = mul i64 %25, %1
  %34 = getelementptr inbounds i8, i8* %0, i64 %33
  br label %35

35:                                               ; preds = %39, %32
  %36 = phi i64 [ %25, %32 ], [ %40, %39 ]
  %37 = phi i8* [ %34, %32 ], [ %41, %39 ]
  %38 = icmp eq i64 %36, 0
  br i1 %38, label %44, label %39

39:                                               ; preds = %35
  %40 = add i64 %36, -1
  %41 = getelementptr inbounds i8, i8* %37, i64 %21
  invoke void %3(i8* %41)
          to label %35 unwind label %42

42:                                               ; preds = %39
  %43 = landingpad { i8*, i32 }
          catch i8* null
  tail call void @_ZSt9terminatev() #9
  unreachable

44:                                               ; preds = %35
  invoke void %4(i8* nonnull %9, i64 %16)
          to label %48 unwind label %45

45:                                               ; preds = %44
  %46 = landingpad { i8*, i32 }
          catch i8* null
  %47 = extractvalue { i8*, i32 } %46, 0
  tail call void @__clang_call_terminate(i8* %47) #9
  unreachable

48:                                               ; preds = %44
  resume { i8*, i32 } %30

49:                                               ; preds = %22, %11, %7
  %50 = phi i64 [ %16, %11 ], [ 0, %7 ], [ %16, %22 ]
  invoke void %4(i8* nonnull %9, i64 %50)
          to label %54 unwind label %51

51:                                               ; preds = %49
  %52 = landingpad { i8*, i32 }
          catch i8* null
  %53 = extractvalue { i8*, i32 } %52, 0
  tail call void @__clang_call_terminate(i8* %53) #9
  unreachable

54:                                               ; preds = %49, %5
  ret void
}

; Function Attrs: noreturn uwtable
define internal fastcc void @_ZN10__cxxabiv112_GLOBAL__N_126throw_bad_array_new_lengthEv() unnamed_addr #4 {
  %1 = tail call i8* @__cxa_allocate_exception(i64 8) #7
  %2 = bitcast i8* %1 to %"class.std::bad_array_new_length"*
  tail call void @_ZNSt20bad_array_new_lengthC1Ev(%"class.std::bad_array_new_length"* %2) #7
  tail call void @__cxa_throw(i8* %1, i8* bitcast (i8** @_ZTISt20bad_array_new_length to i8*), i8* bitcast (void (%"class.std::bad_array_new_length"*)* @_ZNSt20bad_array_new_lengthD1Ev to i8*)) #8
  unreachable
}

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #5

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt20bad_array_new_lengthC1Ev(%"class.std::bad_array_new_length"*) unnamed_addr #3

; Function Attrs: nounwind
declare void @_ZNSt20bad_array_new_lengthD1Ev(%"class.std::bad_array_new_length"*) unnamed_addr #3

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.uadd.with.overflow.i64(i64, i64) #5

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #6 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #7
  tail call void @_ZSt9terminatev() #9
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone speculatable willreturn }
attributes #6 = { noinline noreturn nounwind }
attributes #7 = { nounwind }
attributes #8 = { noreturn }
attributes #9 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}

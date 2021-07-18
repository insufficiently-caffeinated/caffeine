; ModuleID = 'll/.stdlib_stdexcept.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/stdlib_stdexcept.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::domain_error" = type { %"class.std::logic_error" }
%"class.std::invalid_argument" = type { %"class.std::logic_error" }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::out_of_range" = type { %"class.std::logic_error" }
%"class.std::range_error" = type { %"class.std::runtime_error" }
%"class.std::overflow_error" = type { %"class.std::runtime_error" }
%"class.std::underflow_error" = type { %"class.std::runtime_error" }

@_ZTVSt11logic_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11logic_error to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTVSt13runtime_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt13runtime_error to i8*), i8* bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to i8*), i8* bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZTVSt12domain_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt12domain_error to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to i8*), i8* bitcast (void (%"class.std::domain_error"*)* @_ZNSt12domain_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSSt12domain_error = constant [17 x i8] c"St12domain_error\00", align 1
@_ZTSSt11logic_error = constant [16 x i8] c"St11logic_error\00", align 1
@_ZTISt9exception = external constant i8*
@_ZTISt11logic_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTSSt11logic_error, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8
@_ZTISt12domain_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @_ZTSSt12domain_error, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11logic_error to i8*) }, align 8
@_ZTVSt16invalid_argument = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTSSt16invalid_argument = constant [21 x i8] c"St16invalid_argument\00", align 1
@_ZTISt16invalid_argument = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @_ZTSSt16invalid_argument, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11logic_error to i8*) }, align 8
@_ZTVSt12length_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTSSt12length_error = constant [17 x i8] c"St12length_error\00", align 1
@_ZTISt12length_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @_ZTSSt12length_error, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11logic_error to i8*) }, align 8
@_ZTVSt12out_of_range = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTSSt12out_of_range = constant [17 x i8] c"St12out_of_range\00", align 1
@_ZTISt12out_of_range = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @_ZTSSt12out_of_range, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11logic_error to i8*) }, align 8
@_ZTVSt11range_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt11range_error to i8*), i8* bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to i8*), i8* bitcast (void (%"class.std::range_error"*)* @_ZNSt11range_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZTSSt11range_error = constant [16 x i8] c"St11range_error\00", align 1
@_ZTSSt13runtime_error = constant [18 x i8] c"St13runtime_error\00", align 1
@_ZTISt13runtime_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @_ZTSSt13runtime_error, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8
@_ZTISt11range_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @_ZTSSt11range_error, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt13runtime_error to i8*) }, align 8
@_ZTVSt14overflow_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt14overflow_error to i8*), i8* bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to i8*), i8* bitcast (void (%"class.std::overflow_error"*)* @_ZNSt14overflow_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZTSSt14overflow_error = constant [19 x i8] c"St14overflow_error\00", align 1
@_ZTISt14overflow_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @_ZTSSt14overflow_error, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt13runtime_error to i8*) }, align 8
@_ZTVSt15underflow_error = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt15underflow_error to i8*), i8* bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to i8*), i8* bitcast (void (%"class.std::underflow_error"*)* @_ZNSt15underflow_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZTSSt15underflow_error = constant [20 x i8] c"St15underflow_error\00", align 1
@_ZTISt15underflow_error = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @_ZTSSt15underflow_error, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt13runtime_error to i8*) }, align 8

@_ZNSt11logic_errorD1Ev = unnamed_addr alias void (%"class.std::logic_error"*), void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev
@_ZNSt13runtime_errorD1Ev = unnamed_addr alias void (%"class.std::runtime_error"*), void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev
@_ZNSt12domain_errorD2Ev = unnamed_addr alias void (%"class.std::domain_error"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::domain_error"*)*)
@_ZNSt12domain_errorD1Ev = unnamed_addr alias void (%"class.std::domain_error"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::domain_error"*)*)
@_ZNSt16invalid_argumentD2Ev = unnamed_addr alias void (%"class.std::invalid_argument"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::invalid_argument"*)*)
@_ZNSt16invalid_argumentD1Ev = unnamed_addr alias void (%"class.std::invalid_argument"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::invalid_argument"*)*)
@_ZNSt12length_errorD2Ev = unnamed_addr alias void (%"class.std::length_error"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::length_error"*)*)
@_ZNSt12length_errorD1Ev = unnamed_addr alias void (%"class.std::length_error"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::length_error"*)*)
@_ZNSt12out_of_rangeD2Ev = unnamed_addr alias void (%"class.std::out_of_range"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::out_of_range"*)*)
@_ZNSt12out_of_rangeD1Ev = unnamed_addr alias void (%"class.std::out_of_range"*), bitcast (void (%"class.std::logic_error"*)* @_ZNSt11logic_errorD2Ev to void (%"class.std::out_of_range"*)*)
@_ZNSt11range_errorD2Ev = unnamed_addr alias void (%"class.std::range_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::range_error"*)*)
@_ZNSt11range_errorD1Ev = unnamed_addr alias void (%"class.std::range_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::range_error"*)*)
@_ZNSt14overflow_errorD2Ev = unnamed_addr alias void (%"class.std::overflow_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::overflow_error"*)*)
@_ZNSt14overflow_errorD1Ev = unnamed_addr alias void (%"class.std::overflow_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::overflow_error"*)*)
@_ZNSt15underflow_errorD2Ev = unnamed_addr alias void (%"class.std::underflow_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::underflow_error"*)*)
@_ZNSt15underflow_errorD1Ev = unnamed_addr alias void (%"class.std::underflow_error"*), bitcast (void (%"class.std::runtime_error"*)* @_ZNSt13runtime_errorD2Ev to void (%"class.std::underflow_error"*)*)

; Function Attrs: nounwind uwtable
define void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt9exceptionD2Ev(%"class.std::exception"*) unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @_ZNSt11logic_errorD0Ev(%"class.std::logic_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::logic_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readonly uwtable
define i8* @_ZNKSt11logic_error4whatEv(%"class.std::logic_error"* nocapture readonly %0) unnamed_addr #3 align 2 {
  %2 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1, i32 0
  %3 = load i8*, i8** %2, align 8, !tbaa !6
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt13runtime_errorD0Ev(%"class.std::runtime_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::runtime_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define i8* @_ZNKSt13runtime_error4whatEv(%"class.std::runtime_error"* nocapture readonly %0) unnamed_addr #3 align 2 {
  %2 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1, i32 0
  %3 = load i8*, i8** %2, align 8, !tbaa !6
  ret i8* %3
}

; Function Attrs: nounwind uwtable
define void @_ZNSt12domain_errorD0Ev(%"class.std::domain_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::domain_error", %"class.std::domain_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::domain_error", %"class.std::domain_error"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::domain_error", %"class.std::domain_error"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::domain_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt16invalid_argumentD0Ev(%"class.std::invalid_argument"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::invalid_argument", %"class.std::invalid_argument"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::invalid_argument", %"class.std::invalid_argument"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::invalid_argument", %"class.std::invalid_argument"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::invalid_argument"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt12length_errorD0Ev(%"class.std::length_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::length_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt12out_of_rangeD0Ev(%"class.std::out_of_range"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::out_of_range"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt11range_errorD0Ev(%"class.std::range_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::range_error", %"class.std::range_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::range_error", %"class.std::range_error"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::range_error", %"class.std::range_error"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::range_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt14overflow_errorD0Ev(%"class.std::overflow_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::overflow_error", %"class.std::overflow_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::overflow_error", %"class.std::overflow_error"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::overflow_error", %"class.std::overflow_error"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::overflow_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt15underflow_errorD0Ev(%"class.std::underflow_error"* %0) unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::underflow_error", %"class.std::underflow_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::underflow_error", %"class.std::underflow_error"* %0, i64 0, i32 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds i8, i8* %4, i64 -8
  %6 = bitcast i8* %5 to i32*
  %7 = atomicrmw add i32* %6, i32 -1 seq_cst
  %8 = add i32 %7, -1
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = getelementptr inbounds i8, i8* %4, i64 -24
  tail call void @_ZdlPv(i8* nonnull %11) #4
  br label %12

12:                                               ; preds = %1, %10
  %13 = getelementptr %"class.std::underflow_error", %"class.std::underflow_error"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %13) #4
  %14 = bitcast %"class.std::underflow_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %14) #5
  ret void
}

declare i32 @__gxx_personality_v0(...)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"_ZTSNSt3__118__libcpp_refstringE", !8, i64 0}
!8 = !{!"any pointer", !9, i64 0}
!9 = !{!"omnipotent char", !5, i64 0}

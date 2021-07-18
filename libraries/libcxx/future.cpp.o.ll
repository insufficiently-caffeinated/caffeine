; ModuleID = 'll/.future.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/future.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__future_error_category" = type { %"class.std::__1::__do_message" }
%"class.std::__1::__do_message" = type { %"class.std::__1::error_category" }
%"class.std::__1::error_category" = type { i32 (...)** }
%"class.std::__1::future_error" = type { %"class.std::logic_error", %"class.std::__1::error_code" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::__1::error_code" = type { i32, %"class.std::__1::error_category"* }
%"class.std::__1::future" = type { %"class.std::__1::__assoc_sub_state"* }
%"class.std::__1::__assoc_sub_state" = type <{ %"class.std::__1::__shared_count", %"class.std::exception_ptr", %"class.std::__1::mutex", %"class.std::__1::condition_variable", i32, [4 x i8] }>
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::exception_ptr" = type { i8* }
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::condition_variable" = type { %union.pthread_cond_t }
%union.pthread_cond_t = type { %struct.__pthread_cond_s }
%struct.__pthread_cond_s = type { %union.anon.2, %union.anon.3, [2 x i32], [2 x i32], i32, i32, [2 x i32] }
%union.anon.2 = type { i64 }
%union.anon.3 = type { i64 }
%"class.std::__1::promise" = type { %"class.std::__1::__assoc_sub_state"* }
%"class.std::__1::shared_future" = type { %"class.std::__1::__assoc_sub_state"* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::__thread_specific_ptr" = type { i32 }
%"class.std::__1::__thread_struct" = type { %"class.std::__1::__thread_struct_imp"* }
%"class.std::__1::__thread_struct_imp" = type opaque
%"class.std::__1::unique_lock" = type <{ %"class.std::__1::mutex"*, i8, [7 x i8] }>
%"class.std::__1::error_condition" = type { i32, %"class.std::__1::error_category"* }

$_ZNSt3__120__throw_future_errorENS_11future_errcE = comdat any

$__clang_call_terminate = comdat any

$_ZNSt3__117__assoc_sub_stateD2Ev = comdat any

$_ZNSt3__117__assoc_sub_stateD0Ev = comdat any

$_ZNSt3__123__future_error_categoryD0Ev = comdat any

@.str = private unnamed_addr constant [7 x i8] c"future\00", align 1
@.str.1 = private unnamed_addr constant [89 x i8] c"The associated promise has been destructed prior to the associated state becoming ready.\00", align 1
@.str.2 = private unnamed_addr constant [73 x i8] c"The future has already been retrieved from the promise or packaged_task.\00", align 1
@.str.3 = private unnamed_addr constant [47 x i8] c"The state of the promise has already been set.\00", align 1
@.str.4 = private unnamed_addr constant [66 x i8] c"Operation not permitted on an object without an associated state.\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"unspecified future_errc value\0A\00", align 1
@_ZZNSt3__115future_categoryEvE3__f = internal global %"class.std::__1::__future_error_category" zeroinitializer, align 8
@_ZGVZNSt3__115future_categoryEvE3__f = internal global i64 0, align 8
@__dso_handle = external hidden global i8
@_ZTVNSt3__112future_errorE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112future_errorE to i8*), i8* bitcast (void (%"class.std::__1::future_error"*)* @_ZNSt3__112future_errorD2Ev to i8*), i8* bitcast (void (%"class.std::__1::future_error"*)* @_ZNSt3__112future_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__112future_errorE = constant [23 x i8] c"NSt3__112future_errorE\00", align 1
@_ZTISt11logic_error = external constant i8*
@_ZTINSt3__112future_errorE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSNSt3__112future_errorE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt11logic_error to i8*) }, align 8
@_ZTVNSt3__117__assoc_sub_stateE = unnamed_addr constant { [6 x i8*] } { [6 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__117__assoc_sub_stateE to i8*), i8* bitcast (void (%"class.std::__1::__assoc_sub_state"*)* @_ZNSt3__117__assoc_sub_stateD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__assoc_sub_state"*)* @_ZNSt3__117__assoc_sub_stateD0Ev to i8*), i8* bitcast (void (%"class.std::__1::__assoc_sub_state"*)* @_ZNSt3__117__assoc_sub_state16__on_zero_sharedEv to i8*), i8* bitcast (void (%"class.std::__1::__assoc_sub_state"*)* @_ZNSt3__117__assoc_sub_state9__executeEv to i8*)] }, align 8
@_ZTSNSt3__117__assoc_sub_stateE = constant [28 x i8] c"NSt3__117__assoc_sub_stateE\00", align 1
@_ZTINSt3__114__shared_countE = external constant i8*
@_ZTINSt3__117__assoc_sub_stateE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @_ZTSNSt3__117__assoc_sub_stateE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__114__shared_countE to i8*) }, align 8
@_ZTVNSt3__123__future_error_categoryE = hidden unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__123__future_error_categoryE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__future_error_category"*)* @_ZNSt3__123__future_error_categoryD0Ev to i8*), i8* bitcast (i8* (%"class.std::__1::__future_error_category"*)* @_ZNKSt3__123__future_error_category4nameEv to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)* @_ZNKSt3__114error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.std::__1::__future_error_category"*, i32)* @_ZNKSt3__123__future_error_category7messageEi to i8*)] }, align 8
@_ZTSNSt3__123__future_error_categoryE = hidden constant [34 x i8] c"NSt3__123__future_error_categoryE\00", align 1
@_ZTINSt3__112__do_messageE = external hidden constant i8*
@_ZTINSt3__123__future_error_categoryE = hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSNSt3__123__future_error_categoryE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__112__do_messageE to i8*) }, align 8
@.str.7 = private unnamed_addr constant [32 x i8] c"unique_lock::unlock: not locked\00", align 1

@_ZNSt3__112future_errorC1ENS_10error_codeE = unnamed_addr alias void (%"class.std::__1::future_error"*, i32, %"class.std::__1::error_category"*), void (%"class.std::__1::future_error"*, i32, %"class.std::__1::error_category"*)* @_ZNSt3__112future_errorC2ENS_10error_codeE
@_ZNSt3__112future_errorD1Ev = unnamed_addr alias void (%"class.std::__1::future_error"*), void (%"class.std::__1::future_error"*)* @_ZNSt3__112future_errorD2Ev
@_ZNSt3__16futureIvEC1EPNS_17__assoc_sub_stateE = unnamed_addr alias void (%"class.std::__1::future"*, %"class.std::__1::__assoc_sub_state"*), void (%"class.std::__1::future"*, %"class.std::__1::__assoc_sub_state"*)* @_ZNSt3__16futureIvEC2EPNS_17__assoc_sub_stateE
@_ZNSt3__16futureIvED1Ev = unnamed_addr alias void (%"class.std::__1::future"*), void (%"class.std::__1::future"*)* @_ZNSt3__16futureIvED2Ev
@_ZNSt3__17promiseIvEC1Ev = unnamed_addr alias void (%"class.std::__1::promise"*), void (%"class.std::__1::promise"*)* @_ZNSt3__17promiseIvEC2Ev
@_ZNSt3__17promiseIvED1Ev = unnamed_addr alias void (%"class.std::__1::promise"*), void (%"class.std::__1::promise"*)* @_ZNSt3__17promiseIvED2Ev
@_ZNSt3__113shared_futureIvED1Ev = unnamed_addr alias void (%"class.std::__1::shared_future"*), void (%"class.std::__1::shared_future"*)* @_ZNSt3__113shared_futureIvED2Ev

; Function Attrs: norecurse nounwind readnone uwtable
define hidden i8* @_ZNKSt3__123__future_error_category4nameEv(%"class.std::__1::__future_error_category"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: uwtable
define hidden void @_ZNKSt3__123__future_error_category7messageEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::__future_error_category"* nocapture readnone %1, i32 %2) unnamed_addr #1 align 2 {
  switch i32 %2, label %24 [
    i32 0, label %4
    i32 4, label %4
    i32 1, label %9
    i32 2, label %14
    i32 3, label %19
  ]

4:                                                ; preds = %3, %3
  %5 = tail call noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #15
  %6 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %5, i8** %6, align 8, !tbaa !3
  %7 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 97, i64 88>, <2 x i64>* %7, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(88) %5, i8* nonnull align 1 dereferenceable(88) getelementptr inbounds ([89 x i8], [89 x i8]* @.str.1, i64 0, i64 0), i64 88, i1 false) #16
  %8 = getelementptr inbounds i8, i8* %5, i64 88
  br label %29

9:                                                ; preds = %3
  %10 = tail call noalias nonnull dereferenceable(80) i8* @_Znwm(i64 80) #15
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %10, i8** %11, align 8, !tbaa !3
  %12 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 81, i64 72>, <2 x i64>* %12, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(72) %10, i8* nonnull align 1 dereferenceable(72) getelementptr inbounds ([73 x i8], [73 x i8]* @.str.2, i64 0, i64 0), i64 72, i1 false) #16
  %13 = getelementptr inbounds i8, i8* %10, i64 72
  br label %29

14:                                               ; preds = %3
  %15 = tail call noalias nonnull dereferenceable(48) i8* @_Znwm(i64 48) #15
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %15, i8** %16, align 8, !tbaa !3
  %17 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 49, i64 46>, <2 x i64>* %17, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(46) %15, i8* nonnull align 1 dereferenceable(46) getelementptr inbounds ([47 x i8], [47 x i8]* @.str.3, i64 0, i64 0), i64 46, i1 false) #16
  %18 = getelementptr inbounds i8, i8* %15, i64 46
  br label %29

19:                                               ; preds = %3
  %20 = tail call noalias nonnull dereferenceable(80) i8* @_Znwm(i64 80) #15
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %20, i8** %21, align 8, !tbaa !3
  %22 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 81, i64 65>, <2 x i64>* %22, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(65) %20, i8* nonnull align 1 dereferenceable(65) getelementptr inbounds ([66 x i8], [66 x i8]* @.str.4, i64 0, i64 0), i64 65, i1 false) #16
  %23 = getelementptr inbounds i8, i8* %20, i64 65
  br label %29

24:                                               ; preds = %3
  %25 = tail call noalias nonnull dereferenceable(32) i8* @_Znwm(i64 32) #15
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %25, i8** %26, align 8, !tbaa !3
  %27 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 33, i64 30>, <2 x i64>* %27, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(30) %25, i8* nonnull align 1 dereferenceable(30) getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0), i64 30, i1 false) #16
  %28 = getelementptr inbounds i8, i8* %25, i64 30
  br label %29

29:                                               ; preds = %24, %19, %14, %9, %4
  %30 = phi i8* [ %28, %24 ], [ %23, %19 ], [ %18, %14 ], [ %13, %9 ], [ %8, %4 ]
  store i8 0, i8* %30, align 1, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115future_categoryEv() local_unnamed_addr #2 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115future_categoryEvE3__f to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %8, !prof !6

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %3
  tail call void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0)) #16
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__future_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !7
  %7 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to void (i8*)*), i8* bitcast (%"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f to i8*), i8* nonnull @__dso_handle) #16
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  br label %8

8:                                                ; preds = %3, %6, %0
  ret %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0)
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @_ZNSt3__114error_categoryD2Ev(%"class.std::__1::error_category"*) unnamed_addr #4

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #3

; Function Attrs: uwtable
define void @_ZNSt3__112future_errorC2ENS_10error_codeE(%"class.std::__1::future_error"* %0, i32 %1, %"class.std::__1::error_category"* %2) unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::error_code", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 0
  store i32 %1, i32* %6, align 8
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %7, align 8
  %8 = getelementptr %"class.std::__1::future_error", %"class.std::__1::future_error"* %0, i64 0, i32 0
  %9 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %9) #16
  call void @_ZNKSt3__110error_code7messageEv(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::error_code"* nonnull %4)
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %8, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %10 unwind label %22

10:                                               ; preds = %3
  %11 = load i8, i8* %9, align 8, !tbaa !3
  %12 = and i8 %11, 1
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %17, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %16 = load i8*, i8** %15, align 8, !tbaa !3
  call void @_ZdlPv(i8* %16) #17
  br label %17

17:                                               ; preds = %10, %14
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #16
  %18 = getelementptr %"class.std::__1::future_error", %"class.std::__1::future_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112future_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %18, align 8, !tbaa !7
  %19 = getelementptr inbounds %"class.std::__1::future_error", %"class.std::__1::future_error"* %0, i64 0, i32 1
  %20 = bitcast %"class.std::__1::error_code"* %19 to i8*
  %21 = bitcast %"class.std::__1::error_code"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %20, i8* nonnull align 8 dereferenceable(16) %21, i64 16, i1 false), !tbaa.struct !9
  ret void

22:                                               ; preds = %3
  %23 = landingpad { i8*, i32 }
          cleanup
  %24 = load i8, i8* %9, align 8, !tbaa !3
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %22
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i8*, i8** %28, align 8, !tbaa !3
  call void @_ZdlPv(i8* %29) #17
  br label %30

30:                                               ; preds = %22, %27
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #16
  resume { i8*, i32 } %23
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

declare void @_ZNKSt3__110error_code7messageEv(%"class.std::__1::basic_string"* sret align 8, %"class.std::__1::error_code"*) local_unnamed_addr #6

declare void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #6

declare i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112future_errorD2Ev(%"class.std::__1::future_error"* %0) unnamed_addr #2 align 2 {
  %2 = getelementptr %"class.std::__1::future_error", %"class.std::__1::future_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* %2) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112future_errorD0Ev(%"class.std::__1::future_error"* %0) unnamed_addr #2 align 2 {
  %2 = getelementptr %"class.std::__1::future_error", %"class.std::__1::future_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* %2) #16
  %3 = bitcast %"class.std::__1::future_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #17
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #7

; Function Attrs: nounwind uwtable
define void @_ZNSt3__117__assoc_sub_state16__on_zero_sharedEv(%"class.std::__1::__assoc_sub_state"* %0) unnamed_addr #2 align 2 {
  %2 = icmp eq %"class.std::__1::__assoc_sub_state"* %0, null
  br i1 %2, label %8, label %3

3:                                                ; preds = %1
  %4 = bitcast %"class.std::__1::__assoc_sub_state"* %0 to void (%"class.std::__1::__assoc_sub_state"*)***
  %5 = load void (%"class.std::__1::__assoc_sub_state"*)**, void (%"class.std::__1::__assoc_sub_state"*)*** %4, align 8, !tbaa !7
  %6 = getelementptr inbounds void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %5, i64 1
  %7 = load void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %6, align 8
  tail call void %7(%"class.std::__1::__assoc_sub_state"* nonnull %0) #16
  br label %8

8:                                                ; preds = %3, %1
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state9set_valueEv(%"class.std::__1::__assoc_sub_state"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::exception_ptr", align 8
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %3)
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 8, !tbaa !14
  %6 = and i32 %5, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = bitcast %"class.std::exception_ptr"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #16
  %10 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %2, i64 0, i32 0
  store i8* null, i8** %10, align 8, !tbaa !19
  %11 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1, i32 0
  %12 = load i8*, i8** %11, align 8, !tbaa !19
  %13 = icmp eq i8* %12, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %2) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #16
  br i1 %13, label %18, label %14

14:                                               ; preds = %8, %1
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 2) #18
          to label %15 unwind label %16

15:                                               ; preds = %14
  unreachable

16:                                               ; preds = %14
  %17 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %3) #16
  resume { i8*, i32 } %17

18:                                               ; preds = %8
  %19 = load i32, i32* %4, align 8, !tbaa !14
  %20 = or i32 %19, 5
  store i32 %20, i32* %4, align 8, !tbaa !14
  %21 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %21) #16
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %3) #16
  ret void
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 %0) local_unnamed_addr #8 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 32) #16
  %3 = bitcast i8* %2 to %"class.std::__1::future_error"*
  %4 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115future_categoryEvE3__f to i8*) acquire, align 8
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %6, label %11, !prof !6

6:                                                ; preds = %1
  %7 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  tail call void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0)) #16
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__future_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !7
  %10 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to void (i8*)*), i8* bitcast (%"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f to i8*), i8* nonnull @__dso_handle) #16
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  br label %11

11:                                               ; preds = %1, %6, %9
  invoke void @_ZNSt3__112future_errorC2ENS_10error_codeE(%"class.std::__1::future_error"* %3, i32 %0, %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0))
          to label %12 unwind label %13

12:                                               ; preds = %11
  tail call void @__cxa_throw(i8* %2, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112future_errorE to i8*), i8* bitcast (void (%"class.std::__1::future_error"*)* @_ZNSt3__112future_errorD2Ev to i8*)) #18
  unreachable

13:                                               ; preds = %11
  %14 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #16
  resume { i8*, i32 } %14
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"*) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state24set_value_at_thread_exitEv(%"class.std::__1::__assoc_sub_state"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::exception_ptr", align 8
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %3)
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %5 = load i32, i32* %4, align 8, !tbaa !14
  %6 = and i32 %5, 1
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %14

8:                                                ; preds = %1
  %9 = bitcast %"class.std::exception_ptr"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #16
  %10 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %2, i64 0, i32 0
  store i8* null, i8** %10, align 8, !tbaa !19
  %11 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1, i32 0
  %12 = load i8*, i8** %11, align 8, !tbaa !19
  %13 = icmp eq i8* %12, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %2) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #16
  br i1 %13, label %18, label %14

14:                                               ; preds = %8, %1
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 2) #18
          to label %15 unwind label %16

15:                                               ; preds = %14
  unreachable

16:                                               ; preds = %22, %18, %14
  %17 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %3) #16
  resume { i8*, i32 } %17

18:                                               ; preds = %8
  %19 = load i32, i32* %4, align 8, !tbaa !14
  %20 = or i32 %19, 1
  store i32 %20, i32* %4, align 8, !tbaa !14
  %21 = invoke nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv()
          to label %22 unwind label %16

22:                                               ; preds = %18
  %23 = getelementptr inbounds %"class.std::__1::__thread_specific_ptr", %"class.std::__1::__thread_specific_ptr"* %21, i64 0, i32 0
  %24 = load i32, i32* %23, align 4, !tbaa !20
  %25 = call i8* @pthread_getspecific(i32 %24) #16
  %26 = bitcast i8* %25 to %"class.std::__1::__thread_struct"*
  invoke void @_ZNSt3__115__thread_struct27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct"* %26, %"class.std::__1::__assoc_sub_state"* nonnull %0)
          to label %27 unwind label %16

27:                                               ; preds = %22
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %3) #16
  ret void
}

declare nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv() local_unnamed_addr #6

declare void @_ZNSt3__115__thread_struct27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct"*, %"class.std::__1::__assoc_sub_state"*) local_unnamed_addr #6

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state13set_exceptionESt13exception_ptr(%"class.std::__1::__assoc_sub_state"* %0, %"class.std::exception_ptr"* %1) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::exception_ptr", align 8
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %5 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 8, !tbaa !14
  %7 = and i32 %6, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %2
  %10 = bitcast %"class.std::exception_ptr"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #16
  %11 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %3, i64 0, i32 0
  store i8* null, i8** %11, align 8, !tbaa !19
  %12 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1, i32 0
  %13 = load i8*, i8** %12, align 8, !tbaa !19
  %14 = icmp eq i8* %13, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #16
  br i1 %14, label %19, label %15

15:                                               ; preds = %9, %2
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 2) #18
          to label %16 unwind label %17

16:                                               ; preds = %15
  unreachable

17:                                               ; preds = %15
  %18 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  resume { i8*, i32 } %18

19:                                               ; preds = %9
  %20 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1
  %21 = call nonnull align 8 dereferenceable(8) %"class.std::exception_ptr"* @_ZNSt13exception_ptraSERKS_(%"class.std::exception_ptr"* nonnull %20, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8) %1) #16
  %22 = load i32, i32* %5, align 8, !tbaa !14
  %23 = or i32 %22, 4
  store i32 %23, i32* %5, align 8, !tbaa !14
  %24 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %24) #16
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  ret void
}

; Function Attrs: nounwind
declare nonnull align 8 dereferenceable(8) %"class.std::exception_ptr"* @_ZNSt13exception_ptraSERKS_(%"class.std::exception_ptr"*, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8)) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state28set_exception_at_thread_exitESt13exception_ptr(%"class.std::__1::__assoc_sub_state"* %0, %"class.std::exception_ptr"* %1) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::exception_ptr", align 8
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %5 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %6 = load i32, i32* %5, align 8, !tbaa !14
  %7 = and i32 %6, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %2
  %10 = bitcast %"class.std::exception_ptr"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #16
  %11 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %3, i64 0, i32 0
  store i8* null, i8** %11, align 8, !tbaa !19
  %12 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1, i32 0
  %13 = load i8*, i8** %12, align 8, !tbaa !19
  %14 = icmp eq i8* %13, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #16
  br i1 %14, label %19, label %15

15:                                               ; preds = %9, %2
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 2) #18
          to label %16 unwind label %17

16:                                               ; preds = %15
  unreachable

17:                                               ; preds = %23, %19, %15
  %18 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  resume { i8*, i32 } %18

19:                                               ; preds = %9
  %20 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1
  %21 = call nonnull align 8 dereferenceable(8) %"class.std::exception_ptr"* @_ZNSt13exception_ptraSERKS_(%"class.std::exception_ptr"* nonnull %20, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8) %1) #16
  %22 = invoke nonnull align 4 dereferenceable(4) %"class.std::__1::__thread_specific_ptr"* @_ZNSt3__119__thread_local_dataEv()
          to label %23 unwind label %17

23:                                               ; preds = %19
  %24 = getelementptr inbounds %"class.std::__1::__thread_specific_ptr", %"class.std::__1::__thread_specific_ptr"* %22, i64 0, i32 0
  %25 = load i32, i32* %24, align 4, !tbaa !20
  %26 = call i8* @pthread_getspecific(i32 %25) #16
  %27 = bitcast i8* %26 to %"class.std::__1::__thread_struct"*
  invoke void @_ZNSt3__115__thread_struct27__make_ready_at_thread_exitEPNS_17__assoc_sub_stateE(%"class.std::__1::__thread_struct"* %27, %"class.std::__1::__assoc_sub_state"* nonnull %0)
          to label %28 unwind label %17

28:                                               ; preds = %23
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state12__make_readyEv(%"class.std::__1::__assoc_sub_state"* %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %2)
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 8, !tbaa !14
  %5 = or i32 %4, 4
  store i32 %5, i32* %3, align 8, !tbaa !14
  %6 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  tail call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %6) #16
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %2) #16
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state4copyEv(%"class.std::__1::__assoc_sub_state"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = alloca %"class.std::exception_ptr", align 8
  %4 = alloca %"class.std::exception_ptr", align 8
  %5 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %5) #16
  %6 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  %7 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %6, %"class.std::__1::mutex"** %7, align 8, !tbaa !22
  %8 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %8, align 8, !tbaa !25
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %6)
  %9 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %10 = load i32, i32* %9, align 8, !tbaa !14
  %11 = and i32 %10, 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %28

13:                                               ; preds = %1
  %14 = and i32 %10, 8
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

16:                                               ; preds = %13
  %17 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  br label %24

18:                                               ; preds = %13
  %19 = and i32 %10, -9
  store i32 %19, i32* %9, align 8, !tbaa !14
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %6) #16
  store i8 0, i8* %8, align 8, !tbaa !25
  %20 = bitcast %"class.std::__1::__assoc_sub_state"* %0 to void (%"class.std::__1::__assoc_sub_state"*)***
  %21 = load void (%"class.std::__1::__assoc_sub_state"*)**, void (%"class.std::__1::__assoc_sub_state"*)*** %20, align 8, !tbaa !7
  %22 = getelementptr inbounds void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %21, i64 3
  %23 = load void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %22, align 8
  invoke void %23(%"class.std::__1::__assoc_sub_state"* nonnull %0)
          to label %28 unwind label %37

24:                                               ; preds = %24, %16
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %17, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #16
  %25 = load i32, i32* %9, align 8, !tbaa !14
  %26 = and i32 %25, 4
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %24, label %28

28:                                               ; preds = %24, %1, %18
  %29 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1
  %30 = bitcast %"class.std::exception_ptr"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %30) #16
  %31 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %3, i64 0, i32 0
  store i8* null, i8** %31, align 8, !tbaa !19
  %32 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %29, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8, !tbaa !19
  %34 = icmp eq i8* %33, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %30) #16
  br i1 %34, label %45, label %35

35:                                               ; preds = %28
  call void @_ZNSt13exception_ptrC1ERKS_(%"class.std::exception_ptr"* nonnull %4, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8) %29) #16
  invoke void @_ZSt17rethrow_exceptionSt13exception_ptr(%"class.std::exception_ptr"* nonnull %4) #18
          to label %36 unwind label %41

36:                                               ; preds = %35
  unreachable

37:                                               ; preds = %18
  %38 = landingpad { i8*, i32 }
          cleanup
  %39 = extractvalue { i8*, i32 } %38, 0
  %40 = extractvalue { i8*, i32 } %38, 1
  br label %51

41:                                               ; preds = %35
  %42 = landingpad { i8*, i32 }
          cleanup
  %43 = extractvalue { i8*, i32 } %42, 0
  %44 = extractvalue { i8*, i32 } %42, 1
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %4) #16
  br label %51

45:                                               ; preds = %28
  %46 = load i8, i8* %8, align 8, !tbaa !25, !range !26
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %50, label %48

48:                                               ; preds = %45
  %49 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %7, align 8, !tbaa !22
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %49) #16
  br label %50

50:                                               ; preds = %45, %48
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #16
  ret void

51:                                               ; preds = %41, %37
  %52 = phi i8* [ %43, %41 ], [ %39, %37 ]
  %53 = phi i32 [ %44, %41 ], [ %40, %37 ]
  %54 = load i8, i8* %8, align 8, !tbaa !25, !range !26
  %55 = icmp eq i8 %54, 0
  br i1 %55, label %58, label %56

56:                                               ; preds = %51
  %57 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %7, align 8, !tbaa !22
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %57) #16
  br label %58

58:                                               ; preds = %51, %56
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %5) #16
  %59 = insertvalue { i8*, i32 } undef, i8* %52, 0
  %60 = insertvalue { i8*, i32 } %59, i32 %53, 1
  resume { i8*, i32 } %60
}

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state10__sub_waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::__assoc_sub_state"* %0, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %1) local_unnamed_addr #1 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %4 = load i32, i32* %3, align 8, !tbaa !14
  %5 = and i32 %4, 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %29

7:                                                ; preds = %2
  %8 = and i32 %4, 8
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  br label %25

12:                                               ; preds = %7
  %13 = and i32 %4, -9
  store i32 %13, i32* %3, align 8, !tbaa !14
  %14 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 1
  %15 = load i8, i8* %14, align 8, !tbaa !25, !range !26
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %17, label %18

17:                                               ; preds = %12
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 1, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.7, i64 0, i64 0)) #18
  unreachable

18:                                               ; preds = %12
  %19 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %1, i64 0, i32 0
  %20 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %19, align 8, !tbaa !22
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %20) #16
  store i8 0, i8* %14, align 8, !tbaa !25
  %21 = bitcast %"class.std::__1::__assoc_sub_state"* %0 to void (%"class.std::__1::__assoc_sub_state"*)***
  %22 = load void (%"class.std::__1::__assoc_sub_state"*)**, void (%"class.std::__1::__assoc_sub_state"*)*** %21, align 8, !tbaa !7
  %23 = getelementptr inbounds void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %22, i64 3
  %24 = load void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %23, align 8
  tail call void %24(%"class.std::__1::__assoc_sub_state"* nonnull %0)
  br label %29

25:                                               ; preds = %10, %25
  tail call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %11, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %1) #16
  %26 = load i32, i32* %3, align 8, !tbaa !14
  %27 = and i32 %26, 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %25, label %29

29:                                               ; preds = %25, %2, %18
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"*) unnamed_addr #4

; Function Attrs: noreturn
declare void @_ZSt17rethrow_exceptionSt13exception_ptr(%"class.std::exception_ptr"*) local_unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZNSt13exception_ptrC1ERKS_(%"class.std::exception_ptr"*, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8)) unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__117__assoc_sub_state4waitEv(%"class.std::__1::__assoc_sub_state"* %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::unique_lock", align 8
  %3 = bitcast %"class.std::__1::unique_lock"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %3) #16
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 2
  %5 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 0
  store %"class.std::__1::mutex"* %4, %"class.std::__1::mutex"** %5, align 8, !tbaa !22
  %6 = getelementptr inbounds %"class.std::__1::unique_lock", %"class.std::__1::unique_lock"* %2, i64 0, i32 1
  store i8 1, i8* %6, align 8, !tbaa !25
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %7 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 4
  %8 = load i32, i32* %7, align 8, !tbaa !14
  %9 = and i32 %8, 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %26

11:                                               ; preds = %1
  %12 = and i32 %8, 8
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  br label %22

16:                                               ; preds = %11
  %17 = and i32 %8, -9
  store i32 %17, i32* %7, align 8, !tbaa !14
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  store i8 0, i8* %6, align 8, !tbaa !25
  %18 = bitcast %"class.std::__1::__assoc_sub_state"* %0 to void (%"class.std::__1::__assoc_sub_state"*)***
  %19 = load void (%"class.std::__1::__assoc_sub_state"*)**, void (%"class.std::__1::__assoc_sub_state"*)*** %18, align 8, !tbaa !7
  %20 = getelementptr inbounds void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %19, i64 3
  %21 = load void (%"class.std::__1::__assoc_sub_state"*)*, void (%"class.std::__1::__assoc_sub_state"*)** %20, align 8
  invoke void %21(%"class.std::__1::__assoc_sub_state"* nonnull %0)
          to label %26 unwind label %32

22:                                               ; preds = %22, %14
  call void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"* nonnull %15, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9) %2) #16
  %23 = load i32, i32* %7, align 8, !tbaa !14
  %24 = and i32 %23, 4
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %22, label %26

26:                                               ; preds = %22, %1, %16
  %27 = load i8, i8* %6, align 8, !tbaa !25, !range !26
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %31, label %29

29:                                               ; preds = %26
  %30 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !22
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %30) #16
  br label %31

31:                                               ; preds = %26, %29
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #16
  ret void

32:                                               ; preds = %16
  %33 = landingpad { i8*, i32 }
          cleanup
  %34 = load i8, i8* %6, align 8, !tbaa !25, !range !26
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %32
  %37 = load %"class.std::__1::mutex"*, %"class.std::__1::mutex"** %5, align 8, !tbaa !22
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* %37) #16
  br label %38

38:                                               ; preds = %32, %36
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %3) #16
  resume { i8*, i32 } %33
}

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variable4waitERNS_11unique_lockINS_5mutexEEE(%"class.std::__1::condition_variable"*, %"class.std::__1::unique_lock"* nonnull align 8 dereferenceable(9)) local_unnamed_addr #4

; Function Attrs: noreturn uwtable
define void @_ZNSt3__117__assoc_sub_state9__executeEv(%"class.std::__1::__assoc_sub_state"* nocapture readnone %0) unnamed_addr #10 align 2 {
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable
}

; Function Attrs: uwtable
define void @_ZNSt3__16futureIvEC2EPNS_17__assoc_sub_stateE(%"class.std::__1::future"* nocapture %0, %"class.std::__1::__assoc_sub_state"* %1) unnamed_addr #1 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::__1::future", %"class.std::__1::future"* %0, i64 0, i32 0
  store %"class.std::__1::__assoc_sub_state"* %1, %"class.std::__1::__assoc_sub_state"** %3, align 8, !tbaa !27
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %1, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %4)
  %5 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %1, i64 0, i32 4
  %6 = load i32, i32* %5, align 8, !tbaa !14
  %7 = and i32 %6, 2
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %13, label %9

9:                                                ; preds = %2
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 1) #18
          to label %10 unwind label %11

10:                                               ; preds = %9
  unreachable

11:                                               ; preds = %9
  %12 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  resume { i8*, i32 } %12

13:                                               ; preds = %2
  %14 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %1, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"* %14) #16
  %15 = load i32, i32* %5, align 8, !tbaa !14
  %16 = or i32 %15, 2
  store i32 %16, i32* %5, align 8, !tbaa !14
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %4) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__16futureIvED2Ev(%"class.std::__1::future"* nocapture readonly %0) unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::future", %"class.std::__1::future"* %0, i64 0, i32 0
  %3 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %2, align 8, !tbaa !27
  %4 = icmp eq %"class.std::__1::__assoc_sub_state"* %3, null
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %3, i64 0, i32 0
  %7 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %6) #16
  br label %8

8:                                                ; preds = %1, %5
  ret void
}

; Function Attrs: nounwind
declare zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"*) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__16futureIvE3getEv(%"class.std::__1::future"* nocapture %0) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::future", %"class.std::__1::future"* %0, i64 0, i32 0
  %3 = bitcast %"class.std::__1::future"* %0 to %"class.std::__1::__shared_count"**
  %4 = load %"class.std::__1::__shared_count"*, %"class.std::__1::__shared_count"** %3, align 8, !tbaa !27
  %5 = bitcast %"class.std::__1::__shared_count"* %4 to %"class.std::__1::__assoc_sub_state"*
  store %"class.std::__1::__assoc_sub_state"* null, %"class.std::__1::__assoc_sub_state"** %2, align 8, !tbaa !27
  invoke void @_ZNSt3__117__assoc_sub_state4copyEv(%"class.std::__1::__assoc_sub_state"* %5)
          to label %6 unwind label %11

6:                                                ; preds = %1
  %7 = icmp eq %"class.std::__1::__shared_count"* %4, null
  br i1 %7, label %10, label %8

8:                                                ; preds = %6
  %9 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* nonnull %4) #16
  br label %10

10:                                               ; preds = %6, %8
  ret void

11:                                               ; preds = %1
  %12 = landingpad { i8*, i32 }
          cleanup
  %13 = icmp eq %"class.std::__1::__shared_count"* %4, null
  br i1 %13, label %16, label %14

14:                                               ; preds = %11
  %15 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* nonnull %4) #16
  br label %16

16:                                               ; preds = %11, %14
  resume { i8*, i32 } %12
}

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvEC2Ev(%"class.std::__1::promise"* nocapture %0) unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call noalias nonnull dereferenceable(120) i8* @_Znwm(i64 120) #15
  %3 = bitcast i8* %2 to i32 (...)***
  %4 = getelementptr inbounds i8, i8* %2, i64 8
  %5 = bitcast i8* %4 to i64*
  store i64 0, i64* %5, align 8, !tbaa !29
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVNSt3__117__assoc_sub_stateE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !7
  %6 = getelementptr inbounds i8, i8* %2, i64 16
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(100) %6, i8 0, i64 100, i1 false) #16
  %7 = bitcast %"class.std::__1::promise"* %0 to i8**
  store i8* %2, i8** %7, align 8, !tbaa !32
  ret void
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #11

; Function Attrs: nounwind uwtable
define void @_ZNSt3__17promiseIvED2Ev(%"class.std::__1::promise"* nocapture readonly %0) unnamed_addr #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::error_code", align 8
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::exception_ptr", align 8
  %5 = alloca %"class.std::exception_ptr", align 8
  %6 = alloca %"class.std::__1::future_error", align 8
  %7 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %0, i64 0, i32 0
  %8 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %7, align 8, !tbaa !32
  %9 = icmp eq %"class.std::__1::__assoc_sub_state"* %8, null
  br i1 %9, label %84, label %10

10:                                               ; preds = %1
  %11 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %8, i64 0, i32 4
  %12 = load i32, i32* %11, align 8, !tbaa !14
  %13 = and i32 %12, 1
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %80

15:                                               ; preds = %10
  %16 = bitcast %"class.std::exception_ptr"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #16
  %17 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %4, i64 0, i32 0
  store i8* null, i8** %17, align 8, !tbaa !19
  %18 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %8, i64 0, i32 1, i32 0
  %19 = load i8*, i8** %18, align 8, !tbaa !19
  %20 = icmp eq i8* %19, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %4) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %16) #16
  br i1 %20, label %21, label %80

21:                                               ; preds = %15
  %22 = bitcast %"class.std::__1::promise"* %0 to %"class.std::__1::__shared_count"**
  %23 = load %"class.std::__1::__shared_count"*, %"class.std::__1::__shared_count"** %22, align 8, !tbaa !32
  %24 = getelementptr inbounds %"class.std::__1::__shared_count", %"class.std::__1::__shared_count"* %23, i64 0, i32 1
  %25 = load atomic i64, i64* %24 monotonic, align 8
  %26 = icmp sgt i64 %25, 0
  %27 = bitcast %"class.std::__1::__shared_count"* %23 to %"class.std::__1::__assoc_sub_state"*
  br i1 %26, label %28, label %80

28:                                               ; preds = %21
  %29 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115future_categoryEvE3__f to i8*) acquire, align 8
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %31, label %36, !prof !6

31:                                               ; preds = %28
  %32 = call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %36, label %34

34:                                               ; preds = %31
  call void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0)) #16
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__future_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !7
  %35 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to void (i8*)*), i8* bitcast (%"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f to i8*), i8* nonnull @__dso_handle) #16
  call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115future_categoryEvE3__f) #16
  br label %36

36:                                               ; preds = %28, %31, %34
  %37 = bitcast %"class.std::__1::error_code"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %37)
  %38 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 0
  store i32 4, i32* %38, align 8
  %39 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 1
  store %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* @_ZZNSt3__115future_categoryEvE3__f, i64 0, i32 0, i32 0), %"class.std::__1::error_category"** %39, align 8
  %40 = getelementptr inbounds %"class.std::__1::future_error", %"class.std::__1::future_error"* %6, i64 0, i32 0
  %41 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %41) #16
  invoke void @_ZNKSt3__110error_code7messageEv(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::error_code"* nonnull %2)
          to label %42 unwind label %85

42:                                               ; preds = %36
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* nonnull %40, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %43 unwind label %50

43:                                               ; preds = %42
  %44 = load i8, i8* %41, align 8, !tbaa !3
  %45 = and i8 %44, 1
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %59, label %47

47:                                               ; preds = %43
  %48 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %49 = load i8*, i8** %48, align 8, !tbaa !3
  call void @_ZdlPv(i8* %49) #17
  br label %59

50:                                               ; preds = %42
  %51 = landingpad { i8*, i32 }
          catch i8* null
  %52 = load i8, i8* %41, align 8, !tbaa !3
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %58, label %55

55:                                               ; preds = %50
  %56 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8, !tbaa !3
  call void @_ZdlPv(i8* %57) #17
  br label %58

58:                                               ; preds = %55, %50
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #16
  br label %87

59:                                               ; preds = %47, %43
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %41) #16
  %60 = getelementptr inbounds %"class.std::__1::future_error", %"class.std::__1::future_error"* %6, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112future_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %60, align 8, !tbaa !7
  %61 = getelementptr inbounds %"class.std::__1::future_error", %"class.std::__1::future_error"* %6, i64 0, i32 1
  %62 = bitcast %"class.std::__1::error_code"* %61 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %62, i8* nonnull align 8 dereferenceable(16) %37, i64 16, i1 false), !tbaa.struct !9
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %37)
  %63 = call i8* @__cxa_allocate_exception(i64 32) #16, !noalias !34
  %64 = bitcast i8* %63 to %"class.std::logic_error"*
  call void @_ZNSt11logic_errorC2ERKS_(%"class.std::logic_error"* %64, %"class.std::logic_error"* nonnull align 8 dereferenceable(16) %40) #16, !noalias !34
  %65 = bitcast i8* %63 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112future_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %65, align 8, !tbaa !7, !noalias !34
  %66 = getelementptr inbounds i8, i8* %63, i64 16
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %66, i8* nonnull align 8 dereferenceable(16) %62, i64 16, i1 false) #16, !tbaa.struct !9, !noalias !34
  invoke void @__cxa_throw(i8* %63, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112future_errorE to i8*), i8* bitcast (void (%"class.std::__1::future_error"*)* @_ZNSt3__112future_errorD2Ev to i8*)) #18
          to label %74 unwind label %67

67:                                               ; preds = %59
  %68 = landingpad { i8*, i32 }
          catch i8* null
  %69 = extractvalue { i8*, i32 } %68, 0
  %70 = call i8* @__cxa_begin_catch(i8* %69) #16, !noalias !34
  call void @_ZSt17current_exceptionv(%"class.std::exception_ptr"* nonnull sret align 8 %5) #16
  invoke void @__cxa_end_catch()
          to label %75 unwind label %71

71:                                               ; preds = %67
  %72 = landingpad { i8*, i32 }
          catch i8* null
  %73 = extractvalue { i8*, i32 } %72, 0
  call void @__clang_call_terminate(i8* %73) #19
  unreachable

74:                                               ; preds = %59
  unreachable

75:                                               ; preds = %67
  invoke void @_ZNSt3__117__assoc_sub_state13set_exceptionESt13exception_ptr(%"class.std::__1::__assoc_sub_state"* %27, %"class.std::exception_ptr"* nonnull %5)
          to label %76 unwind label %77

76:                                               ; preds = %75
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %5) #16
  call void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* nonnull %40) #16
  br label %80

77:                                               ; preds = %75
  %78 = landingpad { i8*, i32 }
          catch i8* null
  %79 = extractvalue { i8*, i32 } %78, 0
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %5) #16
  call void @_ZNSt3__112future_errorD2Ev(%"class.std::__1::future_error"* nonnull %6) #16
  call void @__clang_call_terminate(i8* %79) #19
  unreachable

80:                                               ; preds = %15, %10, %76, %21
  %81 = bitcast %"class.std::__1::promise"* %0 to %"class.std::__1::__shared_count"**
  %82 = load %"class.std::__1::__shared_count"*, %"class.std::__1::__shared_count"** %81, align 8, !tbaa !32
  %83 = call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %82) #16
  br label %84

84:                                               ; preds = %1, %80
  ret void

85:                                               ; preds = %36
  %86 = landingpad { i8*, i32 }
          catch i8* null
  br label %87

87:                                               ; preds = %58, %85
  %88 = phi { i8*, i32 } [ %86, %85 ], [ %51, %58 ]
  %89 = extractvalue { i8*, i32 } %88, 0
  call void @__clang_call_terminate(i8* %89) #19
  unreachable
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #12 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #16
  tail call void @_ZSt9terminatev() #19
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvE10get_futureEv(%"class.std::__1::future"* noalias nocapture sret align 8 %0, %"class.std::__1::promise"* nocapture readonly %1) local_unnamed_addr #1 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %1, i64 0, i32 0
  %4 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %3, align 8, !tbaa !32
  %5 = icmp eq %"class.std::__1::__assoc_sub_state"* %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %2
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"class.std::__1::future", %"class.std::__1::future"* %0, i64 0, i32 0
  store %"class.std::__1::__assoc_sub_state"* %4, %"class.std::__1::__assoc_sub_state"** %8, align 8, !tbaa !27
  %9 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %9)
  %10 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 4
  %11 = load i32, i32* %10, align 8, !tbaa !14
  %12 = and i32 %11, 2
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %18, label %14

14:                                               ; preds = %7
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 1) #18
          to label %15 unwind label %16

15:                                               ; preds = %14
  unreachable

16:                                               ; preds = %14
  %17 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %9) #16
  resume { i8*, i32 } %17

18:                                               ; preds = %7
  %19 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"* %19) #16
  %20 = load i32, i32* %10, align 8, !tbaa !14
  %21 = or i32 %20, 2
  store i32 %21, i32* %10, align 8, !tbaa !14
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %9) #16
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvE9set_valueEv(%"class.std::__1::promise"* nocapture readonly %0) local_unnamed_addr #1 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = alloca %"class.std::exception_ptr", align 8
  %3 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %0, i64 0, i32 0
  %4 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %3, align 8, !tbaa !32
  %5 = icmp eq %"class.std::__1::__assoc_sub_state"* %4, null
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 2
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull %8)
  %9 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 4
  %10 = load i32, i32* %9, align 8, !tbaa !14
  %11 = and i32 %10, 1
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %19

13:                                               ; preds = %7
  %14 = bitcast %"class.std::exception_ptr"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #16
  %15 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %2, i64 0, i32 0
  store i8* null, i8** %15, align 8, !tbaa !19
  %16 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 1, i32 0
  %17 = load i8*, i8** %16, align 8, !tbaa !19
  %18 = icmp eq i8* %17, null
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %2) #16
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #16
  br i1 %18, label %23, label %19

19:                                               ; preds = %13, %7
  invoke void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 2) #18
          to label %20 unwind label %21

20:                                               ; preds = %19
  unreachable

21:                                               ; preds = %19
  %22 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %8) #16
  resume { i8*, i32 } %22

23:                                               ; preds = %13
  %24 = load i32, i32* %9, align 8, !tbaa !14
  %25 = or i32 %24, 5
  store i32 %25, i32* %9, align 8, !tbaa !14
  %26 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 3
  call void @_ZNSt3__118condition_variable10notify_allEv(%"class.std::__1::condition_variable"* nonnull %26) #16
  call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull %8) #16
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvE13set_exceptionESt13exception_ptr(%"class.std::__1::promise"* nocapture readonly %0, %"class.std::exception_ptr"* %1) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::exception_ptr", align 8
  %4 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %0, i64 0, i32 0
  %5 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %4, align 8, !tbaa !32
  %6 = icmp eq %"class.std::__1::__assoc_sub_state"* %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable

8:                                                ; preds = %2
  call void @_ZNSt13exception_ptrC1ERKS_(%"class.std::exception_ptr"* nonnull %3, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8) %1) #16
  invoke void @_ZNSt3__117__assoc_sub_state13set_exceptionESt13exception_ptr(%"class.std::__1::__assoc_sub_state"* nonnull %5, %"class.std::exception_ptr"* nonnull %3)
          to label %9 unwind label %10

9:                                                ; preds = %8
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  ret void

10:                                               ; preds = %8
  %11 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  resume { i8*, i32 } %11
}

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvE24set_value_at_thread_exitEv(%"class.std::__1::promise"* nocapture readonly %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %0, i64 0, i32 0
  %3 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %2, align 8, !tbaa !32
  %4 = icmp eq %"class.std::__1::__assoc_sub_state"* %3, null
  br i1 %4, label %5, label %6

5:                                                ; preds = %1
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable

6:                                                ; preds = %1
  tail call void @_ZNSt3__117__assoc_sub_state24set_value_at_thread_exitEv(%"class.std::__1::__assoc_sub_state"* nonnull %3)
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__17promiseIvE28set_exception_at_thread_exitESt13exception_ptr(%"class.std::__1::promise"* nocapture readonly %0, %"class.std::exception_ptr"* %1) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::exception_ptr", align 8
  %4 = getelementptr inbounds %"class.std::__1::promise", %"class.std::__1::promise"* %0, i64 0, i32 0
  %5 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %4, align 8, !tbaa !32
  %6 = icmp eq %"class.std::__1::__assoc_sub_state"* %5, null
  br i1 %6, label %7, label %8

7:                                                ; preds = %2
  tail call void @_ZNSt3__120__throw_future_errorENS_11future_errcE(i32 3) #18
  unreachable

8:                                                ; preds = %2
  call void @_ZNSt13exception_ptrC1ERKS_(%"class.std::exception_ptr"* nonnull %3, %"class.std::exception_ptr"* nonnull align 8 dereferenceable(8) %1) #16
  invoke void @_ZNSt3__117__assoc_sub_state28set_exception_at_thread_exitESt13exception_ptr(%"class.std::__1::__assoc_sub_state"* nonnull %5, %"class.std::exception_ptr"* nonnull %3)
          to label %9 unwind label %10

9:                                                ; preds = %8
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  ret void

10:                                               ; preds = %8
  %11 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %3) #16
  resume { i8*, i32 } %11
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__113shared_futureIvED2Ev(%"class.std::__1::shared_future"* nocapture readonly %0) unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::shared_future", %"class.std::__1::shared_future"* %0, i64 0, i32 0
  %3 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %2, align 8, !tbaa !37
  %4 = icmp eq %"class.std::__1::__assoc_sub_state"* %3, null
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  %6 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %3, i64 0, i32 0
  %7 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %6) #16
  br label %8

8:                                                ; preds = %1, %5
  ret void
}

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::shared_future"* @_ZNSt3__113shared_futureIvEaSERKS1_(%"class.std::__1::shared_future"* returned %0, %"class.std::__1::shared_future"* nocapture nonnull readonly align 8 dereferenceable(8) %1) local_unnamed_addr #2 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::shared_future", %"class.std::__1::shared_future"* %1, i64 0, i32 0
  %4 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %3, align 8, !tbaa !37
  %5 = icmp eq %"class.std::__1::__assoc_sub_state"* %4, null
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %4, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"* %7) #16
  br label %8

8:                                                ; preds = %2, %6
  %9 = getelementptr inbounds %"class.std::__1::shared_future", %"class.std::__1::shared_future"* %0, i64 0, i32 0
  %10 = load %"class.std::__1::__assoc_sub_state"*, %"class.std::__1::__assoc_sub_state"** %9, align 8, !tbaa !37
  %11 = icmp eq %"class.std::__1::__assoc_sub_state"* %10, null
  br i1 %11, label %15, label %12

12:                                               ; preds = %8
  %13 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %10, i64 0, i32 0
  %14 = tail call zeroext i1 @_ZNSt3__114__shared_count16__release_sharedEv(%"class.std::__1::__shared_count"* %13) #16
  br label %15

15:                                               ; preds = %8, %12
  %16 = bitcast %"class.std::__1::shared_future"* %1 to i64*
  %17 = load i64, i64* %16, align 8, !tbaa !37
  %18 = bitcast %"class.std::__1::shared_future"* %0 to i64*
  store i64 %17, i64* %18, align 8, !tbaa !37
  ret %"class.std::__1::shared_future"* %0
}

; Function Attrs: nounwind
declare void @_ZNSt3__114__shared_count12__add_sharedEv(%"class.std::__1::__shared_count"*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i8* @_ZNKSt11logic_error4whatEv(%"class.std::logic_error"*) unnamed_addr #4

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__117__assoc_sub_stateD2Ev(%"class.std::__1::__assoc_sub_state"* %0) unnamed_addr #13 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVNSt3__117__assoc_sub_stateE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !7
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %3) #16
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1
  tail call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %4) #16
  %5 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_countD2Ev(%"class.std::__1::__shared_count"* %5) #16
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__117__assoc_sub_stateD0Ev(%"class.std::__1::__assoc_sub_state"* %0) unnamed_addr #13 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [6 x i8*] }, { [6 x i8*] }* @_ZTVNSt3__117__assoc_sub_stateE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !7
  %3 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 3
  tail call void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"* nonnull %3) #16
  %4 = getelementptr inbounds %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 1
  tail call void @_ZNSt13exception_ptrD1Ev(%"class.std::exception_ptr"* nonnull %4) #16
  %5 = getelementptr %"class.std::__1::__assoc_sub_state", %"class.std::__1::__assoc_sub_state"* %0, i64 0, i32 0
  tail call void @_ZNSt3__114__shared_countD2Ev(%"class.std::__1::__shared_count"* %5) #16
  %6 = bitcast %"class.std::__1::__assoc_sub_state"* %0 to i8*
  tail call void @_ZdlPv(i8* %6) #17
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__123__future_error_categoryD0Ev(%"class.std::__1::__future_error_category"* %0) unnamed_addr #13 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__future_error_category", %"class.std::__1::__future_error_category"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__114error_categoryD2Ev(%"class.std::__1::error_category"* %2) #16
  %3 = bitcast %"class.std::__1::__future_error_category"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #17
  ret void
}

; Function Attrs: nounwind
declare { i32, %"class.std::__1::error_category"* } @_ZNKSt3__114error_category23default_error_conditionEi(%"class.std::__1::error_category"*, i32) unnamed_addr #4

; Function Attrs: nounwind
declare zeroext i1 @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE(%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"* nonnull align 8 dereferenceable(16)) unnamed_addr #4

; Function Attrs: nounwind
declare zeroext i1 @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi(%"class.std::__1::error_category"*, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16), i32) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"*) unnamed_addr #4

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

declare void @__cxa_free_exception(i8*) local_unnamed_addr

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"*) local_unnamed_addr #6

; Function Attrs: nounwind
declare void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"*) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__118condition_variableD1Ev(%"class.std::__1::condition_variable"*) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__114__shared_countD2Ev(%"class.std::__1::__shared_count"*) unnamed_addr #4

; Function Attrs: nounwind
declare i8* @pthread_getspecific(i32) local_unnamed_addr #4

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #9

; Function Attrs: nounwind
declare void @_ZSt17current_exceptionv(%"class.std::exception_ptr"* sret align 8) local_unnamed_addr #4

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt11logic_errorC2ERKS_(%"class.std::logic_error"*, %"class.std::logic_error"* nonnull align 8 dereferenceable(16)) unnamed_addr #4

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #14

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noinline noreturn nounwind }
attributes #13 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { argmemonly nounwind willreturn writeonly }
attributes #15 = { builtin allocsize(0) }
attributes #16 = { nounwind }
attributes #17 = { builtin nounwind }
attributes #18 = { noreturn }
attributes #19 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!"branch_weights", i32 1, i32 1048575}
!7 = !{!8, !8, i64 0}
!8 = !{!"vtable pointer", !5, i64 0}
!9 = !{i64 0, i64 4, !10, i64 8, i64 8, !12}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !4, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"any pointer", !4, i64 0}
!14 = !{!15, !11, i64 112}
!15 = !{!"_ZTSNSt3__117__assoc_sub_stateE", !16, i64 16, !17, i64 24, !18, i64 64, !11, i64 112}
!16 = !{!"_ZTSSt13exception_ptr", !13, i64 0}
!17 = !{!"_ZTSNSt3__15mutexE", !4, i64 0}
!18 = !{!"_ZTSNSt3__118condition_variableE", !4, i64 0}
!19 = !{!16, !13, i64 0}
!20 = !{!21, !11, i64 0}
!21 = !{!"_ZTSNSt3__121__thread_specific_ptrINS_15__thread_structEEE", !11, i64 0}
!22 = !{!23, !13, i64 0}
!23 = !{!"_ZTSNSt3__111unique_lockINS_5mutexEEE", !13, i64 0, !24, i64 8}
!24 = !{!"bool", !4, i64 0}
!25 = !{!23, !24, i64 8}
!26 = !{i8 0, i8 2}
!27 = !{!28, !13, i64 0}
!28 = !{!"_ZTSNSt3__16futureIvEE", !13, i64 0}
!29 = !{!30, !31, i64 8}
!30 = !{!"_ZTSNSt3__114__shared_countE", !31, i64 8}
!31 = !{!"long", !4, i64 0}
!32 = !{!33, !13, i64 0}
!33 = !{!"_ZTSNSt3__17promiseIvEE", !13, i64 0}
!34 = !{!35}
!35 = distinct !{!35, !36, !"_ZSt18make_exception_ptrINSt3__112future_errorEESt13exception_ptrT_: argument 0"}
!36 = distinct !{!36, !"_ZSt18make_exception_ptrINSt3__112future_errorEESt13exception_ptrT_"}
!37 = !{!38, !13, i64 0}
!38 = !{!"_ZTSNSt3__113shared_futureIvEE", !13, i64 0}

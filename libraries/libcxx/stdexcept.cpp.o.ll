; ModuleID = 'll/.stdexcept.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/stdexcept.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }

@_ZTVSt11logic_error = external unnamed_addr constant { [5 x i8*] }, align 8
@_ZTVSt13runtime_error = external unnamed_addr constant { [5 x i8*] }, align 8

@_ZNSt11logic_errorC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE = unnamed_addr alias void (%"class.std::logic_error"*, %"class.std::__1::basic_string"*), void (%"class.std::logic_error"*, %"class.std::__1::basic_string"*)* @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
@_ZNSt11logic_errorC1EPKc = unnamed_addr alias void (%"class.std::logic_error"*, i8*), void (%"class.std::logic_error"*, i8*)* @_ZNSt11logic_errorC2EPKc
@_ZNSt11logic_errorC1ERKS_ = unnamed_addr alias void (%"class.std::logic_error"*, %"class.std::logic_error"*), void (%"class.std::logic_error"*, %"class.std::logic_error"*)* @_ZNSt11logic_errorC2ERKS_
@_ZNSt13runtime_errorC1ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE = unnamed_addr alias void (%"class.std::runtime_error"*, %"class.std::__1::basic_string"*), void (%"class.std::runtime_error"*, %"class.std::__1::basic_string"*)* @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE
@_ZNSt13runtime_errorC1EPKc = unnamed_addr alias void (%"class.std::runtime_error"*, i8*), void (%"class.std::runtime_error"*, i8*)* @_ZNSt13runtime_errorC2EPKc
@_ZNSt13runtime_errorC1ERKS_ = unnamed_addr alias void (%"class.std::runtime_error"*, %"class.std::runtime_error"*), void (%"class.std::runtime_error"*, %"class.std::runtime_error"*)* @_ZNSt13runtime_errorC2ERKS_

; Function Attrs: uwtable
define void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %0, %"class.std::__1::basic_string"* nocapture nonnull readonly align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !6
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = select i1 %7, i8* %11, i8* %9
  %13 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %12) #8
  %14 = add i64 %13, 25
  %15 = invoke noalias nonnull i8* @_Znwm(i64 %14) #9
          to label %16 unwind label %25

16:                                               ; preds = %2
  %17 = bitcast i8* %15 to i64*
  store i64 %13, i64* %17, align 8, !tbaa !8
  %18 = getelementptr inbounds i8, i8* %15, i64 8
  %19 = bitcast i8* %18 to i64*
  store i64 %13, i64* %19, align 8, !tbaa !12
  %20 = getelementptr inbounds i8, i8* %15, i64 16
  %21 = bitcast i8* %20 to i32*
  store i32 0, i32* %21, align 8, !tbaa !13
  %22 = getelementptr inbounds i8, i8* %15, i64 24
  %23 = add i64 %13, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %22, i8* align 1 %12, i64 %23, i1 false)
  %24 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1, i32 0
  store i8* %22, i8** %24, align 8, !tbaa !14
  ret void

25:                                               ; preds = %2
  %26 = landingpad { i8*, i32 }
          cleanup
  %27 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %27) #10
  resume { i8*, i32 } %26
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @_ZNSt9exceptionD2Ev(%"class.std::exception"*) unnamed_addr #1

; Function Attrs: uwtable
define void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %0, i8* nocapture readonly %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #8
  %5 = add i64 %4, 25
  %6 = invoke noalias nonnull i8* @_Znwm(i64 %5) #9
          to label %7 unwind label %16

7:                                                ; preds = %2
  %8 = bitcast i8* %6 to i64*
  store i64 %4, i64* %8, align 8, !tbaa !8
  %9 = getelementptr inbounds i8, i8* %6, i64 8
  %10 = bitcast i8* %9 to i64*
  store i64 %4, i64* %10, align 8, !tbaa !12
  %11 = getelementptr inbounds i8, i8* %6, i64 16
  %12 = bitcast i8* %11 to i32*
  store i32 0, i32* %12, align 8, !tbaa !13
  %13 = getelementptr inbounds i8, i8* %6, i64 24
  %14 = add i64 %4, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %13, i8* align 1 %1, i64 %14, i1 false)
  %15 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1, i32 0
  store i8* %13, i8** %15, align 8, !tbaa !14
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %18) #10
  resume { i8*, i32 } %17
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt11logic_errorC2ERKS_(%"class.std::logic_error"* nocapture %0, %"class.std::logic_error"* nocapture nonnull readonly align 8 dereferenceable(16) %1) unnamed_addr #2 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt11logic_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %1, i64 0, i32 1
  %6 = bitcast %"class.std::__1::__libcpp_refstring"* %5 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !14
  %8 = bitcast %"class.std::__1::__libcpp_refstring"* %4 to i64*
  store i64 %7, i64* %8, align 8, !tbaa !14
  %9 = inttoptr i64 %7 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 -8
  %11 = bitcast i8* %10 to i32*
  %12 = atomicrmw add i32* %11, i32 1 seq_cst
  ret void
}

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(16) %"class.std::logic_error"* @_ZNSt11logic_erroraSERKS_(%"class.std::logic_error"* returned %0, %"class.std::logic_error"* nocapture nonnull readonly align 8 dereferenceable(16) %1) local_unnamed_addr #3 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %1, i64 0, i32 1
  %4 = getelementptr inbounds %"class.std::logic_error", %"class.std::logic_error"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_refstring", %"class.std::__1::__libcpp_refstring"* %4, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8, !tbaa !14
  %7 = bitcast %"class.std::__1::__libcpp_refstring"* %3 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !14
  %9 = bitcast %"class.std::__1::__libcpp_refstring"* %4 to i64*
  store i64 %8, i64* %9, align 8, !tbaa !14
  %10 = inttoptr i64 %8 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 -8
  %12 = bitcast i8* %11 to i32*
  %13 = atomicrmw add i32* %12, i32 1 seq_cst
  %14 = getelementptr inbounds i8, i8* %6, i64 -8
  %15 = bitcast i8* %14 to i32*
  %16 = atomicrmw add i32* %15, i32 -1 seq_cst
  %17 = add i32 %16, -1
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %2
  %20 = getelementptr inbounds i8, i8* %6, i64 -24
  tail call void @_ZdlPv(i8* nonnull %20) #10
  br label %21

21:                                               ; preds = %2, %19
  ret %"class.std::logic_error"* %0
}

; Function Attrs: uwtable
define void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %0, %"class.std::__1::basic_string"* nocapture nonnull readonly align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !6
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = select i1 %7, i8* %11, i8* %9
  %13 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %12) #8
  %14 = add i64 %13, 25
  %15 = invoke noalias nonnull i8* @_Znwm(i64 %14) #9
          to label %16 unwind label %25

16:                                               ; preds = %2
  %17 = bitcast i8* %15 to i64*
  store i64 %13, i64* %17, align 8, !tbaa !8
  %18 = getelementptr inbounds i8, i8* %15, i64 8
  %19 = bitcast i8* %18 to i64*
  store i64 %13, i64* %19, align 8, !tbaa !12
  %20 = getelementptr inbounds i8, i8* %15, i64 16
  %21 = bitcast i8* %20 to i32*
  store i32 0, i32* %21, align 8, !tbaa !13
  %22 = getelementptr inbounds i8, i8* %15, i64 24
  %23 = add i64 %13, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %22, i8* align 1 %12, i64 %23, i1 false)
  %24 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1, i32 0
  store i8* %22, i8** %24, align 8, !tbaa !14
  ret void

25:                                               ; preds = %2
  %26 = landingpad { i8*, i32 }
          cleanup
  %27 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %27) #10
  resume { i8*, i32 } %26
}

; Function Attrs: uwtable
define void @_ZNSt13runtime_errorC2EPKc(%"class.std::runtime_error"* %0, i8* nocapture readonly %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #8
  %5 = add i64 %4, 25
  %6 = invoke noalias nonnull i8* @_Znwm(i64 %5) #9
          to label %7 unwind label %16

7:                                                ; preds = %2
  %8 = bitcast i8* %6 to i64*
  store i64 %4, i64* %8, align 8, !tbaa !8
  %9 = getelementptr inbounds i8, i8* %6, i64 8
  %10 = bitcast i8* %9 to i64*
  store i64 %4, i64* %10, align 8, !tbaa !12
  %11 = getelementptr inbounds i8, i8* %6, i64 16
  %12 = bitcast i8* %11 to i32*
  store i32 0, i32* %12, align 8, !tbaa !13
  %13 = getelementptr inbounds i8, i8* %6, i64 24
  %14 = add i64 %4, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %13, i8* align 1 %1, i64 %14, i1 false)
  %15 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1, i32 0
  store i8* %13, i8** %15, align 8, !tbaa !14
  ret void

16:                                               ; preds = %2
  %17 = landingpad { i8*, i32 }
          cleanup
  %18 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %18) #10
  resume { i8*, i32 } %17
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt13runtime_errorC2ERKS_(%"class.std::runtime_error"* nocapture %0, %"class.std::runtime_error"* nocapture nonnull readonly align 8 dereferenceable(16) %1) unnamed_addr #2 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt13runtime_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %3, align 8, !tbaa !3
  %4 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %1, i64 0, i32 1
  %6 = bitcast %"class.std::__1::__libcpp_refstring"* %5 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !14
  %8 = bitcast %"class.std::__1::__libcpp_refstring"* %4 to i64*
  store i64 %7, i64* %8, align 8, !tbaa !14
  %9 = inttoptr i64 %7 to i8*
  %10 = getelementptr inbounds i8, i8* %9, i64 -8
  %11 = bitcast i8* %10 to i32*
  %12 = atomicrmw add i32* %11, i32 1 seq_cst
  ret void
}

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(16) %"class.std::runtime_error"* @_ZNSt13runtime_erroraSERKS_(%"class.std::runtime_error"* returned %0, %"class.std::runtime_error"* nocapture nonnull readonly align 8 dereferenceable(16) %1) local_unnamed_addr #3 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %1, i64 0, i32 1
  %4 = getelementptr inbounds %"class.std::runtime_error", %"class.std::runtime_error"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_refstring", %"class.std::__1::__libcpp_refstring"* %4, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8, !tbaa !14
  %7 = bitcast %"class.std::__1::__libcpp_refstring"* %3 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !14
  %9 = bitcast %"class.std::__1::__libcpp_refstring"* %4 to i64*
  store i64 %8, i64* %9, align 8, !tbaa !14
  %10 = inttoptr i64 %8 to i8*
  %11 = getelementptr inbounds i8, i8* %10, i64 -8
  %12 = bitcast i8* %11 to i32*
  %13 = atomicrmw add i32* %12, i32 1 seq_cst
  %14 = getelementptr inbounds i8, i8* %6, i64 -8
  %15 = bitcast i8* %14 to i32*
  %16 = atomicrmw add i32* %15, i32 -1 seq_cst
  %17 = add i32 %16, -1
  %18 = icmp slt i32 %17, 0
  br i1 %18, label %19, label %21

19:                                               ; preds = %2
  %20 = getelementptr inbounds i8, i8* %6, i64 -24
  tail call void @_ZdlPv(i8* nonnull %20) #10
  br label %21

21:                                               ; preds = %2, %19
  ret %"class.std::runtime_error"* %0
}

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #4

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #7

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind readonly }
attributes #9 = { allocsize(0) }
attributes #10 = { nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !5, i64 0}
!8 = !{!9, !10, i64 0}
!9 = !{!"_ZTSNSt3__115__refstring_imp12_GLOBAL__N_19_Rep_baseE", !10, i64 0, !10, i64 8, !11, i64 16}
!10 = !{!"long", !7, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = !{!9, !10, i64 8}
!13 = !{!9, !11, i64 16}
!14 = !{!15, !16, i64 0}
!15 = !{!"_ZTSNSt3__118__libcpp_refstringE", !16, i64 0}
!16 = !{!"any pointer", !7, i64 0}

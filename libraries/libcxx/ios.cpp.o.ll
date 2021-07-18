; ModuleID = 'll/.ios.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/ios.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__iostream_category" = type { %"class.std::__1::__do_message" }
%"class.std::__1::__do_message" = type { %"class.std::__1::error_category" }
%"class.std::__1::error_category" = type { i32 (...)** }
%"class.std::__1::ios_base::failure" = type { %"class.std::__1::system_error" }
%"class.std::__1::system_error" = type { %"class.std::runtime_error", %"class.std::__1::error_code" }
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::__1::error_code" = type { i32, %"class.std::__1::error_category"* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"class.std::__1::error_condition" = type { i32, %"class.std::__1::error_category"* }

$__clang_call_terminate = comdat any

$_ZNSt3__115__throw_failureEPKc = comdat any

$_ZNSt3__119__iostream_categoryD0Ev = comdat any

@.str = private unnamed_addr constant [9 x i8] c"iostream\00", align 1
@.str.1 = private unnamed_addr constant [36 x i8] c"unspecified iostream_category error\00", align 1
@_ZZNSt3__117iostream_categoryEvE1s = internal global %"class.std::__1::__iostream_category" zeroinitializer, align 8
@_ZGVZNSt3__117iostream_categoryEvE1s = internal global i64 0, align 8
@__dso_handle = external hidden global i8
@_ZTVNSt3__18ios_base7failureE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__18ios_base7failureE to i8*), i8* bitcast (void (%"class.std::__1::ios_base::failure"*)* @_ZNSt3__18ios_base7failureD2Ev to i8*), i8* bitcast (void (%"class.std::__1::ios_base::failure"*)* @_ZNSt3__18ios_base7failureD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZNSt3__18ios_base9boolalphaE = local_unnamed_addr constant i32 1, align 4
@_ZNSt3__18ios_base3decE = local_unnamed_addr constant i32 2, align 4
@_ZNSt3__18ios_base5fixedE = local_unnamed_addr constant i32 4, align 4
@_ZNSt3__18ios_base3hexE = local_unnamed_addr constant i32 8, align 4
@_ZNSt3__18ios_base8internalE = local_unnamed_addr constant i32 16, align 4
@_ZNSt3__18ios_base4leftE = local_unnamed_addr constant i32 32, align 4
@_ZNSt3__18ios_base3octE = local_unnamed_addr constant i32 64, align 4
@_ZNSt3__18ios_base5rightE = local_unnamed_addr constant i32 128, align 4
@_ZNSt3__18ios_base10scientificE = local_unnamed_addr constant i32 256, align 4
@_ZNSt3__18ios_base8showbaseE = local_unnamed_addr constant i32 512, align 4
@_ZNSt3__18ios_base9showpointE = local_unnamed_addr constant i32 1024, align 4
@_ZNSt3__18ios_base7showposE = local_unnamed_addr constant i32 2048, align 4
@_ZNSt3__18ios_base6skipwsE = local_unnamed_addr constant i32 4096, align 4
@_ZNSt3__18ios_base7unitbufE = local_unnamed_addr constant i32 8192, align 4
@_ZNSt3__18ios_base9uppercaseE = local_unnamed_addr constant i32 16384, align 4
@_ZNSt3__18ios_base11adjustfieldE = local_unnamed_addr constant i32 176, align 4
@_ZNSt3__18ios_base9basefieldE = local_unnamed_addr constant i32 74, align 4
@_ZNSt3__18ios_base10floatfieldE = local_unnamed_addr constant i32 260, align 4
@_ZNSt3__18ios_base6badbitE = local_unnamed_addr constant i32 1, align 4
@_ZNSt3__18ios_base6eofbitE = local_unnamed_addr constant i32 2, align 4
@_ZNSt3__18ios_base7failbitE = local_unnamed_addr constant i32 4, align 4
@_ZNSt3__18ios_base7goodbitE = local_unnamed_addr constant i32 0, align 4
@_ZNSt3__18ios_base3appE = local_unnamed_addr constant i32 1, align 4
@_ZNSt3__18ios_base3ateE = local_unnamed_addr constant i32 2, align 4
@_ZNSt3__18ios_base6binaryE = local_unnamed_addr constant i32 4, align 4
@_ZNSt3__18ios_base2inE = local_unnamed_addr constant i32 8, align 4
@_ZNSt3__18ios_base3outE = local_unnamed_addr constant i32 16, align 4
@_ZNSt3__18ios_base5truncE = local_unnamed_addr constant i32 32, align 4
@_ZNSt3__18ios_base9__xindex_E = global { { i32 } } zeroinitializer, align 4
@_ZZNSt3__18ios_base5iwordEiE5error = internal global i64 0, align 8
@_ZZNSt3__18ios_base5pwordEiE5error = internal global i8* null, align 8
@_ZTVNSt3__18ios_baseE = unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTINSt3__18ios_baseE to i8*), i8* bitcast (void (%"class.std::__1::ios_base"*)* @_ZNSt3__18ios_baseD2Ev to i8*), i8* bitcast (void (%"class.std::__1::ios_base"*)* @_ZNSt3__18ios_baseD0Ev to i8*)] }, align 8
@.str.2 = private unnamed_addr constant [16 x i8] c"ios_base::clear\00", align 1
@_ZZNSt3__18ios_base15sync_with_stdioEbE14previous_state = internal unnamed_addr global i8 1, align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSNSt3__18ios_baseE = constant [18 x i8] c"NSt3__18ios_baseE\00", align 1
@_ZTINSt3__18ios_baseE = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @_ZTSNSt3__18ios_baseE, i32 0, i32 0) }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__18ios_base7failureE = constant [26 x i8] c"NSt3__18ios_base7failureE\00", align 1
@_ZTINSt3__112system_errorE = external constant i8*
@_ZTINSt3__18ios_base7failureE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @_ZTSNSt3__18ios_base7failureE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__112system_errorE to i8*) }, align 8
@_ZTVNSt3__119__iostream_categoryE = hidden unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__119__iostream_categoryE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__iostream_category"*)* @_ZNSt3__119__iostream_categoryD0Ev to i8*), i8* bitcast (i8* (%"class.std::__1::__iostream_category"*)* @_ZNKSt3__119__iostream_category4nameEv to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)* @_ZNKSt3__114error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.std::__1::__iostream_category"*, i32)* @_ZNKSt3__119__iostream_category7messageEi to i8*)] }, align 8
@_ZTSNSt3__119__iostream_categoryE = hidden constant [30 x i8] c"NSt3__119__iostream_categoryE\00", align 1
@_ZTINSt3__112__do_messageE = external hidden constant i8*
@_ZTINSt3__119__iostream_categoryE = hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @_ZTSNSt3__119__iostream_categoryE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__112__do_messageE to i8*) }, align 8

@_ZNSt3__18ios_base7failureC1ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeE = unnamed_addr alias void (%"class.std::__1::ios_base::failure"*, %"class.std::__1::basic_string"*, %"class.std::__1::error_code"*), void (%"class.std::__1::ios_base::failure"*, %"class.std::__1::basic_string"*, %"class.std::__1::error_code"*)* @_ZNSt3__18ios_base7failureC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeE
@_ZNSt3__18ios_base7failureC1EPKcRKNS_10error_codeE = unnamed_addr alias void (%"class.std::__1::ios_base::failure"*, i8*, %"class.std::__1::error_code"*), void (%"class.std::__1::ios_base::failure"*, i8*, %"class.std::__1::error_code"*)* @_ZNSt3__18ios_base7failureC2EPKcRKNS_10error_codeE
@_ZNSt3__18ios_base7failureD1Ev = unnamed_addr alias void (%"class.std::__1::ios_base::failure"*), void (%"class.std::__1::ios_base::failure"*)* @_ZNSt3__18ios_base7failureD2Ev
@_ZNSt3__18ios_baseD1Ev = unnamed_addr alias void (%"class.std::__1::ios_base"*), void (%"class.std::__1::ios_base"*)* @_ZNSt3__18ios_baseD2Ev

; Function Attrs: norecurse nounwind readnone uwtable
define hidden i8* @_ZNKSt3__119__iostream_category4nameEv(%"class.std::__1::__iostream_category"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: uwtable
define hidden void @_ZNKSt3__119__iostream_category7messageEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::__iostream_category"* %1, i32 %2) unnamed_addr #1 align 2 {
  %4 = icmp ne i32 %2, 1
  %5 = icmp slt i32 %2, 4096
  %6 = and i1 %4, %5
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = getelementptr %"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* %1, i64 0, i32 0
  tail call void @_ZNKSt3__112__do_message7messageEi(%"class.std::__1::basic_string"* sret align 8 %0, %"class.std::__1::__do_message"* %8, i32 %2)
  br label %14

9:                                                ; preds = %3
  %10 = tail call noalias nonnull dereferenceable(48) i8* @_Znwm(i64 48) #16
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %10, i8** %11, align 8, !tbaa !3
  %12 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 49, i64 35>, <2 x i64>* %12, align 8, !tbaa !3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(35) %10, i8* nonnull align 1 dereferenceable(35) getelementptr inbounds ([36 x i8], [36 x i8]* @.str.1, i64 0, i64 0), i64 35, i1 false) #17
  %13 = getelementptr inbounds i8, i8* %10, i64 35
  store i8 0, i8* %13, align 1, !tbaa !3
  br label %14

14:                                               ; preds = %9, %7
  ret void
}

declare hidden void @_ZNKSt3__112__do_message7messageEi(%"class.std::__1::basic_string"* sret align 8, %"class.std::__1::__do_message"*, i32) unnamed_addr #2

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__117iostream_categoryEv() local_unnamed_addr #3 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__117iostream_categoryEvE1s to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %8, !prof !6

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__117iostream_categoryEvE1s) #17
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %3
  tail call void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0)) #17
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__119__iostream_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !7
  %7 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to void (i8*)*), i8* bitcast (%"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s to i8*), i8* nonnull @__dso_handle) #17
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__117iostream_categoryEvE1s) #17
  br label %8

8:                                                ; preds = %3, %6, %0
  ret %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0)
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__114error_categoryD2Ev(%"class.std::__1::error_category"*) unnamed_addr #5

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #4

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base7failureC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeE(%"class.std::__1::ios_base::failure"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::error_code"* nocapture nonnull readonly align 8 dereferenceable(16) %2) unnamed_addr #1 align 2 {
  %4 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa.struct !9
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 1
  %8 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %7, align 8, !tbaa.struct !9
  tail call void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %4, i32 %6, %"class.std::__1::error_category"* %8, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1)
  %9 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__18ios_base7failureE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %9, align 8, !tbaa !7
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #6

declare void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #2

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base7failureC2EPKcRKNS_10error_codeE(%"class.std::__1::ios_base::failure"* %0, i8* %1, %"class.std::__1::error_code"* nocapture nonnull readonly align 8 dereferenceable(16) %2) unnamed_addr #1 align 2 {
  %4 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa.struct !9
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 1
  %8 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %7, align 8, !tbaa.struct !9
  tail call void @_ZNSt3__112system_errorC2ENS_10error_codeEPKc(%"class.std::__1::system_error"* %4, i32 %6, %"class.std::__1::error_category"* %8, i8* %1)
  %9 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__18ios_base7failureE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %9, align 8, !tbaa !7
  ret void
}

declare void @_ZNSt3__112system_errorC2ENS_10error_codeEPKc(%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, i8*) unnamed_addr #2

; Function Attrs: nounwind
declare void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"*) unnamed_addr #5

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_base7failureD2Ev(%"class.std::__1::ios_base::failure"* %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0
  tail call void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %2) #17
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_base7failureD0Ev(%"class.std::__1::ios_base::failure"* %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::__1::ios_base::failure", %"class.std::__1::ios_base::failure"* %0, i64 0, i32 0
  tail call void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %2) #17
  %3 = bitcast %"class.std::__1::ios_base::failure"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #18
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #7

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base16__call_callbacksENS0_5eventE(%"class.std::__1::ios_base"* %0, i32 %1) local_unnamed_addr #1 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 10
  %4 = load i64, i64* %3, align 8, !tbaa !14
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %8 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  br label %10

9:                                                ; preds = %10, %2
  ret void

10:                                               ; preds = %6, %10
  %11 = phi i64 [ %4, %6 ], [ %12, %10 ]
  %12 = add i64 %11, -1
  %13 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %7, align 8, !tbaa !17
  %14 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %13, i64 %12
  %15 = load void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %14, align 8, !tbaa !12
  %16 = load i32*, i32** %8, align 8, !tbaa !18
  %17 = getelementptr inbounds i32, i32* %16, i64 %12
  %18 = load i32, i32* %17, align 4, !tbaa !10
  tail call void %15(i32 %1, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %0, i32 %18)
  %19 = icmp eq i64 %12, 0
  br i1 %19, label %9, label %10
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #6

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base5imbueERKNS_6localeE(%"class.std::__1::locale"* noalias sret align 8 %0, %"class.std::__1::ios_base"* %1, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %2) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 7
  %5 = bitcast i8** %4 to %"class.std::__1::locale"*
  tail call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %5) #17
  %6 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::locale"* @_ZNSt3__16localeaSERKS0_(%"class.std::__1::locale"* nonnull %5, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %2) #17
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 10
  %8 = load i64, i64* %7, align 8, !tbaa !14
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %26, label %10

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 8
  %12 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 9
  br label %13

13:                                               ; preds = %22, %10
  %14 = phi i64 [ %8, %10 ], [ %15, %22 ]
  %15 = add i64 %14, -1
  %16 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %11, align 8, !tbaa !17
  %17 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %16, i64 %15
  %18 = load void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %17, align 8, !tbaa !12
  %19 = load i32*, i32** %12, align 8, !tbaa !18
  %20 = getelementptr inbounds i32, i32* %19, i64 %15
  %21 = load i32, i32* %20, align 4, !tbaa !10
  invoke void %18(i32 1, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %1, i32 %21)
          to label %22 unwind label %24

22:                                               ; preds = %13
  %23 = icmp eq i64 %15, 0
  br i1 %23, label %26, label %13

24:                                               ; preds = %13
  %25 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* %0) #17
  resume { i8*, i32 } %25

26:                                               ; preds = %22, %3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"*, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8)) unnamed_addr #5

; Function Attrs: nounwind
declare nonnull align 8 dereferenceable(8) %"class.std::__1::locale"* @_ZNSt3__16localeaSERKS0_(%"class.std::__1::locale"*, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8)) local_unnamed_addr #5

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"*) unnamed_addr #5

; Function Attrs: nounwind uwtable
define void @_ZNKSt3__18ios_base6getlocEv(%"class.std::__1::locale"* noalias sret align 8 %0, %"class.std::__1::ios_base"* %1) local_unnamed_addr #3 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 7
  %4 = bitcast i8** %3 to %"class.std::__1::locale"*
  tail call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %4) #17
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define i32 @_ZNSt3__18ios_base6xallocEv() local_unnamed_addr #8 align 2 {
  %1 = atomicrmw add i32* getelementptr inbounds ({ { i32 } }, { { i32 } }* @_ZNSt3__18ios_base9__xindex_E, i64 0, i32 0, i32 0), i32 1 seq_cst
  ret i32 %1
}

; Function Attrs: uwtable
define nonnull align 8 dereferenceable(8) i64* @_ZNSt3__18ios_base5iwordEi(%"class.std::__1::ios_base"* nocapture %0, i32 %1) local_unnamed_addr #1 align 2 {
  %3 = sext i32 %1 to i64
  %4 = add nsw i64 %3, 1
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 14
  %6 = load i64, i64* %5, align 8, !tbaa !19
  %7 = icmp ugt i64 %4, %6
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 13
  %10 = load i64, i64* %9, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %12 = load i64*, i64** %11, align 8, !tbaa !21
  br label %60

13:                                               ; preds = %2
  %14 = icmp ult i64 %4, 1152921504606846975
  %15 = shl i64 %6, 1
  %16 = icmp ult i64 %15, %4
  %17 = select i1 %16, i64 %4, i64 %15
  %18 = select i1 %14, i64 %17, i64 2305843009213693951
  %19 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %20 = bitcast i64** %19 to i8**
  %21 = load i8*, i8** %20, align 8, !tbaa !21
  %22 = shl i64 %18, 3
  %23 = tail call i8* @realloc(i8* %21, i64 %22) #17
  %24 = ptrtoint i8* %23 to i64
  %25 = icmp eq i8* %23, null
  br i1 %25, label %26, label %36

26:                                               ; preds = %13
  %27 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %28 = load i32, i32* %27, align 8, !tbaa !22
  %29 = or i32 %28, 1
  store i32 %29, i32* %27, align 8
  %30 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %31 = load i32, i32* %30, align 4, !tbaa !23
  %32 = and i32 %31, %29
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %35, label %34

34:                                               ; preds = %26
  tail call void @_ZNSt3__115__throw_failureEPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)) #19
  unreachable

35:                                               ; preds = %26
  store i64 0, i64* @_ZZNSt3__18ios_base5iwordEiE5error, align 8, !tbaa !20
  br label %67

36:                                               ; preds = %13
  %37 = bitcast i8* %23 to i64*
  store i8* %23, i8** %20, align 8, !tbaa !21
  %38 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 13
  %39 = load i64, i64* %38, align 8, !tbaa !24
  %40 = icmp slt i64 %39, %18
  br i1 %40, label %41, label %59

41:                                               ; preds = %36
  %42 = getelementptr inbounds i64, i64* %37, i64 %18
  %43 = bitcast i64* %42 to i8*
  %44 = shl nsw i64 %39, 3
  %45 = getelementptr i8, i8* %23, i64 %44
  %46 = add i64 %44, 8
  %47 = getelementptr i8, i8* %23, i64 %46
  %48 = icmp ugt i8* %47, %43
  %49 = select i1 %48, i8* %47, i8* %43
  %50 = bitcast i8* %49 to i64*
  %51 = sub i64 0, %39
  %52 = getelementptr i64, i64* %50, i64 %51
  %53 = bitcast i64* %52 to i8*
  %54 = xor i64 %24, -1
  %55 = getelementptr i8, i8* %53, i64 %54
  %56 = ptrtoint i8* %55 to i64
  %57 = add i64 %56, 8
  %58 = and i64 %57, -8
  call void @llvm.memset.p0i8.i64(i8* align 8 %45, i8 0, i64 %58, i1 false)
  br label %59

59:                                               ; preds = %41, %36
  store i64 %18, i64* %5, align 8, !tbaa !19
  br label %60

60:                                               ; preds = %8, %59
  %61 = phi i64* [ %12, %8 ], [ %37, %59 ]
  %62 = phi i64 [ %10, %8 ], [ %39, %59 ]
  %63 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 13
  %64 = icmp ult i64 %62, %4
  %65 = select i1 %64, i64 %4, i64 %62
  store i64 %65, i64* %63, align 8, !tbaa !24
  %66 = getelementptr inbounds i64, i64* %61, i64 %3
  br label %67

67:                                               ; preds = %35, %60
  %68 = phi i64* [ %66, %60 ], [ @_ZZNSt3__18ios_base5iwordEiE5error, %35 ]
  ret i64* %68
}

; Function Attrs: nounwind
declare noalias i8* @realloc(i8* nocapture, i64) local_unnamed_addr #5

; Function Attrs: uwtable
define nonnull align 8 dereferenceable(8) i8** @_ZNSt3__18ios_base5pwordEi(%"class.std::__1::ios_base"* nocapture %0, i32 %1) local_unnamed_addr #1 align 2 {
  %3 = sext i32 %1 to i64
  %4 = add nsw i64 %3, 1
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 17
  %6 = load i64, i64* %5, align 8, !tbaa !25
  %7 = icmp ugt i64 %4, %6
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  %10 = load i64, i64* %9, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 15
  %12 = load i8**, i8*** %11, align 8, !tbaa !26
  br label %52

13:                                               ; preds = %2
  %14 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 14
  %15 = load i64, i64* %14, align 8, !tbaa !19
  %16 = icmp ult i64 %4, 1152921504606846975
  %17 = shl i64 %15, 1
  %18 = icmp ult i64 %17, %4
  %19 = select i1 %18, i64 %4, i64 %17
  %20 = select i1 %16, i64 %19, i64 2305843009213693951
  %21 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 15
  %22 = bitcast i8*** %21 to i8**
  %23 = load i8*, i8** %22, align 8, !tbaa !26
  %24 = shl i64 %20, 3
  %25 = tail call i8* @realloc(i8* %23, i64 %24) #17
  %26 = icmp eq i8* %25, null
  br i1 %26, label %27, label %37

27:                                               ; preds = %13
  %28 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %29 = load i32, i32* %28, align 8, !tbaa !22
  %30 = or i32 %29, 1
  store i32 %30, i32* %28, align 8
  %31 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %32 = load i32, i32* %31, align 4, !tbaa !23
  %33 = and i32 %32, %30
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %36, label %35

35:                                               ; preds = %27
  tail call void @_ZNSt3__115__throw_failureEPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)) #19
  unreachable

36:                                               ; preds = %27
  store i8* null, i8** @_ZZNSt3__18ios_base5pwordEiE5error, align 8, !tbaa !12
  br label %59

37:                                               ; preds = %13
  %38 = bitcast i8* %25 to i8**
  store i8* %25, i8** %22, align 8, !tbaa !26
  %39 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  %40 = load i64, i64* %39, align 8, !tbaa !27
  %41 = icmp slt i64 %40, %20
  br i1 %41, label %42, label %44

42:                                               ; preds = %37
  %43 = getelementptr inbounds i8*, i8** %38, i64 %40
  br label %46

44:                                               ; preds = %46, %37
  %45 = phi i8** [ %38, %37 ], [ %49, %46 ]
  store i64 %20, i64* %5, align 8, !tbaa !25
  br label %52

46:                                               ; preds = %42, %46
  %47 = phi i8** [ %48, %46 ], [ %43, %42 ]
  store i8* null, i8** %47, align 8, !tbaa !12
  %48 = getelementptr inbounds i8*, i8** %47, i64 1
  %49 = load i8**, i8*** %21, align 8, !tbaa !26
  %50 = getelementptr inbounds i8*, i8** %49, i64 %20
  %51 = icmp ult i8** %48, %50
  br i1 %51, label %46, label %44

52:                                               ; preds = %8, %44
  %53 = phi i8** [ %12, %8 ], [ %45, %44 ]
  %54 = phi i64 [ %10, %8 ], [ %40, %44 ]
  %55 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  %56 = icmp ult i64 %54, %4
  %57 = select i1 %56, i64 %4, i64 %54
  store i64 %57, i64* %55, align 8, !tbaa !27
  %58 = getelementptr inbounds i8*, i8** %53, i64 %3
  br label %59

59:                                               ; preds = %36, %52
  %60 = phi i8** [ %58, %52 ], [ @_ZZNSt3__18ios_base5pwordEiE5error, %36 ]
  ret i8** %60
}

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base17register_callbackEPFvNS0_5eventERS0_iEi(%"class.std::__1::ios_base"* nocapture %0, void (i32, %"class.std::__1::ios_base"*, i32)* %1, i32 %2) local_unnamed_addr #1 align 2 {
  %4 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 10
  %5 = load i64, i64* %4, align 8, !tbaa !14
  %6 = add i64 %5, 1
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 11
  %8 = load i64, i64* %7, align 8, !tbaa !28
  %9 = icmp ugt i64 %6, %8
  br i1 %9, label %10, label %50

10:                                               ; preds = %3
  %11 = icmp ult i64 %6, 1152921504606846975
  %12 = shl i64 %8, 1
  %13 = icmp ult i64 %12, %6
  %14 = select i1 %13, i64 %6, i64 %12
  %15 = select i1 %11, i64 %14, i64 2305843009213693951
  %16 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %17 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %16 to i8**
  %18 = load i8*, i8** %17, align 8, !tbaa !17
  %19 = shl i64 %15, 3
  %20 = tail call i8* @realloc(i8* %18, i64 %19) #17
  %21 = icmp eq i8* %20, null
  br i1 %21, label %22, label %31

22:                                               ; preds = %10
  %23 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %24 = load i32, i32* %23, align 8, !tbaa !22
  %25 = or i32 %24, 1
  store i32 %25, i32* %23, align 8
  %26 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %27 = load i32, i32* %26, align 4, !tbaa !23
  %28 = and i32 %27, %25
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %31, label %30

30:                                               ; preds = %22
  tail call void @_ZNSt3__115__throw_failureEPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)) #19
  unreachable

31:                                               ; preds = %22, %10
  store i8* %20, i8** %17, align 8, !tbaa !17
  %32 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  %33 = bitcast i32** %32 to i8**
  %34 = load i8*, i8** %33, align 8, !tbaa !18
  %35 = shl i64 %15, 2
  %36 = tail call i8* @realloc(i8* %34, i64 %35) #17
  %37 = icmp eq i8* %36, null
  br i1 %37, label %38, label %47

38:                                               ; preds = %31
  %39 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %40 = load i32, i32* %39, align 8, !tbaa !22
  %41 = or i32 %40, 1
  store i32 %41, i32* %39, align 8
  %42 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %43 = load i32, i32* %42, align 4, !tbaa !23
  %44 = and i32 %43, %41
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %47, label %46

46:                                               ; preds = %38
  tail call void @_ZNSt3__115__throw_failureEPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)) #19
  unreachable

47:                                               ; preds = %38, %31
  store i8* %36, i8** %33, align 8, !tbaa !18
  store i64 %15, i64* %7, align 8, !tbaa !28
  %48 = load i64, i64* %4, align 8, !tbaa !14
  %49 = add i64 %48, 1
  br label %50

50:                                               ; preds = %47, %3
  %51 = phi i64 [ %49, %47 ], [ %6, %3 ]
  %52 = phi i64 [ %48, %47 ], [ %5, %3 ]
  %53 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %54 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %53, align 8, !tbaa !17
  %55 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %54, i64 %52
  store void (i32, %"class.std::__1::ios_base"*, i32)* %1, void (i32, %"class.std::__1::ios_base"*, i32)** %55, align 8, !tbaa !12
  %56 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  %57 = load i32*, i32** %56, align 8, !tbaa !18
  %58 = getelementptr inbounds i32, i32* %57, i64 %52
  store i32 %2, i32* %58, align 4, !tbaa !10
  store i64 %51, i64* %4, align 8, !tbaa !14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_baseD2Ev(%"class.std::__1::ios_base"* %0) unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTVNSt3__18ios_baseE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !7
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 10
  %4 = load i64, i64* %3, align 8, !tbaa !14
  %5 = icmp eq i64 %4, 0
  br i1 %5, label %20, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %8 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  br label %9

9:                                                ; preds = %18, %6
  %10 = phi i64 [ %4, %6 ], [ %11, %18 ]
  %11 = add i64 %10, -1
  %12 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %7, align 8, !tbaa !17
  %13 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %12, i64 %11
  %14 = load void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %13, align 8, !tbaa !12
  %15 = load i32*, i32** %8, align 8, !tbaa !18
  %16 = getelementptr inbounds i32, i32* %15, i64 %11
  %17 = load i32, i32* %16, align 4, !tbaa !10
  invoke void %14(i32 0, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %0, i32 %17)
          to label %18 unwind label %35

18:                                               ; preds = %9
  %19 = icmp eq i64 %11, 0
  br i1 %19, label %20, label %9

20:                                               ; preds = %18, %1
  %21 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 7
  %22 = bitcast i8** %21 to %"class.std::__1::locale"*
  tail call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %22) #17
  %23 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %24 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %23 to i8**
  %25 = load i8*, i8** %24, align 8, !tbaa !17
  tail call void @free(i8* %25) #17
  %26 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  %27 = bitcast i32** %26 to i8**
  %28 = load i8*, i8** %27, align 8, !tbaa !18
  tail call void @free(i8* %28) #17
  %29 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %30 = bitcast i64** %29 to i8**
  %31 = load i8*, i8** %30, align 8, !tbaa !21
  tail call void @free(i8* %31) #17
  %32 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 15
  %33 = bitcast i8*** %32 to i8**
  %34 = load i8*, i8** %33, align 8, !tbaa !26
  tail call void @free(i8* %34) #17
  ret void

35:                                               ; preds = %9
  %36 = landingpad { i8*, i32 }
          catch i8* null
  %37 = extractvalue { i8*, i32 } %36, 0
  tail call void @__clang_call_terminate(i8* %37) #20
  unreachable
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #9 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #17
  tail call void @_ZSt9terminatev() #20
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_baseD0Ev(%"class.std::__1::ios_base"* %0) unnamed_addr #3 align 2 {
  tail call void @_ZNSt3__18ios_baseD2Ev(%"class.std::__1::ios_base"* %0) #17
  %2 = bitcast %"class.std::__1::ios_base"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #18
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base5clearEj(%"class.std::__1::ios_base"* nocapture %0, i32 %1) local_unnamed_addr #1 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 6
  %4 = load i8*, i8** %3, align 8, !tbaa !29
  %5 = icmp eq i8* %4, null
  %6 = zext i1 %5 to i32
  %7 = or i32 %6, %1
  %8 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  store i32 %7, i32* %8, align 8
  %9 = zext i1 %5 to i32
  %10 = or i32 %9, %1
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %12 = load i32, i32* %11, align 4, !tbaa !23
  %13 = and i32 %12, %10
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %15

15:                                               ; preds = %2
  tail call void @_ZNSt3__115__throw_failureEPKc(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)) #19
  unreachable

16:                                               ; preds = %2
  ret void
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__115__throw_failureEPKc(i8* %0) local_unnamed_addr #10 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 32) #17
  %3 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__117iostream_categoryEvE1s to i8*) acquire, align 8
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %5, label %10, !prof !6

5:                                                ; preds = %1
  %6 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__117iostream_categoryEvE1s) #17
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %5
  tail call void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0)) #17
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__119__iostream_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !7
  %9 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to void (i8*)*), i8* bitcast (%"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s to i8*), i8* nonnull @__dso_handle) #17
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__117iostream_categoryEvE1s) #17
  br label %10

10:                                               ; preds = %1, %5, %8
  %11 = bitcast i8* %2 to %"class.std::__1::system_error"*
  invoke void @_ZNSt3__112system_errorC2ENS_10error_codeEPKc(%"class.std::__1::system_error"* %11, i32 1, %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* @_ZZNSt3__117iostream_categoryEvE1s, i64 0, i32 0, i32 0), i8* %0)
          to label %12 unwind label %14

12:                                               ; preds = %10
  %13 = bitcast i8* %2 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__18ios_base7failureE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %13, align 8, !tbaa !7
  tail call void @__cxa_throw(i8* %2, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__18ios_base7failureE to i8*), i8* bitcast (void (%"class.std::__1::ios_base::failure"*)* @_ZNSt3__18ios_base7failureD2Ev to i8*)) #19
  unreachable

14:                                               ; preds = %10
  %15 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #17
  resume { i8*, i32 } %15
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* %0, i8* %1) local_unnamed_addr #3 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 6
  store i8* %1, i8** %3, align 8, !tbaa !29
  %4 = icmp eq i8* %1, null
  %5 = zext i1 %4 to i32
  %6 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  store i32 %5, i32* %6, align 8, !tbaa !22
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  store i32 0, i32* %7, align 4, !tbaa !23
  %8 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 1
  store i32 4098, i32* %8, align 8, !tbaa !30
  %9 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 2
  %10 = bitcast i64* %9 to <2 x i64>*
  store <2 x i64> <i64 6, i64 0>, <2 x i64>* %10, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %12 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 7
  %13 = bitcast i8** %12 to %"class.std::__1::locale"*
  %14 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %11 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(80) %14, i8 0, i64 80, i1 false)
  tail call void @_ZNSt3__16localeC1Ev(%"class.std::__1::locale"* nonnull %13) #17
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__16localeC1Ev(%"class.std::__1::locale"*) unnamed_addr #5

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base7copyfmtERKS0_(%"class.std::__1::ios_base"* %0, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %1) local_unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 11
  %4 = load i64, i64* %3, align 8, !tbaa !28
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 10
  %6 = load i64, i64* %5, align 8, !tbaa !14
  %7 = icmp ult i64 %4, %6
  br i1 %7, label %8, label %30

8:                                                ; preds = %2
  %9 = shl i64 %6, 3
  %10 = tail call noalias i8* @malloc(i64 %9) #17
  %11 = ptrtoint i8* %10 to i64
  %12 = icmp eq i8* %10, null
  br i1 %12, label %13, label %19

13:                                               ; preds = %8
  invoke void @_ZSt17__throw_bad_allocv() #19
          to label %14 unwind label %15

14:                                               ; preds = %13
  unreachable

15:                                               ; preds = %13
  %16 = landingpad { i8*, i32 }
          cleanup
  %17 = extractvalue { i8*, i32 } %16, 0
  %18 = extractvalue { i8*, i32 } %16, 1
  br label %211

19:                                               ; preds = %8
  %20 = shl i64 %6, 2
  %21 = tail call noalias i8* @malloc(i64 %20) #17
  %22 = ptrtoint i8* %21 to i64
  %23 = icmp eq i8* %21, null
  br i1 %23, label %24, label %30

24:                                               ; preds = %19
  invoke void @_ZSt17__throw_bad_allocv() #19
          to label %25 unwind label %26

25:                                               ; preds = %24
  unreachable

26:                                               ; preds = %24
  %27 = landingpad { i8*, i32 }
          cleanup
  %28 = extractvalue { i8*, i32 } %27, 0
  %29 = extractvalue { i8*, i32 } %27, 1
  br label %203

30:                                               ; preds = %19, %2
  %31 = phi i64 [ %22, %19 ], [ 0, %2 ]
  %32 = phi i64 [ %11, %19 ], [ 0, %2 ]
  %33 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 14
  %34 = load i64, i64* %33, align 8, !tbaa !19
  %35 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 13
  %36 = load i64, i64* %35, align 8, !tbaa !24
  %37 = icmp ult i64 %34, %36
  br i1 %37, label %38, label %47

38:                                               ; preds = %30
  %39 = shl i64 %36, 3
  %40 = tail call noalias i8* @malloc(i64 %39) #17
  %41 = ptrtoint i8* %40 to i64
  %42 = icmp eq i8* %40, null
  br i1 %42, label %43, label %47

43:                                               ; preds = %38
  invoke void @_ZSt17__throw_bad_allocv() #19
          to label %44 unwind label %45

44:                                               ; preds = %43
  unreachable

45:                                               ; preds = %43
  %46 = landingpad { i8*, i32 }
          cleanup
  br label %195

47:                                               ; preds = %38, %30
  %48 = phi i64 [ %41, %38 ], [ 0, %30 ]
  %49 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 17
  %50 = load i64, i64* %49, align 8, !tbaa !25
  %51 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 16
  %52 = load i64, i64* %51, align 8, !tbaa !27
  %53 = icmp ult i64 %50, %52
  br i1 %53, label %54, label %61

54:                                               ; preds = %47
  %55 = shl i64 %52, 3
  %56 = tail call noalias i8* @malloc(i64 %55) #17
  %57 = ptrtoint i8* %56 to i64
  %58 = icmp eq i8* %56, null
  br i1 %58, label %59, label %61

59:                                               ; preds = %54
  invoke void @_ZSt17__throw_bad_allocv() #19
          to label %60 unwind label %193

60:                                               ; preds = %59
  unreachable

61:                                               ; preds = %54, %47
  %62 = phi i64 [ %57, %54 ], [ 0, %47 ]
  %63 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 1
  %64 = load i32, i32* %63, align 8, !tbaa !30
  %65 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 1
  store i32 %64, i32* %65, align 8, !tbaa !30
  %66 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 2
  %67 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 2
  %68 = bitcast i64* %66 to <2 x i64>*
  %69 = load <2 x i64>, <2 x i64>* %68, align 8, !tbaa !20
  %70 = bitcast i64* %67 to <2 x i64>*
  store <2 x i64> %69, <2 x i64>* %70, align 8, !tbaa !20
  %71 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 7
  %72 = bitcast i8** %71 to %"class.std::__1::locale"*
  %73 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 7
  %74 = bitcast i8** %73 to %"class.std::__1::locale"*
  %75 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::locale"* @_ZNSt3__16localeaSERKS0_(%"class.std::__1::locale"* nonnull %72, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %74) #17
  %76 = load i64, i64* %3, align 8, !tbaa !28
  %77 = load i64, i64* %5, align 8, !tbaa !14
  %78 = icmp ult i64 %76, %77
  br i1 %78, label %79, label %89

79:                                               ; preds = %61
  %80 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %81 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %80 to i8**
  %82 = load i8*, i8** %81, align 8, !tbaa !17
  tail call void @free(i8* %82) #17
  %83 = inttoptr i64 %32 to void (i32, %"class.std::__1::ios_base"*, i32)**
  store void (i32, %"class.std::__1::ios_base"*, i32)** %83, void (i32, %"class.std::__1::ios_base"*, i32)*** %80, align 8, !tbaa !17
  %84 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  %85 = bitcast i32** %84 to i8**
  %86 = load i8*, i8** %85, align 8, !tbaa !18
  tail call void @free(i8* %86) #17
  %87 = inttoptr i64 %31 to i32*
  store i32* %87, i32** %84, align 8, !tbaa !18
  %88 = load i64, i64* %5, align 8, !tbaa !14
  store i64 %88, i64* %3, align 8, !tbaa !28
  br label %89

89:                                               ; preds = %79, %61
  %90 = phi i64 [ 0, %79 ], [ %31, %61 ]
  %91 = phi i64 [ 0, %79 ], [ %32, %61 ]
  %92 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 10
  store i64 0, i64* %92, align 8, !tbaa !14
  %93 = load i64, i64* %5, align 8, !tbaa !14
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %117, label %95

95:                                               ; preds = %89
  %96 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 8
  %97 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %98 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 9
  %99 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  br label %100

100:                                              ; preds = %95, %100
  %101 = phi i64 [ 0, %95 ], [ %114, %100 ]
  %102 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %96, align 8, !tbaa !17
  %103 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %102, i64 %101
  %104 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)** %103 to i64*
  %105 = load i64, i64* %104, align 8, !tbaa !12
  %106 = load void (i32, %"class.std::__1::ios_base"*, i32)**, void (i32, %"class.std::__1::ios_base"*, i32)*** %97, align 8, !tbaa !17
  %107 = getelementptr inbounds void (i32, %"class.std::__1::ios_base"*, i32)*, void (i32, %"class.std::__1::ios_base"*, i32)** %106, i64 %101
  %108 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)** %107 to i64*
  store i64 %105, i64* %108, align 8, !tbaa !12
  %109 = load i32*, i32** %98, align 8, !tbaa !18
  %110 = getelementptr inbounds i32, i32* %109, i64 %101
  %111 = load i32, i32* %110, align 4, !tbaa !10
  %112 = load i32*, i32** %99, align 8, !tbaa !18
  %113 = getelementptr inbounds i32, i32* %112, i64 %101
  store i32 %111, i32* %113, align 4, !tbaa !10
  %114 = add nuw i64 %101, 1
  store i64 %114, i64* %92, align 8, !tbaa !14
  %115 = load i64, i64* %5, align 8, !tbaa !14
  %116 = icmp ult i64 %114, %115
  br i1 %116, label %100, label %117

117:                                              ; preds = %100, %89
  %118 = load i64, i64* %33, align 8, !tbaa !19
  %119 = load i64, i64* %35, align 8, !tbaa !24
  %120 = icmp ult i64 %118, %119
  br i1 %120, label %121, label %127

121:                                              ; preds = %117
  %122 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %123 = bitcast i64** %122 to i8**
  %124 = load i8*, i8** %123, align 8, !tbaa !21
  tail call void @free(i8* %124) #17
  %125 = inttoptr i64 %48 to i64*
  store i64* %125, i64** %122, align 8, !tbaa !21
  %126 = load i64, i64* %35, align 8, !tbaa !24
  store i64 %126, i64* %33, align 8, !tbaa !19
  br label %127

127:                                              ; preds = %121, %117
  %128 = phi i64 [ 0, %121 ], [ %48, %117 ]
  %129 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 13
  store i64 0, i64* %129, align 8, !tbaa !24
  %130 = load i64, i64* %35, align 8, !tbaa !24
  %131 = icmp eq i64 %130, 0
  br i1 %131, label %146, label %132

132:                                              ; preds = %127
  %133 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 12
  %134 = load i64*, i64** %133, align 8, !tbaa !21
  %135 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %136 = load i64*, i64** %135, align 8, !tbaa !21
  br label %137

137:                                              ; preds = %132, %137
  %138 = phi i64 [ 0, %132 ], [ %143, %137 ]
  %139 = getelementptr inbounds i64, i64* %134, i64 %138
  %140 = load i64, i64* %139, align 8, !tbaa !20
  %141 = getelementptr inbounds i64, i64* %136, i64 %138
  store i64 %140, i64* %141, align 8, !tbaa !20
  %142 = load i64, i64* %129, align 8, !tbaa !24
  %143 = add i64 %142, 1
  store i64 %143, i64* %129, align 8, !tbaa !24
  %144 = load i64, i64* %35, align 8, !tbaa !24
  %145 = icmp ult i64 %143, %144
  br i1 %145, label %137, label %146

146:                                              ; preds = %137, %127
  %147 = load i64, i64* %49, align 8, !tbaa !25
  %148 = load i64, i64* %51, align 8, !tbaa !27
  %149 = icmp ult i64 %147, %148
  br i1 %149, label %150, label %156

150:                                              ; preds = %146
  %151 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 15
  %152 = bitcast i8*** %151 to i8**
  %153 = load i8*, i8** %152, align 8, !tbaa !26
  tail call void @free(i8* %153) #17
  %154 = inttoptr i64 %62 to i8**
  store i8** %154, i8*** %151, align 8, !tbaa !26
  %155 = load i64, i64* %51, align 8, !tbaa !27
  store i64 %155, i64* %49, align 8, !tbaa !25
  br label %156

156:                                              ; preds = %150, %146
  %157 = phi i64 [ 0, %150 ], [ %62, %146 ]
  %158 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  store i64 0, i64* %158, align 8, !tbaa !27
  %159 = load i64, i64* %51, align 8, !tbaa !27
  %160 = icmp eq i64 %159, 0
  br i1 %160, label %176, label %161

161:                                              ; preds = %156
  %162 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 15
  %163 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 15
  br label %164

164:                                              ; preds = %161, %164
  %165 = phi i64 [ 0, %161 ], [ %173, %164 ]
  %166 = load i8**, i8*** %162, align 8, !tbaa !26
  %167 = getelementptr inbounds i8*, i8** %166, i64 %165
  %168 = bitcast i8** %167 to i64*
  %169 = load i64, i64* %168, align 8, !tbaa !12
  %170 = load i8**, i8*** %163, align 8, !tbaa !26
  %171 = getelementptr inbounds i8*, i8** %170, i64 %165
  %172 = bitcast i8** %171 to i64*
  store i64 %169, i64* %172, align 8, !tbaa !12
  %173 = add nuw i64 %165, 1
  store i64 %173, i64* %158, align 8, !tbaa !27
  %174 = load i64, i64* %51, align 8, !tbaa !27
  %175 = icmp ult i64 %173, %174
  br i1 %175, label %164, label %176

176:                                              ; preds = %164, %156
  %177 = icmp eq i64 %157, 0
  br i1 %177, label %180, label %178

178:                                              ; preds = %176
  %179 = inttoptr i64 %157 to i8*
  tail call void @free(i8* nonnull %179)
  br label %180

180:                                              ; preds = %178, %176
  %181 = icmp eq i64 %128, 0
  br i1 %181, label %184, label %182

182:                                              ; preds = %180
  %183 = inttoptr i64 %128 to i8*
  tail call void @free(i8* nonnull %183)
  br label %184

184:                                              ; preds = %182, %180
  %185 = icmp eq i64 %90, 0
  br i1 %185, label %188, label %186

186:                                              ; preds = %184
  %187 = inttoptr i64 %90 to i8*
  tail call void @free(i8* nonnull %187)
  br label %188

188:                                              ; preds = %186, %184
  %189 = icmp eq i64 %91, 0
  br i1 %189, label %192, label %190

190:                                              ; preds = %188
  %191 = inttoptr i64 %91 to i8*
  tail call void @free(i8* nonnull %191)
  br label %192

192:                                              ; preds = %190, %188
  ret void

193:                                              ; preds = %59
  %194 = landingpad { i8*, i32 }
          cleanup
  br label %195

195:                                              ; preds = %193, %45
  %196 = phi { i8*, i32 } [ %194, %193 ], [ %46, %45 ]
  %197 = phi i64 [ %48, %193 ], [ %41, %45 ]
  %198 = extractvalue { i8*, i32 } %196, 0
  %199 = extractvalue { i8*, i32 } %196, 1
  %200 = icmp eq i64 %197, 0
  br i1 %200, label %203, label %201

201:                                              ; preds = %195
  %202 = inttoptr i64 %197 to i8*
  tail call void @free(i8* nonnull %202)
  br label %203

203:                                              ; preds = %201, %26, %195
  %204 = phi i64 [ %31, %195 ], [ %31, %201 ], [ %22, %26 ]
  %205 = phi i64 [ %32, %195 ], [ %32, %201 ], [ %11, %26 ]
  %206 = phi i32 [ %199, %195 ], [ %199, %201 ], [ %29, %26 ]
  %207 = phi i8* [ %198, %195 ], [ %198, %201 ], [ %28, %26 ]
  %208 = icmp eq i64 %204, 0
  br i1 %208, label %211, label %209

209:                                              ; preds = %203
  %210 = inttoptr i64 %204 to i8*
  tail call void @free(i8* nonnull %210)
  br label %211

211:                                              ; preds = %209, %15, %203
  %212 = phi i8* [ %17, %15 ], [ %207, %203 ], [ %207, %209 ]
  %213 = phi i32 [ %18, %15 ], [ %206, %203 ], [ %206, %209 ]
  %214 = phi i64 [ %11, %15 ], [ %205, %203 ], [ %205, %209 ]
  %215 = icmp eq i64 %214, 0
  br i1 %215, label %218, label %216

216:                                              ; preds = %211
  %217 = inttoptr i64 %214 to i8*
  tail call void @free(i8* nonnull %217)
  br label %218

218:                                              ; preds = %216, %211
  %219 = insertvalue { i8*, i32 } undef, i8* %212, 0
  %220 = insertvalue { i8*, i32 } %219, i32 %213, 1
  resume { i8*, i32 } %220
}

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #11

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() local_unnamed_addr #12

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_base4moveERS0_(%"class.std::__1::ios_base"* %0, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %1) local_unnamed_addr #3 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 1
  %4 = load i32, i32* %3, align 8, !tbaa !30
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 1
  store i32 %4, i32* %5, align 8, !tbaa !30
  %6 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 2
  %7 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 2
  %8 = bitcast i64* %6 to <2 x i64>*
  %9 = load <2 x i64>, <2 x i64>* %8, align 8, !tbaa !20
  %10 = bitcast i64* %7 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %10, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 4
  %12 = load i32, i32* %11, align 8, !tbaa !22
  %13 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  store i32 %12, i32* %13, align 8, !tbaa !22
  %14 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 5
  %15 = load i32, i32* %14, align 4, !tbaa !23
  %16 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  store i32 %15, i32* %16, align 4, !tbaa !23
  %17 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 6
  store i8* null, i8** %17, align 8, !tbaa !29
  %18 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 7
  %19 = bitcast i8** %18 to %"class.std::__1::locale"*
  %20 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 7
  %21 = bitcast i8** %20 to %"class.std::__1::locale"*
  tail call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %21, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %19) #17
  %22 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 8
  %23 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %24 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 9
  %25 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 10
  %26 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %22 to <4 x i64>*
  %27 = load <4 x i64>, <4 x i64>* %26, align 8, !tbaa !3
  %28 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %23 to <4 x i64>*
  store <4 x i64> %27, <4 x i64>* %28, align 8, !tbaa !3
  store void (i32, %"class.std::__1::ios_base"*, i32)** null, void (i32, %"class.std::__1::ios_base"*, i32)*** %22, align 8, !tbaa !17
  store i32* null, i32** %24, align 8, !tbaa !18
  %29 = bitcast i64* %25 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %29, align 8, !tbaa !20
  %30 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 12
  %31 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 12
  %32 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 13
  %33 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 15
  %34 = bitcast i64** %30 to <4 x i64>*
  %35 = load <4 x i64>, <4 x i64>* %34, align 8, !tbaa !3
  %36 = bitcast i64** %31 to <4 x i64>*
  store <4 x i64> %35, <4 x i64>* %36, align 8, !tbaa !3
  store i64* null, i64** %30, align 8, !tbaa !21
  %37 = bitcast i64* %32 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %37, align 8, !tbaa !20
  store i8** null, i8*** %33, align 8, !tbaa !26
  %38 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 16
  %39 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  %40 = bitcast i64* %38 to <2 x i64>*
  %41 = load <2 x i64>, <2 x i64>* %40, align 8, !tbaa !20
  %42 = bitcast i64* %39 to <2 x i64>*
  store <2 x i64> %41, <2 x i64>* %42, align 8, !tbaa !20
  %43 = bitcast i64* %38 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %43, align 8, !tbaa !20
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18ios_base4swapERS0_(%"class.std::__1::ios_base"* %0, %"class.std::__1::ios_base"* nonnull align 8 dereferenceable(136) %1) local_unnamed_addr #3 align 2 {
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 1
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 1
  %6 = load i32, i32* %4, align 4, !tbaa !10
  %7 = load i32, i32* %5, align 8, !tbaa !10
  store i32 %7, i32* %4, align 4, !tbaa !10
  store i32 %6, i32* %5, align 8, !tbaa !10
  %8 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 2
  %9 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 2
  %10 = load i64, i64* %8, align 8, !tbaa !20
  %11 = load i64, i64* %9, align 8, !tbaa !20
  store i64 %11, i64* %8, align 8, !tbaa !20
  store i64 %10, i64* %9, align 8, !tbaa !20
  %12 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 3
  %13 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 3
  %14 = load i64, i64* %12, align 8, !tbaa !20
  %15 = load i64, i64* %13, align 8, !tbaa !20
  store i64 %15, i64* %12, align 8, !tbaa !20
  store i64 %14, i64* %13, align 8, !tbaa !20
  %16 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %17 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 4
  %18 = load i32, i32* %16, align 4, !tbaa !10
  %19 = load i32, i32* %17, align 8, !tbaa !10
  store i32 %19, i32* %16, align 4, !tbaa !10
  store i32 %18, i32* %17, align 8, !tbaa !10
  %20 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %21 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 5
  %22 = load i32, i32* %20, align 4, !tbaa !10
  %23 = load i32, i32* %21, align 4, !tbaa !10
  store i32 %23, i32* %20, align 4, !tbaa !10
  store i32 %22, i32* %21, align 4, !tbaa !10
  %24 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 7
  %25 = bitcast i8** %24 to %"class.std::__1::locale"*
  %26 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 7
  %27 = bitcast i8** %26 to %"class.std::__1::locale"*
  %28 = bitcast %"class.std::__1::locale"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %28) #17
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %3, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %25) #17
  %29 = call nonnull align 8 dereferenceable(8) %"class.std::__1::locale"* @_ZNSt3__16localeaSERKS0_(%"class.std::__1::locale"* nonnull %25, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %27) #17
  %30 = call nonnull align 8 dereferenceable(8) %"class.std::__1::locale"* @_ZNSt3__16localeaSERKS0_(%"class.std::__1::locale"* nonnull %27, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %3) #17
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %3) #17
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %28) #17
  %31 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 8
  %32 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 8
  %33 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %31 to i64*
  %34 = load i64, i64* %33, align 8, !tbaa !12
  %35 = bitcast void (i32, %"class.std::__1::ios_base"*, i32)*** %32 to i64*
  %36 = load i64, i64* %35, align 8, !tbaa !12
  store i64 %36, i64* %33, align 8, !tbaa !12
  store i64 %34, i64* %35, align 8, !tbaa !12
  %37 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 9
  %38 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 9
  %39 = bitcast i32** %37 to <2 x i64>*
  %40 = load <2 x i64>, <2 x i64>* %39, align 8, !tbaa !3
  %41 = bitcast i32** %38 to <2 x i64>*
  %42 = load <2 x i64>, <2 x i64>* %41, align 8, !tbaa !3
  %43 = bitcast i32** %37 to <2 x i64>*
  store <2 x i64> %42, <2 x i64>* %43, align 8, !tbaa !3
  %44 = bitcast i32** %38 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %44, align 8, !tbaa !3
  %45 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 11
  %46 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 11
  %47 = bitcast i64* %45 to <2 x i64>*
  %48 = load <2 x i64>, <2 x i64>* %47, align 8, !tbaa !3
  %49 = bitcast i64* %46 to <2 x i64>*
  %50 = load <2 x i64>, <2 x i64>* %49, align 8, !tbaa !3
  %51 = bitcast i64* %45 to <2 x i64>*
  store <2 x i64> %50, <2 x i64>* %51, align 8, !tbaa !3
  %52 = bitcast i64* %46 to <2 x i64>*
  store <2 x i64> %48, <2 x i64>* %52, align 8, !tbaa !3
  %53 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 13
  %54 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 13
  %55 = load i64, i64* %53, align 8, !tbaa !20
  %56 = load i64, i64* %54, align 8, !tbaa !20
  store i64 %56, i64* %53, align 8, !tbaa !20
  store i64 %55, i64* %54, align 8, !tbaa !20
  %57 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 14
  %58 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 14
  %59 = bitcast i64* %57 to <2 x i64>*
  %60 = load <2 x i64>, <2 x i64>* %59, align 8, !tbaa !3
  %61 = bitcast i64* %58 to <2 x i64>*
  %62 = load <2 x i64>, <2 x i64>* %61, align 8, !tbaa !3
  %63 = bitcast i64* %57 to <2 x i64>*
  store <2 x i64> %62, <2 x i64>* %63, align 8, !tbaa !3
  %64 = bitcast i64* %58 to <2 x i64>*
  store <2 x i64> %60, <2 x i64>* %64, align 8, !tbaa !3
  %65 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 16
  %66 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 16
  %67 = load i64, i64* %65, align 8, !tbaa !20
  %68 = load i64, i64* %66, align 8, !tbaa !20
  store i64 %68, i64* %65, align 8, !tbaa !20
  store i64 %67, i64* %66, align 8, !tbaa !20
  %69 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 17
  %70 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %1, i64 0, i32 17
  %71 = load i64, i64* %69, align 8, !tbaa !20
  %72 = load i64, i64* %70, align 8, !tbaa !20
  store i64 %72, i64* %69, align 8, !tbaa !20
  store i64 %71, i64* %70, align 8, !tbaa !20
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base33__set_badbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nocapture %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 8, !tbaa !22
  %4 = or i32 %3, 1
  store i32 %4, i32* %2, align 8, !tbaa !22
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %6 = load i32, i32* %5, align 4, !tbaa !23
  %7 = and i32 %6, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %1
  tail call void @__cxa_rethrow() #19
  unreachable

10:                                               ; preds = %1
  ret void
}

declare void @__cxa_rethrow() local_unnamed_addr

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base34__set_failbit_and_consider_rethrowEv(%"class.std::__1::ios_base"* nocapture %0) local_unnamed_addr #1 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 4
  %3 = load i32, i32* %2, align 8, !tbaa !22
  %4 = or i32 %3, 4
  store i32 %4, i32* %2, align 8, !tbaa !22
  %5 = getelementptr inbounds %"class.std::__1::ios_base", %"class.std::__1::ios_base"* %0, i64 0, i32 5
  %6 = load i32, i32* %5, align 4, !tbaa !23
  %7 = and i32 %6, 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %10, label %9

9:                                                ; preds = %1
  tail call void @__cxa_rethrow() #19
  unreachable

10:                                               ; preds = %1
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define zeroext i1 @_ZNSt3__18ios_base15sync_with_stdioEb(i1 zeroext %0) local_unnamed_addr #8 align 2 {
  %2 = zext i1 %0 to i8
  %3 = load i8, i8* @_ZZNSt3__18ios_base15sync_with_stdioEbE14previous_state, align 1, !tbaa !31, !range !33
  %4 = icmp ne i8 %3, 0
  store i8 %2, i8* @_ZZNSt3__18ios_base15sync_with_stdioEbE14previous_state, align 1, !tbaa !31
  ret i1 %4
}

; Function Attrs: nounwind
declare i8* @_ZNKSt13runtime_error4whatEv(%"class.std::runtime_error"*) unnamed_addr #5

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__119__iostream_categoryD0Ev(%"class.std::__1::__iostream_category"* %0) unnamed_addr #13 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__iostream_category", %"class.std::__1::__iostream_category"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__114error_categoryD2Ev(%"class.std::__1::error_category"* %2) #17
  %3 = bitcast %"class.std::__1::__iostream_category"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #18
  ret void
}

; Function Attrs: nounwind
declare { i32, %"class.std::__1::error_category"* } @_ZNKSt3__114error_category23default_error_conditionEi(%"class.std::__1::error_category"*, i32) unnamed_addr #5

; Function Attrs: nounwind
declare zeroext i1 @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE(%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"* nonnull align 8 dereferenceable(16)) unnamed_addr #5

; Function Attrs: nounwind
declare zeroext i1 @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi(%"class.std::__1::error_category"*, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16), i32) unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"*) unnamed_addr #5

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #14

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #15

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nofree nounwind }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn }
attributes #7 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { noinline noreturn nounwind }
attributes #10 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { argmemonly nounwind willreturn writeonly }
attributes #16 = { builtin allocsize(0) }
attributes #17 = { nounwind }
attributes #18 = { builtin nounwind }
attributes #19 = { noreturn }
attributes #20 = { noreturn nounwind }

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
!14 = !{!15, !16, i64 72}
!15 = !{!"_ZTSNSt3__18ios_baseE", !11, i64 8, !16, i64 16, !16, i64 24, !11, i64 32, !11, i64 36, !13, i64 40, !13, i64 48, !13, i64 56, !13, i64 64, !16, i64 72, !16, i64 80, !13, i64 88, !16, i64 96, !16, i64 104, !13, i64 112, !16, i64 120, !16, i64 128}
!16 = !{!"long", !4, i64 0}
!17 = !{!15, !13, i64 56}
!18 = !{!15, !13, i64 64}
!19 = !{!15, !16, i64 104}
!20 = !{!16, !16, i64 0}
!21 = !{!15, !13, i64 88}
!22 = !{!15, !11, i64 32}
!23 = !{!15, !11, i64 36}
!24 = !{!15, !16, i64 96}
!25 = !{!15, !16, i64 128}
!26 = !{!15, !13, i64 112}
!27 = !{!15, !16, i64 120}
!28 = !{!15, !16, i64 80}
!29 = !{!15, !13, i64 40}
!30 = !{!15, !11, i64 8}
!31 = !{!32, !32, i64 0}
!32 = !{!"bool", !4, i64 0}
!33 = !{i8 0, i8 2}

; ModuleID = 'll/.system_error.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/system_error.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__generic_error_category" = type { %"class.std::__1::__do_message" }
%"class.std::__1::__do_message" = type { %"class.std::__1::error_category" }
%"class.std::__1::error_category" = type { i32 (...)** }
%"class.std::__1::__system_error_category" = type { %"class.std::__1::__do_message" }
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
%"class.std::__1::error_condition" = type { i32, %"class.std::__1::error_category"* }
%"class.std::__1::__basic_string_common" = type { i8 }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }

$_ZNSt3__112__do_messageD0Ev = comdat any

$_ZNSt3__124__generic_error_categoryD0Ev = comdat any

$_ZNSt3__123__system_error_categoryD0Ev = comdat any

@_ZTVNSt3__114error_categoryE = unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTINSt3__114error_categoryE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)* @_ZNKSt3__114error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"generic\00", align 1
@.str.1 = private unnamed_addr constant [35 x i8] c"unspecified generic_category error\00", align 1
@_ZZNSt3__116generic_categoryEvE1s = internal global %"class.std::__1::__generic_error_category" zeroinitializer, align 8
@_ZGVZNSt3__116generic_categoryEvE1s = internal global i64 0, align 8
@.str.2 = private unnamed_addr constant [7 x i8] c"system\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"unspecified system_category error\00", align 1
@_ZZNSt3__115system_categoryEvE1s = internal global %"class.std::__1::__system_error_category" zeroinitializer, align 8
@_ZGVZNSt3__115system_categoryEvE1s = internal global i64 0, align 8
@.str.4 = private unnamed_addr constant [3 x i8] c": \00", align 1
@_ZTVNSt3__112system_errorE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112system_errorE to i8*), i8* bitcast (void (%"class.std::__1::system_error"*)* @_ZNSt3__112system_errorD2Ev to i8*), i8* bitcast (void (%"class.std::__1::system_error"*)* @_ZNSt3__112system_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__112system_errorE = constant [23 x i8] c"NSt3__112system_errorE\00", align 1
@_ZTISt13runtime_error = external constant i8*
@_ZTINSt3__112system_errorE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSNSt3__112system_errorE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt13runtime_error to i8*) }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSNSt3__114error_categoryE = constant [25 x i8] c"NSt3__114error_categoryE\00", align 1
@_ZTINSt3__114error_categoryE = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSNSt3__114error_categoryE, i32 0, i32 0) }, align 8
@_ZTVNSt3__112__do_messageE = hidden unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112__do_messageE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__do_message"*)* @_ZNSt3__112__do_messageD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)* @_ZNKSt3__114error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.std::__1::__do_message"*, i32)* @_ZNKSt3__112__do_message7messageEi to i8*)] }, align 8
@_ZTSNSt3__112__do_messageE = hidden constant [23 x i8] c"NSt3__112__do_messageE\00", align 1
@_ZTINSt3__112__do_messageE = hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSNSt3__112__do_messageE, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTINSt3__114error_categoryE to i8*) }, align 8
@_ZTVNSt3__124__generic_error_categoryE = hidden unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__124__generic_error_categoryE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__generic_error_category"*)* @_ZNSt3__124__generic_error_categoryD0Ev to i8*), i8* bitcast (i8* (%"class.std::__1::__generic_error_category"*)* @_ZNKSt3__124__generic_error_category4nameEv to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)* @_ZNKSt3__114error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.std::__1::__generic_error_category"*, i32)* @_ZNKSt3__124__generic_error_category7messageEi to i8*)] }, align 8
@_ZTSNSt3__124__generic_error_categoryE = hidden constant [35 x i8] c"NSt3__124__generic_error_categoryE\00", align 1
@_ZTINSt3__124__generic_error_categoryE = hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @_ZTSNSt3__124__generic_error_categoryE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112__do_messageE to i8*) }, align 8
@_ZTVNSt3__123__system_error_categoryE = hidden unnamed_addr constant { [9 x i8*] } { [9 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__123__system_error_categoryE to i8*), i8* bitcast (void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev to i8*), i8* bitcast (void (%"class.std::__1::__system_error_category"*)* @_ZNSt3__123__system_error_categoryD0Ev to i8*), i8* bitcast (i8* (%"class.std::__1::__system_error_category"*)* @_ZNKSt3__123__system_error_category4nameEv to i8*), i8* bitcast ({ i32, %"class.std::__1::error_category"* } (%"class.std::__1::__system_error_category"*, i32)* @_ZNKSt3__123__system_error_category23default_error_conditionEi to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, i32, %"class.std::__1::error_condition"*)* @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE to i8*), i8* bitcast (i1 (%"class.std::__1::error_category"*, %"class.std::__1::error_code"*, i32)* @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi to i8*), i8* bitcast (void (%"class.std::__1::basic_string"*, %"class.std::__1::__system_error_category"*, i32)* @_ZNKSt3__123__system_error_category7messageEi to i8*)] }, align 8
@_ZTSNSt3__123__system_error_categoryE = hidden constant [34 x i8] c"NSt3__123__system_error_categoryE\00", align 1
@_ZTINSt3__123__system_error_categoryE = hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSNSt3__123__system_error_categoryE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112__do_messageE to i8*) }, align 8
@.str.6 = private unnamed_addr constant [17 x i8] c"Unknown error %d\00", align 1

@_ZNSt3__114error_categoryD1Ev = unnamed_addr alias void (%"class.std::__1::error_category"*), void (%"class.std::__1::error_category"*)* @_ZNSt3__114error_categoryD2Ev
@_ZNSt3__112system_errorC1ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"*)* @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
@_ZNSt3__112system_errorC1ENS_10error_codeEPKc = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, i8*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, i8*)* @_ZNSt3__112system_errorC2ENS_10error_codeEPKc
@_ZNSt3__112system_errorC1ENS_10error_codeE = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*)* @_ZNSt3__112system_errorC2ENS_10error_codeE
@_ZNSt3__112system_errorC1EiRKNS_14error_categoryERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"*)* @_ZNSt3__112system_errorC2EiRKNS_14error_categoryERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
@_ZNSt3__112system_errorC1EiRKNS_14error_categoryEPKc = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, i8*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, i8*)* @_ZNSt3__112system_errorC2EiRKNS_14error_categoryEPKc
@_ZNSt3__112system_errorC1EiRKNS_14error_categoryE = unnamed_addr alias void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*), void (%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*)* @_ZNSt3__112system_errorC2EiRKNS_14error_categoryE
@_ZNSt3__112system_errorD1Ev = unnamed_addr alias void (%"class.std::__1::system_error"*), void (%"class.std::__1::system_error"*)* @_ZNSt3__112system_errorD2Ev

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt3__114error_categoryC2Ev(%"class.std::__1::error_category"* nocapture %0) unnamed_addr #0 align 2 {
  %2 = getelementptr %"class.std::__1::error_category", %"class.std::__1::error_category"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__114error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define void @_ZNSt3__114error_categoryD0Ev(%"class.std::__1::error_category"* nocapture readnone %0) unnamed_addr #1 align 2 {
  tail call void @llvm.trap() #21
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #2

; Function Attrs: norecurse nounwind readnone uwtable
define { i32, %"class.std::__1::error_category"* } @_ZNKSt3__114error_category23default_error_conditionEi(%"class.std::__1::error_category"* %0, i32 %1) unnamed_addr #3 align 2 {
  %3 = insertvalue { i32, %"class.std::__1::error_category"* } undef, i32 %1, 0
  %4 = insertvalue { i32, %"class.std::__1::error_category"* } %3, %"class.std::__1::error_category"* %0, 1
  ret { i32, %"class.std::__1::error_category"* } %4
}

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZNKSt3__114error_category10equivalentEiRKNS_15error_conditionE(%"class.std::__1::error_category"* %0, i32 %1, %"class.std::__1::error_condition"* nocapture nonnull readonly align 8 dereferenceable(16) %2) unnamed_addr #4 align 2 {
  %4 = bitcast %"class.std::__1::error_category"* %0 to { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)***
  %5 = load { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)**, { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)*** %4, align 8, !tbaa !3
  %6 = getelementptr inbounds { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)*, { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)** %5, i64 3
  %7 = load { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)*, { i32, %"class.std::__1::error_category"* } (%"class.std::__1::error_category"*, i32)** %6, align 8
  %8 = tail call { i32, %"class.std::__1::error_category"* } %7(%"class.std::__1::error_category"* %0, i32 %1) #22
  %9 = extractvalue { i32, %"class.std::__1::error_category"* } %8, 0
  %10 = extractvalue { i32, %"class.std::__1::error_category"* } %8, 1
  %11 = getelementptr inbounds %"class.std::__1::error_condition", %"class.std::__1::error_condition"* %2, i64 0, i32 1
  %12 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %11, align 8, !tbaa !6
  %13 = icmp eq %"class.std::__1::error_category"* %10, %12
  %14 = getelementptr inbounds %"class.std::__1::error_condition", %"class.std::__1::error_condition"* %2, i64 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = icmp eq i32 %9, %15
  %17 = and i1 %13, %16
  ret i1 %17
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #5

; Function Attrs: norecurse nounwind readonly uwtable
define zeroext i1 @_ZNKSt3__114error_category10equivalentERKNS_10error_codeEi(%"class.std::__1::error_category"* readnone %0, %"class.std::__1::error_code"* nocapture nonnull readonly align 8 dereferenceable(16) %1, i32 %2) unnamed_addr #6 align 2 {
  %4 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  %5 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %4, align 8, !tbaa !11
  %6 = icmp eq %"class.std::__1::error_category"* %5, %0
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = icmp eq i32 %8, %2
  %10 = and i1 %6, %9
  ret i1 %10
}

; Function Attrs: uwtable
define hidden void @_ZNKSt3__112__do_message7messageEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::__do_message"* nocapture readnone %1, i32 %2) unnamed_addr #7 align 2 {
  %4 = alloca [1024 x i8], align 16
  %5 = getelementptr inbounds [1024 x i8], [1024 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %5) #22, !noalias !13
  %6 = tail call i32* @__errno_location() #23
  %7 = load i32, i32* %6, align 4, !tbaa !16, !noalias !13
  %8 = call i8* @strerror_r(i32 %2, i8* nonnull %5, i64 1024) #22, !noalias !13
  %9 = load i8, i8* %8, align 1, !tbaa !17, !noalias !13
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %3
  %12 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* nonnull %5, i64 1024, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i32 %2) #22
  br label %13

13:                                               ; preds = %11, %3
  %14 = phi i8* [ %8, %3 ], [ %5, %11 ]
  store i32 %7, i32* %6, align 4, !tbaa !16, !noalias !13
  %15 = call i64 @strlen(i8* nonnull dereferenceable(1) %14) #22, !noalias !13
  %16 = icmp ugt i64 %15, -17
  br i1 %16, label %17, label %19

17:                                               ; preds = %13
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %18) #24
  unreachable

19:                                               ; preds = %13
  %20 = icmp ult i64 %15, 23
  br i1 %20, label %29, label %21

21:                                               ; preds = %19
  %22 = add nuw i64 %15, 16
  %23 = and i64 %22, -16
  %24 = call noalias nonnull i8* @_Znwm(i64 %23) #25
  %25 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %24, i8** %25, align 8, !tbaa !17, !alias.scope !13
  %26 = or i64 %23, 1
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %26, i64* %27, align 8, !tbaa !17, !alias.scope !13
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %15, i64* %28, align 8, !tbaa !17, !alias.scope !13
  br label %36

29:                                               ; preds = %19
  %30 = trunc i64 %15 to i8
  %31 = shl nuw nsw i8 %30, 1
  %32 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %31, i8* %32, align 8, !tbaa !17, !alias.scope !13
  %33 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %34 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %33, i64 0, i32 1, i64 0
  %35 = icmp eq i64 %15, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %29, %21
  %37 = phi i8* [ %24, %21 ], [ %34, %29 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %37, i8* align 1 %14, i64 %15, i1 false) #22
  br label %38

38:                                               ; preds = %29, %36
  %39 = phi i8* [ %34, %29 ], [ %37, %36 ]
  %40 = getelementptr inbounds i8, i8* %39, i64 %15
  store i8 0, i8* %40, align 1, !tbaa !17
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %5) #22, !noalias !13
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define hidden i8* @_ZNKSt3__124__generic_error_category4nameEv(%"class.std::__1::__generic_error_category"* nocapture readnone %0) unnamed_addr #3 align 2 {
  ret i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: uwtable
define hidden void @_ZNKSt3__124__generic_error_category7messageEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::__generic_error_category"* nocapture readnone %1, i32 %2) unnamed_addr #7 align 2 {
  %4 = icmp sgt i32 %2, 4095
  br i1 %4, label %5, label %10

5:                                                ; preds = %3
  %6 = tail call noalias nonnull dereferenceable(48) i8* @_Znwm(i64 48) #25
  %7 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %6, i8** %7, align 8, !tbaa !17
  %8 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 49, i64 34>, <2 x i64>* %8, align 8, !tbaa !17
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(34) %6, i8* nonnull align 1 dereferenceable(34) getelementptr inbounds ([35 x i8], [35 x i8]* @.str.1, i64 0, i64 0), i64 34, i1 false) #22
  %9 = getelementptr inbounds i8, i8* %6, i64 34
  store i8 0, i8* %9, align 1, !tbaa !17
  br label %11

10:                                               ; preds = %3
  tail call void @_ZNKSt3__112__do_message7messageEi(%"class.std::__1::basic_string"* sret align 8 %0, %"class.std::__1::__do_message"* undef, i32 %2)
  br label %11

11:                                               ; preds = %10, %5
  ret void
}

; Function Attrs: nofree nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() local_unnamed_addr #8 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__116generic_categoryEvE1s to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %7, !prof !18

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__116generic_categoryEvE1s) #22
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__124__generic_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !3
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__116generic_categoryEvE1s) #22
  br label %7

7:                                                ; preds = %3, %6, %0
  ret %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0)
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #9

; Function Attrs: norecurse nounwind readnone uwtable
define hidden i8* @_ZNKSt3__123__system_error_category4nameEv(%"class.std::__1::__system_error_category"* nocapture readnone %0) unnamed_addr #3 align 2 {
  ret i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0)
}

; Function Attrs: uwtable
define hidden void @_ZNKSt3__123__system_error_category7messageEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::__system_error_category"* nocapture readnone %1, i32 %2) unnamed_addr #7 align 2 {
  %4 = icmp sgt i32 %2, 4095
  br i1 %4, label %5, label %10

5:                                                ; preds = %3
  %6 = tail call noalias nonnull dereferenceable(48) i8* @_Znwm(i64 48) #25
  %7 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %6, i8** %7, align 8, !tbaa !17
  %8 = bitcast %"class.std::__1::basic_string"* %0 to <2 x i64>*
  store <2 x i64> <i64 49, i64 33>, <2 x i64>* %8, align 8, !tbaa !17
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(33) %6, i8* nonnull align 1 dereferenceable(33) getelementptr inbounds ([34 x i8], [34 x i8]* @.str.3, i64 0, i64 0), i64 33, i1 false) #22
  %9 = getelementptr inbounds i8, i8* %6, i64 33
  store i8 0, i8* %9, align 1, !tbaa !17
  br label %11

10:                                               ; preds = %3
  tail call void @_ZNKSt3__112__do_message7messageEi(%"class.std::__1::basic_string"* sret align 8 %0, %"class.std::__1::__do_message"* undef, i32 %2)
  br label %11

11:                                               ; preds = %10, %5
  ret void
}

; Function Attrs: nofree nounwind uwtable
define hidden { i32, %"class.std::__1::error_category"* } @_ZNKSt3__123__system_error_category23default_error_conditionEi(%"class.std::__1::__system_error_category"* nocapture readnone %0, i32 %1) unnamed_addr #8 align 2 {
  %3 = icmp sgt i32 %1, 4095
  br i1 %3, label %4, label %11

4:                                                ; preds = %2
  %5 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115system_categoryEvE1s to i8*) acquire, align 8
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %18, !prof !18

7:                                                ; preds = %4
  %8 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %18, label %10

10:                                               ; preds = %7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__system_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !3
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  br label %18

11:                                               ; preds = %2
  %12 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__116generic_categoryEvE1s to i8*) acquire, align 8
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %14, label %18, !prof !18

14:                                               ; preds = %11
  %15 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__116generic_categoryEvE1s) #22
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %17

17:                                               ; preds = %14
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__124__generic_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !3
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__116generic_categoryEvE1s) #22
  br label %18

18:                                               ; preds = %17, %14, %11, %10, %7, %4
  %19 = phi %"class.std::__1::error_category"* [ getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0), %4 ], [ getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0), %7 ], [ getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0), %10 ], [ getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0), %11 ], [ getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0), %14 ], [ getelementptr inbounds (%"class.std::__1::__generic_error_category", %"class.std::__1::__generic_error_category"* @_ZZNSt3__116generic_categoryEvE1s, i64 0, i32 0, i32 0), %17 ]
  %20 = insertvalue { i32, %"class.std::__1::error_category"* } undef, i32 %1, 0
  %21 = insertvalue { i32, %"class.std::__1::error_category"* } %20, %"class.std::__1::error_category"* %19, 1
  ret { i32, %"class.std::__1::error_category"* } %21
}

; Function Attrs: nofree nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() local_unnamed_addr #8 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115system_categoryEvE1s to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %7, !prof !18

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__system_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !3
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  br label %7

7:                                                ; preds = %3, %6, %0
  ret %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0)
}

; Function Attrs: uwtable
define void @_ZNKSt3__115error_condition7messageEv(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::error_condition"* nocapture readonly %1) local_unnamed_addr #7 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::error_condition", %"class.std::__1::error_condition"* %1, i64 0, i32 1
  %4 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %3, align 8, !tbaa !6
  %5 = getelementptr inbounds %"class.std::__1::error_condition", %"class.std::__1::error_condition"* %1, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa !19
  %7 = bitcast %"class.std::__1::error_category"* %4 to void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)***
  %8 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)**, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*** %7, align 8, !tbaa !3
  %9 = getelementptr inbounds void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %8, i64 6
  %10 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %9, align 8
  tail call void %10(%"class.std::__1::basic_string"* sret align 8 %0, %"class.std::__1::error_category"* %4, i32 %6)
  ret void
}

; Function Attrs: uwtable
define void @_ZNKSt3__110error_code7messageEv(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::error_code"* nocapture readonly %1) local_unnamed_addr #7 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  %4 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %3, align 8, !tbaa !11
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa !20
  %7 = bitcast %"class.std::__1::error_category"* %4 to void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)***
  %8 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)**, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*** %7, align 8, !tbaa !3
  %9 = getelementptr inbounds void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %8, i64 6
  %10 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %9, align 8
  tail call void %10(%"class.std::__1::basic_string"* sret align 8 %0, %"class.std::__1::error_category"* %4, i32 %6)
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* noalias nocapture sret align 8 %0, %"class.std::__1::error_code"* nocapture nonnull readonly align 8 dereferenceable(16) %1, %"class.std::__1::basic_string"* %2) local_unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa !20
  %7 = icmp eq i32 %6, 0
  %8 = bitcast %"class.std::__1::basic_string"* %2 to i8*
  br i1 %7, label %63, label %9

9:                                                ; preds = %3
  %10 = load i8, i8* %8, align 8, !tbaa !17
  %11 = and i8 %10, 1
  %12 = icmp eq i8 %11, 0
  br i1 %12, label %16, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !17
  br label %19

16:                                               ; preds = %9
  %17 = lshr i8 %10, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %13, %16
  %20 = phi i64 [ %15, %13 ], [ %18, %16 ]
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %25, label %22

22:                                               ; preds = %19
  %23 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %2, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i64 0, i64 0))
  %24 = load i32, i32* %5, align 8, !tbaa !20, !noalias !21
  br label %25

25:                                               ; preds = %22, %19
  %26 = phi i32 [ %24, %22 ], [ %6, %19 ]
  %27 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %27) #22
  %28 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  %29 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %28, align 8, !tbaa !11, !noalias !21
  %30 = bitcast %"class.std::__1::error_category"* %29 to void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)***
  %31 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)**, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*** %30, align 8, !tbaa !3, !noalias !21
  %32 = getelementptr inbounds void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %31, i64 6
  %33 = load void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)*, void (%"class.std::__1::basic_string"*, %"class.std::__1::error_category"*, i32)** %32, align 8, !noalias !21
  call void %33(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::error_category"* %29, i32 %26)
  %34 = load i8, i8* %27, align 8, !tbaa !17
  %35 = and i8 %34, 1
  %36 = icmp eq i8 %35, 0
  %37 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  %41 = bitcast %"class.std::__1::basic_string"* %4 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %42 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %41, i64 0, i32 1, i64 0
  %43 = lshr i8 %34, 1
  %44 = zext i8 %43 to i64
  %45 = select i1 %36, i8* %42, i8* %38
  %46 = select i1 %36, i64 %44, i64 %40
  %47 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %2, i8* %45, i64 %46)
          to label %48 unwind label %55

48:                                               ; preds = %25
  %49 = load i8, i8* %27, align 8, !tbaa !17
  %50 = and i8 %49, 1
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %54, label %52

52:                                               ; preds = %48
  %53 = load i8*, i8** %37, align 8, !tbaa !17
  call void @_ZdlPv(i8* %53) #26
  br label %54

54:                                               ; preds = %48, %52
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %27) #22
  br label %63

55:                                               ; preds = %25
  %56 = landingpad { i8*, i32 }
          cleanup
  %57 = load i8, i8* %27, align 8, !tbaa !17
  %58 = and i8 %57, 1
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %62, label %60

60:                                               ; preds = %55
  %61 = load i8*, i8** %37, align 8, !tbaa !17
  call void @_ZdlPv(i8* %61) #26
  br label %62

62:                                               ; preds = %55, %60
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %27) #22
  resume { i8*, i32 } %56

63:                                               ; preds = %3, %54
  %64 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %64, i8* nonnull align 8 dereferenceable(24) %8, i64 24, i1 false) #22
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %8, i8 0, i64 24, i1 false) #22
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* %2, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"class.std::__1::error_code", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 0
  store i32 %1, i32* %8, align 8
  %9 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %9, align 8
  %10 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #22
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %7, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %6, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %5, %"class.std::__1::basic_string"* nonnull %7)
          to label %11 unwind label %33

11:                                               ; preds = %4
  %12 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %12, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6)
          to label %13 unwind label %37

13:                                               ; preds = %11
  %14 = load i8, i8* %10, align 8, !tbaa !17
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %13
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !17
  call void @_ZdlPv(i8* %19) #26
  br label %20

20:                                               ; preds = %13, %17
  %21 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %22 = load i8, i8* %21, align 8, !tbaa !17
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8, !tbaa !17
  call void @_ZdlPv(i8* %27) #26
  br label %28

28:                                               ; preds = %20, %25
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #22
  %29 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %29, align 8, !tbaa !3
  %30 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1
  %31 = bitcast %"class.std::__1::error_code"* %30 to i8*
  %32 = bitcast %"class.std::__1::error_code"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %31, i8* nonnull align 8 dereferenceable(16) %32, i64 16, i1 false), !tbaa.struct !24
  ret void

33:                                               ; preds = %4
  %34 = landingpad { i8*, i32 }
          cleanup
  %35 = extractvalue { i8*, i32 } %34, 0
  %36 = extractvalue { i8*, i32 } %34, 1
  br label %47

37:                                               ; preds = %11
  %38 = landingpad { i8*, i32 }
          cleanup
  %39 = extractvalue { i8*, i32 } %38, 0
  %40 = extractvalue { i8*, i32 } %38, 1
  %41 = load i8, i8* %10, align 8, !tbaa !17
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %37
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !17
  call void @_ZdlPv(i8* %46) #26
  br label %47

47:                                               ; preds = %44, %37, %33
  %48 = phi i8* [ %35, %33 ], [ %39, %37 ], [ %39, %44 ]
  %49 = phi i32 [ %36, %33 ], [ %40, %37 ], [ %40, %44 ]
  %50 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %51 = load i8, i8* %50, align 8, !tbaa !17
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %57, label %54

54:                                               ; preds = %47
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !17
  call void @_ZdlPv(i8* %56) #26
  br label %57

57:                                               ; preds = %47, %54
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #22
  %58 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %59 = insertvalue { i8*, i32 } %58, i32 %49, 1
  resume { i8*, i32 } %59
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #10

declare void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #10

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2ENS_10error_codeEPKc(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* %2, i8* nocapture readonly %3) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"class.std::__1::error_code", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 0
  store i32 %1, i32* %8, align 8
  %9 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %9, align 8
  %10 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #22
  %11 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %3) #22
  %12 = icmp ugt i64 %11, -17
  br i1 %12, label %13, label %15

13:                                               ; preds = %4
  %14 = bitcast %"class.std::__1::basic_string"* %7 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* nonnull %14) #24
  unreachable

15:                                               ; preds = %4
  %16 = icmp ult i64 %11, 23
  br i1 %16, label %25, label %17

17:                                               ; preds = %15
  %18 = add nuw i64 %11, 16
  %19 = and i64 %18, -16
  %20 = tail call noalias nonnull i8* @_Znwm(i64 %19) #25
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %20, i8** %21, align 8, !tbaa !17
  %22 = or i64 %19, 1
  %23 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %22, i64* %23, align 8, !tbaa !17
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %11, i64* %24, align 8, !tbaa !17
  br label %32

25:                                               ; preds = %15
  %26 = trunc i64 %11 to i8
  %27 = shl nuw nsw i8 %26, 1
  %28 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  store i8 %27, i8* %28, align 8, !tbaa !17
  %29 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %30 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %29, i64 0, i32 1, i64 0
  %31 = icmp eq i64 %11, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %25, %17
  %33 = phi i8* [ %20, %17 ], [ %30, %25 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %33, i8* align 1 %3, i64 %11, i1 false) #22
  br label %34

34:                                               ; preds = %25, %32
  %35 = phi i8* [ %30, %25 ], [ %33, %32 ]
  %36 = getelementptr inbounds i8, i8* %35, i64 %11
  store i8 0, i8* %36, align 1, !tbaa !17
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %6, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %5, %"class.std::__1::basic_string"* nonnull %7)
          to label %37 unwind label %59

37:                                               ; preds = %34
  %38 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %38, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6)
          to label %39 unwind label %63

39:                                               ; preds = %37
  %40 = load i8, i8* %10, align 8, !tbaa !17
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %45 = load i8*, i8** %44, align 8, !tbaa !17
  call void @_ZdlPv(i8* %45) #26
  br label %46

46:                                               ; preds = %39, %43
  %47 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %48 = load i8, i8* %47, align 8, !tbaa !17
  %49 = and i8 %48, 1
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %54, label %51

51:                                               ; preds = %46
  %52 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %53 = load i8*, i8** %52, align 8, !tbaa !17
  call void @_ZdlPv(i8* %53) #26
  br label %54

54:                                               ; preds = %46, %51
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #22
  %55 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %55, align 8, !tbaa !3
  %56 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1
  %57 = bitcast %"class.std::__1::error_code"* %56 to i8*
  %58 = bitcast %"class.std::__1::error_code"* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %57, i8* nonnull align 8 dereferenceable(16) %58, i64 16, i1 false), !tbaa.struct !24
  ret void

59:                                               ; preds = %34
  %60 = landingpad { i8*, i32 }
          cleanup
  %61 = extractvalue { i8*, i32 } %60, 0
  %62 = extractvalue { i8*, i32 } %60, 1
  br label %73

63:                                               ; preds = %37
  %64 = landingpad { i8*, i32 }
          cleanup
  %65 = extractvalue { i8*, i32 } %64, 0
  %66 = extractvalue { i8*, i32 } %64, 1
  %67 = load i8, i8* %10, align 8, !tbaa !17
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %63
  %71 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !17
  call void @_ZdlPv(i8* %72) #26
  br label %73

73:                                               ; preds = %70, %63, %59
  %74 = phi i8* [ %61, %59 ], [ %65, %63 ], [ %65, %70 ]
  %75 = phi i32 [ %62, %59 ], [ %66, %63 ], [ %66, %70 ]
  %76 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %77 = load i8, i8* %76, align 8, !tbaa !17
  %78 = and i8 %77, 1
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %83, label %80

80:                                               ; preds = %73
  %81 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %82 = load i8*, i8** %81, align 8, !tbaa !17
  call void @_ZdlPv(i8* %82) #26
  br label %83

83:                                               ; preds = %73, %80
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #22
  %84 = insertvalue { i8*, i32 } undef, i8* %74, 0
  %85 = insertvalue { i8*, i32 } %84, i32 %75, 1
  resume { i8*, i32 } %85
}

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2ENS_10error_codeE(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* %2) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::error_code", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 0
  store i32 %1, i32* %7, align 8
  %8 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %8, align 8
  %9 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %9) #22
  %10 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  store i8 0, i8* %10, align 8, !tbaa !17
  %11 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %12 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %11, i64 0, i32 1, i64 0
  store i8 0, i8* %12, align 1, !tbaa !17
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %4, %"class.std::__1::basic_string"* nonnull %6)
          to label %13 unwind label %34

13:                                               ; preds = %3
  %14 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %14, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %15 unwind label %38

15:                                               ; preds = %13
  %16 = load i8, i8* %9, align 8, !tbaa !17
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %22, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %21 = load i8*, i8** %20, align 8, !tbaa !17
  call void @_ZdlPv(i8* %21) #26
  br label %22

22:                                               ; preds = %15, %19
  %23 = load i8, i8* %10, align 8, !tbaa !17
  %24 = and i8 %23, 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %22
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %28 = load i8*, i8** %27, align 8, !tbaa !17
  call void @_ZdlPv(i8* %28) #26
  br label %29

29:                                               ; preds = %22, %26
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #22
  %30 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %30, align 8, !tbaa !3
  %31 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1
  %32 = bitcast %"class.std::__1::error_code"* %31 to i8*
  %33 = bitcast %"class.std::__1::error_code"* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %32, i8* nonnull align 8 dereferenceable(16) %33, i64 16, i1 false), !tbaa.struct !24
  ret void

34:                                               ; preds = %3
  %35 = landingpad { i8*, i32 }
          cleanup
  %36 = extractvalue { i8*, i32 } %35, 0
  %37 = extractvalue { i8*, i32 } %35, 1
  br label %48

38:                                               ; preds = %13
  %39 = landingpad { i8*, i32 }
          cleanup
  %40 = extractvalue { i8*, i32 } %39, 0
  %41 = extractvalue { i8*, i32 } %39, 1
  %42 = load i8, i8* %9, align 8, !tbaa !17
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %38
  %46 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %47 = load i8*, i8** %46, align 8, !tbaa !17
  call void @_ZdlPv(i8* %47) #26
  br label %48

48:                                               ; preds = %45, %38, %34
  %49 = phi i8* [ %36, %34 ], [ %40, %38 ], [ %40, %45 ]
  %50 = phi i32 [ %37, %34 ], [ %41, %38 ], [ %41, %45 ]
  %51 = load i8, i8* %10, align 8, !tbaa !17
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %57, label %54

54:                                               ; preds = %48
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !17
  call void @_ZdlPv(i8* %56) #26
  br label %57

57:                                               ; preds = %48, %54
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #22
  %58 = insertvalue { i8*, i32 } undef, i8* %49, 0
  %59 = insertvalue { i8*, i32 } %58, i32 %50, 1
  resume { i8*, i32 } %59
}

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2EiRKNS_14error_categoryERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* nonnull align 8 dereferenceable(8) %2, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::error_code", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #22
  %9 = bitcast %"class.std::__1::error_code"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #22
  %10 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 0
  store i32 %1, i32* %10, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %11, align 8, !tbaa !11
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %7, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6, %"class.std::__1::basic_string"* nonnull %7)
          to label %12 unwind label %33

12:                                               ; preds = %4
  %13 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %13, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %14 unwind label %37

14:                                               ; preds = %12
  %15 = load i8, i8* %8, align 8, !tbaa !17
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %14
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !17
  call void @_ZdlPv(i8* %20) #26
  br label %21

21:                                               ; preds = %14, %18
  %22 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %23 = load i8, i8* %22, align 8, !tbaa !17
  %24 = and i8 %23, 1
  %25 = icmp eq i8 %24, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %28 = load i8*, i8** %27, align 8, !tbaa !17
  call void @_ZdlPv(i8* %28) #26
  br label %29

29:                                               ; preds = %21, %26
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #22
  %30 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %30, align 8, !tbaa !3
  %31 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 0
  store i32 %1, i32* %31, align 8, !tbaa !20
  %32 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %32, align 8, !tbaa !11
  ret void

33:                                               ; preds = %4
  %34 = landingpad { i8*, i32 }
          cleanup
  %35 = extractvalue { i8*, i32 } %34, 0
  %36 = extractvalue { i8*, i32 } %34, 1
  br label %47

37:                                               ; preds = %12
  %38 = landingpad { i8*, i32 }
          cleanup
  %39 = extractvalue { i8*, i32 } %38, 0
  %40 = extractvalue { i8*, i32 } %38, 1
  %41 = load i8, i8* %8, align 8, !tbaa !17
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %37
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !17
  call void @_ZdlPv(i8* %46) #26
  br label %47

47:                                               ; preds = %44, %37, %33
  %48 = phi i8* [ %35, %33 ], [ %39, %37 ], [ %39, %44 ]
  %49 = phi i32 [ %36, %33 ], [ %40, %37 ], [ %40, %44 ]
  %50 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %51 = load i8, i8* %50, align 8, !tbaa !17
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %57, label %54

54:                                               ; preds = %47
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !17
  call void @_ZdlPv(i8* %56) #26
  br label %57

57:                                               ; preds = %47, %54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #22
  %58 = insertvalue { i8*, i32 } undef, i8* %48, 0
  %59 = insertvalue { i8*, i32 } %58, i32 %49, 1
  resume { i8*, i32 } %59
}

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2EiRKNS_14error_categoryEPKc(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* nonnull align 8 dereferenceable(8) %2, i8* nocapture readonly %3) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::error_code", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #22
  %9 = bitcast %"class.std::__1::error_code"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %9) #22
  %10 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 0
  store i32 %1, i32* %10, align 8, !tbaa !20
  %11 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %11, align 8, !tbaa !11
  %12 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %3) #22
  %13 = icmp ugt i64 %12, -17
  br i1 %13, label %14, label %16

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %7 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* nonnull %15) #24
  unreachable

16:                                               ; preds = %4
  %17 = icmp ult i64 %12, 23
  br i1 %17, label %26, label %18

18:                                               ; preds = %16
  %19 = add nuw i64 %12, 16
  %20 = and i64 %19, -16
  %21 = tail call noalias nonnull i8* @_Znwm(i64 %20) #25
  %22 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %21, i8** %22, align 8, !tbaa !17
  %23 = or i64 %20, 1
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %23, i64* %24, align 8, !tbaa !17
  %25 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %12, i64* %25, align 8, !tbaa !17
  br label %33

26:                                               ; preds = %16
  %27 = trunc i64 %12 to i8
  %28 = shl nuw nsw i8 %27, 1
  %29 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  store i8 %28, i8* %29, align 8, !tbaa !17
  %30 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %31 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %30, i64 0, i32 1, i64 0
  %32 = icmp eq i64 %12, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %26, %18
  %34 = phi i8* [ %21, %18 ], [ %31, %26 ]
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %34, i8* align 1 %3, i64 %12, i1 false) #22
  br label %35

35:                                               ; preds = %26, %33
  %36 = phi i8* [ %31, %26 ], [ %34, %33 ]
  %37 = getelementptr inbounds i8, i8* %36, i64 %12
  store i8 0, i8* %37, align 1, !tbaa !17
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6, %"class.std::__1::basic_string"* nonnull %7)
          to label %38 unwind label %59

38:                                               ; preds = %35
  %39 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %39, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %40 unwind label %63

40:                                               ; preds = %38
  %41 = load i8, i8* %8, align 8, !tbaa !17
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !17
  call void @_ZdlPv(i8* %46) #26
  br label %47

47:                                               ; preds = %40, %44
  %48 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %49 = load i8, i8* %48, align 8, !tbaa !17
  %50 = and i8 %49, 1
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %47
  %53 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %54 = load i8*, i8** %53, align 8, !tbaa !17
  call void @_ZdlPv(i8* %54) #26
  br label %55

55:                                               ; preds = %47, %52
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #22
  %56 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %56, align 8, !tbaa !3
  %57 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 0
  store i32 %1, i32* %57, align 8, !tbaa !20
  %58 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %58, align 8, !tbaa !11
  ret void

59:                                               ; preds = %35
  %60 = landingpad { i8*, i32 }
          cleanup
  %61 = extractvalue { i8*, i32 } %60, 0
  %62 = extractvalue { i8*, i32 } %60, 1
  br label %73

63:                                               ; preds = %38
  %64 = landingpad { i8*, i32 }
          cleanup
  %65 = extractvalue { i8*, i32 } %64, 0
  %66 = extractvalue { i8*, i32 } %64, 1
  %67 = load i8, i8* %8, align 8, !tbaa !17
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %63
  %71 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !17
  call void @_ZdlPv(i8* %72) #26
  br label %73

73:                                               ; preds = %70, %63, %59
  %74 = phi i8* [ %61, %59 ], [ %65, %63 ], [ %65, %70 ]
  %75 = phi i32 [ %62, %59 ], [ %66, %63 ], [ %66, %70 ]
  %76 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  %77 = load i8, i8* %76, align 8, !tbaa !17
  %78 = and i8 %77, 1
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %83, label %80

80:                                               ; preds = %73
  %81 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %82 = load i8*, i8** %81, align 8, !tbaa !17
  call void @_ZdlPv(i8* %82) #26
  br label %83

83:                                               ; preds = %73, %80
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %9) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #22
  %84 = insertvalue { i8*, i32 } undef, i8* %74, 0
  %85 = insertvalue { i8*, i32 } %84, i32 %75, 1
  resume { i8*, i32 } %85
}

; Function Attrs: uwtable
define void @_ZNSt3__112system_errorC2EiRKNS_14error_categoryE(%"class.std::__1::system_error"* %0, i32 %1, %"class.std::__1::error_category"* nonnull align 8 dereferenceable(8) %2) unnamed_addr #7 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::error_code", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #22
  %8 = bitcast %"class.std::__1::error_code"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #22
  %9 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 0
  store i32 %1, i32* %9, align 8, !tbaa !20
  %10 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %5, i64 0, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %10, align 8, !tbaa !11
  %11 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  store i8 0, i8* %11, align 8, !tbaa !17
  %12 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %13 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %12, i64 0, i32 1, i64 0
  store i8 0, i8* %13, align 1, !tbaa !17
  invoke void @_ZNSt3__112system_error6__initERKNS_10error_codeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %5, %"class.std::__1::basic_string"* nonnull %6)
          to label %14 unwind label %34

14:                                               ; preds = %3
  %15 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  invoke void @_ZNSt13runtime_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::runtime_error"* %15, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %16 unwind label %38

16:                                               ; preds = %14
  %17 = load i8, i8* %7, align 8, !tbaa !17
  %18 = and i8 %17, 1
  %19 = icmp eq i8 %18, 0
  br i1 %19, label %23, label %20

20:                                               ; preds = %16
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !17
  call void @_ZdlPv(i8* %22) #26
  br label %23

23:                                               ; preds = %16, %20
  %24 = load i8, i8* %11, align 8, !tbaa !17
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %23
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i8*, i8** %28, align 8, !tbaa !17
  call void @_ZdlPv(i8* %29) #26
  br label %30

30:                                               ; preds = %23, %27
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #22
  %31 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__112system_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %31, align 8, !tbaa !3
  %32 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 0
  store i32 %1, i32* %32, align 8, !tbaa !20
  %33 = getelementptr inbounds %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 1, i32 1
  store %"class.std::__1::error_category"* %2, %"class.std::__1::error_category"** %33, align 8, !tbaa !11
  ret void

34:                                               ; preds = %3
  %35 = landingpad { i8*, i32 }
          cleanup
  %36 = extractvalue { i8*, i32 } %35, 0
  %37 = extractvalue { i8*, i32 } %35, 1
  br label %48

38:                                               ; preds = %14
  %39 = landingpad { i8*, i32 }
          cleanup
  %40 = extractvalue { i8*, i32 } %39, 0
  %41 = extractvalue { i8*, i32 } %39, 1
  %42 = load i8, i8* %7, align 8, !tbaa !17
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %38
  %46 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %47 = load i8*, i8** %46, align 8, !tbaa !17
  call void @_ZdlPv(i8* %47) #26
  br label %48

48:                                               ; preds = %45, %38, %34
  %49 = phi i8* [ %36, %34 ], [ %40, %38 ], [ %40, %45 ]
  %50 = phi i32 [ %37, %34 ], [ %41, %38 ], [ %41, %45 ]
  %51 = load i8, i8* %11, align 8, !tbaa !17
  %52 = and i8 %51, 1
  %53 = icmp eq i8 %52, 0
  br i1 %53, label %57, label %54

54:                                               ; preds = %48
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !17
  call void @_ZdlPv(i8* %56) #26
  br label %57

57:                                               ; preds = %48, %54
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #22
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #22
  %58 = insertvalue { i8*, i32 } undef, i8* %49, 0
  %59 = insertvalue { i8*, i32 } %58, i32 %50, 1
  resume { i8*, i32 } %59
}

; Function Attrs: nounwind
declare void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"*) unnamed_addr #11

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %0) unnamed_addr #4 align 2 {
  %2 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"* %2) #22
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112system_errorD0Ev(%"class.std::__1::system_error"* %0) unnamed_addr #4 align 2 {
  %2 = getelementptr %"class.std::__1::system_error", %"class.std::__1::system_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"* %2) #22
  %3 = bitcast %"class.std::__1::system_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #26
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #12

; Function Attrs: noreturn uwtable
define void @_ZNSt3__120__throw_system_errorEiPKc(i32 %0, i8* nocapture readonly %1) local_unnamed_addr #13 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = tail call i8* @__cxa_allocate_exception(i64 32) #22
  %4 = bitcast i8* %3 to %"class.std::__1::system_error"*
  %5 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__115system_categoryEvE1s to i8*) acquire, align 8
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11, !prof !18

7:                                                ; preds = %2
  %8 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %11, label %10

10:                                               ; preds = %7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [9 x i8*] }, { [9 x i8*] }* @_ZTVNSt3__123__system_error_categoryE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0, i32 0), align 8, !tbaa !3
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__115system_categoryEvE1s) #22
  br label %11

11:                                               ; preds = %2, %7, %10
  invoke void @_ZNSt3__112system_errorC2ENS_10error_codeEPKc(%"class.std::__1::system_error"* %4, i32 %0, %"class.std::__1::error_category"* getelementptr inbounds (%"class.std::__1::__system_error_category", %"class.std::__1::__system_error_category"* @_ZZNSt3__115system_categoryEvE1s, i64 0, i32 0, i32 0), i8* %1)
          to label %12 unwind label %13

12:                                               ; preds = %11
  tail call void @__cxa_throw(i8* %3, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112system_errorE to i8*), i8* bitcast (void (%"class.std::__1::system_error"*)* @_ZNSt3__112system_errorD2Ev to i8*)) #24
  unreachable

13:                                               ; preds = %11
  %14 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %3) #22
  resume { i8*, i32 } %14
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

declare void @__cxa_free_exception(i8*) local_unnamed_addr

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__114error_categoryD2Ev(%"class.std::__1::error_category"* nocapture %0) unnamed_addr #3 align 2 {
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__112__do_messageD0Ev(%"class.std::__1::__do_message"* %0) unnamed_addr #14 comdat align 2 {
  tail call void @llvm.trap() #21
  unreachable
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__124__generic_error_categoryD0Ev(%"class.std::__1::__generic_error_category"* %0) unnamed_addr #14 comdat align 2 {
  %2 = bitcast %"class.std::__1::__generic_error_category"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #26
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__123__system_error_categoryD0Ev(%"class.std::__1::__system_error_category"* %0) unnamed_addr #14 comdat align 2 {
  %2 = bitcast %"class.std::__1::__system_error_category"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #26
  ret void
}

; Function Attrs: nounwind
declare i8* @_ZNKSt13runtime_error4whatEv(%"class.std::runtime_error"*) unnamed_addr #11

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #15

; Function Attrs: nounwind
declare i8* @strerror_r(i32, i8*, i64) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare i32 @snprintf(i8* noalias nocapture, i64, i8* nocapture readonly, ...) local_unnamed_addr #16

; Function Attrs: noreturn
declare void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"*) local_unnamed_addr #17

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #18

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #19

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"*, i8*) local_unnamed_addr #10

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"*, i8*, i64) local_unnamed_addr #10

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #20

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { cold noreturn nounwind }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind }
attributes #10 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #19 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #20 = { argmemonly nounwind willreturn writeonly }
attributes #21 = { noreturn nounwind }
attributes #22 = { nounwind }
attributes #23 = { nounwind readnone }
attributes #24 = { noreturn }
attributes #25 = { builtin allocsize(0) }
attributes #26 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !10, i64 8}
!7 = !{!"_ZTSNSt3__115error_conditionE", !8, i64 0, !10, i64 8}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !5, i64 0}
!10 = !{!"any pointer", !9, i64 0}
!11 = !{!12, !10, i64 8}
!12 = !{!"_ZTSNSt3__110error_codeE", !8, i64 0, !10, i64 8}
!13 = !{!14}
!14 = distinct !{!14, !15, !"_ZNSt3__112_GLOBAL__N_113do_strerror_rEi: argument 0"}
!15 = distinct !{!15, !"_ZNSt3__112_GLOBAL__N_113do_strerror_rEi"}
!16 = !{!8, !8, i64 0}
!17 = !{!9, !9, i64 0}
!18 = !{!"branch_weights", i32 1, i32 1048575}
!19 = !{!7, !8, i64 0}
!20 = !{!12, !8, i64 0}
!21 = !{!22}
!22 = distinct !{!22, !23, !"_ZNKSt3__110error_code7messageEv: argument 0"}
!23 = distinct !{!23, !"_ZNKSt3__110error_code7messageEv"}
!24 = !{i64 0, i64 4, !16, i64 8, i64 8, !25}
!25 = !{!10, !10, i64 0}

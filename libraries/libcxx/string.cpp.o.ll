; ModuleID = 'll/.string.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/string.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::allocator" = type { i8 }
%"class.std::__1::basic_string.3" = type { %"class.std::__1::__compressed_pair.4" }
%"class.std::__1::__compressed_pair.4" = type { %"struct.std::__1::__compressed_pair_elem.5" }
%"struct.std::__1::__compressed_pair_elem.5" = type { %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__rep" }
%"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__rep" = type { %union.anon.6 }
%union.anon.6 = type { %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__long" }
%"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__long" = type { i64, i64, i32* }
%"class.std::__1::allocator.9" = type { i8 }
%"class.std::__1::__basic_string_common" = type { i8 }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::out_of_range" = type { %"class.std::logic_error" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }
%"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short" = type { %union.anon.7, [5 x i32] }
%union.anon.7 = type { i32 }
%"class.std::invalid_argument" = type { %"class.std::logic_error" }

$_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv = comdat any

$_ZNSt3__120__throw_length_errorEPKc = comdat any

$_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv = comdat any

$_ZNSt3__120__throw_out_of_rangeEPKc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__grow_by_and_replaceEmmmmmmPKc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_ = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_RKS4_ = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED5Ev = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmmc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEmmmmmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKcm = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmmc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__shrink_or_extendEm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignERKS5_mm = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4copyEPcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_mmRKS4_ = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofEPKcmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEcm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEmc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5eraseEmm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendERKS5_mm = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEPKc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm = comdat any

$__clang_call_terminate = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEPKcmm = comdat any

$_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmRKS5_mm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_ = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmRKS5_mm = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertENS_11__wrap_iterIPKcEEc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmRKS5_mm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKwm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5rfindEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_ = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_RKS4_ = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE16find_last_not_ofEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEED5Ev = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE17find_first_not_ofEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmmw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEaSEw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEPKwm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE2atEm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKwm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE13find_first_ofEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmmw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEPKwm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7reserveEm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE18__shrink_or_extendEm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEPKwm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignERKS5_mm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4copyEPwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_mmRKS4_ = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4findEwm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEmw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKw = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE12find_last_ofEPKwmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9push_backEw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEmw = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5rfindEwm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEmw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5eraseEmm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendERKS5_mm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEPKw = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmPKwm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmPKw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE2atEm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEPKw = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4findEPKwmm = comdat any

$_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmRKS5_mm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEaSERKS5_ = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEPKw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmRKS5_mm = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertENS_11__wrap_iterIPKwEEw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmRKS5_mm = comdat any

$_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_ = comdat any

$_ZNSt12length_errorC2EPKc = comdat any

$_ZNSt12out_of_rangeC2EPKc = comdat any

$_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_ = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4nposE = comdat any

$_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4nposE = comdat any

@.str = private unnamed_addr constant [13 x i8] c"basic_string\00", align 1
@_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4nposE = weak_odr local_unnamed_addr constant i64 -1, comdat, align 8
@_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4nposE = weak_odr local_unnamed_addr constant i64 -1, comdat, align 8
@.str.3 = private unnamed_addr constant [6 x i8] c"stoul\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"stoll\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"stoull\00", align 1
@.str.8 = private unnamed_addr constant [6 x i8] c"stold\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"%Lf\00", align 1
@.str.11 = private unnamed_addr constant [3 x i32] [i32 37, i32 102, i32 0], align 4
@.str.12 = private unnamed_addr constant [4 x i32] [i32 37, i32 76, i32 102, i32 0], align 4
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8
@_ZTISt12out_of_range = external constant i8*
@_ZTVSt12out_of_range = external unnamed_addr constant { [5 x i8*] }, align 8
@.str.13 = private unnamed_addr constant [68 x i8] c"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size\00", align 1
@.str.14 = private unnamed_addr constant [16 x i8] c": no conversion\00", align 1
@_ZTISt16invalid_argument = external constant i8*
@_ZTVSt16invalid_argument = external unnamed_addr constant { [5 x i8*] }, align 8
@.str.15 = private unnamed_addr constant [15 x i8] c": out of range\00", align 1
@.str.16 = private unnamed_addr constant [20 x i8] c"string_view::substr\00", align 1
@_ZNSt3__16__itoaL10__pow10_32E = internal unnamed_addr constant [10 x i32] [i32 0, i32 10, i32 100, i32 1000, i32 10000, i32 100000, i32 1000000, i32 10000000, i32 100000000, i32 1000000000], align 16
@_ZNSt3__16__itoaL10__pow10_64E = internal unnamed_addr constant [20 x i64] [i64 0, i64 10, i64 100, i64 1000, i64 10000, i64 100000, i64 1000000, i64 10000000, i64 100000000, i64 1000000000, i64 10000000000, i64 100000000000, i64 1000000000000, i64 10000000000000, i64 100000000000000, i64 1000000000000000, i64 10000000000000000, i64 100000000000000000, i64 1000000000000000000, i64 -8446744073709551616], align 16

@_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*), void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*)* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_
@_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_RKS4_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*, %"class.std::__1::allocator"*), void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*, %"class.std::__1::allocator"*)* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_RKS4_
@_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED1Ev = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string"*), void (%"class.std::__1::basic_string"*)* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED2Ev
@_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_mmRKS4_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*, i64, i64, %"class.std::__1::allocator"*), void (%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"*, i64, i64, %"class.std::__1::allocator"*)* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_mmRKS4_
@_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC1ERKS5_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*), void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*)* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_
@_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC1ERKS5_RKS4_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*, %"class.std::__1::allocator.9"*), void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*, %"class.std::__1::allocator.9"*)* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_RKS4_
@_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEED1Ev = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string.3"*), void (%"class.std::__1::basic_string.3"*)* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEED2Ev
@_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC1ERKS5_mmRKS4_ = weak_odr unnamed_addr alias void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*, i64, i64, %"class.std::__1::allocator.9"*), void (%"class.std::__1::basic_string.3"*, %"class.std::__1::basic_string.3"*, i64, i64, %"class.std::__1::allocator.9"*)* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_mmRKS4_

; Function Attrs: noreturn uwtable
define weak_odr void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %0) local_unnamed_addr #0 comdat align 2 {
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)) #19
  unreachable
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorEPKc(i8* %0) local_unnamed_addr #1 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #20
  %3 = bitcast i8* %2 to %"class.std::length_error"*
  invoke void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #19
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #20
  resume { i8*, i32 } %6
}

; Function Attrs: noreturn uwtable
define weak_odr void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %0) local_unnamed_addr #0 comdat align 2 {
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)) #19
  unreachable
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* %0) local_unnamed_addr #1 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #20
  %3 = bitcast i8* %2 to %"class.std::out_of_range"*
  invoke void @_ZNSt12out_of_rangeC2EPKc(%"class.std::out_of_range"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #20
  resume { i8*, i32 } %6
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %3, i64 %4) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  br i1 %13, label %18, label %20

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %27

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %10
  %21 = sub i64 %12, %1
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub nsw i64 22, %12
  %25 = add i64 %24, %23
  %26 = icmp ult i64 %25, %4
  br i1 %26, label %111, label %41

27:                                               ; preds = %14
  %28 = sub i64 %16, %1
  %29 = icmp ult i64 %28, %2
  %30 = select i1 %29, i64 %28, i64 %2
  %31 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !3
  %33 = and i64 %32, -2
  %34 = add i64 %33, -1
  %35 = sub i64 %30, %16
  %36 = add i64 %35, %34
  %37 = icmp ult i64 %36, %4
  br i1 %37, label %116, label %38

38:                                               ; preds = %27
  %39 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %40 = load i8*, i8** %39, align 8, !tbaa !3
  br label %44

41:                                               ; preds = %20
  %42 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %43 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %42, i64 0, i32 1, i64 0
  br label %44

44:                                               ; preds = %38, %41
  %45 = phi i64 [ %30, %38 ], [ %23, %41 ]
  %46 = phi i64 [ %28, %38 ], [ %21, %41 ]
  %47 = phi i64 [ %16, %38 ], [ %12, %41 ]
  %48 = phi i8* [ %40, %38 ], [ %43, %41 ]
  %49 = icmp eq i64 %45, %4
  br i1 %49, label %88, label %50

50:                                               ; preds = %44
  %51 = sub i64 %46, %45
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %88, label %53

53:                                               ; preds = %50
  %54 = icmp ugt i64 %45, %4
  %55 = getelementptr inbounds i8, i8* %48, i64 %1
  br i1 %54, label %56, label %59

56:                                               ; preds = %53
  %57 = icmp eq i64 %4, 0
  br i1 %57, label %85, label %58

58:                                               ; preds = %56
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %55, i8* align 1 %3, i64 %4, i1 false) #20
  br label %85

59:                                               ; preds = %53
  %60 = icmp ult i8* %55, %3
  %61 = getelementptr inbounds i8, i8* %48, i64 %47
  %62 = icmp ugt i8* %61, %3
  %63 = and i1 %60, %62
  br i1 %63, label %64, label %77

64:                                               ; preds = %59
  %65 = getelementptr inbounds i8, i8* %55, i64 %45
  %66 = icmp ugt i8* %65, %3
  br i1 %66, label %70, label %67

67:                                               ; preds = %64
  %68 = sub i64 %4, %45
  %69 = getelementptr inbounds i8, i8* %3, i64 %68
  br label %77

70:                                               ; preds = %64
  %71 = icmp eq i64 %45, 0
  br i1 %71, label %73, label %72

72:                                               ; preds = %70
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %55, i8* align 1 %3, i64 %45, i1 false) #20
  br label %73

73:                                               ; preds = %70, %72
  %74 = add i64 %45, %1
  %75 = getelementptr inbounds i8, i8* %3, i64 %4
  %76 = sub i64 %4, %45
  br label %77

77:                                               ; preds = %67, %73, %59
  %78 = phi i64 [ 0, %73 ], [ %45, %67 ], [ %45, %59 ]
  %79 = phi i64 [ %76, %73 ], [ %4, %67 ], [ %4, %59 ]
  %80 = phi i8* [ %75, %73 ], [ %69, %67 ], [ %3, %59 ]
  %81 = phi i64 [ %74, %73 ], [ %1, %67 ], [ %1, %59 ]
  %82 = getelementptr inbounds i8, i8* %48, i64 %81
  %83 = getelementptr inbounds i8, i8* %82, i64 %79
  %84 = getelementptr inbounds i8, i8* %82, i64 %78
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %83, i8* align 1 %84, i64 %51, i1 false) #20
  br label %88

85:                                               ; preds = %58, %56
  %86 = getelementptr inbounds i8, i8* %55, i64 %4
  %87 = getelementptr inbounds i8, i8* %55, i64 %45
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %86, i8* align 1 %87, i64 %51, i1 false) #20
  br label %96

88:                                               ; preds = %77, %50, %44
  %89 = phi i64 [ %4, %44 ], [ %78, %77 ], [ %45, %50 ]
  %90 = phi i64 [ %4, %44 ], [ %79, %77 ], [ %4, %50 ]
  %91 = phi i8* [ %3, %44 ], [ %80, %77 ], [ %3, %50 ]
  %92 = phi i64 [ %1, %44 ], [ %81, %77 ], [ %1, %50 ]
  %93 = icmp eq i64 %90, 0
  br i1 %93, label %96, label %94

94:                                               ; preds = %88
  %95 = getelementptr inbounds i8, i8* %48, i64 %92
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %95, i8* align 1 %91, i64 %90, i1 false) #20
  br label %96

96:                                               ; preds = %94, %88, %85
  %97 = phi i64 [ %45, %85 ], [ %89, %88 ], [ %89, %94 ]
  %98 = phi i64 [ %4, %85 ], [ 0, %88 ], [ %90, %94 ]
  %99 = sub i64 %98, %97
  %100 = add i64 %99, %47
  %101 = load i8, i8* %6, align 8, !tbaa !3
  %102 = and i8 %101, 1
  %103 = icmp eq i8 %102, 0
  br i1 %103, label %106, label %104

104:                                              ; preds = %96
  %105 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %100, i64* %105, align 8, !tbaa !3
  br label %109

106:                                              ; preds = %96
  %107 = trunc i64 %100 to i8
  %108 = shl i8 %107, 1
  store i8 %108, i8* %6, align 8, !tbaa !3
  br label %109

109:                                              ; preds = %104, %106
  %110 = getelementptr inbounds i8, i8* %48, i64 %100
  br label %173

111:                                              ; preds = %20
  %112 = add i64 %4, -22
  %113 = add i64 %112, %12
  %114 = sub i64 %113, %23
  %115 = icmp ugt i64 %114, -40
  br i1 %115, label %122, label %124

116:                                              ; preds = %27
  %117 = add i64 %16, %4
  %118 = sub i64 %117, %30
  %119 = sub i64 %118, %34
  %120 = sub i64 -17, %33
  %121 = icmp ult i64 %120, %119
  br i1 %121, label %122, label %127

122:                                              ; preds = %116, %111
  %123 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %123) #19
  unreachable

124:                                              ; preds = %111
  %125 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %126 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %125, i64 0, i32 1, i64 0
  br label %131

127:                                              ; preds = %116
  %128 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %129 = load i8*, i8** %128, align 8, !tbaa !3
  %130 = icmp ult i64 %34, 9223372036854775783
  br i1 %130, label %131, label %145

131:                                              ; preds = %124, %127
  %132 = phi i8* [ %126, %124 ], [ %129, %127 ]
  %133 = phi i64 [ %114, %124 ], [ %119, %127 ]
  %134 = phi i64 [ %23, %124 ], [ %30, %127 ]
  %135 = phi i64 [ %12, %124 ], [ %16, %127 ]
  %136 = phi i64 [ 22, %124 ], [ %34, %127 ]
  %137 = add i64 %136, %133
  %138 = shl nuw i64 %136, 1
  %139 = icmp ult i64 %137, %138
  %140 = select i1 %139, i64 %138, i64 %137
  %141 = add i64 %140, 16
  %142 = and i64 %141, -16
  %143 = icmp ult i64 %140, 23
  %144 = select i1 %143, i64 23, i64 %142
  br label %145

145:                                              ; preds = %131, %127
  %146 = phi i8* [ %132, %131 ], [ %129, %127 ]
  %147 = phi i64 [ %134, %131 ], [ %30, %127 ]
  %148 = phi i64 [ %135, %131 ], [ %16, %127 ]
  %149 = phi i64 [ %136, %131 ], [ %34, %127 ]
  %150 = phi i64 [ %144, %131 ], [ -17, %127 ]
  %151 = tail call noalias nonnull i8* @_Znwm(i64 %150) #21
  %152 = icmp eq i64 %1, 0
  br i1 %152, label %154, label %153

153:                                              ; preds = %145
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %151, i8* align 1 %146, i64 %1, i1 false) #20
  br label %154

154:                                              ; preds = %153, %145
  %155 = getelementptr inbounds i8, i8* %151, i64 %1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %155, i8* align 1 %3, i64 %4, i1 false) #20
  %156 = sub i64 %148, %147
  %157 = sub i64 %156, %1
  %158 = icmp eq i64 %157, 0
  br i1 %158, label %163, label %159

159:                                              ; preds = %154
  %160 = getelementptr inbounds i8, i8* %155, i64 %4
  %161 = getelementptr inbounds i8, i8* %146, i64 %1
  %162 = getelementptr inbounds i8, i8* %161, i64 %147
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %160, i8* align 1 %162, i64 %157, i1 false) #20
  br label %163

163:                                              ; preds = %159, %154
  %164 = icmp eq i64 %149, 22
  br i1 %164, label %166, label %165

165:                                              ; preds = %163
  tail call void @_ZdlPv(i8* %146) #22
  br label %166

166:                                              ; preds = %163, %165
  %167 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %151, i8** %167, align 8, !tbaa !3
  %168 = or i64 %150, 1
  %169 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %168, i64* %169, align 8, !tbaa !3
  %170 = add i64 %156, %4
  %171 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %170, i64* %171, align 8, !tbaa !3
  %172 = getelementptr inbounds i8, i8* %151, i64 %170
  br label %173

173:                                              ; preds = %166, %109
  %174 = phi i8* [ %172, %166 ], [ %110, %109 ]
  store i8 0, i8* %174, align 1, !tbaa !3
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE21__grow_by_and_replaceEmmmmmmPKc(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i8* %7) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %9 = sub i64 -18, %1
  %10 = icmp ult i64 %9, %2
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %12) #19
  unreachable

13:                                               ; preds = %8
  %14 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %15 = load i8, i8* %14, align 8, !tbaa !3
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %13
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !3
  br label %24

21:                                               ; preds = %13
  %22 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %23 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 0
  br label %24

24:                                               ; preds = %18, %21
  %25 = phi i8* [ %20, %18 ], [ %23, %21 ]
  %26 = icmp ult i64 %1, 9223372036854775783
  br i1 %26, label %27, label %36

27:                                               ; preds = %24
  %28 = add i64 %2, %1
  %29 = shl nuw i64 %1, 1
  %30 = icmp ult i64 %28, %29
  %31 = select i1 %30, i64 %29, i64 %28
  %32 = add i64 %31, 16
  %33 = and i64 %32, -16
  %34 = icmp ult i64 %31, 23
  %35 = select i1 %34, i64 23, i64 %33
  br label %36

36:                                               ; preds = %24, %27
  %37 = phi i64 [ %35, %27 ], [ -17, %24 ]
  %38 = tail call noalias nonnull i8* @_Znwm(i64 %37) #21
  %39 = icmp eq i64 %4, 0
  br i1 %39, label %41, label %40

40:                                               ; preds = %36
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %38, i8* align 1 %25, i64 %4, i1 false) #20
  br label %41

41:                                               ; preds = %36, %40
  %42 = icmp eq i64 %6, 0
  br i1 %42, label %45, label %43

43:                                               ; preds = %41
  %44 = getelementptr inbounds i8, i8* %38, i64 %4
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %44, i8* align 1 %7, i64 %6, i1 false) #20
  br label %45

45:                                               ; preds = %41, %43
  %46 = sub i64 %3, %5
  %47 = sub i64 %46, %4
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %54, label %49

49:                                               ; preds = %45
  %50 = getelementptr inbounds i8, i8* %38, i64 %4
  %51 = getelementptr inbounds i8, i8* %50, i64 %6
  %52 = getelementptr inbounds i8, i8* %25, i64 %4
  %53 = getelementptr inbounds i8, i8* %52, i64 %5
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %51, i8* align 1 %53, i64 %47, i1 false) #20
  br label %54

54:                                               ; preds = %45, %49
  %55 = icmp eq i64 %1, 22
  br i1 %55, label %57, label %56

56:                                               ; preds = %54
  tail call void @_ZdlPv(i8* %25) #22
  br label %57

57:                                               ; preds = %54, %56
  %58 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %38, i8** %58, align 8, !tbaa !3
  %59 = or i64 %37, 1
  %60 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %59, i64* %60, align 8, !tbaa !3
  %61 = add i64 %46, %6
  %62 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %61, i64* %62, align 8, !tbaa !3
  %63 = getelementptr inbounds i8, i8* %38, i64 %61
  store i8 0, i8* %63, align 1, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub i64 %21, %23
  %25 = icmp ugt i64 %24, %3
  %26 = add i64 %23, %3
  %27 = select i1 %25, i64 %26, i64 %21
  %28 = getelementptr inbounds i8, i8* %20, i64 %27
  %29 = icmp eq i64 %3, 0
  %30 = icmp slt i64 %27, %3
  %31 = or i1 %29, %30
  br i1 %31, label %59, label %32

32:                                               ; preds = %19
  %33 = getelementptr inbounds i8, i8* %1, i64 %3
  %34 = add nsw i64 %3, -1
  %35 = getelementptr inbounds i8, i8* %20, i64 %34
  %36 = getelementptr inbounds i8, i8* %33, i64 -1
  %37 = sub i64 1, %3
  br label %38

38:                                               ; preds = %46, %32
  %39 = phi i8* [ %28, %32 ], [ %42, %46 ]
  %40 = icmp eq i8* %35, %39
  br i1 %40, label %59, label %41

41:                                               ; preds = %38
  %42 = getelementptr inbounds i8, i8* %39, i64 -1
  %43 = load i8, i8* %42, align 1, !tbaa !3
  %44 = load i8, i8* %36, align 1, !tbaa !3
  %45 = icmp eq i8 %43, %44
  br i1 %45, label %47, label %46

46:                                               ; preds = %51, %41
  br label %38

47:                                               ; preds = %41, %51
  %48 = phi i8* [ %52, %51 ], [ %42, %41 ]
  %49 = phi i8* [ %54, %51 ], [ %36, %41 ]
  %50 = icmp eq i8* %49, %1
  br i1 %50, label %57, label %51

51:                                               ; preds = %47
  %52 = getelementptr inbounds i8, i8* %48, i64 -1
  %53 = load i8, i8* %52, align 1, !tbaa !3
  %54 = getelementptr inbounds i8, i8* %49, i64 -1
  %55 = load i8, i8* %54, align 1, !tbaa !3
  %56 = icmp eq i8 %53, %55
  br i1 %56, label %47, label %46

57:                                               ; preds = %47
  %58 = getelementptr i8, i8* %42, i64 %37
  br label %59

59:                                               ; preds = %38, %19, %57
  %60 = phi i8* [ %28, %19 ], [ %58, %57 ], [ %28, %38 ]
  %61 = icmp ne i64 %3, 0
  %62 = icmp eq i8* %60, %28
  %63 = and i1 %61, %62
  %64 = ptrtoint i8* %60 to i64
  %65 = ptrtoint i8* %20 to i64
  %66 = sub i64 %64, %65
  %67 = select i1 %63, i64 -1, i64 %66
  ret i64 %67
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #5 comdat align 2 {
  %5 = icmp ugt i64 %3, -17
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %7) #19
  unreachable

8:                                                ; preds = %4
  %9 = icmp ult i64 %3, 23
  br i1 %9, label %10, label %16

10:                                               ; preds = %8
  %11 = trunc i64 %2 to i8
  %12 = shl i8 %11, 1
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %12, i8* %13, align 8, !tbaa !3
  %14 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %14, i64 0, i32 1, i64 0
  br label %24

16:                                               ; preds = %8
  %17 = add nuw i64 %3, 16
  %18 = and i64 %17, -16
  %19 = tail call noalias nonnull i8* @_Znwm(i64 %18) #21
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %19, i8** %20, align 8, !tbaa !3
  %21 = or i64 %18, 1
  %22 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %21, i64* %22, align 8, !tbaa !3
  %23 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %23, align 8, !tbaa !3
  br label %24

24:                                               ; preds = %16, %10
  %25 = phi i8* [ %15, %10 ], [ %19, %16 ]
  %26 = icmp eq i64 %2, 0
  br i1 %26, label %28, label %27

27:                                               ; preds = %24
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %25, i8* align 1 %1, i64 %2, i1 false) #20
  br label %28

28:                                               ; preds = %24, %27
  %29 = getelementptr inbounds i8, i8* %25, i64 %2
  store i8 0, i8* %29, align 1, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_) align 2 {
  %3 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %8, i8* nonnull align 8 dereferenceable(24) %3, i64 24, i1 false), !tbaa.struct !6
  br label %36

9:                                                ; preds = %2
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ult i64 %13, 23
  br i1 %14, label %15, label %21

15:                                               ; preds = %9
  %16 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %17 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %16, i64 0, i32 1, i64 0
  %18 = trunc i64 %13 to i8
  %19 = shl nuw nsw i8 %18, 1
  %20 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %19, i8* %20, align 8, !tbaa !3
  br label %33

21:                                               ; preds = %9
  %22 = icmp ugt i64 %13, -17
  br i1 %22, label %23, label %25

23:                                               ; preds = %21
  %24 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %24) #19
  unreachable

25:                                               ; preds = %21
  %26 = add nuw i64 %13, 16
  %27 = and i64 %26, -16
  %28 = tail call noalias nonnull i8* @_Znwm(i64 %27) #21
  %29 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %28, i8** %29, align 8, !tbaa !3
  %30 = or i64 %27, 1
  %31 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %30, i64* %31, align 8, !tbaa !3
  %32 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %13, i64* %32, align 8, !tbaa !3
  br label %33

33:                                               ; preds = %15, %25
  %34 = phi i8* [ %17, %15 ], [ %28, %25 ]
  %35 = add nuw i64 %13, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %34, i8* align 1 %11, i64 %35, i1 false) #20
  br label %36

36:                                               ; preds = %33, %7
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKc(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %3) local_unnamed_addr #2 comdat align 2 {
  %5 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %3) #20
  %6 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %3, i64 %5)
  ret %"class.std::__1::basic_string"* %6
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_RKS4_(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::allocator"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_RKS4_) align 2 {
  %4 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %9, i8* nonnull align 8 dereferenceable(24) %4, i64 24, i1 false), !tbaa.struct !6
  br label %37

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = icmp ult i64 %14, 23
  br i1 %15, label %16, label %22

16:                                               ; preds = %10
  %17 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %18 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %17, i64 0, i32 1, i64 0
  %19 = trunc i64 %14 to i8
  %20 = shl nuw nsw i8 %19, 1
  %21 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %20, i8* %21, align 8, !tbaa !3
  br label %34

22:                                               ; preds = %10
  %23 = icmp ugt i64 %14, -17
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %25) #19
  unreachable

26:                                               ; preds = %22
  %27 = add nuw i64 %14, 16
  %28 = and i64 %27, -16
  %29 = tail call noalias nonnull i8* @_Znwm(i64 %28) #21
  %30 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %29, i8** %30, align 8, !tbaa !3
  %31 = or i64 %28, 1
  %32 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %31, i64* %32, align 8, !tbaa !3
  %33 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %14, i64* %33, align 8, !tbaa !3
  br label %34

34:                                               ; preds = %16, %26
  %35 = phi i8* [ %18, %16 ], [ %29, %26 ]
  %36 = add nuw i64 %14, 1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %35, i8* align 1 %12, i64 %36, i1 false) #20
  br label %37

37:                                               ; preds = %34, %8
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE16find_last_not_ofEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ugt i64 %21, %2
  %23 = add i64 %2, 1
  %24 = select i1 %22, i64 %23, i64 %21
  %25 = getelementptr inbounds i8, i8* %20, i64 %24
  %26 = icmp eq i64 %3, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %19
  %28 = icmp eq i64 %24, 0
  br i1 %28, label %45, label %29

29:                                               ; preds = %27
  %30 = getelementptr inbounds i8, i8* %25, i64 -1
  br label %40

31:                                               ; preds = %19, %34
  %32 = phi i8* [ %35, %34 ], [ %25, %19 ]
  %33 = icmp eq i8* %32, %20
  br i1 %33, label %45, label %34

34:                                               ; preds = %31
  %35 = getelementptr inbounds i8, i8* %32, i64 -1
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = zext i8 %36 to i32
  %38 = tail call i8* @memchr(i8* %1, i32 %37, i64 %3) #20
  %39 = icmp eq i8* %38, null
  br i1 %39, label %40, label %31

40:                                               ; preds = %34, %29
  %41 = phi i8* [ %30, %29 ], [ %35, %34 ]
  %42 = ptrtoint i8* %41 to i64
  %43 = ptrtoint i8* %20 to i64
  %44 = sub i64 %42, %43
  br label %45

45:                                               ; preds = %31, %27, %40
  %46 = phi i64 [ %44, %40 ], [ -1, %27 ], [ -1, %31 ]
  ret i64 %46
}

; Function Attrs: inlinehint nounwind uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED2Ev(%"class.std::__1::basic_string"* %0) unnamed_addr #6 comdat($_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED5Ev) align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %3 = load i8, i8* %2, align 8, !tbaa !3
  %4 = and i8 %3, 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %8 = load i8*, i8** %7, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %8) #22
  br label %9

9:                                                ; preds = %1, %6
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17find_first_not_ofEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ugt i64 %21, %2
  br i1 %22, label %23, label %41

23:                                               ; preds = %19
  %24 = getelementptr inbounds i8, i8* %20, i64 %21
  %25 = getelementptr inbounds i8, i8* %20, i64 %2
  %26 = icmp eq i64 %3, 0
  br i1 %26, label %36, label %27

27:                                               ; preds = %23, %33
  %28 = phi i8* [ %34, %33 ], [ %25, %23 ]
  %29 = load i8, i8* %28, align 1, !tbaa !3
  %30 = zext i8 %29 to i32
  %31 = tail call i8* @memchr(i8* %1, i32 %30, i64 %3) #20
  %32 = icmp eq i8* %31, null
  br i1 %32, label %36, label %33

33:                                               ; preds = %27
  %34 = getelementptr inbounds i8, i8* %28, i64 1
  %35 = icmp eq i8* %34, %24
  br i1 %35, label %41, label %27

36:                                               ; preds = %27, %23
  %37 = phi i8* [ %25, %23 ], [ %28, %27 ]
  %38 = ptrtoint i8* %37 to i64
  %39 = ptrtoint i8* %20 to i64
  %40 = sub i64 %38, %39
  br label %41

41:                                               ; preds = %33, %19, %36
  %42 = phi i64 [ %40, %36 ], [ -1, %19 ], [ -1, %33 ]
  ret i64 %42
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmmc(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8 signext %3) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %11 = load i64, i64* %10, align 8, !tbaa !3
  br label %15

12:                                               ; preds = %4
  %13 = lshr i8 %6, 1
  %14 = zext i8 %13 to i64
  br label %15

15:                                               ; preds = %9, %12
  %16 = phi i64 [ %11, %9 ], [ %14, %12 ]
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %15
  %21 = icmp eq i64 %2, 0
  br i1 %21, label %110, label %22

22:                                               ; preds = %20
  br i1 %8, label %23, label %26

23:                                               ; preds = %22
  %24 = sub i64 22, %16
  %25 = icmp ult i64 %24, %2
  br i1 %25, label %46, label %36

26:                                               ; preds = %22
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %28 = load i64, i64* %27, align 8, !tbaa !3
  %29 = and i64 %28, -2
  %30 = add i64 %29, -1
  %31 = sub i64 %30, %16
  %32 = icmp ult i64 %31, %2
  br i1 %32, label %50, label %33

33:                                               ; preds = %26
  %34 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %35 = load i8*, i8** %34, align 8, !tbaa !3
  br label %39

36:                                               ; preds = %23
  %37 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %38 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %37, i64 0, i32 1, i64 0
  br label %39

39:                                               ; preds = %33, %36
  %40 = phi i8* [ %35, %33 ], [ %38, %36 ]
  %41 = sub i64 %16, %1
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %96, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds i8, i8* %40, i64 %1
  %45 = getelementptr inbounds i8, i8* %44, i64 %2
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 1 %45, i8* align 1 %44, i64 %41, i1 false) #20
  br label %96

46:                                               ; preds = %23
  %47 = add i64 %16, %2
  %48 = add i64 %47, -22
  %49 = icmp ugt i64 %48, -39
  br i1 %49, label %55, label %57

50:                                               ; preds = %26
  %51 = add i64 %16, %2
  %52 = sub i64 %51, %30
  %53 = sub i64 -16, %29
  %54 = icmp ult i64 %53, %52
  br i1 %54, label %55, label %60

55:                                               ; preds = %50, %46
  %56 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %56) #19
  unreachable

57:                                               ; preds = %46
  %58 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %59 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %58, i64 0, i32 1, i64 0
  br label %64

60:                                               ; preds = %50
  %61 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %62 = load i8*, i8** %61, align 8, !tbaa !3
  %63 = icmp ult i64 %30, 9223372036854775783
  br i1 %63, label %64, label %75

64:                                               ; preds = %57, %60
  %65 = phi i8* [ %59, %57 ], [ %62, %60 ]
  %66 = phi i64 [ %47, %57 ], [ %51, %60 ]
  %67 = phi i64 [ 22, %57 ], [ %30, %60 ]
  %68 = shl nuw i64 %67, 1
  %69 = icmp ult i64 %66, %68
  %70 = select i1 %69, i64 %68, i64 %66
  %71 = add i64 %70, 16
  %72 = and i64 %71, -16
  %73 = icmp ult i64 %70, 23
  %74 = select i1 %73, i64 23, i64 %72
  br label %75

75:                                               ; preds = %64, %60
  %76 = phi i8* [ %65, %64 ], [ %62, %60 ]
  %77 = phi i64 [ %67, %64 ], [ %30, %60 ]
  %78 = phi i64 [ %74, %64 ], [ -17, %60 ]
  %79 = tail call noalias nonnull i8* @_Znwm(i64 %78) #21
  %80 = icmp eq i64 %1, 0
  br i1 %80, label %82, label %81

81:                                               ; preds = %75
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %79, i8* align 1 %76, i64 %1, i1 false) #20
  br label %82

82:                                               ; preds = %81, %75
  %83 = sub i64 %16, %1
  %84 = icmp eq i64 %83, 0
  br i1 %84, label %89, label %85

85:                                               ; preds = %82
  %86 = getelementptr inbounds i8, i8* %79, i64 %1
  %87 = getelementptr inbounds i8, i8* %86, i64 %2
  %88 = getelementptr inbounds i8, i8* %76, i64 %1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %87, i8* align 1 %88, i64 %83, i1 false) #20
  br label %89

89:                                               ; preds = %85, %82
  %90 = icmp eq i64 %77, 22
  br i1 %90, label %92, label %91

91:                                               ; preds = %89
  tail call void @_ZdlPv(i8* %76) #22
  br label %92

92:                                               ; preds = %89, %91
  %93 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %79, i8** %93, align 8, !tbaa !3
  %94 = or i64 %78, 1
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %94, i64* %95, align 8, !tbaa !3
  br label %96

96:                                               ; preds = %43, %39, %92
  %97 = phi i8* [ %79, %92 ], [ %40, %39 ], [ %40, %43 ]
  %98 = getelementptr inbounds i8, i8* %97, i64 %1
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %98, i8 %3, i64 %2, i1 false) #20
  %99 = add i64 %16, %2
  %100 = load i8, i8* %5, align 8, !tbaa !3
  %101 = and i8 %100, 1
  %102 = icmp eq i8 %101, 0
  br i1 %102, label %105, label %103

103:                                              ; preds = %96
  %104 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %99, i64* %104, align 8, !tbaa !3
  br label %108

105:                                              ; preds = %96
  %106 = trunc i64 %99 to i8
  %107 = shl i8 %106, 1
  store i8 %107, i8* %5, align 8, !tbaa !3
  br label %108

108:                                              ; preds = %103, %105
  %109 = getelementptr inbounds i8, i8* %97, i64 %99
  store i8 0, i8* %109, align 1, !tbaa !3
  br label %110

110:                                              ; preds = %20, %108
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %8 = sub i64 -17, %1
  %9 = icmp ult i64 %8, %2
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %7
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %12
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i8* [ %19, %17 ], [ %22, %20 ]
  %25 = icmp ult i64 %1, 9223372036854775783
  br i1 %25, label %26, label %35

26:                                               ; preds = %23
  %27 = add i64 %2, %1
  %28 = shl nuw i64 %1, 1
  %29 = icmp ult i64 %27, %28
  %30 = select i1 %29, i64 %28, i64 %27
  %31 = add i64 %30, 16
  %32 = and i64 %31, -16
  %33 = icmp ult i64 %30, 23
  %34 = select i1 %33, i64 23, i64 %32
  br label %35

35:                                               ; preds = %23, %26
  %36 = phi i64 [ %34, %26 ], [ -17, %23 ]
  %37 = tail call noalias nonnull i8* @_Znwm(i64 %36) #21
  %38 = icmp eq i64 %4, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %35
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %37, i8* align 1 %24, i64 %4, i1 false) #20
  br label %40

40:                                               ; preds = %35, %39
  %41 = sub i64 %3, %5
  %42 = sub i64 %41, %4
  %43 = icmp eq i64 %42, 0
  br i1 %43, label %49, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds i8, i8* %37, i64 %4
  %46 = getelementptr inbounds i8, i8* %45, i64 %6
  %47 = getelementptr inbounds i8, i8* %24, i64 %4
  %48 = getelementptr inbounds i8, i8* %47, i64 %5
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %46, i8* align 1 %48, i64 %42, i1 false) #20
  br label %49

49:                                               ; preds = %40, %44
  %50 = icmp eq i64 %1, 22
  br i1 %50, label %52, label %51

51:                                               ; preds = %49
  tail call void @_ZdlPv(i8* %24) #22
  br label %52

52:                                               ; preds = %49, %51
  %53 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %37, i8** %53, align 8, !tbaa !3
  %54 = or i64 %36, 1
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %54, i64* %55, align 8, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEc(%"class.std::__1::basic_string"* %0, i8 signext %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 1, i64* %10, align 8, !tbaa !3
  br label %14

11:                                               ; preds = %2
  %12 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %13 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %12, i64 0, i32 1, i64 0
  store i8 2, i8* %3, align 8, !tbaa !3
  br label %14

14:                                               ; preds = %11, %7
  %15 = phi i8* [ %9, %7 ], [ %13, %11 ]
  store i8 %1, i8* %15, align 1, !tbaa !3
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  store i8 0, i8* %16, align 1, !tbaa !3
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2) local_unnamed_addr #5 comdat align 2 {
  %4 = icmp ugt i64 %2, -17
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %6) #19
  unreachable

7:                                                ; preds = %3
  %8 = icmp ult i64 %2, 23
  br i1 %8, label %17, label %9

9:                                                ; preds = %7
  %10 = add nuw i64 %2, 16
  %11 = and i64 %10, -16
  %12 = tail call noalias nonnull i8* @_Znwm(i64 %11) #21
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %12, i8** %13, align 8, !tbaa !3
  %14 = or i64 %11, 1
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %14, i64* %15, align 8, !tbaa !3
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %16, align 8, !tbaa !3
  br label %24

17:                                               ; preds = %7
  %18 = trunc i64 %2 to i8
  %19 = shl nuw nsw i8 %18, 1
  %20 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %19, i8* %20, align 8, !tbaa !3
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  %23 = icmp eq i64 %2, 0
  br i1 %23, label %26, label %24

24:                                               ; preds = %9, %17
  %25 = phi i8* [ %12, %9 ], [ %22, %17 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %25, i8* align 1 %1, i64 %2, i1 false) #20
  br label %26

26:                                               ; preds = %17, %24
  %27 = phi i8* [ %22, %17 ], [ %25, %24 ]
  %28 = getelementptr inbounds i8, i8* %27, i64 %2
  store i8 0, i8* %28, align 1, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 1 dereferenceable(1) i8* @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEm(%"class.std::__1::basic_string"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp ugt i64 %9, %1
  br i1 %10, label %20, label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ugt i64 %13, %1
  br i1 %14, label %17, label %15

15:                                               ; preds = %11, %7
  %16 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %16) #19
  unreachable

17:                                               ; preds = %11
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %7
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i8* [ %19, %17 ], [ %22, %20 ]
  %25 = getelementptr inbounds i8, i8* %24, i64 %1
  ret i8* %25
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i8* %2, i64 %3) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %1
  br i1 %12, label %17, label %24

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load i64, i64* %20, align 8, !tbaa !3
  %22 = and i64 %21, -2
  %23 = add i64 %22, -1
  br label %24

24:                                               ; preds = %9, %19
  %25 = phi i64 [ %15, %19 ], [ %11, %9 ]
  %26 = phi i64 [ %23, %19 ], [ 22, %9 ]
  %27 = sub i64 %26, %25
  %28 = icmp ult i64 %27, %3
  br i1 %28, label %65, label %29

29:                                               ; preds = %24
  %30 = icmp eq i64 %3, 0
  br i1 %30, label %113, label %31

31:                                               ; preds = %29
  br i1 %8, label %35, label %32

32:                                               ; preds = %31
  %33 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8, !tbaa !3
  br label %38

35:                                               ; preds = %31
  %36 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %37 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %36, i64 0, i32 1, i64 0
  br label %38

38:                                               ; preds = %32, %35
  %39 = phi i8* [ %34, %32 ], [ %37, %35 ]
  %40 = sub i64 %25, %1
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %51, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i8, i8* %39, i64 %1
  %44 = icmp ule i8* %43, %2
  %45 = getelementptr inbounds i8, i8* %39, i64 %25
  %46 = icmp ugt i8* %45, %2
  %47 = and i1 %44, %46
  %48 = getelementptr inbounds i8, i8* %2, i64 %3
  %49 = select i1 %47, i8* %48, i8* %2
  %50 = getelementptr inbounds i8, i8* %43, i64 %3
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 1 %50, i8* align 1 %43, i64 %40, i1 false) #20
  br label %51

51:                                               ; preds = %38, %42
  %52 = phi i8* [ %49, %42 ], [ %2, %38 ]
  %53 = getelementptr inbounds i8, i8* %39, i64 %1
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %53, i8* align 1 %52, i64 %3, i1 false) #20
  %54 = add i64 %25, %3
  %55 = load i8, i8* %5, align 8, !tbaa !3
  %56 = and i8 %55, 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %60, label %58

58:                                               ; preds = %51
  %59 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %54, i64* %59, align 8, !tbaa !3
  br label %63

60:                                               ; preds = %51
  %61 = trunc i64 %54 to i8
  %62 = shl i8 %61, 1
  store i8 %62, i8* %5, align 8, !tbaa !3
  br label %63

63:                                               ; preds = %58, %60
  %64 = getelementptr inbounds i8, i8* %39, i64 %54
  br label %111

65:                                               ; preds = %24
  %66 = add i64 %25, %3
  %67 = sub i64 %66, %26
  %68 = sub i64 -18, %26
  %69 = icmp ult i64 %68, %67
  br i1 %69, label %70, label %72

70:                                               ; preds = %65
  %71 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %71) #19
  unreachable

72:                                               ; preds = %65
  br i1 %8, label %76, label %73

73:                                               ; preds = %72
  %74 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %75 = load i8*, i8** %74, align 8, !tbaa !3
  br label %79

76:                                               ; preds = %72
  %77 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %78 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %77, i64 0, i32 1, i64 0
  br label %79

79:                                               ; preds = %76, %73
  %80 = phi i8* [ %75, %73 ], [ %78, %76 ]
  %81 = icmp ult i64 %26, 9223372036854775783
  br i1 %81, label %82, label %90

82:                                               ; preds = %79
  %83 = shl nuw i64 %26, 1
  %84 = icmp ult i64 %66, %83
  %85 = select i1 %84, i64 %83, i64 %66
  %86 = add i64 %85, 16
  %87 = and i64 %86, -16
  %88 = icmp ult i64 %85, 23
  %89 = select i1 %88, i64 23, i64 %87
  br label %90

90:                                               ; preds = %82, %79
  %91 = phi i64 [ %89, %82 ], [ -17, %79 ]
  %92 = tail call noalias nonnull i8* @_Znwm(i64 %91) #21
  %93 = icmp eq i64 %1, 0
  br i1 %93, label %95, label %94

94:                                               ; preds = %90
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %92, i8* align 1 %80, i64 %1, i1 false) #20
  br label %95

95:                                               ; preds = %94, %90
  %96 = getelementptr inbounds i8, i8* %92, i64 %1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %96, i8* align 1 %2, i64 %3, i1 false) #20
  %97 = sub i64 %25, %1
  %98 = icmp eq i64 %97, 0
  br i1 %98, label %102, label %99

99:                                               ; preds = %95
  %100 = getelementptr inbounds i8, i8* %96, i64 %3
  %101 = getelementptr inbounds i8, i8* %80, i64 %1
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %100, i8* align 1 %101, i64 %97, i1 false) #20
  br label %102

102:                                              ; preds = %99, %95
  %103 = icmp eq i64 %26, 22
  br i1 %103, label %105, label %104

104:                                              ; preds = %102
  tail call void @_ZdlPv(i8* %80) #22
  br label %105

105:                                              ; preds = %102, %104
  %106 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %92, i8** %106, align 8, !tbaa !3
  %107 = or i64 %91, 1
  %108 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %107, i64* %108, align 8, !tbaa !3
  %109 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %66, i64* %109, align 8, !tbaa !3
  %110 = getelementptr inbounds i8, i8* %92, i64 %66
  br label %111

111:                                              ; preds = %105, %63
  %112 = phi i8* [ %64, %63 ], [ %110, %105 ]
  store i8 0, i8* %112, align 1, !tbaa !3
  br label %113

113:                                              ; preds = %111, %29
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE13find_first_ofEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ule i64 %21, %2
  %23 = icmp eq i64 %3, 0
  %24 = or i1 %23, %22
  br i1 %24, label %49, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds i8, i8* %20, i64 %2
  %27 = getelementptr inbounds i8, i8* %20, i64 %21
  %28 = getelementptr inbounds i8, i8* %1, i64 %3
  br label %29

29:                                               ; preds = %39, %25
  %30 = phi i8* [ %40, %39 ], [ %26, %25 ]
  %31 = load i8, i8* %30, align 1, !tbaa !3
  br label %34

32:                                               ; preds = %34
  %33 = icmp eq i8* %38, %28
  br i1 %33, label %39, label %34

34:                                               ; preds = %32, %29
  %35 = phi i8* [ %1, %29 ], [ %38, %32 ]
  %36 = load i8, i8* %35, align 1, !tbaa !3
  %37 = icmp eq i8 %31, %36
  %38 = getelementptr inbounds i8, i8* %35, i64 1
  br i1 %37, label %42, label %32

39:                                               ; preds = %32
  %40 = getelementptr inbounds i8, i8* %30, i64 1
  %41 = icmp eq i8* %40, %27
  br i1 %41, label %42, label %29

42:                                               ; preds = %39, %34
  %43 = phi i8* [ %30, %34 ], [ %27, %39 ]
  %44 = icmp eq i8* %43, %27
  %45 = ptrtoint i8* %43 to i64
  %46 = ptrtoint i8* %20 to i64
  %47 = sub i64 %45, %46
  %48 = select i1 %44, i64 -1, i64 %47
  br label %49

49:                                               ; preds = %19, %42
  %50 = phi i64 [ -1, %19 ], [ %48, %42 ]
  ret i64 %50
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmmc(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i64 %3, i8 signext %4) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  br i1 %13, label %18, label %20

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %27

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %10
  %21 = sub i64 %12, %1
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub nsw i64 22, %12
  %25 = add i64 %24, %23
  %26 = icmp ult i64 %25, %3
  br i1 %26, label %57, label %41

27:                                               ; preds = %14
  %28 = sub i64 %16, %1
  %29 = icmp ult i64 %28, %2
  %30 = select i1 %29, i64 %28, i64 %2
  %31 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !3
  %33 = and i64 %32, -2
  %34 = add i64 %33, -1
  %35 = sub i64 %30, %16
  %36 = add i64 %35, %34
  %37 = icmp ult i64 %36, %3
  br i1 %37, label %62, label %38

38:                                               ; preds = %27
  %39 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %40 = load i8*, i8** %39, align 8, !tbaa !3
  br label %44

41:                                               ; preds = %20
  %42 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %43 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %42, i64 0, i32 1, i64 0
  br label %44

44:                                               ; preds = %38, %41
  %45 = phi i64 [ %30, %38 ], [ %23, %41 ]
  %46 = phi i64 [ %28, %38 ], [ %21, %41 ]
  %47 = phi i64 [ %16, %38 ], [ %12, %41 ]
  %48 = phi i8* [ %40, %38 ], [ %43, %41 ]
  %49 = icmp eq i64 %45, %3
  br i1 %49, label %116, label %50

50:                                               ; preds = %44
  %51 = sub i64 %46, %45
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %116, label %53

53:                                               ; preds = %50
  %54 = getelementptr inbounds i8, i8* %48, i64 %1
  %55 = getelementptr inbounds i8, i8* %54, i64 %3
  %56 = getelementptr inbounds i8, i8* %54, i64 %45
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %55, i8* align 1 %56, i64 %51, i1 false) #20
  br label %116

57:                                               ; preds = %20
  %58 = add i64 %3, -22
  %59 = add i64 %58, %12
  %60 = sub i64 %59, %23
  %61 = icmp ugt i64 %60, -39
  br i1 %61, label %68, label %70

62:                                               ; preds = %27
  %63 = add i64 %16, %3
  %64 = sub i64 %63, %30
  %65 = sub i64 %64, %34
  %66 = sub i64 -16, %33
  %67 = icmp ult i64 %66, %65
  br i1 %67, label %68, label %73

68:                                               ; preds = %62, %57
  %69 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %69) #19
  unreachable

70:                                               ; preds = %57
  %71 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %72 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %71, i64 0, i32 1, i64 0
  br label %77

73:                                               ; preds = %62
  %74 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %75 = load i8*, i8** %74, align 8, !tbaa !3
  %76 = icmp ult i64 %34, 9223372036854775783
  br i1 %76, label %77, label %91

77:                                               ; preds = %70, %73
  %78 = phi i8* [ %72, %70 ], [ %75, %73 ]
  %79 = phi i64 [ %60, %70 ], [ %65, %73 ]
  %80 = phi i64 [ %23, %70 ], [ %30, %73 ]
  %81 = phi i64 [ %12, %70 ], [ %16, %73 ]
  %82 = phi i64 [ 22, %70 ], [ %34, %73 ]
  %83 = add i64 %82, %79
  %84 = shl nuw i64 %82, 1
  %85 = icmp ult i64 %83, %84
  %86 = select i1 %85, i64 %84, i64 %83
  %87 = add i64 %86, 16
  %88 = and i64 %87, -16
  %89 = icmp ult i64 %86, 23
  %90 = select i1 %89, i64 23, i64 %88
  br label %91

91:                                               ; preds = %77, %73
  %92 = phi i8* [ %78, %77 ], [ %75, %73 ]
  %93 = phi i64 [ %80, %77 ], [ %30, %73 ]
  %94 = phi i64 [ %81, %77 ], [ %16, %73 ]
  %95 = phi i64 [ %82, %77 ], [ %34, %73 ]
  %96 = phi i64 [ %90, %77 ], [ -17, %73 ]
  %97 = tail call noalias nonnull i8* @_Znwm(i64 %96) #21
  %98 = icmp eq i64 %1, 0
  br i1 %98, label %100, label %99

99:                                               ; preds = %91
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %97, i8* align 1 %92, i64 %1, i1 false) #20
  br label %100

100:                                              ; preds = %99, %91
  %101 = sub i64 %94, %93
  %102 = sub i64 %101, %1
  %103 = icmp eq i64 %102, 0
  br i1 %103, label %109, label %104

104:                                              ; preds = %100
  %105 = getelementptr inbounds i8, i8* %97, i64 %1
  %106 = getelementptr inbounds i8, i8* %105, i64 %3
  %107 = getelementptr inbounds i8, i8* %92, i64 %1
  %108 = getelementptr inbounds i8, i8* %107, i64 %93
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %106, i8* align 1 %108, i64 %102, i1 false) #20
  br label %109

109:                                              ; preds = %104, %100
  %110 = icmp eq i64 %95, 22
  br i1 %110, label %112, label %111

111:                                              ; preds = %109
  tail call void @_ZdlPv(i8* %92) #22
  br label %112

112:                                              ; preds = %111, %109
  %113 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %97, i8** %113, align 8, !tbaa !3
  %114 = or i64 %96, 1
  %115 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %114, i64* %115, align 8, !tbaa !3
  br label %118

116:                                              ; preds = %53, %50, %44
  %117 = icmp eq i64 %3, 0
  br i1 %117, label %123, label %118

118:                                              ; preds = %112, %116
  %119 = phi i8* [ %97, %112 ], [ %48, %116 ]
  %120 = phi i64 [ %94, %112 ], [ %47, %116 ]
  %121 = phi i64 [ %93, %112 ], [ %45, %116 ]
  %122 = getelementptr inbounds i8, i8* %119, i64 %1
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %122, i8 %4, i64 %3, i1 false) #20
  br label %123

123:                                              ; preds = %116, %118
  %124 = phi i8* [ %48, %116 ], [ %119, %118 ]
  %125 = phi i64 [ %47, %116 ], [ %120, %118 ]
  %126 = phi i64 [ %45, %116 ], [ %121, %118 ]
  %127 = sub i64 %3, %126
  %128 = add i64 %127, %125
  %129 = load i8, i8* %6, align 8, !tbaa !3
  %130 = and i8 %129, 1
  %131 = icmp eq i8 %130, 0
  br i1 %131, label %134, label %132

132:                                              ; preds = %123
  %133 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %128, i64* %133, align 8, !tbaa !3
  br label %137

134:                                              ; preds = %123
  %135 = trunc i64 %128 to i8
  %136 = shl i8 %135, 1
  store i8 %136, i8* %6, align 8, !tbaa !3
  br label %137

137:                                              ; preds = %132, %134
  %138 = getelementptr inbounds i8, i8* %124, i64 %128
  store i8 0, i8* %138, align 1, !tbaa !3
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2) local_unnamed_addr #2 comdat align 2 {
  %4 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2)
  ret %"class.std::__1::basic_string"* %4
}

; Function Attrs: uwtable
define linkonce_odr hidden nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = icmp ugt i64 %2, 22
  br i1 %9, label %36, label %19

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = icmp ult i64 %14, %2
  br i1 %15, label %39, label %16

16:                                               ; preds = %10
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8, !tbaa !3
  br label %22

19:                                               ; preds = %8
  %20 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %20, i64 0, i32 1, i64 0
  br label %22

22:                                               ; preds = %16, %19
  %23 = phi i8* [ %18, %16 ], [ %21, %19 ]
  %24 = icmp eq i64 %2, 0
  br i1 %24, label %26, label %25

25:                                               ; preds = %22
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %23, i8* align 1 %1, i64 %2, i1 false) #20
  br label %26

26:                                               ; preds = %22, %25
  %27 = getelementptr inbounds i8, i8* %23, i64 %2
  store i8 0, i8* %27, align 1, !tbaa !3
  %28 = load i8, i8* %4, align 8, !tbaa !3
  %29 = and i8 %28, 1
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %33, label %31

31:                                               ; preds = %26
  %32 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %32, align 8, !tbaa !3
  br label %75

33:                                               ; preds = %26
  %34 = trunc i64 %2 to i8
  %35 = shl i8 %34, 1
  store i8 %35, i8* %4, align 8, !tbaa !3
  br label %75

36:                                               ; preds = %8
  %37 = add i64 %2, -22
  %38 = icmp ugt i64 %37, -40
  br i1 %38, label %43, label %45

39:                                               ; preds = %10
  %40 = sub i64 %2, %14
  %41 = sub i64 -17, %13
  %42 = icmp ult i64 %41, %40
  br i1 %42, label %43, label %48

43:                                               ; preds = %39, %36
  %44 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %44) #19
  unreachable

45:                                               ; preds = %36
  %46 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %47 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %46, i64 0, i32 1, i64 0
  br label %52

48:                                               ; preds = %39
  %49 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %50 = load i8*, i8** %49, align 8, !tbaa !3
  %51 = icmp ult i64 %14, 9223372036854775783
  br i1 %51, label %52, label %62

52:                                               ; preds = %45, %48
  %53 = phi i8* [ %47, %45 ], [ %50, %48 ]
  %54 = phi i64 [ 22, %45 ], [ %14, %48 ]
  %55 = shl nuw i64 %54, 1
  %56 = icmp ugt i64 %55, %2
  %57 = select i1 %56, i64 %55, i64 %2
  %58 = add i64 %57, 16
  %59 = and i64 %58, -16
  %60 = icmp ult i64 %57, 23
  %61 = select i1 %60, i64 23, i64 %59
  br label %62

62:                                               ; preds = %52, %48
  %63 = phi i8* [ %53, %52 ], [ %50, %48 ]
  %64 = phi i64 [ %54, %52 ], [ %14, %48 ]
  %65 = phi i64 [ %61, %52 ], [ -17, %48 ]
  %66 = tail call noalias nonnull i8* @_Znwm(i64 %65) #21
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %66, i8* align 1 %1, i64 %2, i1 false) #20
  %67 = icmp eq i64 %64, 22
  br i1 %67, label %69, label %68

68:                                               ; preds = %62
  tail call void @_ZdlPv(i8* %63) #22
  br label %69

69:                                               ; preds = %62, %68
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %66, i8** %70, align 8, !tbaa !3
  %71 = or i64 %65, 1
  %72 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %71, i64* %72, align 8, !tbaa !3
  %73 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %73, align 8, !tbaa !3
  %74 = getelementptr inbounds i8, i8* %66, i64 %2
  store i8 0, i8* %74, align 1, !tbaa !3
  br label %75

75:                                               ; preds = %33, %31, %69
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7reserveEm(%"class.std::__1::basic_string"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = icmp ugt i64 %1, -17
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %5) #19
  unreachable

6:                                                ; preds = %2
  %7 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %6
  %12 = icmp ugt i64 %1, 22
  br i1 %12, label %22, label %43

13:                                               ; preds = %6
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = and i64 %15, -2
  %17 = add i64 %16, -1
  %18 = icmp ult i64 %17, %1
  br i1 %18, label %19, label %43

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %21 = load i64, i64* %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %11
  %23 = lshr i8 %8, 1
  %24 = zext i8 %23 to i64
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %21, %19 ], [ %24, %22 ]
  %27 = icmp ugt i64 %26, %1
  %28 = select i1 %27, i64 %26, i64 %1
  %29 = add i64 %28, 16
  %30 = and i64 %29, -16
  %31 = add i64 %30, -1
  %32 = icmp ugt i64 %28, 22
  %33 = select i1 %32, i64 %31, i64 22
  br i1 %10, label %39, label %34

34:                                               ; preds = %25
  %35 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %36 = load i64, i64* %35, align 8, !tbaa !3
  %37 = and i64 %36, -2
  %38 = add i64 %37, -1
  br label %39

39:                                               ; preds = %25, %34
  %40 = phi i64 [ %38, %34 ], [ 22, %25 ]
  %41 = icmp eq i64 %33, %40
  br i1 %41, label %43, label %42

42:                                               ; preds = %39
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__shrink_or_extendEm(%"class.std::__1::basic_string"* nonnull %0, i64 %33)
  br label %43

43:                                               ; preds = %13, %42, %39, %11
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE18__shrink_or_extendEm(%"class.std::__1::basic_string"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp eq i64 %1, 22
  br i1 %10, label %45, label %22

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = and i64 %13, -2
  %15 = add i64 %14, -1
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = icmp eq i64 %1, 22
  br i1 %18, label %19, label %22

19:                                               ; preds = %11
  %20 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %20, i64 0, i32 1, i64 0
  br label %50

22:                                               ; preds = %11, %7
  %23 = phi i64 [ %17, %11 ], [ %9, %7 ]
  %24 = phi i64 [ %15, %11 ], [ 22, %7 ]
  %25 = icmp ult i64 %24, %1
  %26 = add i64 %1, 1
  br i1 %25, label %27, label %29

27:                                               ; preds = %22
  %28 = tail call noalias nonnull i8* @_Znwm(i64 %26) #21
  br label %35

29:                                               ; preds = %22
  %30 = invoke noalias nonnull i8* @_Znwm(i64 %26) #21
          to label %35 unwind label %31

31:                                               ; preds = %29
  %32 = landingpad { i8*, i32 }
          catch i8* null
  %33 = extractvalue { i8*, i32 } %32, 0
  %34 = tail call i8* @__cxa_begin_catch(i8* %33) #20
  tail call void @__cxa_end_catch()
  br label %79

35:                                               ; preds = %29, %27
  %36 = phi i8* [ %28, %27 ], [ %30, %29 ]
  br i1 %6, label %40, label %37

37:                                               ; preds = %35
  %38 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %39 = load i64, i64* %38, align 8, !tbaa !3
  br label %50

40:                                               ; preds = %35
  %41 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %42 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %41, i64 0, i32 1, i64 0
  %43 = lshr i8 %4, 1
  %44 = zext i8 %43 to i64
  br label %57

45:                                               ; preds = %7
  %46 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %47 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %46, i64 0, i32 1, i64 0
  %48 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %49 = load i8*, i8** %48, align 8, !tbaa !3
  br label %57

50:                                               ; preds = %37, %19
  %51 = phi i64 [ %17, %19 ], [ %39, %37 ]
  %52 = phi i64 [ %17, %19 ], [ %23, %37 ]
  %53 = phi i8* [ %21, %19 ], [ %36, %37 ]
  %54 = phi i1 [ false, %19 ], [ true, %37 ]
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !3
  br label %57

57:                                               ; preds = %40, %45, %50
  %58 = phi i64 [ %52, %50 ], [ %9, %45 ], [ %23, %40 ]
  %59 = phi i8* [ %53, %50 ], [ %47, %45 ], [ %36, %40 ]
  %60 = phi i8* [ %56, %50 ], [ %49, %45 ], [ %42, %40 ]
  %61 = phi i1 [ %54, %50 ], [ false, %45 ], [ true, %40 ]
  %62 = phi i1 [ true, %50 ], [ true, %45 ], [ false, %40 ]
  %63 = phi i64 [ %51, %50 ], [ %9, %45 ], [ %44, %40 ]
  %64 = add i64 %63, 1
  %65 = icmp eq i64 %64, 0
  br i1 %65, label %67, label %66

66:                                               ; preds = %57
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %59, i8* align 1 %60, i64 %64, i1 false) #20
  br label %67

67:                                               ; preds = %57, %66
  br i1 %62, label %68, label %69

68:                                               ; preds = %67
  tail call void @_ZdlPv(i8* %60) #22
  br label %69

69:                                               ; preds = %68, %67
  br i1 %61, label %70, label %76

70:                                               ; preds = %69
  %71 = add i64 %1, 1
  %72 = or i64 %71, 1
  %73 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %72, i64* %73, align 8, !tbaa !3
  %74 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %58, i64* %74, align 8, !tbaa !3
  %75 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %59, i8** %75, align 8, !tbaa !3
  br label %79

76:                                               ; preds = %69
  %77 = trunc i64 %58 to i8
  %78 = shl i8 %77, 1
  store i8 %78, i8* %3, align 8, !tbaa !3
  br label %79

79:                                               ; preds = %70, %76, %31
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %15, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !3
  %11 = and i64 %10, -2
  %12 = add i64 %11, -1
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  br label %18

15:                                               ; preds = %3
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %15
  %19 = phi i64 [ %12, %8 ], [ 22, %15 ]
  %20 = phi i64 [ %14, %8 ], [ %17, %15 ]
  %21 = sub i64 %19, %20
  %22 = icmp ult i64 %21, %2
  br i1 %22, label %46, label %23

23:                                               ; preds = %18
  %24 = icmp eq i64 %2, 0
  br i1 %24, label %88, label %25

25:                                               ; preds = %23
  br i1 %7, label %29, label %26

26:                                               ; preds = %25
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %28 = load i8*, i8** %27, align 8, !tbaa !3
  br label %32

29:                                               ; preds = %25
  %30 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %31 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %30, i64 0, i32 1, i64 0
  br label %32

32:                                               ; preds = %26, %29
  %33 = phi i8* [ %28, %26 ], [ %31, %29 ]
  %34 = getelementptr inbounds i8, i8* %33, i64 %20
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %34, i8* align 1 %1, i64 %2, i1 false) #20
  %35 = add i64 %20, %2
  %36 = load i8, i8* %4, align 8, !tbaa !3
  %37 = and i8 %36, 1
  %38 = icmp eq i8 %37, 0
  br i1 %38, label %41, label %39

39:                                               ; preds = %32
  %40 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %35, i64* %40, align 8, !tbaa !3
  br label %44

41:                                               ; preds = %32
  %42 = trunc i64 %35 to i8
  %43 = shl i8 %42, 1
  store i8 %43, i8* %4, align 8, !tbaa !3
  br label %44

44:                                               ; preds = %39, %41
  %45 = getelementptr inbounds i8, i8* %33, i64 %35
  br label %86

46:                                               ; preds = %18
  %47 = add i64 %20, %2
  %48 = sub i64 %47, %19
  %49 = sub i64 -18, %19
  %50 = icmp ult i64 %49, %48
  br i1 %50, label %51, label %53

51:                                               ; preds = %46
  %52 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %52) #19
  unreachable

53:                                               ; preds = %46
  br i1 %7, label %57, label %54

54:                                               ; preds = %53
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i8*, i8** %55, align 8, !tbaa !3
  br label %60

57:                                               ; preds = %53
  %58 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %59 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %58, i64 0, i32 1, i64 0
  br label %60

60:                                               ; preds = %57, %54
  %61 = phi i8* [ %56, %54 ], [ %59, %57 ]
  %62 = icmp ult i64 %19, 9223372036854775783
  br i1 %62, label %63, label %71

63:                                               ; preds = %60
  %64 = shl nuw i64 %19, 1
  %65 = icmp ult i64 %47, %64
  %66 = select i1 %65, i64 %64, i64 %47
  %67 = add i64 %66, 16
  %68 = and i64 %67, -16
  %69 = icmp ult i64 %66, 23
  %70 = select i1 %69, i64 23, i64 %68
  br label %71

71:                                               ; preds = %63, %60
  %72 = phi i64 [ %70, %63 ], [ -17, %60 ]
  %73 = tail call noalias nonnull i8* @_Znwm(i64 %72) #21
  %74 = icmp eq i64 %20, 0
  br i1 %74, label %76, label %75

75:                                               ; preds = %71
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %73, i8* align 1 %61, i64 %20, i1 false) #20
  br label %76

76:                                               ; preds = %75, %71
  %77 = getelementptr inbounds i8, i8* %73, i64 %20
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %77, i8* align 1 %1, i64 %2, i1 false) #20
  %78 = icmp eq i64 %19, 22
  br i1 %78, label %80, label %79

79:                                               ; preds = %76
  tail call void @_ZdlPv(i8* %61) #22
  br label %80

80:                                               ; preds = %76, %79
  %81 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %73, i8** %81, align 8, !tbaa !3
  %82 = or i64 %72, 1
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %82, i64* %83, align 8, !tbaa !3
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %47, i64* %84, align 8, !tbaa !3
  %85 = getelementptr inbounds i8, i8* %73, i64 %47
  br label %86

86:                                               ; preds = %80, %44
  %87 = phi i8* [ %45, %44 ], [ %85, %80 ]
  store i8 0, i8* %87, align 1, !tbaa !3
  br label %88

88:                                               ; preds = %86, %23
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignERKS5_mm(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %2
  br i1 %12, label %17, label %22

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %2
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %9
  %23 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %24 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %23, i64 0, i32 1, i64 0
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %15, %19 ], [ %11, %22 ]
  %27 = phi i8* [ %21, %19 ], [ %24, %22 ]
  %28 = sub i64 %26, %2
  %29 = icmp ult i64 %28, %3
  %30 = select i1 %29, i64 %28, i64 %3
  %31 = getelementptr inbounds i8, i8* %27, i64 %2
  %32 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcm(%"class.std::__1::basic_string"* %0, i8* %31, i64 %30)
  ret %"class.std::__1::basic_string"* %32
}

; Function Attrs: uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4copyEPcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %3
  br i1 %12, label %17, label %25

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %3
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = sub i64 %15, %3
  %21 = icmp ult i64 %20, %2
  %22 = select i1 %21, i64 %20, i64 %2
  %23 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %24 = load i8*, i8** %23, align 8, !tbaa !3
  br label %31

25:                                               ; preds = %9
  %26 = sub i64 %11, %3
  %27 = icmp ult i64 %26, %2
  %28 = select i1 %27, i64 %26, i64 %2
  %29 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %30 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %29, i64 0, i32 1, i64 0
  br label %31

31:                                               ; preds = %19, %25
  %32 = phi i64 [ %22, %19 ], [ %28, %25 ]
  %33 = phi i8* [ %24, %19 ], [ %30, %25 ]
  %34 = icmp eq i64 %32, 0
  br i1 %34, label %37, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds i8, i8* %33, i64 %3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 %36, i64 %32, i1 false) #20
  br label %37

37:                                               ; preds = %31, %35
  ret i64 %32
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC2ERKS5_mmRKS4_(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3, %"class.std::__1::allocator"* nonnull align 1 dereferenceable(1) %4) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC5ERKS5_mmRKS4_) align 2 {
  %6 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %2
  br i1 %13, label %18, label %23

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %2
  br i1 %17, label %18, label %20

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %14
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  br label %26

23:                                               ; preds = %10
  %24 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %25 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %24, i64 0, i32 1, i64 0
  br label %26

26:                                               ; preds = %20, %23
  %27 = phi i64 [ %16, %20 ], [ %12, %23 ]
  %28 = phi i8* [ %22, %20 ], [ %25, %23 ]
  %29 = getelementptr inbounds i8, i8* %28, i64 %2
  %30 = sub i64 %27, %2
  %31 = icmp ult i64 %30, %3
  %32 = select i1 %31, i64 %30, i64 %3
  %33 = icmp ugt i64 %32, -17
  br i1 %33, label %34, label %36

34:                                               ; preds = %26
  %35 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %35) #19
  unreachable

36:                                               ; preds = %26
  %37 = icmp ult i64 %32, 23
  br i1 %37, label %46, label %38

38:                                               ; preds = %36
  %39 = add nuw i64 %32, 16
  %40 = and i64 %39, -16
  %41 = tail call noalias nonnull i8* @_Znwm(i64 %40) #21
  %42 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %41, i8** %42, align 8, !tbaa !3
  %43 = or i64 %40, 1
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %43, i64* %44, align 8, !tbaa !3
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %32, i64* %45, align 8, !tbaa !3
  br label %53

46:                                               ; preds = %36
  %47 = trunc i64 %32 to i8
  %48 = shl nuw nsw i8 %47, 1
  %49 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %48, i8* %49, align 8, !tbaa !3
  %50 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %50, i64 0, i32 1, i64 0
  %52 = icmp eq i64 %32, 0
  br i1 %52, label %55, label %53

53:                                               ; preds = %46, %38
  %54 = phi i8* [ %41, %38 ], [ %51, %46 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %54, i8* align 1 %29, i64 %32, i1 false) #20
  br label %55

55:                                               ; preds = %46, %53
  %56 = phi i8* [ %51, %46 ], [ %54, %53 ]
  %57 = getelementptr inbounds i8, i8* %56, i64 %32
  store i8 0, i8* %57, align 1, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEcm(%"class.std::__1::basic_string"* %0, i8 signext %1, i64 %2) local_unnamed_addr #4 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !3
  br label %18

13:                                               ; preds = %3
  %14 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %14, i64 0, i32 1, i64 0
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %13
  %19 = phi i8* [ %10, %8 ], [ %15, %13 ]
  %20 = phi i64 [ %12, %8 ], [ %17, %13 ]
  %21 = icmp ugt i64 %20, %2
  br i1 %21, label %22, label %36

22:                                               ; preds = %18
  %23 = sub i64 %20, %2
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %29, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds i8, i8* %19, i64 %2
  %27 = zext i8 %1 to i32
  %28 = tail call i8* @memchr(i8* %26, i32 %27, i64 %23) #20
  br label %29

29:                                               ; preds = %25, %22
  %30 = phi i8* [ %28, %25 ], [ null, %22 ]
  %31 = icmp eq i8* %30, null
  %32 = ptrtoint i8* %30 to i64
  %33 = ptrtoint i8* %19 to i64
  %34 = sub i64 %32, %33
  %35 = select i1 %31, i64 -1, i64 %34
  br label %36

36:                                               ; preds = %18, %29
  %37 = phi i64 [ -1, %18 ], [ %35, %29 ]
  ret i64 %37
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6__initEmc(%"class.std::__1::basic_string"* %0, i64 %1, i8 signext %2) local_unnamed_addr #5 comdat align 2 {
  %4 = icmp ugt i64 %1, -17
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %6) #19
  unreachable

7:                                                ; preds = %3
  %8 = icmp ult i64 %1, 23
  br i1 %8, label %17, label %9

9:                                                ; preds = %7
  %10 = add nuw i64 %1, 16
  %11 = and i64 %10, -16
  %12 = tail call noalias nonnull i8* @_Znwm(i64 %11) #21
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %12, i8** %13, align 8, !tbaa !3
  %14 = or i64 %11, 1
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %14, i64* %15, align 8, !tbaa !3
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %16, align 8, !tbaa !3
  br label %24

17:                                               ; preds = %7
  %18 = trunc i64 %1 to i8
  %19 = shl nuw nsw i8 %18, 1
  %20 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %19, i8* %20, align 8, !tbaa !3
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  %23 = icmp eq i64 %1, 0
  br i1 %23, label %26, label %24

24:                                               ; preds = %9, %17
  %25 = phi i8* [ %12, %9 ], [ %22, %17 ]
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 1 %25, i8 %2, i64 %1, i1 false) #20
  br label %26

26:                                               ; preds = %17, %24
  %27 = phi i8* [ %22, %17 ], [ %25, %24 ]
  %28 = getelementptr inbounds i8, i8* %27, i64 %1
  store i8 0, i8* %28, align 1, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc(%"class.std::__1::basic_string"* %0, i64 %1, i8* %2) local_unnamed_addr #2 comdat align 2 {
  %4 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %2) #20
  %5 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i8* %2, i64 %4)
  ret %"class.std::__1::basic_string"* %5
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE12find_last_ofEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp eq i64 %3, 0
  br i1 %22, label %41, label %23

23:                                               ; preds = %19
  %24 = icmp ugt i64 %21, %2
  %25 = add i64 %2, 1
  %26 = select i1 %24, i64 %25, i64 %21
  %27 = getelementptr inbounds i8, i8* %20, i64 %26
  br label %28

28:                                               ; preds = %31, %23
  %29 = phi i8* [ %27, %23 ], [ %32, %31 ]
  %30 = icmp eq i8* %29, %20
  br i1 %30, label %41, label %31

31:                                               ; preds = %28
  %32 = getelementptr inbounds i8, i8* %29, i64 -1
  %33 = load i8, i8* %32, align 1, !tbaa !3
  %34 = zext i8 %33 to i32
  %35 = tail call i8* @memchr(i8* %1, i32 %34, i64 %3) #20
  %36 = icmp eq i8* %35, null
  br i1 %36, label %28, label %37

37:                                               ; preds = %31
  %38 = ptrtoint i8* %32 to i64
  %39 = ptrtoint i8* %20 to i64
  %40 = sub i64 %38, %39
  br label %41

41:                                               ; preds = %28, %19, %37
  %42 = phi i64 [ -1, %19 ], [ %40, %37 ], [ -1, %28 ]
  ret i64 %42
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc(%"class.std::__1::basic_string"* %0, i8 signext %1) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %15, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = and i64 %9, -2
  %11 = add i64 %10, -1
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp eq i64 %13, %11
  br i1 %14, label %20, label %52

15:                                               ; preds = %2
  %16 = lshr i8 %4, 1
  %17 = icmp eq i8 %16, 22
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %18, i64 0, i32 1, i64 0
  br i1 %17, label %28, label %55

20:                                               ; preds = %7
  %21 = icmp eq i64 %11, -17
  br i1 %21, label %22, label %24

22:                                               ; preds = %20
  %23 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %23) #19
  unreachable

24:                                               ; preds = %20
  %25 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %26 = load i8*, i8** %25, align 8, !tbaa !3
  %27 = icmp ult i64 %11, 9223372036854775783
  br i1 %27, label %28, label %40

28:                                               ; preds = %15, %24
  %29 = phi i8* [ %26, %24 ], [ %19, %15 ]
  %30 = phi i64 [ %11, %24 ], [ 22, %15 ]
  %31 = phi i64 [ %13, %24 ], [ 22, %15 ]
  %32 = add nuw nsw i64 %30, 1
  %33 = shl nuw i64 %30, 1
  %34 = icmp ult i64 %32, %33
  %35 = select i1 %34, i64 %33, i64 %32
  %36 = add nuw i64 %35, 16
  %37 = and i64 %36, -16
  %38 = icmp ult i64 %35, 23
  %39 = select i1 %38, i64 23, i64 %37
  br label %40

40:                                               ; preds = %28, %24
  %41 = phi i8* [ %29, %28 ], [ %26, %24 ]
  %42 = phi i64 [ %30, %28 ], [ %11, %24 ]
  %43 = phi i64 [ %31, %28 ], [ %13, %24 ]
  %44 = phi i64 [ %39, %28 ], [ -17, %24 ]
  %45 = tail call noalias nonnull i8* @_Znwm(i64 %44) #21
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %45, i8* align 1 %41, i64 %42, i1 false) #20
  %46 = icmp eq i64 %42, 22
  br i1 %46, label %48, label %47

47:                                               ; preds = %40
  tail call void @_ZdlPv(i8* %41) #22
  br label %48

48:                                               ; preds = %40, %47
  %49 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %45, i8** %49, align 8, !tbaa !3
  %50 = or i64 %44, 1
  %51 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %50, i64* %51, align 8, !tbaa !3
  br label %59

52:                                               ; preds = %7
  %53 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %54 = load i8*, i8** %53, align 8, !tbaa !3
  br label %59

55:                                               ; preds = %15
  %56 = zext i8 %16 to i64
  %57 = add i8 %4, 2
  %58 = and i8 %57, -2
  store i8 %58, i8* %3, align 8, !tbaa !3
  br label %64

59:                                               ; preds = %48, %52
  %60 = phi i64 [ %13, %52 ], [ %43, %48 ]
  %61 = phi i8* [ %54, %52 ], [ %45, %48 ]
  %62 = add i64 %60, 1
  %63 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %62, i64* %63, align 8, !tbaa !3
  br label %64

64:                                               ; preds = %59, %55
  %65 = phi i64 [ %56, %55 ], [ %60, %59 ]
  %66 = phi i8* [ %19, %55 ], [ %61, %59 ]
  %67 = getelementptr inbounds i8, i8* %66, i64 %65
  store i8 %1, i8* %67, align 1, !tbaa !3
  %68 = getelementptr inbounds i8, i8* %67, i64 1
  store i8 0, i8* %68, align 1, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* %0, i64 %1, i8 signext %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %89, label %5

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %18, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = trunc i64 %12 to i8
  br label %21

18:                                               ; preds = %5
  %19 = lshr i8 %7, 1
  %20 = zext i8 %19 to i64
  br label %21

21:                                               ; preds = %10, %18
  %22 = phi i8 [ %17, %10 ], [ %7, %18 ]
  %23 = phi i64 [ %14, %10 ], [ 22, %18 ]
  %24 = phi i64 [ %16, %10 ], [ %20, %18 ]
  %25 = sub i64 %23, %24
  %26 = icmp ult i64 %25, %1
  br i1 %26, label %27, label %65

27:                                               ; preds = %21
  %28 = add i64 %24, %1
  %29 = sub i64 %28, %23
  %30 = sub i64 -17, %23
  %31 = icmp ult i64 %30, %29
  br i1 %31, label %32, label %34

32:                                               ; preds = %27
  %33 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %33) #19
  unreachable

34:                                               ; preds = %27
  br i1 %9, label %38, label %35

35:                                               ; preds = %34
  %36 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !3
  br label %41

38:                                               ; preds = %34
  %39 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %40 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %39, i64 0, i32 1, i64 0
  br label %41

41:                                               ; preds = %38, %35
  %42 = phi i8* [ %37, %35 ], [ %40, %38 ]
  %43 = icmp ult i64 %23, 9223372036854775783
  br i1 %43, label %44, label %52

44:                                               ; preds = %41
  %45 = shl nuw i64 %23, 1
  %46 = icmp ult i64 %28, %45
  %47 = select i1 %46, i64 %45, i64 %28
  %48 = add i64 %47, 16
  %49 = and i64 %48, -16
  %50 = icmp ult i64 %47, 23
  %51 = select i1 %50, i64 23, i64 %49
  br label %52

52:                                               ; preds = %44, %41
  %53 = phi i64 [ %51, %44 ], [ -17, %41 ]
  %54 = tail call noalias nonnull i8* @_Znwm(i64 %53) #21
  %55 = icmp eq i64 %24, 0
  br i1 %55, label %57, label %56

56:                                               ; preds = %52
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %54, i8* align 1 %42, i64 %24, i1 false) #20
  br label %57

57:                                               ; preds = %56, %52
  %58 = icmp eq i64 %23, 22
  br i1 %58, label %60, label %59

59:                                               ; preds = %57
  tail call void @_ZdlPv(i8* %42) #22
  br label %60

60:                                               ; preds = %57, %59
  %61 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %54, i8** %61, align 8, !tbaa !3
  %62 = or i64 %53, 1
  %63 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %62, i64* %63, align 8, !tbaa !3
  %64 = trunc i64 %62 to i8
  br label %65

65:                                               ; preds = %60, %21
  %66 = phi i8 [ %64, %60 ], [ %22, %21 ]
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %65
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  br label %75

72:                                               ; preds = %65
  %73 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %74 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %73, i64 0, i32 1, i64 0
  br label %75

75:                                               ; preds = %69, %72
  %76 = phi i8* [ %71, %69 ], [ %74, %72 ]
  %77 = getelementptr inbounds i8, i8* %76, i64 %24
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %77, i8 %2, i64 %1, i1 false) #20
  %78 = add i64 %24, %1
  %79 = load i8, i8* %6, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %84, label %82

82:                                               ; preds = %75
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %78, i64* %83, align 8, !tbaa !3
  br label %87

84:                                               ; preds = %75
  %85 = trunc i64 %78 to i8
  %86 = shl i8 %85, 1
  store i8 %86, i8* %6, align 8, !tbaa !3
  br label %87

87:                                               ; preds = %82, %84
  %88 = getelementptr inbounds i8, i8* %76, i64 %78
  store i8 0, i8* %88, align 1, !tbaa !3
  br label %89

89:                                               ; preds = %3, %87
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5rfindEcm(%"class.std::__1::basic_string"* %0, i8 signext %1, i64 %2) local_unnamed_addr #4 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !3
  br label %18

13:                                               ; preds = %3
  %14 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %14, i64 0, i32 1, i64 0
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %13
  %19 = phi i8* [ %10, %8 ], [ %15, %13 ]
  %20 = phi i64 [ %12, %8 ], [ %17, %13 ]
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %38, label %22

22:                                               ; preds = %18
  %23 = icmp ugt i64 %20, %2
  %24 = add i64 %2, 1
  %25 = select i1 %23, i64 %24, i64 %20
  %26 = getelementptr inbounds i8, i8* %19, i64 %25
  br label %27

27:                                               ; preds = %30, %22
  %28 = phi i8* [ %26, %22 ], [ %31, %30 ]
  %29 = icmp eq i8* %28, %19
  br i1 %29, label %38, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds i8, i8* %28, i64 -1
  %32 = load i8, i8* %31, align 1, !tbaa !3
  %33 = icmp eq i8 %32, %1
  br i1 %33, label %34, label %27

34:                                               ; preds = %30
  %35 = ptrtoint i8* %31 to i64
  %36 = ptrtoint i8* %19 to i64
  %37 = sub i64 %35, %36
  br label %38

38:                                               ; preds = %27, %18, %34
  %39 = phi i64 [ %37, %34 ], [ -1, %18 ], [ -1, %27 ]
  ret i64 %39
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEmc(%"class.std::__1::basic_string"* %0, i64 %1, i8 signext %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = icmp ugt i64 %1, 22
  br i1 %9, label %17, label %58

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = icmp ult i64 %14, %1
  %16 = trunc i64 %12 to i8
  br i1 %15, label %20, label %58

17:                                               ; preds = %8
  %18 = add i64 %1, -22
  %19 = icmp ugt i64 %18, -39
  br i1 %19, label %24, label %26

20:                                               ; preds = %10
  %21 = sub i64 %1, %14
  %22 = sub i64 -16, %13
  %23 = icmp ult i64 %22, %21
  br i1 %23, label %24, label %29

24:                                               ; preds = %20, %17
  %25 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %25) #19
  unreachable

26:                                               ; preds = %17
  %27 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %27, i64 0, i32 1, i64 0
  br label %35

29:                                               ; preds = %20
  %30 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %31 = load i8*, i8** %30, align 8, !tbaa !3
  %32 = icmp ult i64 %14, 9223372036854775783
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = tail call noalias nonnull dereferenceable(18446744073709551599) i8* @_Znwm(i64 -17) #21
  br label %47

35:                                               ; preds = %29, %26
  %36 = phi i8* [ %28, %26 ], [ %31, %29 ]
  %37 = phi i64 [ 22, %26 ], [ %14, %29 ]
  %38 = shl nuw i64 %37, 1
  %39 = icmp ugt i64 %38, %1
  %40 = select i1 %39, i64 %38, i64 %1
  %41 = add i64 %40, 16
  %42 = and i64 %41, -16
  %43 = icmp ult i64 %40, 23
  %44 = select i1 %43, i64 23, i64 %42
  %45 = tail call noalias nonnull i8* @_Znwm(i64 %44) #21
  %46 = icmp eq i64 %37, 22
  br i1 %46, label %51, label %47

47:                                               ; preds = %33, %35
  %48 = phi i8* [ %34, %33 ], [ %45, %35 ]
  %49 = phi i64 [ -17, %33 ], [ %44, %35 ]
  %50 = phi i8* [ %31, %33 ], [ %36, %35 ]
  tail call void @_ZdlPv(i8* %50) #22
  br label %51

51:                                               ; preds = %35, %47
  %52 = phi i8* [ %45, %35 ], [ %48, %47 ]
  %53 = phi i64 [ %44, %35 ], [ %49, %47 ]
  %54 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %52, i8** %54, align 8, !tbaa !3
  %55 = or i64 %53, 1
  %56 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %55, i64* %56, align 8, !tbaa !3
  %57 = trunc i64 %55 to i8
  br label %58

58:                                               ; preds = %10, %51, %8
  %59 = phi i8 [ %16, %10 ], [ %57, %51 ], [ %5, %8 ]
  %60 = and i8 %59, 1
  %61 = icmp eq i8 %60, 0
  br i1 %61, label %65, label %62

62:                                               ; preds = %58
  %63 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %64 = load i8*, i8** %63, align 8, !tbaa !3
  br label %68

65:                                               ; preds = %58
  %66 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %67 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %66, i64 0, i32 1, i64 0
  br label %68

68:                                               ; preds = %62, %65
  %69 = phi i8* [ %64, %62 ], [ %67, %65 ]
  %70 = icmp eq i64 %1, 0
  br i1 %70, label %72, label %71

71:                                               ; preds = %68
  tail call void @llvm.memset.p0i8.i64(i8* align 1 %69, i8 %2, i64 %1, i1 false) #20
  br label %72

72:                                               ; preds = %68, %71
  %73 = getelementptr inbounds i8, i8* %69, i64 %1
  store i8 0, i8* %73, align 1, !tbaa !3
  %74 = load i8, i8* %4, align 8, !tbaa !3
  %75 = and i8 %74, 1
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %79, label %77

77:                                               ; preds = %72
  %78 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %78, align 8, !tbaa !3
  br label %82

79:                                               ; preds = %72
  %80 = trunc i64 %1 to i8
  %81 = shl i8 %80, 1
  store i8 %81, i8* %4, align 8, !tbaa !3
  br label %82

82:                                               ; preds = %77, %79
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5eraseEmm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %10 = load i64, i64* %9, align 8, !tbaa !3
  br label %14

11:                                               ; preds = %3
  %12 = lshr i8 %5, 1
  %13 = zext i8 %12 to i64
  br label %14

14:                                               ; preds = %8, %11
  %15 = phi i64 [ %10, %8 ], [ %13, %11 ]
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %14
  switch i64 %2, label %31 [
    i64 -1, label %20
    i64 0, label %66
  ]

20:                                               ; preds = %19
  br i1 %7, label %26, label %21

21:                                               ; preds = %20
  %22 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  %24 = getelementptr inbounds i8, i8* %23, i64 %1
  store i8 0, i8* %24, align 1, !tbaa !3
  %25 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %25, align 8, !tbaa !3
  br label %66

26:                                               ; preds = %20
  %27 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %27, i64 0, i32 1, i64 %1
  store i8 0, i8* %28, align 1, !tbaa !3
  %29 = trunc i64 %1 to i8
  %30 = shl i8 %29, 1
  store i8 %30, i8* %4, align 8, !tbaa !3
  br label %66

31:                                               ; preds = %19
  br i1 %7, label %37, label %32

32:                                               ; preds = %31
  %33 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %34 = load i64, i64* %33, align 8, !tbaa !3
  %35 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %36 = load i8*, i8** %35, align 8, !tbaa !3
  br label %42

37:                                               ; preds = %31
  %38 = lshr i8 %5, 1
  %39 = zext i8 %38 to i64
  %40 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %41 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %40, i64 0, i32 1, i64 0
  br label %42

42:                                               ; preds = %37, %32
  %43 = phi i64 [ %34, %32 ], [ %39, %37 ]
  %44 = phi i8* [ %36, %32 ], [ %41, %37 ]
  %45 = sub i64 %43, %1
  %46 = icmp ult i64 %45, %2
  %47 = select i1 %46, i64 %45, i64 %2
  %48 = sub i64 %45, %47
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %54, label %50

50:                                               ; preds = %42
  %51 = getelementptr inbounds i8, i8* %44, i64 %1
  %52 = getelementptr inbounds i8, i8* %51, i64 %47
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 1 %51, i8* align 1 %52, i64 %48, i1 false) #20
  %53 = load i8, i8* %4, align 8, !tbaa !3
  br label %54

54:                                               ; preds = %50, %42
  %55 = phi i8 [ %5, %42 ], [ %53, %50 ]
  %56 = sub i64 %43, %47
  %57 = and i8 %55, 1
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %61, label %59

59:                                               ; preds = %54
  %60 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %56, i64* %60, align 8, !tbaa !3
  br label %64

61:                                               ; preds = %54
  %62 = trunc i64 %56 to i8
  %63 = shl i8 %62, 1
  store i8 %63, i8* %4, align 8, !tbaa !3
  br label %64

64:                                               ; preds = %61, %59
  %65 = getelementptr inbounds i8, i8* %44, i64 %56
  store i8 0, i8* %65, align 1, !tbaa !3
  br label %66

66:                                               ; preds = %19, %64, %26, %21
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendERKS5_mm(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %2
  br i1 %12, label %17, label %22

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %2
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %9
  %23 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %24 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %23, i64 0, i32 1, i64 0
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %15, %19 ], [ %11, %22 ]
  %27 = phi i8* [ %21, %19 ], [ %24, %22 ]
  %28 = getelementptr inbounds i8, i8* %27, i64 %2
  %29 = sub i64 %26, %2
  %30 = icmp ult i64 %29, %3
  %31 = select i1 %30, i64 %29, i64 %3
  %32 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* %0, i8* %28, i64 %31)
  ret %"class.std::__1::basic_string"* %32
}

; Function Attrs: nounwind uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEPKc(%"class.std::__1::basic_string"* %0, i8* %1) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #20
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = icmp eq i64 %3, -1
  br i1 %7, label %9, label %10

9:                                                ; preds = %2
  br i1 %8, label %11, label %19

10:                                               ; preds = %2
  br i1 %8, label %11, label %14

11:                                               ; preds = %10, %9
  %12 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  invoke void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %12) #19
          to label %13 unwind label %39

13:                                               ; preds = %11
  unreachable

14:                                               ; preds = %10
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8, !tbaa !3
  br label %24

19:                                               ; preds = %9
  %20 = lshr i8 %5, 1
  %21 = zext i8 %20 to i64
  %22 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %23 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 0
  br label %24

24:                                               ; preds = %19, %14
  %25 = phi i64 [ %16, %14 ], [ %21, %19 ]
  %26 = phi i8* [ %18, %14 ], [ %23, %19 ]
  %27 = icmp ugt i64 %25, %3
  %28 = select i1 %27, i64 %3, i64 %25
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %33, label %30

30:                                               ; preds = %24
  %31 = tail call i32 @memcmp(i8* %26, i8* %1, i64 %28) #20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %30, %24
  %34 = icmp ult i64 %25, %3
  %35 = zext i1 %27 to i32
  %36 = select i1 %34, i32 -1, i32 %35
  br label %37

37:                                               ; preds = %33, %30
  %38 = phi i32 [ %36, %33 ], [ %31, %30 ]
  ret i32 %38

39:                                               ; preds = %11
  %40 = landingpad { i8*, i32 }
          catch i8* null
  %41 = extractvalue { i8*, i32 } %40, 0
  tail call void @__clang_call_terminate(i8* %41) #23
  unreachable
}

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %3, i64 %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  %14 = icmp eq i64 %4, -1
  %15 = or i1 %14, %13
  br i1 %15, label %22, label %30

16:                                               ; preds = %5
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !3
  %19 = icmp ult i64 %18, %1
  %20 = icmp eq i64 %4, -1
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %24

22:                                               ; preds = %16, %10
  %23 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %23) #19
  unreachable

24:                                               ; preds = %16
  %25 = sub i64 %18, %1
  %26 = icmp ult i64 %25, %2
  %27 = select i1 %26, i64 %25, i64 %2
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i8*, i8** %28, align 8, !tbaa !3
  br label %36

30:                                               ; preds = %10
  %31 = sub i64 %12, %1
  %32 = icmp ult i64 %31, %2
  %33 = select i1 %32, i64 %31, i64 %2
  %34 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %35 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %34, i64 0, i32 1, i64 0
  br label %36

36:                                               ; preds = %24, %30
  %37 = phi i64 [ %27, %24 ], [ %33, %30 ]
  %38 = phi i8* [ %29, %24 ], [ %35, %30 ]
  %39 = icmp ugt i64 %37, %4
  %40 = select i1 %39, i64 %4, i64 %37
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %46, label %42

42:                                               ; preds = %36
  %43 = getelementptr inbounds i8, i8* %38, i64 %1
  %44 = tail call i32 @memcmp(i8* %43, i8* %3, i64 %40) #20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %36, %42
  %47 = icmp ult i64 %37, %4
  %48 = zext i1 %39 to i32
  %49 = select i1 %47, i32 -1, i32 %48
  ret i32 %49

50:                                               ; preds = %42
  ret i32 %44
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #7 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #20
  tail call void @_ZSt9terminatev() #23
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmPKc(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %3) local_unnamed_addr #2 comdat align 2 {
  %5 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %3) #20
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %4
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  %14 = icmp eq i64 %5, -1
  %15 = or i1 %14, %13
  br i1 %15, label %22, label %30

16:                                               ; preds = %4
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !3
  %19 = icmp ult i64 %18, %1
  %20 = icmp eq i64 %5, -1
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %24

22:                                               ; preds = %16, %10
  %23 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %23) #19
  unreachable

24:                                               ; preds = %16
  %25 = sub i64 %18, %1
  %26 = icmp ult i64 %25, %2
  %27 = select i1 %26, i64 %25, i64 %2
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i8*, i8** %28, align 8, !tbaa !3
  br label %36

30:                                               ; preds = %10
  %31 = sub i64 %12, %1
  %32 = icmp ult i64 %31, %2
  %33 = select i1 %32, i64 %31, i64 %2
  %34 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %35 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %34, i64 0, i32 1, i64 0
  br label %36

36:                                               ; preds = %30, %24
  %37 = phi i64 [ %27, %24 ], [ %33, %30 ]
  %38 = phi i8* [ %29, %24 ], [ %35, %30 ]
  %39 = icmp ugt i64 %37, %5
  %40 = select i1 %39, i64 %5, i64 %37
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %46, label %42

42:                                               ; preds = %36
  %43 = getelementptr inbounds i8, i8* %38, i64 %1
  %44 = tail call i32 @memcmp(i8* %43, i8* %3, i64 %40) #20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %42, %36
  %47 = icmp ult i64 %37, %5
  %48 = zext i1 %39 to i32
  %49 = select i1 %47, i32 -1, i32 %48
  br label %50

50:                                               ; preds = %42, %46
  %51 = phi i32 [ %49, %46 ], [ %44, %42 ]
  ret i32 %51
}

; Function Attrs: uwtable
define weak_odr nonnull align 1 dereferenceable(1) i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE2atEm(%"class.std::__1::basic_string"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp ugt i64 %9, %1
  br i1 %10, label %20, label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ugt i64 %13, %1
  br i1 %14, label %17, label %15

15:                                               ; preds = %11, %7
  %16 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %16) #19
  unreachable

17:                                               ; preds = %11
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %7
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i8* [ %19, %17 ], [ %22, %20 ]
  %25 = getelementptr inbounds i8, i8* %24, i64 %1
  ret i8* %25
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKc(%"class.std::__1::basic_string"* %0, i8* %1) local_unnamed_addr #2 comdat align 2 {
  %3 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #20
  %4 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE17__assign_externalEPKcm(%"class.std::__1::basic_string"* %0, i8* nonnull %1, i64 %3)
  ret %"class.std::__1::basic_string"* %4
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE4findEPKcmm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i8* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ult i64 %21, %2
  br i1 %22, label %61, label %23

23:                                               ; preds = %19
  %24 = icmp eq i64 %3, 0
  br i1 %24, label %61, label %25

25:                                               ; preds = %23
  %26 = getelementptr inbounds i8, i8* %20, i64 %2
  %27 = getelementptr inbounds i8, i8* %20, i64 %21
  %28 = ptrtoint i8* %27 to i64
  %29 = ptrtoint i8* %26 to i64
  %30 = sub i64 %28, %29
  %31 = icmp slt i64 %30, %3
  br i1 %31, label %54, label %32

32:                                               ; preds = %25
  %33 = load i8, i8* %1, align 1, !tbaa !3
  %34 = zext i8 %33 to i32
  br label %35

35:                                               ; preds = %49, %32
  %36 = phi i64 [ %52, %49 ], [ %30, %32 ]
  %37 = phi i8* [ %50, %49 ], [ %26, %32 ]
  %38 = sub nsw i64 %36, %3
  %39 = add nsw i64 %38, 1
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %54, label %41

41:                                               ; preds = %35
  %42 = tail call i8* @memchr(i8* %37, i32 %34, i64 %39) #20
  %43 = icmp eq i8* %42, null
  br i1 %43, label %54, label %44

44:                                               ; preds = %41
  %45 = tail call i32 @bcmp(i8* nonnull %42, i8* nonnull %1, i64 %3) #20
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = ptrtoint i8* %42 to i64
  br label %54

49:                                               ; preds = %44
  %50 = getelementptr inbounds i8, i8* %42, i64 1
  %51 = ptrtoint i8* %50 to i64
  %52 = sub i64 %28, %51
  %53 = icmp slt i64 %52, %3
  br i1 %53, label %54, label %35

54:                                               ; preds = %49, %41, %35, %47, %25
  %55 = phi i64 [ %28, %25 ], [ %48, %47 ], [ %28, %35 ], [ %28, %41 ], [ %28, %49 ]
  %56 = phi i8* [ %27, %25 ], [ %42, %47 ], [ %27, %35 ], [ %27, %41 ], [ %27, %49 ]
  %57 = icmp eq i8* %56, %27
  %58 = ptrtoint i8* %20 to i64
  %59 = sub i64 %55, %58
  %60 = select i1 %57, i64 -1, i64 %59
  br label %61

61:                                               ; preds = %19, %23, %54
  %62 = phi i64 [ -1, %19 ], [ %2, %23 ], [ %60, %54 ]
  ret i64 %62
}

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7compareEmmRKS5_mm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3, i64 %4, i64 %5) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %7 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8
  %15 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %8, 1
  %18 = zext i8 %17 to i64
  %19 = select i1 %10, i8* %16, i8* %12
  %20 = select i1 %10, i64 %18, i64 %14
  %21 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %22 = load i8, i8* %21, align 8, !tbaa !3
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %30, label %25

25:                                               ; preds = %6
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8, !tbaa !3
  %28 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %29 = load i64, i64* %28, align 8, !tbaa !3
  br label %35

30:                                               ; preds = %6
  %31 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %32 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %31, i64 0, i32 1, i64 0
  %33 = lshr i8 %22, 1
  %34 = zext i8 %33 to i64
  br label %35

35:                                               ; preds = %30, %25
  %36 = phi i8* [ %27, %25 ], [ %32, %30 ]
  %37 = phi i64 [ %29, %25 ], [ %34, %30 ]
  %38 = icmp ult i64 %37, %1
  br i1 %38, label %39, label %40

39:                                               ; preds = %35
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i64 0, i64 0)) #19
  unreachable

40:                                               ; preds = %35
  %41 = getelementptr inbounds i8, i8* %36, i64 %1
  %42 = sub i64 %37, %1
  %43 = icmp ult i64 %42, %2
  %44 = select i1 %43, i64 %42, i64 %2
  %45 = icmp ult i64 %20, %4
  br i1 %45, label %46, label %47

46:                                               ; preds = %40
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i64 0, i64 0)) #19
  unreachable

47:                                               ; preds = %40
  %48 = sub i64 %20, %4
  %49 = icmp ult i64 %48, %5
  %50 = select i1 %49, i64 %48, i64 %5
  %51 = icmp ugt i64 %44, %50
  %52 = select i1 %51, i64 %50, i64 %44
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %58, label %54

54:                                               ; preds = %47
  %55 = getelementptr inbounds i8, i8* %19, i64 %4
  %56 = tail call i32 @memcmp(i8* %41, i8* %55, i64 %52) #20
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %54, %47
  %59 = icmp eq i64 %44, %50
  br i1 %59, label %63, label %60

60:                                               ; preds = %58
  %61 = icmp ult i64 %44, %50
  %62 = select i1 %61, i32 -1, i32 1
  br label %63

63:                                               ; preds = %54, %58, %60
  %64 = phi i32 [ %56, %54 ], [ %62, %60 ], [ 0, %58 ]
  ret i32 %64
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_(%"class.std::__1::basic_string"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = icmp eq %"class.std::__1::basic_string"* %0, %1
  br i1 %3, label %107, label %4

4:                                                ; preds = %2
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %10 = load i8, i8* %9, align 8, !tbaa !3
  %11 = and i8 %10, 1
  %12 = icmp eq i8 %11, 0
  br i1 %8, label %13, label %46

13:                                               ; preds = %4
  br i1 %12, label %14, label %15

14:                                               ; preds = %13
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %5, i8* nonnull align 8 dereferenceable(24) %9, i64 24, i1 false), !tbaa.struct !6
  br label %107

15:                                               ; preds = %13
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %17 = load i8*, i8** %16, align 8, !tbaa !3
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %19 = load i64, i64* %18, align 8, !tbaa !3
  %20 = icmp ult i64 %19, 23
  br i1 %20, label %21, label %30

21:                                               ; preds = %15
  %22 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %23 = trunc i64 %19 to i8
  %24 = shl nuw nsw i8 %23, 1
  store i8 %24, i8* %5, align 8, !tbaa !3
  %25 = icmp eq i64 %19, 0
  br i1 %25, label %28, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %27, i8* align 1 %17, i64 %19, i1 false) #20
  br label %28

28:                                               ; preds = %26, %21
  %29 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 %19
  store i8 0, i8* %29, align 1, !tbaa !3
  br label %107

30:                                               ; preds = %15
  %31 = add i64 %19, -22
  %32 = icmp ugt i64 %31, -40
  br i1 %32, label %33, label %35

33:                                               ; preds = %30
  %34 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %34) #19
  unreachable

35:                                               ; preds = %30
  %36 = icmp ugt i64 %19, 44
  %37 = select i1 %36, i64 %19, i64 44
  %38 = add nuw i64 %37, 16
  %39 = and i64 %38, -16
  %40 = tail call noalias nonnull i8* @_Znwm(i64 %39) #21
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %40, i8* align 1 %17, i64 %19, i1 false) #20
  %41 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %40, i8** %41, align 8, !tbaa !3
  %42 = or i64 %39, 1
  %43 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %42, i64* %43, align 8, !tbaa !3
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %19, i64* %44, align 8, !tbaa !3
  %45 = getelementptr inbounds i8, i8* %40, i64 %19
  store i8 0, i8* %45, align 1, !tbaa !3
  br label %107

46:                                               ; preds = %4
  %47 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %50 = load i64, i64* %49, align 8
  %51 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %52 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %51, i64 0, i32 1, i64 0
  %53 = lshr i8 %10, 1
  %54 = zext i8 %53 to i64
  %55 = select i1 %12, i8* %52, i8* %48
  %56 = select i1 %12, i64 %54, i64 %50
  %57 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %58 = load i64, i64* %57, align 8, !tbaa !3
  %59 = and i64 %58, -2
  %60 = icmp ugt i64 %59, %56
  br i1 %60, label %61, label %69

61:                                               ; preds = %46
  %62 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %63 = load i8*, i8** %62, align 8, !tbaa !3
  %64 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %56, i64* %64, align 8, !tbaa !3
  %65 = icmp eq i64 %56, 0
  br i1 %65, label %67, label %66

66:                                               ; preds = %61
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %63, i8* align 1 %55, i64 %56, i1 false) #20
  br label %67

67:                                               ; preds = %66, %61
  %68 = getelementptr inbounds i8, i8* %63, i64 %56
  store i8 0, i8* %68, align 1, !tbaa !3
  br label %107

69:                                               ; preds = %46
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %71 = add i64 %59, -1
  %72 = add i64 %56, 1
  %73 = sub i64 %72, %59
  %74 = sub i64 -17, %59
  %75 = icmp ult i64 %74, %73
  br i1 %75, label %76, label %78

76:                                               ; preds = %69
  %77 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %77) #19
  unreachable

78:                                               ; preds = %69
  %79 = and i64 %58, 1
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %84, label %81

81:                                               ; preds = %78
  %82 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %83 = load i8*, i8** %82, align 8, !tbaa !3
  br label %87

84:                                               ; preds = %78
  %85 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %86 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %85, i64 0, i32 1, i64 0
  br label %87

87:                                               ; preds = %84, %81
  %88 = phi i8* [ %83, %81 ], [ %86, %84 ]
  %89 = icmp ult i64 %71, 9223372036854775783
  br i1 %89, label %90, label %98

90:                                               ; preds = %87
  %91 = shl nuw i64 %71, 1
  %92 = icmp ugt i64 %91, %56
  %93 = select i1 %92, i64 %91, i64 %56
  %94 = add i64 %93, 16
  %95 = and i64 %94, -16
  %96 = icmp ult i64 %93, 23
  %97 = select i1 %96, i64 23, i64 %95
  br label %98

98:                                               ; preds = %90, %87
  %99 = phi i64 [ %97, %90 ], [ -17, %87 ]
  %100 = tail call noalias nonnull i8* @_Znwm(i64 %99) #21
  %101 = icmp eq i64 %56, 0
  br i1 %101, label %103, label %102

102:                                              ; preds = %98
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %100, i8* align 1 %55, i64 %56, i1 false) #20
  br label %103

103:                                              ; preds = %102, %98
  tail call void @_ZdlPv(i8* %88) #22
  %104 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %100, i8** %104, align 8, !tbaa !3
  %105 = or i64 %99, 1
  store i64 %105, i64* %57, align 8, !tbaa !3
  store i64 %56, i64* %70, align 8, !tbaa !3
  %106 = getelementptr inbounds i8, i8* %100, i64 %56
  store i8 0, i8* %106, align 1, !tbaa !3
  br label %107

107:                                              ; preds = %103, %67, %35, %28, %14, %2
  ret %"class.std::__1::basic_string"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* %0, i8* %1) local_unnamed_addr #2 comdat align 2 {
  %3 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #20
  %4 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* %0, i8* %1, i64 %3)
  ret %"class.std::__1::basic_string"* %4
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmRKS5_mm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3, i64 %4, i64 %5) local_unnamed_addr #2 comdat align 2 {
  %7 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %6
  %12 = lshr i8 %8, 1
  %13 = zext i8 %12 to i64
  %14 = icmp ult i64 %13, %4
  br i1 %14, label %19, label %24

15:                                               ; preds = %6
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = icmp ult i64 %17, %4
  br i1 %18, label %19, label %21

19:                                               ; preds = %15, %11
  %20 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %20) #19
  unreachable

21:                                               ; preds = %15
  %22 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  br label %27

24:                                               ; preds = %11
  %25 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  br label %27

27:                                               ; preds = %21, %24
  %28 = phi i64 [ %17, %21 ], [ %13, %24 ]
  %29 = phi i8* [ %23, %21 ], [ %26, %24 ]
  %30 = getelementptr inbounds i8, i8* %29, i64 %4
  %31 = sub i64 %28, %4
  %32 = icmp ult i64 %31, %5
  %33 = select i1 %32, i64 %31, i64 %5
  %34 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE7replaceEmmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i64 %2, i8* %30, i64 %33)
  ret %"class.std::__1::basic_string"* %34
}

; Function Attrs: uwtable
define weak_odr i8* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertENS_11__wrap_iterIPKcEEc(%"class.std::__1::basic_string"* %0, i8* %1, i8 signext %2) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %4 = ptrtoint i8* %1 to i64
  %5 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %17

9:                                                ; preds = %3
  %10 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = ptrtoint i8* %11 to i64
  %13 = sub i64 %4, %12
  %14 = lshr i8 %6, 1
  %15 = zext i8 %14 to i64
  %16 = icmp eq i8 %14, 22
  br i1 %16, label %36, label %70

17:                                               ; preds = %3
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = bitcast i8** %18 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !3
  %21 = sub i64 %4, %20
  %22 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %23 = load i64, i64* %22, align 8, !tbaa !3
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %25 = load i64, i64* %24, align 8, !tbaa !3
  %26 = and i64 %25, -2
  %27 = add i64 %26, -1
  %28 = icmp eq i64 %27, %23
  %29 = inttoptr i64 %20 to i8*
  br i1 %28, label %30, label %70

30:                                               ; preds = %17
  %31 = icmp eq i64 %26, -16
  br i1 %31, label %32, label %34

32:                                               ; preds = %30
  %33 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %33) #19
  unreachable

34:                                               ; preds = %30
  %35 = icmp ult i64 %23, 9223372036854775783
  br i1 %35, label %36, label %48

36:                                               ; preds = %9, %34
  %37 = phi i8* [ %29, %34 ], [ %11, %9 ]
  %38 = phi i64 [ %23, %34 ], [ 22, %9 ]
  %39 = phi i64 [ %21, %34 ], [ %13, %9 ]
  %40 = add nuw nsw i64 %38, 1
  %41 = shl nuw i64 %38, 1
  %42 = icmp ult i64 %40, %41
  %43 = select i1 %42, i64 %41, i64 %40
  %44 = add nuw i64 %43, 16
  %45 = and i64 %44, -16
  %46 = icmp ult i64 %43, 23
  %47 = select i1 %46, i64 23, i64 %45
  br label %48

48:                                               ; preds = %36, %34
  %49 = phi i8* [ %37, %36 ], [ %29, %34 ]
  %50 = phi i64 [ %38, %36 ], [ %23, %34 ]
  %51 = phi i64 [ %39, %36 ], [ %21, %34 ]
  %52 = phi i64 [ %47, %36 ], [ -17, %34 ]
  %53 = tail call noalias nonnull i8* @_Znwm(i64 %52) #21
  %54 = icmp eq i64 %51, 0
  br i1 %54, label %56, label %55

55:                                               ; preds = %48
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %53, i8* align 1 %49, i64 %51, i1 false) #20
  br label %56

56:                                               ; preds = %55, %48
  %57 = sub i64 %50, %51
  %58 = icmp eq i64 %57, 0
  br i1 %58, label %63, label %59

59:                                               ; preds = %56
  %60 = getelementptr inbounds i8, i8* %53, i64 %51
  %61 = getelementptr inbounds i8, i8* %60, i64 1
  %62 = getelementptr inbounds i8, i8* %49, i64 %51
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %61, i8* align 1 %62, i64 %57, i1 false) #20
  br label %63

63:                                               ; preds = %59, %56
  %64 = icmp eq i64 %50, 22
  br i1 %64, label %66, label %65

65:                                               ; preds = %63
  tail call void @_ZdlPv(i8* %49) #22
  br label %66

66:                                               ; preds = %63, %65
  %67 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %53, i8** %67, align 8, !tbaa !3
  %68 = or i64 %52, 1
  %69 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %68, i64* %69, align 8, !tbaa !3
  br label %79

70:                                               ; preds = %17, %9
  %71 = phi i64 [ %15, %9 ], [ %23, %17 ]
  %72 = phi i64 [ %13, %9 ], [ %21, %17 ]
  %73 = phi i8* [ %11, %9 ], [ %29, %17 ]
  %74 = sub i64 %71, %72
  %75 = icmp eq i64 %74, 0
  br i1 %75, label %79, label %76

76:                                               ; preds = %70
  %77 = getelementptr inbounds i8, i8* %73, i64 %72
  %78 = getelementptr inbounds i8, i8* %77, i64 1
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 1 %78, i8* align 1 %77, i64 %74, i1 false) #20
  br label %79

79:                                               ; preds = %76, %70, %66
  %80 = phi i64 [ %50, %66 ], [ %71, %70 ], [ %71, %76 ]
  %81 = phi i64 [ %51, %66 ], [ %72, %70 ], [ %72, %76 ]
  %82 = phi i8* [ %53, %66 ], [ %73, %70 ], [ %73, %76 ]
  %83 = getelementptr inbounds i8, i8* %82, i64 %81
  store i8 %2, i8* %83, align 1, !tbaa !3
  %84 = add i64 %80, 1
  %85 = getelementptr inbounds i8, i8* %82, i64 %84
  store i8 0, i8* %85, align 1, !tbaa !3
  %86 = load i8, i8* %5, align 8, !tbaa !3
  %87 = and i8 %86, 1
  %88 = icmp eq i8 %87, 0
  br i1 %88, label %91, label %89

89:                                               ; preds = %79
  %90 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %84, i64* %90, align 8, !tbaa !3
  br label %94

91:                                               ; preds = %79
  %92 = trunc i64 %84 to i8
  %93 = shl i8 %92, 1
  store i8 %93, i8* %5, align 8, !tbaa !3
  br label %94

94:                                               ; preds = %89, %91
  %95 = phi i8 [ %86, %89 ], [ %93, %91 ]
  %96 = and i8 %95, 1
  %97 = icmp eq i8 %96, 0
  br i1 %97, label %101, label %98

98:                                               ; preds = %94
  %99 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %100 = load i8*, i8** %99, align 8, !tbaa !3
  br label %104

101:                                              ; preds = %94
  %102 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %103 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %102, i64 0, i32 1, i64 0
  br label %104

104:                                              ; preds = %98, %101
  %105 = phi i8* [ %100, %98 ], [ %103, %101 ]
  %106 = getelementptr inbounds i8, i8* %105, i64 %81
  ret i8* %106
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6resizeEmc(%"class.std::__1::basic_string"* %0, i64 %1, i8 signext %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %3
  %9 = lshr i8 %5, 1
  %10 = zext i8 %9 to i64
  %11 = icmp ult i64 %10, %1
  br i1 %11, label %16, label %24

12:                                               ; preds = %3
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = icmp ult i64 %14, %1
  br i1 %15, label %16, label %20

16:                                               ; preds = %12, %8
  %17 = phi i64 [ %14, %12 ], [ %10, %8 ]
  %18 = sub i64 %1, %17
  %19 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %0, i64 %18, i8 signext %2)
  br label %29

20:                                               ; preds = %12
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  %23 = getelementptr inbounds i8, i8* %22, i64 %1
  store i8 0, i8* %23, align 1, !tbaa !3
  store i64 %1, i64* %13, align 8, !tbaa !3
  br label %29

24:                                               ; preds = %8
  %25 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %1
  store i8 0, i8* %26, align 1, !tbaa !3
  %27 = trunc i64 %1 to i8
  %28 = shl i8 %27, 1
  store i8 %28, i8* %4, align 8, !tbaa !3
  br label %29

29:                                               ; preds = %24, %20, %16
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmRKS5_mm(%"class.std::__1::basic_string"* %0, i64 %1, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %2, i64 %3, i64 %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string"* %2 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %3
  br i1 %13, label %18, label %23

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %3
  br i1 %17, label %18, label %20

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %14
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  br label %26

23:                                               ; preds = %10
  %24 = bitcast %"class.std::__1::basic_string"* %2 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %25 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %24, i64 0, i32 1, i64 0
  br label %26

26:                                               ; preds = %20, %23
  %27 = phi i64 [ %16, %20 ], [ %12, %23 ]
  %28 = phi i8* [ %22, %20 ], [ %25, %23 ]
  %29 = getelementptr inbounds i8, i8* %28, i64 %3
  %30 = sub i64 %27, %3
  %31 = icmp ult i64 %30, %4
  %32 = select i1 %31, i64 %30, i64 %4
  %33 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKcm(%"class.std::__1::basic_string"* %0, i64 %1, i8* %29, i64 %32)
  ret %"class.std::__1::basic_string"* %33
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %3, i64 %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  br i1 %13, label %18, label %20

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %27

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %10
  %21 = sub i64 %12, %1
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub nsw i64 4, %12
  %25 = add i64 %24, %23
  %26 = icmp ult i64 %25, %4
  br i1 %26, label %116, label %41

27:                                               ; preds = %14
  %28 = sub i64 %16, %1
  %29 = icmp ult i64 %28, %2
  %30 = select i1 %29, i64 %28, i64 %2
  %31 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !3
  %33 = and i64 %32, -2
  %34 = add i64 %33, -1
  %35 = sub i64 %30, %16
  %36 = add i64 %35, %34
  %37 = icmp ult i64 %36, %4
  br i1 %37, label %116, label %38

38:                                               ; preds = %27
  %39 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %40 = load i32*, i32** %39, align 8, !tbaa !3
  br label %44

41:                                               ; preds = %20
  %42 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %43 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %42, i64 0, i32 1, i64 0
  br label %44

44:                                               ; preds = %38, %41
  %45 = phi i64 [ %30, %38 ], [ %23, %41 ]
  %46 = phi i64 [ %28, %38 ], [ %21, %41 ]
  %47 = phi i64 [ %16, %38 ], [ %12, %41 ]
  %48 = phi i32* [ %40, %38 ], [ %43, %41 ]
  %49 = icmp eq i64 %45, %4
  br i1 %49, label %92, label %50

50:                                               ; preds = %44
  %51 = sub i64 %46, %45
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %92, label %53

53:                                               ; preds = %50
  %54 = icmp ugt i64 %45, %4
  %55 = getelementptr inbounds i32, i32* %48, i64 %1
  br i1 %54, label %56, label %60

56:                                               ; preds = %53
  %57 = icmp eq i64 %4, 0
  br i1 %57, label %88, label %58

58:                                               ; preds = %56
  %59 = tail call i32* @wmemmove(i32* %55, i32* %3, i64 %4) #20
  br label %88

60:                                               ; preds = %53
  %61 = icmp ult i32* %55, %3
  %62 = getelementptr inbounds i32, i32* %48, i64 %47
  %63 = icmp ugt i32* %62, %3
  %64 = and i1 %61, %63
  br i1 %64, label %65, label %79

65:                                               ; preds = %60
  %66 = getelementptr inbounds i32, i32* %55, i64 %45
  %67 = icmp ugt i32* %66, %3
  br i1 %67, label %71, label %68

68:                                               ; preds = %65
  %69 = sub i64 %4, %45
  %70 = getelementptr inbounds i32, i32* %3, i64 %69
  br label %79

71:                                               ; preds = %65
  %72 = icmp eq i64 %45, 0
  br i1 %72, label %75, label %73

73:                                               ; preds = %71
  %74 = tail call i32* @wmemmove(i32* %55, i32* %3, i64 %45) #20
  br label %75

75:                                               ; preds = %71, %73
  %76 = add i64 %45, %1
  %77 = getelementptr inbounds i32, i32* %3, i64 %4
  %78 = sub i64 %4, %45
  br label %79

79:                                               ; preds = %68, %75, %60
  %80 = phi i64 [ 0, %75 ], [ %45, %68 ], [ %45, %60 ]
  %81 = phi i64 [ %78, %75 ], [ %4, %68 ], [ %4, %60 ]
  %82 = phi i32* [ %77, %75 ], [ %70, %68 ], [ %3, %60 ]
  %83 = phi i64 [ %76, %75 ], [ %1, %68 ], [ %1, %60 ]
  %84 = getelementptr inbounds i32, i32* %48, i64 %83
  %85 = getelementptr inbounds i32, i32* %84, i64 %81
  %86 = getelementptr inbounds i32, i32* %84, i64 %80
  %87 = tail call i32* @wmemmove(i32* %85, i32* %86, i64 %51) #20
  br label %92

88:                                               ; preds = %58, %56
  %89 = getelementptr inbounds i32, i32* %55, i64 %4
  %90 = getelementptr inbounds i32, i32* %55, i64 %45
  %91 = tail call i32* @wmemmove(i32* %89, i32* %90, i64 %51) #20
  br label %101

92:                                               ; preds = %79, %50, %44
  %93 = phi i64 [ %4, %44 ], [ %80, %79 ], [ %45, %50 ]
  %94 = phi i64 [ %4, %44 ], [ %81, %79 ], [ %4, %50 ]
  %95 = phi i32* [ %3, %44 ], [ %82, %79 ], [ %3, %50 ]
  %96 = phi i64 [ %1, %44 ], [ %83, %79 ], [ %1, %50 ]
  %97 = icmp eq i64 %94, 0
  br i1 %97, label %101, label %98

98:                                               ; preds = %92
  %99 = getelementptr inbounds i32, i32* %48, i64 %96
  %100 = tail call i32* @wmemmove(i32* %99, i32* %95, i64 %94) #20
  br label %101

101:                                              ; preds = %98, %92, %88
  %102 = phi i64 [ %45, %88 ], [ %93, %92 ], [ %93, %98 ]
  %103 = phi i64 [ %4, %88 ], [ 0, %92 ], [ %94, %98 ]
  %104 = sub i64 %103, %102
  %105 = add i64 %104, %47
  %106 = load i8, i8* %6, align 8, !tbaa !3
  %107 = and i8 %106, 1
  %108 = icmp eq i8 %107, 0
  br i1 %108, label %111, label %109

109:                                              ; preds = %101
  %110 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %105, i64* %110, align 8, !tbaa !3
  br label %114

111:                                              ; preds = %101
  %112 = trunc i64 %105 to i8
  %113 = shl i8 %112, 1
  store i8 %113, i8* %6, align 8, !tbaa !3
  br label %114

114:                                              ; preds = %109, %111
  %115 = getelementptr inbounds i32, i32* %48, i64 %105
  store i32 0, i32* %115, align 4, !tbaa !7
  br label %123

116:                                              ; preds = %27, %20
  %117 = phi i64 [ %34, %27 ], [ 4, %20 ]
  %118 = phi i64 [ %16, %27 ], [ %12, %20 ]
  %119 = phi i64 [ %30, %27 ], [ %23, %20 ]
  %120 = add i64 %118, %4
  %121 = add i64 %117, %119
  %122 = sub i64 %120, %121
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %117, i64 %122, i64 %118, i64 %1, i64 %119, i64 %4, i32* %3)
  br label %123

123:                                              ; preds = %116, %114
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6, i32* %7) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %9 = sub i64 4611686018427387886, %1
  %10 = icmp ult i64 %9, %2
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %12) #19
  unreachable

13:                                               ; preds = %8
  %14 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %15 = load i8, i8* %14, align 8, !tbaa !3
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %13
  %19 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %20 = load i32*, i32** %19, align 8, !tbaa !3
  br label %24

21:                                               ; preds = %13
  %22 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %23 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %22, i64 0, i32 1, i64 0
  br label %24

24:                                               ; preds = %18, %21
  %25 = phi i32* [ %20, %18 ], [ %23, %21 ]
  %26 = icmp ult i64 %1, 2305843009213693927
  br i1 %26, label %27, label %38

27:                                               ; preds = %24
  %28 = add i64 %2, %1
  %29 = shl nuw nsw i64 %1, 1
  %30 = icmp ult i64 %28, %29
  %31 = select i1 %30, i64 %29, i64 %28
  %32 = add i64 %31, 4
  %33 = and i64 %32, -4
  %34 = icmp ult i64 %31, 5
  %35 = select i1 %34, i64 5, i64 %33
  %36 = icmp ugt i64 %35, 4611686018427387903
  br i1 %36, label %37, label %38

37:                                               ; preds = %27
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

38:                                               ; preds = %24, %27
  %39 = phi i64 [ %35, %27 ], [ 4611686018427387887, %24 ]
  %40 = shl nuw i64 %39, 2
  %41 = tail call noalias nonnull i8* @_Znwm(i64 %40) #21
  %42 = bitcast i8* %41 to i32*
  %43 = icmp eq i64 %4, 0
  br i1 %43, label %46, label %44

44:                                               ; preds = %38
  %45 = tail call i32* @wmemcpy(i32* nonnull %42, i32* %25, i64 %4) #20
  br label %46

46:                                               ; preds = %38, %44
  %47 = icmp eq i64 %6, 0
  br i1 %47, label %51, label %48

48:                                               ; preds = %46
  %49 = getelementptr inbounds i32, i32* %42, i64 %4
  %50 = tail call i32* @wmemcpy(i32* nonnull %49, i32* %7, i64 %6) #20
  br label %51

51:                                               ; preds = %46, %48
  %52 = sub i64 %3, %5
  %53 = sub i64 %52, %4
  %54 = icmp eq i64 %53, 0
  br i1 %54, label %61, label %55

55:                                               ; preds = %51
  %56 = getelementptr inbounds i32, i32* %42, i64 %4
  %57 = getelementptr inbounds i32, i32* %56, i64 %6
  %58 = getelementptr inbounds i32, i32* %25, i64 %4
  %59 = getelementptr inbounds i32, i32* %58, i64 %5
  %60 = tail call i32* @wmemcpy(i32* nonnull %57, i32* %59, i64 %53) #20
  br label %61

61:                                               ; preds = %51, %55
  %62 = icmp eq i64 %1, 4
  br i1 %62, label %65, label %63

63:                                               ; preds = %61
  %64 = bitcast i32* %25 to i8*
  tail call void @_ZdlPv(i8* %64) #22
  br label %65

65:                                               ; preds = %61, %63
  %66 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %67 = bitcast i32** %66 to i8**
  store i8* %41, i8** %67, align 8, !tbaa !3
  %68 = or i64 %39, 1
  %69 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %68, i64* %69, align 8, !tbaa !3
  %70 = add i64 %52, %6
  %71 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %70, i64* %71, align 8, !tbaa !3
  %72 = getelementptr inbounds i32, i32* %42, i64 %70
  store i32 0, i32* %72, align 4, !tbaa !7
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5rfindEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub i64 %21, %23
  %25 = icmp ugt i64 %24, %3
  %26 = add i64 %23, %3
  %27 = select i1 %25, i64 %26, i64 %21
  %28 = getelementptr inbounds i32, i32* %20, i64 %27
  %29 = icmp eq i64 %3, 0
  %30 = icmp slt i64 %27, %3
  %31 = or i1 %29, %30
  br i1 %31, label %56, label %32

32:                                               ; preds = %19
  %33 = getelementptr inbounds i32, i32* %1, i64 %3
  %34 = add nsw i64 %3, -1
  %35 = getelementptr inbounds i32, i32* %20, i64 %34
  %36 = getelementptr inbounds i32, i32* %33, i64 -1
  br label %37

37:                                               ; preds = %45, %32
  %38 = phi i32* [ %28, %32 ], [ %41, %45 ]
  %39 = icmp eq i32* %35, %38
  br i1 %39, label %56, label %40

40:                                               ; preds = %37
  %41 = getelementptr inbounds i32, i32* %38, i64 -1
  %42 = load i32, i32* %41, align 4, !tbaa !7
  %43 = load i32, i32* %36, align 4, !tbaa !7
  %44 = icmp eq i32 %42, %43
  br i1 %44, label %46, label %45

45:                                               ; preds = %50, %40
  br label %37

46:                                               ; preds = %40, %50
  %47 = phi i32* [ %51, %50 ], [ %41, %40 ]
  %48 = phi i32* [ %53, %50 ], [ %36, %40 ]
  %49 = icmp eq i32* %48, %1
  br i1 %49, label %56, label %50

50:                                               ; preds = %46
  %51 = getelementptr inbounds i32, i32* %47, i64 -1
  %52 = load i32, i32* %51, align 4, !tbaa !7
  %53 = getelementptr inbounds i32, i32* %48, i64 -1
  %54 = load i32, i32* %53, align 4, !tbaa !7
  %55 = icmp eq i32 %52, %54
  br i1 %55, label %46, label %45

56:                                               ; preds = %37, %46, %19
  %57 = phi i32* [ %28, %19 ], [ %47, %46 ], [ %28, %37 ]
  %58 = icmp ne i64 %3, 0
  %59 = icmp eq i32* %57, %28
  %60 = and i1 %58, %59
  %61 = ptrtoint i32* %57 to i64
  %62 = ptrtoint i32* %20 to i64
  %63 = sub i64 %61, %62
  %64 = ashr exact i64 %63, 2
  %65 = select i1 %60, i64 -1, i64 %64
  ret i64 %65
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #5 comdat align 2 {
  %5 = icmp ugt i64 %3, 4611686018427387887
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %7) #19
  unreachable

8:                                                ; preds = %4
  %9 = icmp ult i64 %3, 5
  br i1 %9, label %10, label %16

10:                                               ; preds = %8
  %11 = trunc i64 %2 to i8
  %12 = shl i8 %11, 1
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %12, i8* %13, align 8, !tbaa !3
  %14 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %14, i64 0, i32 1, i64 0
  br label %30

16:                                               ; preds = %8
  %17 = add nuw nsw i64 %3, 4
  %18 = and i64 %17, -4
  %19 = icmp ugt i64 %18, 4611686018427387903
  br i1 %19, label %20, label %21

20:                                               ; preds = %16
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

21:                                               ; preds = %16
  %22 = shl nuw i64 %18, 2
  %23 = tail call noalias nonnull i8* @_Znwm(i64 %22) #21
  %24 = bitcast i8* %23 to i32*
  %25 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %26 = bitcast i32** %25 to i8**
  store i8* %23, i8** %26, align 8, !tbaa !3
  %27 = or i64 %18, 1
  %28 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %27, i64* %28, align 8, !tbaa !3
  %29 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %29, align 8, !tbaa !3
  br label %30

30:                                               ; preds = %21, %10
  %31 = phi i32* [ %15, %10 ], [ %24, %21 ]
  %32 = icmp eq i64 %2, 0
  br i1 %32, label %35, label %33

33:                                               ; preds = %30
  %34 = tail call i32* @wmemcpy(i32* nonnull %31, i32* %1, i64 %2) #20
  br label %35

35:                                               ; preds = %30, %33
  %36 = getelementptr inbounds i32, i32* %31, i64 %2
  store i32 0, i32* %36, align 4, !tbaa !7
  ret void
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_) align 2 {
  %3 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %9

7:                                                ; preds = %2
  %8 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %8, i8* nonnull align 8 dereferenceable(24) %3, i64 24, i1 false), !tbaa.struct !6
  br label %43

9:                                                ; preds = %2
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ult i64 %13, 5
  br i1 %14, label %15, label %21

15:                                               ; preds = %9
  %16 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %17 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %16, i64 0, i32 1, i64 0
  %18 = trunc i64 %13 to i8
  %19 = shl nuw nsw i8 %18, 1
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %19, i8* %20, align 8, !tbaa !3
  br label %39

21:                                               ; preds = %9
  %22 = icmp ugt i64 %13, 4611686018427387887
  br i1 %22, label %23, label %25

23:                                               ; preds = %21
  %24 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %24) #19
  unreachable

25:                                               ; preds = %21
  %26 = add nuw nsw i64 %13, 4
  %27 = and i64 %26, -4
  %28 = icmp ugt i64 %27, 4611686018427387903
  br i1 %28, label %29, label %30

29:                                               ; preds = %25
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

30:                                               ; preds = %25
  %31 = shl nuw i64 %27, 2
  %32 = tail call noalias nonnull i8* @_Znwm(i64 %31) #21
  %33 = bitcast i8* %32 to i32*
  %34 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %35 = bitcast i32** %34 to i8**
  store i8* %32, i8** %35, align 8, !tbaa !3
  %36 = or i64 %27, 1
  %37 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %36, i64* %37, align 8, !tbaa !3
  %38 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %13, i64* %38, align 8, !tbaa !3
  br label %39

39:                                               ; preds = %15, %30
  %40 = phi i32* [ %17, %15 ], [ %33, %30 ]
  %41 = add nuw nsw i64 %13, 1
  %42 = tail call i32* @wmemcpy(i32* nonnull %40, i32* %11, i64 %41) #20
  br label %43

43:                                               ; preds = %39, %7
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKw(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %3) local_unnamed_addr #2 comdat align 2 {
  %5 = tail call i64 @wcslen(i32* %3) #20
  %6 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %3, i64 %5)
  ret %"class.std::__1::basic_string.3"* %6
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_RKS4_(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::allocator.9"* nonnull align 1 dereferenceable(1) %2) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_RKS4_) align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %9, i8* nonnull align 8 dereferenceable(24) %4, i64 24, i1 false), !tbaa.struct !6
  br label %44

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %12 = load i32*, i32** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = icmp ult i64 %14, 5
  br i1 %15, label %16, label %22

16:                                               ; preds = %10
  %17 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %18 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %17, i64 0, i32 1, i64 0
  %19 = trunc i64 %14 to i8
  %20 = shl nuw nsw i8 %19, 1
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %20, i8* %21, align 8, !tbaa !3
  br label %40

22:                                               ; preds = %10
  %23 = icmp ugt i64 %14, 4611686018427387887
  br i1 %23, label %24, label %26

24:                                               ; preds = %22
  %25 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %25) #19
  unreachable

26:                                               ; preds = %22
  %27 = add nuw nsw i64 %14, 4
  %28 = and i64 %27, -4
  %29 = icmp ugt i64 %28, 4611686018427387903
  br i1 %29, label %30, label %31

30:                                               ; preds = %26
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

31:                                               ; preds = %26
  %32 = shl nuw i64 %28, 2
  %33 = tail call noalias nonnull i8* @_Znwm(i64 %32) #21
  %34 = bitcast i8* %33 to i32*
  %35 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %36 = bitcast i32** %35 to i8**
  store i8* %33, i8** %36, align 8, !tbaa !3
  %37 = or i64 %28, 1
  %38 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %37, i64* %38, align 8, !tbaa !3
  %39 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %14, i64* %39, align 8, !tbaa !3
  br label %40

40:                                               ; preds = %16, %31
  %41 = phi i32* [ %18, %16 ], [ %34, %31 ]
  %42 = add nuw nsw i64 %14, 1
  %43 = tail call i32* @wmemcpy(i32* nonnull %41, i32* %12, i64 %42) #20
  br label %44

44:                                               ; preds = %40, %8
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE16find_last_not_ofEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ugt i64 %21, %2
  %23 = add i64 %2, 1
  %24 = select i1 %22, i64 %23, i64 %21
  %25 = getelementptr inbounds i32, i32* %20, i64 %24
  %26 = icmp eq i64 %3, 0
  br i1 %26, label %27, label %31

27:                                               ; preds = %19
  %28 = icmp eq i64 %24, 0
  br i1 %28, label %45, label %29

29:                                               ; preds = %27
  %30 = getelementptr inbounds i32, i32* %25, i64 -1
  br label %39

31:                                               ; preds = %19, %34
  %32 = phi i32* [ %35, %34 ], [ %25, %19 ]
  %33 = icmp eq i32* %32, %20
  br i1 %33, label %45, label %34

34:                                               ; preds = %31
  %35 = getelementptr inbounds i32, i32* %32, i64 -1
  %36 = load i32, i32* %35, align 4, !tbaa !7
  %37 = tail call i32* @wmemchr(i32* %1, i32 signext %36, i64 %3) #20
  %38 = icmp eq i32* %37, null
  br i1 %38, label %39, label %31

39:                                               ; preds = %34, %29
  %40 = phi i32* [ %30, %29 ], [ %35, %34 ]
  %41 = ptrtoint i32* %40 to i64
  %42 = ptrtoint i32* %20 to i64
  %43 = sub i64 %41, %42
  %44 = ashr exact i64 %43, 2
  br label %45

45:                                               ; preds = %31, %27, %39
  %46 = phi i64 [ %44, %39 ], [ -1, %27 ], [ -1, %31 ]
  ret i64 %46
}

; Function Attrs: inlinehint nounwind uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEED2Ev(%"class.std::__1::basic_string.3"* %0) unnamed_addr #6 comdat($_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEED5Ev) align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %3 = load i8, i8* %2, align 8, !tbaa !3
  %4 = and i8 %3, 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %10, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %8 = bitcast i32** %7 to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %9) #22
  br label %10

10:                                               ; preds = %1, %6
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE17find_first_not_ofEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ugt i64 %21, %2
  br i1 %22, label %23, label %41

23:                                               ; preds = %19
  %24 = getelementptr inbounds i32, i32* %20, i64 %21
  %25 = getelementptr inbounds i32, i32* %20, i64 %2
  %26 = icmp eq i64 %3, 0
  br i1 %26, label %35, label %27

27:                                               ; preds = %23, %32
  %28 = phi i32* [ %33, %32 ], [ %25, %23 ]
  %29 = load i32, i32* %28, align 4, !tbaa !7
  %30 = tail call i32* @wmemchr(i32* %1, i32 signext %29, i64 %3) #20
  %31 = icmp eq i32* %30, null
  br i1 %31, label %35, label %32

32:                                               ; preds = %27
  %33 = getelementptr inbounds i32, i32* %28, i64 1
  %34 = icmp eq i32* %33, %24
  br i1 %34, label %41, label %27

35:                                               ; preds = %27, %23
  %36 = phi i32* [ %25, %23 ], [ %28, %27 ]
  %37 = ptrtoint i32* %36 to i64
  %38 = ptrtoint i32* %20 to i64
  %39 = sub i64 %37, %38
  %40 = ashr exact i64 %39, 2
  br label %41

41:                                               ; preds = %32, %19, %35
  %42 = phi i64 [ %40, %35 ], [ -1, %19 ], [ -1, %32 ]
  ret i64 %42
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32 signext %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %12, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %11 = load i64, i64* %10, align 8, !tbaa !3
  br label %15

12:                                               ; preds = %4
  %13 = lshr i8 %6, 1
  %14 = zext i8 %13 to i64
  br label %15

15:                                               ; preds = %9, %12
  %16 = phi i64 [ %11, %9 ], [ %14, %12 ]
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %20

18:                                               ; preds = %15
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %15
  %21 = icmp eq i64 %2, 0
  br i1 %21, label %68, label %22

22:                                               ; preds = %20
  br i1 %8, label %23, label %26

23:                                               ; preds = %22
  %24 = sub i64 4, %16
  %25 = icmp ult i64 %24, %2
  br i1 %25, label %47, label %36

26:                                               ; preds = %22
  %27 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %28 = load i64, i64* %27, align 8, !tbaa !3
  %29 = and i64 %28, -2
  %30 = add i64 %29, -1
  %31 = sub i64 %30, %16
  %32 = icmp ult i64 %31, %2
  br i1 %32, label %47, label %33

33:                                               ; preds = %26
  %34 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %35 = load i32*, i32** %34, align 8, !tbaa !3
  br label %39

36:                                               ; preds = %23
  %37 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %38 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %37, i64 0, i32 1, i64 0
  br label %39

39:                                               ; preds = %33, %36
  %40 = phi i32* [ %35, %33 ], [ %38, %36 ]
  %41 = sub i64 %16, %1
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %53, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds i32, i32* %40, i64 %1
  %45 = getelementptr inbounds i32, i32* %44, i64 %2
  %46 = tail call i32* @wmemmove(i32* nonnull %45, i32* %44, i64 %41) #20
  br label %53

47:                                               ; preds = %26, %23
  %48 = phi i64 [ %30, %26 ], [ 4, %23 ]
  %49 = add i64 %16, %2
  %50 = sub i64 %49, %48
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %48, i64 %50, i64 %16, i64 %1, i64 0, i64 %2)
  %51 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %52 = load i32*, i32** %51, align 8, !tbaa !3
  br label %53

53:                                               ; preds = %43, %39, %47
  %54 = phi i32* [ %52, %47 ], [ %40, %39 ], [ %40, %43 ]
  %55 = getelementptr inbounds i32, i32* %54, i64 %1
  %56 = tail call i32* @wmemset(i32* %55, i32 signext %3, i64 %2) #20
  %57 = add i64 %16, %2
  %58 = load i8, i8* %5, align 8, !tbaa !3
  %59 = and i8 %58, 1
  %60 = icmp eq i8 %59, 0
  br i1 %60, label %63, label %61

61:                                               ; preds = %53
  %62 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %57, i64* %62, align 8, !tbaa !3
  br label %66

63:                                               ; preds = %53
  %64 = trunc i64 %57 to i8
  %65 = shl i8 %64, 1
  store i8 %65, i8* %5, align 8, !tbaa !3
  br label %66

66:                                               ; preds = %61, %63
  %67 = getelementptr inbounds i32, i32* %54, i64 %57
  store i32 0, i32* %67, align 4, !tbaa !7
  br label %68

68:                                               ; preds = %20, %66
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i64 %3, i64 %4, i64 %5, i64 %6) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %8 = sub i64 4611686018427387887, %1
  %9 = icmp ult i64 %8, %2
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %7
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %12
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i32*, i32** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %12
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i32* [ %19, %17 ], [ %22, %20 ]
  %25 = icmp ult i64 %1, 2305843009213693927
  br i1 %25, label %26, label %37

26:                                               ; preds = %23
  %27 = add i64 %2, %1
  %28 = shl nuw nsw i64 %1, 1
  %29 = icmp ult i64 %27, %28
  %30 = select i1 %29, i64 %28, i64 %27
  %31 = add i64 %30, 4
  %32 = and i64 %31, -4
  %33 = icmp ult i64 %30, 5
  %34 = select i1 %33, i64 5, i64 %32
  %35 = icmp ugt i64 %34, 4611686018427387903
  br i1 %35, label %36, label %37

36:                                               ; preds = %26
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

37:                                               ; preds = %23, %26
  %38 = phi i64 [ %34, %26 ], [ 4611686018427387887, %23 ]
  %39 = shl nuw i64 %38, 2
  %40 = tail call noalias nonnull i8* @_Znwm(i64 %39) #21
  %41 = bitcast i8* %40 to i32*
  %42 = icmp eq i64 %4, 0
  br i1 %42, label %45, label %43

43:                                               ; preds = %37
  %44 = tail call i32* @wmemcpy(i32* nonnull %41, i32* %24, i64 %4) #20
  br label %45

45:                                               ; preds = %37, %43
  %46 = sub i64 %3, %5
  %47 = sub i64 %46, %4
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %55, label %49

49:                                               ; preds = %45
  %50 = getelementptr inbounds i32, i32* %41, i64 %4
  %51 = getelementptr inbounds i32, i32* %50, i64 %6
  %52 = getelementptr inbounds i32, i32* %24, i64 %4
  %53 = getelementptr inbounds i32, i32* %52, i64 %5
  %54 = tail call i32* @wmemcpy(i32* nonnull %51, i32* %53, i64 %47) #20
  br label %55

55:                                               ; preds = %45, %49
  %56 = icmp eq i64 %1, 4
  br i1 %56, label %59, label %57

57:                                               ; preds = %55
  %58 = bitcast i32* %24 to i8*
  tail call void @_ZdlPv(i8* %58) #22
  br label %59

59:                                               ; preds = %55, %57
  %60 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %61 = bitcast i32** %60 to i8**
  store i8* %40, i8** %61, align 8, !tbaa !3
  %62 = or i64 %38, 1
  %63 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %62, i64* %63, align 8, !tbaa !3
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEaSEw(%"class.std::__1::basic_string.3"* %0, i32 signext %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %2
  %8 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %9 = load i32*, i32** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 1, i64* %10, align 8, !tbaa !3
  br label %14

11:                                               ; preds = %2
  %12 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %13 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %12, i64 0, i32 1, i64 0
  store i8 2, i8* %3, align 8, !tbaa !3
  br label %14

14:                                               ; preds = %11, %7
  %15 = phi i32* [ %9, %7 ], [ %13, %11 ]
  store i32 %1, i32* %15, align 4, !tbaa !7
  %16 = getelementptr inbounds i32, i32* %15, i64 1
  store i32 0, i32* %16, align 4, !tbaa !7
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEPKwm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2) local_unnamed_addr #5 comdat align 2 {
  %4 = icmp ugt i64 %2, 4611686018427387887
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %6) #19
  unreachable

7:                                                ; preds = %3
  %8 = icmp ult i64 %2, 5
  br i1 %8, label %23, label %9

9:                                                ; preds = %7
  %10 = add nuw nsw i64 %2, 4
  %11 = and i64 %10, -4
  %12 = icmp ugt i64 %11, 4611686018427387903
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

14:                                               ; preds = %9
  %15 = shl nuw i64 %11, 2
  %16 = tail call noalias nonnull i8* @_Znwm(i64 %15) #21
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = bitcast i32** %18 to i8**
  store i8* %16, i8** %19, align 8, !tbaa !3
  %20 = or i64 %11, 1
  %21 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %20, i64* %21, align 8, !tbaa !3
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %22, align 8, !tbaa !3
  br label %30

23:                                               ; preds = %7
  %24 = trunc i64 %2 to i8
  %25 = shl nuw nsw i8 %24, 1
  %26 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %25, i8* %26, align 8, !tbaa !3
  %27 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %27, i64 0, i32 1, i64 0
  %29 = icmp eq i64 %2, 0
  br i1 %29, label %33, label %30

30:                                               ; preds = %14, %23
  %31 = phi i32* [ %17, %14 ], [ %28, %23 ]
  %32 = tail call i32* @wmemcpy(i32* nonnull %31, i32* %1, i64 %2) #20
  br label %33

33:                                               ; preds = %23, %30
  %34 = phi i32* [ %28, %23 ], [ %31, %30 ]
  %35 = getelementptr inbounds i32, i32* %34, i64 %2
  store i32 0, i32* %35, align 4, !tbaa !7
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 4 dereferenceable(4) i32* @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE2atEm(%"class.std::__1::basic_string.3"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp ugt i64 %9, %1
  br i1 %10, label %20, label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ugt i64 %13, %1
  br i1 %14, label %17, label %15

15:                                               ; preds = %11, %7
  %16 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %16) #19
  unreachable

17:                                               ; preds = %11
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i32*, i32** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %7
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i32* [ %19, %17 ], [ %22, %20 ]
  %25 = getelementptr inbounds i32, i32* %24, i64 %1
  ret i32* %25
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i32* %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %1
  br i1 %12, label %17, label %24

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load i64, i64* %20, align 8, !tbaa !3
  %22 = and i64 %21, -2
  %23 = add i64 %22, -1
  br label %24

24:                                               ; preds = %9, %19
  %25 = phi i64 [ %15, %19 ], [ %11, %9 ]
  %26 = phi i64 [ %23, %19 ], [ 4, %9 ]
  %27 = sub i64 %26, %25
  %28 = icmp ult i64 %27, %3
  br i1 %28, label %67, label %29

29:                                               ; preds = %24
  %30 = icmp eq i64 %3, 0
  br i1 %30, label %70, label %31

31:                                               ; preds = %29
  br i1 %8, label %35, label %32

32:                                               ; preds = %31
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i32*, i32** %33, align 8, !tbaa !3
  br label %38

35:                                               ; preds = %31
  %36 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %37 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %36, i64 0, i32 1, i64 0
  br label %38

38:                                               ; preds = %32, %35
  %39 = phi i32* [ %34, %32 ], [ %37, %35 ]
  %40 = sub i64 %25, %1
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %52, label %42

42:                                               ; preds = %38
  %43 = getelementptr inbounds i32, i32* %39, i64 %1
  %44 = icmp ule i32* %43, %2
  %45 = getelementptr inbounds i32, i32* %39, i64 %25
  %46 = icmp ugt i32* %45, %2
  %47 = and i1 %44, %46
  %48 = getelementptr inbounds i32, i32* %2, i64 %3
  %49 = select i1 %47, i32* %48, i32* %2
  %50 = getelementptr inbounds i32, i32* %43, i64 %3
  %51 = tail call i32* @wmemmove(i32* nonnull %50, i32* %43, i64 %40) #20
  br label %52

52:                                               ; preds = %38, %42
  %53 = phi i32* [ %49, %42 ], [ %2, %38 ]
  %54 = getelementptr inbounds i32, i32* %39, i64 %1
  %55 = tail call i32* @wmemmove(i32* %54, i32* %53, i64 %3) #20
  %56 = add i64 %25, %3
  %57 = load i8, i8* %5, align 8, !tbaa !3
  %58 = and i8 %57, 1
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %62, label %60

60:                                               ; preds = %52
  %61 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %56, i64* %61, align 8, !tbaa !3
  br label %65

62:                                               ; preds = %52
  %63 = trunc i64 %56 to i8
  %64 = shl i8 %63, 1
  store i8 %64, i8* %5, align 8, !tbaa !3
  br label %65

65:                                               ; preds = %60, %62
  %66 = getelementptr inbounds i32, i32* %39, i64 %56
  store i32 0, i32* %66, align 4, !tbaa !7
  br label %70

67:                                               ; preds = %24
  %68 = add i64 %25, %3
  %69 = sub i64 %68, %26
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %26, i64 %69, i64 %25, i64 %1, i64 0, i64 %3, i32* %2)
  br label %70

70:                                               ; preds = %29, %65, %67
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE13find_first_ofEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ule i64 %21, %2
  %23 = icmp eq i64 %3, 0
  %24 = or i1 %23, %22
  br i1 %24, label %50, label %25

25:                                               ; preds = %19
  %26 = getelementptr inbounds i32, i32* %20, i64 %2
  %27 = getelementptr inbounds i32, i32* %20, i64 %21
  %28 = getelementptr inbounds i32, i32* %1, i64 %3
  br label %29

29:                                               ; preds = %39, %25
  %30 = phi i32* [ %40, %39 ], [ %26, %25 ]
  %31 = load i32, i32* %30, align 4, !tbaa !7
  br label %34

32:                                               ; preds = %34
  %33 = icmp eq i32* %38, %28
  br i1 %33, label %39, label %34

34:                                               ; preds = %32, %29
  %35 = phi i32* [ %1, %29 ], [ %38, %32 ]
  %36 = load i32, i32* %35, align 4, !tbaa !7
  %37 = icmp eq i32 %31, %36
  %38 = getelementptr inbounds i32, i32* %35, i64 1
  br i1 %37, label %42, label %32

39:                                               ; preds = %32
  %40 = getelementptr inbounds i32, i32* %30, i64 1
  %41 = icmp eq i32* %40, %27
  br i1 %41, label %42, label %29

42:                                               ; preds = %39, %34
  %43 = phi i32* [ %30, %34 ], [ %27, %39 ]
  %44 = icmp eq i32* %43, %27
  %45 = ptrtoint i32* %43 to i64
  %46 = ptrtoint i32* %20 to i64
  %47 = sub i64 %45, %46
  %48 = ashr exact i64 %47, 2
  %49 = select i1 %44, i64 -1, i64 %48
  br label %50

50:                                               ; preds = %19, %42
  %51 = phi i64 [ -1, %19 ], [ %49, %42 ]
  ret i64 %51
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i64 %3, i32 signext %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  br i1 %13, label %18, label %20

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %1
  br i1 %17, label %18, label %27

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %10
  %21 = sub i64 %12, %1
  %22 = icmp ult i64 %21, %2
  %23 = select i1 %22, i64 %21, i64 %2
  %24 = sub nsw i64 4, %12
  %25 = add i64 %24, %23
  %26 = icmp ult i64 %25, %3
  br i1 %26, label %58, label %41

27:                                               ; preds = %14
  %28 = sub i64 %16, %1
  %29 = icmp ult i64 %28, %2
  %30 = select i1 %29, i64 %28, i64 %2
  %31 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !3
  %33 = and i64 %32, -2
  %34 = add i64 %33, -1
  %35 = sub i64 %30, %16
  %36 = add i64 %35, %34
  %37 = icmp ult i64 %36, %3
  br i1 %37, label %58, label %38

38:                                               ; preds = %27
  %39 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %40 = load i32*, i32** %39, align 8, !tbaa !3
  br label %44

41:                                               ; preds = %20
  %42 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %43 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %42, i64 0, i32 1, i64 0
  br label %44

44:                                               ; preds = %38, %41
  %45 = phi i64 [ %30, %38 ], [ %23, %41 ]
  %46 = phi i64 [ %28, %38 ], [ %21, %41 ]
  %47 = phi i64 [ %16, %38 ], [ %12, %41 ]
  %48 = phi i32* [ %40, %38 ], [ %43, %41 ]
  %49 = icmp eq i64 %45, %3
  br i1 %49, label %67, label %50

50:                                               ; preds = %44
  %51 = sub i64 %46, %45
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %67, label %53

53:                                               ; preds = %50
  %54 = getelementptr inbounds i32, i32* %48, i64 %1
  %55 = getelementptr inbounds i32, i32* %54, i64 %3
  %56 = getelementptr inbounds i32, i32* %54, i64 %45
  %57 = tail call i32* @wmemmove(i32* %55, i32* %56, i64 %51) #20
  br label %67

58:                                               ; preds = %20, %27
  %59 = phi i64 [ %34, %27 ], [ 4, %20 ]
  %60 = phi i64 [ %16, %27 ], [ %12, %20 ]
  %61 = phi i64 [ %30, %27 ], [ %23, %20 ]
  %62 = add i64 %60, %3
  %63 = add i64 %59, %61
  %64 = sub i64 %62, %63
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %59, i64 %64, i64 %60, i64 %1, i64 %61, i64 %3)
  %65 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %66 = load i32*, i32** %65, align 8, !tbaa !3
  br label %69

67:                                               ; preds = %53, %50, %44
  %68 = icmp eq i64 %3, 0
  br i1 %68, label %75, label %69

69:                                               ; preds = %58, %67
  %70 = phi i32* [ %66, %58 ], [ %48, %67 ]
  %71 = phi i64 [ %60, %58 ], [ %47, %67 ]
  %72 = phi i64 [ %61, %58 ], [ %45, %67 ]
  %73 = getelementptr inbounds i32, i32* %70, i64 %1
  %74 = tail call i32* @wmemset(i32* %73, i32 signext %4, i64 %3) #20
  br label %75

75:                                               ; preds = %67, %69
  %76 = phi i32* [ %48, %67 ], [ %70, %69 ]
  %77 = phi i64 [ %47, %67 ], [ %71, %69 ]
  %78 = phi i64 [ %45, %67 ], [ %72, %69 ]
  %79 = sub i64 %3, %78
  %80 = add i64 %79, %77
  %81 = load i8, i8* %6, align 8, !tbaa !3
  %82 = and i8 %81, 1
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %86, label %84

84:                                               ; preds = %75
  %85 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %80, i64* %85, align 8, !tbaa !3
  br label %89

86:                                               ; preds = %75
  %87 = trunc i64 %80 to i8
  %88 = shl i8 %87, 1
  store i8 %88, i8* %6, align 8, !tbaa !3
  br label %89

89:                                               ; preds = %84, %86
  %90 = getelementptr inbounds i32, i32* %76, i64 %80
  store i32 0, i32* %90, align 4, !tbaa !7
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEPKwm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = icmp ugt i64 %2, 4
  br i1 %9, label %40, label %19

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = icmp ult i64 %14, %2
  br i1 %15, label %37, label %16

16:                                               ; preds = %10
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8, !tbaa !3
  br label %22

19:                                               ; preds = %8
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %20, i64 0, i32 1, i64 0
  br label %22

22:                                               ; preds = %19, %16
  %23 = phi i32* [ %18, %16 ], [ %21, %19 ]
  %24 = icmp eq i64 %2, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %26 = tail call i32* @wmemmove(i32* %23, i32* %1, i64 %2) #20
  br label %27

27:                                               ; preds = %25, %22
  %28 = getelementptr inbounds i32, i32* %23, i64 %2
  store i32 0, i32* %28, align 4, !tbaa !7
  %29 = load i8, i8* %4, align 8, !tbaa !3
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %27
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %2, i64* %33, align 8, !tbaa !3
  br label %47

34:                                               ; preds = %27
  %35 = trunc i64 %2 to i8
  %36 = shl i8 %35, 1
  store i8 %36, i8* %4, align 8, !tbaa !3
  br label %47

37:                                               ; preds = %10
  %38 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %39 = load i64, i64* %38, align 8, !tbaa !3
  br label %43

40:                                               ; preds = %8
  %41 = lshr i8 %5, 1
  %42 = zext i8 %41 to i64
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi i64 [ %14, %37 ], [ 4, %40 ]
  %45 = phi i64 [ %39, %37 ], [ %42, %40 ]
  %46 = sub i64 %2, %44
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %44, i64 %46, i64 %45, i64 0, i64 %45, i64 %2, i32* %1)
  br label %47

47:                                               ; preds = %43, %34, %32
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7reserveEm(%"class.std::__1::basic_string.3"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = icmp ugt i64 %1, 4611686018427387887
  br i1 %3, label %4, label %6

4:                                                ; preds = %2
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %5) #19
  unreachable

6:                                                ; preds = %2
  %7 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %13

11:                                               ; preds = %6
  %12 = icmp ugt i64 %1, 4
  br i1 %12, label %22, label %43

13:                                               ; preds = %6
  %14 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = and i64 %15, -2
  %17 = add i64 %16, -1
  %18 = icmp ult i64 %17, %1
  br i1 %18, label %19, label %43

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %21 = load i64, i64* %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %11
  %23 = lshr i8 %8, 1
  %24 = zext i8 %23 to i64
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %21, %19 ], [ %24, %22 ]
  %27 = icmp ugt i64 %26, %1
  %28 = select i1 %27, i64 %26, i64 %1
  %29 = add i64 %28, 4
  %30 = and i64 %29, -4
  %31 = add i64 %30, -1
  %32 = icmp ugt i64 %28, 4
  %33 = select i1 %32, i64 %31, i64 4
  br i1 %10, label %39, label %34

34:                                               ; preds = %25
  %35 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %36 = load i64, i64* %35, align 8, !tbaa !3
  %37 = and i64 %36, -2
  %38 = add i64 %37, -1
  br label %39

39:                                               ; preds = %25, %34
  %40 = phi i64 [ %38, %34 ], [ 4, %25 ]
  %41 = icmp eq i64 %33, %40
  br i1 %41, label %43, label %42

42:                                               ; preds = %39
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE18__shrink_or_extendEm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %33)
  br label %43

43:                                               ; preds = %13, %42, %39, %11
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE18__shrink_or_extendEm(%"class.std::__1::basic_string.3"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp eq i64 %1, 4
  br i1 %10, label %54, label %22

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = and i64 %13, -2
  %15 = add i64 %14, -1
  %16 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = icmp eq i64 %1, 4
  br i1 %18, label %19, label %22

19:                                               ; preds = %11
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %20, i64 0, i32 1, i64 0
  br label %59

22:                                               ; preds = %11, %7
  %23 = phi i64 [ %17, %11 ], [ %9, %7 ]
  %24 = phi i64 [ %15, %11 ], [ 4, %7 ]
  %25 = icmp ult i64 %24, %1
  %26 = add i64 %1, 1
  %27 = icmp ugt i64 %26, 4611686018427387903
  br i1 %25, label %28, label %33

28:                                               ; preds = %22
  br i1 %27, label %29, label %30

29:                                               ; preds = %28
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

30:                                               ; preds = %28
  %31 = shl nuw i64 %26, 2
  %32 = tail call noalias nonnull i8* @_Znwm(i64 %31) #21
  br label %43

33:                                               ; preds = %22
  br i1 %27, label %34, label %36

34:                                               ; preds = %33
  invoke void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
          to label %35 unwind label %39

35:                                               ; preds = %34
  unreachable

36:                                               ; preds = %33
  %37 = shl nuw i64 %26, 2
  %38 = invoke noalias nonnull i8* @_Znwm(i64 %37) #21
          to label %43 unwind label %39

39:                                               ; preds = %36, %34
  %40 = landingpad { i8*, i32 }
          catch i8* null
  %41 = extractvalue { i8*, i32 } %40, 0
  %42 = tail call i8* @__cxa_begin_catch(i8* %41) #20
  tail call void @__cxa_end_catch()
  br label %90

43:                                               ; preds = %36, %30
  %44 = phi i8* [ %32, %30 ], [ %38, %36 ]
  %45 = bitcast i8* %44 to i32*
  br i1 %6, label %49, label %46

46:                                               ; preds = %43
  %47 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %48 = load i64, i64* %47, align 8, !tbaa !3
  br label %59

49:                                               ; preds = %43
  %50 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %50, i64 0, i32 1, i64 0
  %52 = lshr i8 %4, 1
  %53 = zext i8 %52 to i64
  br label %66

54:                                               ; preds = %7
  %55 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %56 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %55, i64 0, i32 1, i64 0
  %57 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %58 = load i32*, i32** %57, align 8, !tbaa !3
  br label %66

59:                                               ; preds = %46, %19
  %60 = phi i64 [ %17, %19 ], [ %48, %46 ]
  %61 = phi i64 [ %17, %19 ], [ %23, %46 ]
  %62 = phi i32* [ %21, %19 ], [ %45, %46 ]
  %63 = phi i1 [ false, %19 ], [ true, %46 ]
  %64 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %65 = load i32*, i32** %64, align 8, !tbaa !3
  br label %66

66:                                               ; preds = %49, %54, %59
  %67 = phi i64 [ %61, %59 ], [ %9, %54 ], [ %23, %49 ]
  %68 = phi i32* [ %62, %59 ], [ %56, %54 ], [ %45, %49 ]
  %69 = phi i32* [ %65, %59 ], [ %58, %54 ], [ %51, %49 ]
  %70 = phi i1 [ %63, %59 ], [ false, %54 ], [ true, %49 ]
  %71 = phi i1 [ true, %59 ], [ true, %54 ], [ false, %49 ]
  %72 = phi i64 [ %60, %59 ], [ %9, %54 ], [ %53, %49 ]
  %73 = add i64 %72, 1
  %74 = icmp eq i64 %73, 0
  br i1 %74, label %77, label %75

75:                                               ; preds = %66
  %76 = tail call i32* @wmemcpy(i32* nonnull %68, i32* %69, i64 %73) #20
  br label %77

77:                                               ; preds = %66, %75
  br i1 %71, label %78, label %80

78:                                               ; preds = %77
  %79 = bitcast i32* %69 to i8*
  tail call void @_ZdlPv(i8* %79) #22
  br label %80

80:                                               ; preds = %78, %77
  br i1 %70, label %81, label %87

81:                                               ; preds = %80
  %82 = add nsw i64 %1, 1
  %83 = or i64 %82, 1
  %84 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %83, i64* %84, align 8, !tbaa !3
  %85 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %67, i64* %85, align 8, !tbaa !3
  %86 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i32* %68, i32** %86, align 8, !tbaa !3
  br label %90

87:                                               ; preds = %80
  %88 = trunc i64 %67 to i8
  %89 = shl i8 %88, 1
  store i8 %89, i8* %3, align 8, !tbaa !3
  br label %90

90:                                               ; preds = %81, %87, %39
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEPKwm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %15, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !3
  %11 = and i64 %10, -2
  %12 = add i64 %11, -1
  %13 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  br label %18

15:                                               ; preds = %3
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %15
  %19 = phi i64 [ %12, %8 ], [ 4, %15 ]
  %20 = phi i64 [ %14, %8 ], [ %17, %15 ]
  %21 = sub i64 %19, %20
  %22 = icmp ult i64 %21, %2
  br i1 %22, label %47, label %23

23:                                               ; preds = %18
  %24 = icmp eq i64 %2, 0
  br i1 %24, label %50, label %25

25:                                               ; preds = %23
  br i1 %7, label %29, label %26

26:                                               ; preds = %25
  %27 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %28 = load i32*, i32** %27, align 8, !tbaa !3
  br label %32

29:                                               ; preds = %25
  %30 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %31 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %30, i64 0, i32 1, i64 0
  br label %32

32:                                               ; preds = %26, %29
  %33 = phi i32* [ %28, %26 ], [ %31, %29 ]
  %34 = getelementptr inbounds i32, i32* %33, i64 %20
  %35 = tail call i32* @wmemcpy(i32* %34, i32* %1, i64 %2) #20
  %36 = add i64 %20, %2
  %37 = load i8, i8* %4, align 8, !tbaa !3
  %38 = and i8 %37, 1
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %42, label %40

40:                                               ; preds = %32
  %41 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %36, i64* %41, align 8, !tbaa !3
  br label %45

42:                                               ; preds = %32
  %43 = trunc i64 %36 to i8
  %44 = shl i8 %43, 1
  store i8 %44, i8* %4, align 8, !tbaa !3
  br label %45

45:                                               ; preds = %40, %42
  %46 = getelementptr inbounds i32, i32* %33, i64 %36
  store i32 0, i32* %46, align 4, !tbaa !7
  br label %50

47:                                               ; preds = %18
  %48 = add i64 %20, %2
  %49 = sub i64 %48, %19
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %19, i64 %49, i64 %20, i64 %20, i64 0, i64 %2, i32* %1)
  br label %50

50:                                               ; preds = %23, %45, %47
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignERKS5_mm(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %2
  br i1 %12, label %17, label %22

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %2
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %21 = load i32*, i32** %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %9
  %23 = bitcast %"class.std::__1::basic_string.3"* %1 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %24 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %23, i64 0, i32 1, i64 0
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %15, %19 ], [ %11, %22 ]
  %27 = phi i32* [ %21, %19 ], [ %24, %22 ]
  %28 = getelementptr inbounds i32, i32* %27, i64 %2
  %29 = sub i64 %26, %2
  %30 = icmp ult i64 %29, %3
  %31 = select i1 %30, i64 %29, i64 %3
  %32 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEPKwm(%"class.std::__1::basic_string.3"* %0, i32* %28, i64 %31)
  ret %"class.std::__1::basic_string.3"* %32
}

; Function Attrs: uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4copyEPwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %3
  br i1 %12, label %17, label %25

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %3
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = sub i64 %15, %3
  %21 = icmp ult i64 %20, %2
  %22 = select i1 %21, i64 %20, i64 %2
  %23 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %24 = load i32*, i32** %23, align 8, !tbaa !3
  br label %31

25:                                               ; preds = %9
  %26 = sub i64 %11, %3
  %27 = icmp ult i64 %26, %2
  %28 = select i1 %27, i64 %26, i64 %2
  %29 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %30 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %29, i64 0, i32 1, i64 0
  br label %31

31:                                               ; preds = %19, %25
  %32 = phi i64 [ %22, %19 ], [ %28, %25 ]
  %33 = phi i32* [ %24, %19 ], [ %30, %25 ]
  %34 = icmp eq i64 %32, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds i32, i32* %33, i64 %3
  %37 = tail call i32* @wmemcpy(i32* %1, i32* %36, i64 %32) #20
  br label %38

38:                                               ; preds = %31, %35
  ret i64 %32
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC2ERKS5_mmRKS4_(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3, %"class.std::__1::allocator.9"* nonnull align 1 dereferenceable(1) %4) unnamed_addr #2 comdat($_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEC5ERKS5_mmRKS4_) align 2 {
  %6 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %2
  br i1 %13, label %18, label %23

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %2
  br i1 %17, label %18, label %20

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %14
  %21 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i32*, i32** %21, align 8, !tbaa !3
  br label %26

23:                                               ; preds = %10
  %24 = bitcast %"class.std::__1::basic_string.3"* %1 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %25 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %24, i64 0, i32 1, i64 0
  br label %26

26:                                               ; preds = %20, %23
  %27 = phi i64 [ %16, %20 ], [ %12, %23 ]
  %28 = phi i32* [ %22, %20 ], [ %25, %23 ]
  %29 = getelementptr inbounds i32, i32* %28, i64 %2
  %30 = sub i64 %27, %2
  %31 = icmp ult i64 %30, %3
  %32 = select i1 %31, i64 %30, i64 %3
  %33 = icmp ugt i64 %32, 4611686018427387887
  br i1 %33, label %34, label %36

34:                                               ; preds = %26
  %35 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %35) #19
  unreachable

36:                                               ; preds = %26
  %37 = icmp ult i64 %32, 5
  br i1 %37, label %52, label %38

38:                                               ; preds = %36
  %39 = add nuw nsw i64 %32, 4
  %40 = and i64 %39, -4
  %41 = icmp ugt i64 %40, 4611686018427387903
  br i1 %41, label %42, label %43

42:                                               ; preds = %38
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

43:                                               ; preds = %38
  %44 = shl nuw i64 %40, 2
  %45 = tail call noalias nonnull i8* @_Znwm(i64 %44) #21
  %46 = bitcast i8* %45 to i32*
  %47 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %48 = bitcast i32** %47 to i8**
  store i8* %45, i8** %48, align 8, !tbaa !3
  %49 = or i64 %40, 1
  %50 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %49, i64* %50, align 8, !tbaa !3
  %51 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %32, i64* %51, align 8, !tbaa !3
  br label %59

52:                                               ; preds = %36
  %53 = trunc i64 %32 to i8
  %54 = shl nuw nsw i8 %53, 1
  %55 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %54, i8* %55, align 8, !tbaa !3
  %56 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %57 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %56, i64 0, i32 1, i64 0
  %58 = icmp eq i64 %32, 0
  br i1 %58, label %62, label %59

59:                                               ; preds = %52, %43
  %60 = phi i32* [ %46, %43 ], [ %57, %52 ]
  %61 = tail call i32* @wmemcpy(i32* nonnull %60, i32* %29, i64 %32) #20
  br label %62

62:                                               ; preds = %52, %59
  %63 = phi i32* [ %57, %52 ], [ %60, %59 ]
  %64 = getelementptr inbounds i32, i32* %63, i64 %32
  store i32 0, i32* %64, align 4, !tbaa !7
  ret void
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4findEwm(%"class.std::__1::basic_string.3"* %0, i32 signext %1, i64 %2) local_unnamed_addr #4 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %10 = load i32*, i32** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !3
  br label %18

13:                                               ; preds = %3
  %14 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %14, i64 0, i32 1, i64 0
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %13
  %19 = phi i32* [ %10, %8 ], [ %15, %13 ]
  %20 = phi i64 [ %12, %8 ], [ %17, %13 ]
  %21 = icmp ugt i64 %20, %2
  br i1 %21, label %22, label %36

22:                                               ; preds = %18
  %23 = sub i64 %20, %2
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %22
  %26 = getelementptr inbounds i32, i32* %19, i64 %2
  %27 = tail call i32* @wmemchr(i32* %26, i32 signext %1, i64 %23) #20
  br label %28

28:                                               ; preds = %25, %22
  %29 = phi i32* [ %27, %25 ], [ null, %22 ]
  %30 = icmp eq i32* %29, null
  %31 = ptrtoint i32* %29 to i64
  %32 = ptrtoint i32* %19 to i64
  %33 = sub i64 %31, %32
  %34 = ashr exact i64 %33, 2
  %35 = select i1 %30, i64 -1, i64 %34
  br label %36

36:                                               ; preds = %18, %28
  %37 = phi i64 [ -1, %18 ], [ %35, %28 ]
  ret i64 %37
}

; Function Attrs: inlinehint uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6__initEmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i32 signext %2) local_unnamed_addr #5 comdat align 2 {
  %4 = icmp ugt i64 %1, 4611686018427387887
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %6) #19
  unreachable

7:                                                ; preds = %3
  %8 = icmp ult i64 %1, 5
  br i1 %8, label %23, label %9

9:                                                ; preds = %7
  %10 = add nuw nsw i64 %1, 4
  %11 = and i64 %10, -4
  %12 = icmp ugt i64 %11, 4611686018427387903
  br i1 %12, label %13, label %14

13:                                               ; preds = %9
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

14:                                               ; preds = %9
  %15 = shl nuw i64 %11, 2
  %16 = tail call noalias nonnull i8* @_Znwm(i64 %15) #21
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = bitcast i32** %18 to i8**
  store i8* %16, i8** %19, align 8, !tbaa !3
  %20 = or i64 %11, 1
  %21 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %20, i64* %21, align 8, !tbaa !3
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %22, align 8, !tbaa !3
  br label %30

23:                                               ; preds = %7
  %24 = trunc i64 %1 to i8
  %25 = shl nuw nsw i8 %24, 1
  %26 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %25, i8* %26, align 8, !tbaa !3
  %27 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %27, i64 0, i32 1, i64 0
  %29 = icmp eq i64 %1, 0
  br i1 %29, label %33, label %30

30:                                               ; preds = %14, %23
  %31 = phi i32* [ %17, %14 ], [ %28, %23 ]
  %32 = tail call i32* @wmemset(i32* nonnull %31, i32 signext %2, i64 %1) #20
  br label %33

33:                                               ; preds = %23, %30
  %34 = phi i32* [ %28, %23 ], [ %31, %30 ]
  %35 = getelementptr inbounds i32, i32* %34, i64 %1
  store i32 0, i32* %35, align 4, !tbaa !7
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKw(%"class.std::__1::basic_string.3"* %0, i64 %1, i32* %2) local_unnamed_addr #2 comdat align 2 {
  %4 = tail call i64 @wcslen(i32* %2) #20
  %5 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i32* %2, i64 %4)
  ret %"class.std::__1::basic_string.3"* %5
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE12find_last_ofEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp eq i64 %3, 0
  br i1 %22, label %41, label %23

23:                                               ; preds = %19
  %24 = icmp ugt i64 %21, %2
  %25 = add i64 %2, 1
  %26 = select i1 %24, i64 %25, i64 %21
  %27 = getelementptr inbounds i32, i32* %20, i64 %26
  br label %28

28:                                               ; preds = %31, %23
  %29 = phi i32* [ %27, %23 ], [ %32, %31 ]
  %30 = icmp eq i32* %29, %20
  br i1 %30, label %41, label %31

31:                                               ; preds = %28
  %32 = getelementptr inbounds i32, i32* %29, i64 -1
  %33 = load i32, i32* %32, align 4, !tbaa !7
  %34 = tail call i32* @wmemchr(i32* %1, i32 signext %33, i64 %3) #20
  %35 = icmp eq i32* %34, null
  br i1 %35, label %28, label %36

36:                                               ; preds = %31
  %37 = ptrtoint i32* %32 to i64
  %38 = ptrtoint i32* %20 to i64
  %39 = sub i64 %37, %38
  %40 = ashr exact i64 %39, 2
  br label %41

41:                                               ; preds = %28, %19, %36
  %42 = phi i64 [ -1, %19 ], [ %40, %36 ], [ -1, %28 ]
  ret i64 %42
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9push_backEw(%"class.std::__1::basic_string.3"* %0, i32 signext %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp eq i8 %8, 4
  br i1 %10, label %19, label %25

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = and i64 %13, -2
  %15 = add i64 %14, -1
  %16 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = icmp eq i64 %17, %15
  br i1 %18, label %19, label %32

19:                                               ; preds = %11, %7
  %20 = phi i64 [ %17, %11 ], [ 4, %7 ]
  %21 = phi i64 [ %15, %11 ], [ 4, %7 ]
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %21, i64 1, i64 %21, i64 %21, i64 0, i64 0)
  %22 = load i8, i8* %3, align 8, !tbaa !3
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %25, label %32

25:                                               ; preds = %7, %19
  %26 = phi i64 [ %20, %19 ], [ %9, %7 ]
  %27 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %27, i64 0, i32 1, i64 0
  %29 = trunc i64 %26 to i8
  %30 = shl i8 %29, 1
  %31 = add i8 %30, 2
  store i8 %31, i8* %3, align 8, !tbaa !3
  br label %38

32:                                               ; preds = %11, %19
  %33 = phi i64 [ %20, %19 ], [ %17, %11 ]
  %34 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %35 = load i32*, i32** %34, align 8, !tbaa !3
  %36 = add i64 %33, 1
  %37 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %36, i64* %37, align 8, !tbaa !3
  br label %38

38:                                               ; preds = %32, %25
  %39 = phi i64 [ %26, %25 ], [ %33, %32 ]
  %40 = phi i32* [ %28, %25 ], [ %35, %32 ]
  %41 = getelementptr inbounds i32, i32* %40, i64 %39
  store i32 %1, i32* %41, align 4, !tbaa !7
  %42 = getelementptr inbounds i32, i32* %41, i64 1
  store i32 0, i32* %42, align 4, !tbaa !7
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i32 signext %2) local_unnamed_addr #2 comdat align 2 {
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %56, label %5

5:                                                ; preds = %3
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %18, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = trunc i64 %12 to i8
  br label %21

18:                                               ; preds = %5
  %19 = lshr i8 %7, 1
  %20 = zext i8 %19 to i64
  br label %21

21:                                               ; preds = %10, %18
  %22 = phi i8 [ %17, %10 ], [ %7, %18 ]
  %23 = phi i64 [ %14, %10 ], [ 4, %18 ]
  %24 = phi i64 [ %16, %10 ], [ %20, %18 ]
  %25 = sub i64 %23, %24
  %26 = icmp ult i64 %25, %1
  br i1 %26, label %27, label %31

27:                                               ; preds = %21
  %28 = add i64 %24, %1
  %29 = sub i64 %28, %23
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %23, i64 %29, i64 %24, i64 %24, i64 0, i64 0)
  %30 = load i8, i8* %6, align 8, !tbaa !3
  br label %31

31:                                               ; preds = %27, %21
  %32 = phi i8 [ %30, %27 ], [ %22, %21 ]
  %33 = and i8 %32, 1
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %31
  %36 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %37 = load i32*, i32** %36, align 8, !tbaa !3
  br label %41

38:                                               ; preds = %31
  %39 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %40 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %39, i64 0, i32 1, i64 0
  br label %41

41:                                               ; preds = %35, %38
  %42 = phi i32* [ %37, %35 ], [ %40, %38 ]
  %43 = getelementptr inbounds i32, i32* %42, i64 %24
  %44 = tail call i32* @wmemset(i32* %43, i32 signext %2, i64 %1) #20
  %45 = add i64 %24, %1
  %46 = load i8, i8* %6, align 8, !tbaa !3
  %47 = and i8 %46, 1
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %51, label %49

49:                                               ; preds = %41
  %50 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %45, i64* %50, align 8, !tbaa !3
  br label %54

51:                                               ; preds = %41
  %52 = trunc i64 %45 to i8
  %53 = shl i8 %52, 1
  store i8 %53, i8* %6, align 8, !tbaa !3
  br label %54

54:                                               ; preds = %49, %51
  %55 = getelementptr inbounds i32, i32* %42, i64 %45
  store i32 0, i32* %55, align 4, !tbaa !7
  br label %56

56:                                               ; preds = %3, %54
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5rfindEwm(%"class.std::__1::basic_string.3"* %0, i32 signext %1, i64 %2) local_unnamed_addr #4 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %13, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %10 = load i32*, i32** %9, align 8, !tbaa !3
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i64, i64* %11, align 8, !tbaa !3
  br label %18

13:                                               ; preds = %3
  %14 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %14, i64 0, i32 1, i64 0
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %8, %13
  %19 = phi i32* [ %10, %8 ], [ %15, %13 ]
  %20 = phi i64 [ %12, %8 ], [ %17, %13 ]
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %39, label %22

22:                                               ; preds = %18
  %23 = icmp ugt i64 %20, %2
  %24 = add i64 %2, 1
  %25 = select i1 %23, i64 %24, i64 %20
  %26 = getelementptr inbounds i32, i32* %19, i64 %25
  br label %27

27:                                               ; preds = %30, %22
  %28 = phi i32* [ %26, %22 ], [ %31, %30 ]
  %29 = icmp eq i32* %28, %19
  br i1 %29, label %39, label %30

30:                                               ; preds = %27
  %31 = getelementptr inbounds i32, i32* %28, i64 -1
  %32 = load i32, i32* %31, align 4, !tbaa !7
  %33 = icmp eq i32 %32, %1
  br i1 %33, label %34, label %27

34:                                               ; preds = %30
  %35 = ptrtoint i32* %31 to i64
  %36 = ptrtoint i32* %19 to i64
  %37 = sub i64 %35, %36
  %38 = ashr exact i64 %37, 2
  br label %39

39:                                               ; preds = %27, %18, %34
  %40 = phi i64 [ %38, %34 ], [ -1, %18 ], [ -1, %27 ]
  ret i64 %40
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i32 signext %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = icmp ugt i64 %1, 4
  br i1 %9, label %20, label %28

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = icmp ult i64 %14, %1
  %16 = trunc i64 %12 to i8
  br i1 %15, label %17, label %28

17:                                               ; preds = %10
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %19 = load i64, i64* %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %8
  %21 = lshr i8 %5, 1
  %22 = zext i8 %21 to i64
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i64 [ %14, %17 ], [ 4, %20 ]
  %25 = phi i64 [ %19, %17 ], [ %22, %20 ]
  %26 = sub i64 %1, %24
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %24, i64 %26, i64 %25, i64 0, i64 %25, i64 0)
  %27 = load i8, i8* %4, align 8, !tbaa !3
  br label %28

28:                                               ; preds = %10, %23, %8
  %29 = phi i8 [ %16, %10 ], [ %27, %23 ], [ %5, %8 ]
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %35, label %32

32:                                               ; preds = %28
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i32*, i32** %33, align 8, !tbaa !3
  br label %38

35:                                               ; preds = %28
  %36 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %37 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %36, i64 0, i32 1, i64 0
  br label %38

38:                                               ; preds = %32, %35
  %39 = phi i32* [ %34, %32 ], [ %37, %35 ]
  %40 = icmp eq i64 %1, 0
  br i1 %40, label %43, label %41

41:                                               ; preds = %38
  %42 = tail call i32* @wmemset(i32* %39, i32 signext %2, i64 %1) #20
  br label %43

43:                                               ; preds = %38, %41
  %44 = getelementptr inbounds i32, i32* %39, i64 %1
  store i32 0, i32* %44, align 4, !tbaa !7
  %45 = load i8, i8* %4, align 8, !tbaa !3
  %46 = and i8 %45, 1
  %47 = icmp eq i8 %46, 0
  br i1 %47, label %50, label %48

48:                                               ; preds = %43
  %49 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %49, align 8, !tbaa !3
  br label %53

50:                                               ; preds = %43
  %51 = trunc i64 %1 to i8
  %52 = shl i8 %51, 1
  store i8 %52, i8* %4, align 8, !tbaa !3
  br label %53

53:                                               ; preds = %48, %50
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE5eraseEmm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %11, label %8

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %10 = load i64, i64* %9, align 8, !tbaa !3
  br label %14

11:                                               ; preds = %3
  %12 = lshr i8 %5, 1
  %13 = zext i8 %12 to i64
  br label %14

14:                                               ; preds = %8, %11
  %15 = phi i64 [ %10, %8 ], [ %13, %11 ]
  %16 = icmp ult i64 %15, %1
  br i1 %16, label %17, label %19

17:                                               ; preds = %14
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %14
  switch i64 %2, label %31 [
    i64 -1, label %20
    i64 0, label %67
  ]

20:                                               ; preds = %19
  br i1 %7, label %26, label %21

21:                                               ; preds = %20
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %23 = load i32*, i32** %22, align 8, !tbaa !3
  %24 = getelementptr inbounds i32, i32* %23, i64 %1
  store i32 0, i32* %24, align 4, !tbaa !7
  %25 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %1, i64* %25, align 8, !tbaa !3
  br label %67

26:                                               ; preds = %20
  %27 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %28 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %27, i64 0, i32 1, i64 %1
  store i32 0, i32* %28, align 4, !tbaa !7
  %29 = trunc i64 %1 to i8
  %30 = shl i8 %29, 1
  store i8 %30, i8* %4, align 8, !tbaa !3
  br label %67

31:                                               ; preds = %19
  br i1 %7, label %37, label %32

32:                                               ; preds = %31
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %34 = load i64, i64* %33, align 8, !tbaa !3
  %35 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %36 = load i32*, i32** %35, align 8, !tbaa !3
  br label %42

37:                                               ; preds = %31
  %38 = lshr i8 %5, 1
  %39 = zext i8 %38 to i64
  %40 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %41 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %40, i64 0, i32 1, i64 0
  br label %42

42:                                               ; preds = %37, %32
  %43 = phi i64 [ %34, %32 ], [ %39, %37 ]
  %44 = phi i32* [ %36, %32 ], [ %41, %37 ]
  %45 = sub i64 %43, %1
  %46 = icmp ult i64 %45, %2
  %47 = select i1 %46, i64 %45, i64 %2
  %48 = sub i64 %45, %47
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %55, label %50

50:                                               ; preds = %42
  %51 = getelementptr inbounds i32, i32* %44, i64 %1
  %52 = getelementptr inbounds i32, i32* %51, i64 %47
  %53 = tail call i32* @wmemmove(i32* %51, i32* %52, i64 %48) #20
  %54 = load i8, i8* %4, align 8, !tbaa !3
  br label %55

55:                                               ; preds = %50, %42
  %56 = phi i8 [ %5, %42 ], [ %54, %50 ]
  %57 = sub i64 %43, %47
  %58 = and i8 %56, 1
  %59 = icmp eq i8 %58, 0
  br i1 %59, label %62, label %60

60:                                               ; preds = %55
  %61 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %57, i64* %61, align 8, !tbaa !3
  br label %65

62:                                               ; preds = %55
  %63 = trunc i64 %57 to i8
  %64 = shl i8 %63, 1
  store i8 %64, i8* %4, align 8, !tbaa !3
  br label %65

65:                                               ; preds = %62, %60
  %66 = getelementptr inbounds i32, i32* %44, i64 %57
  store i32 0, i32* %66, align 4, !tbaa !7
  br label %67

67:                                               ; preds = %19, %65, %26, %21
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendERKS5_mm(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1, i64 %2, i64 %3) local_unnamed_addr #2 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %13

9:                                                ; preds = %4
  %10 = lshr i8 %6, 1
  %11 = zext i8 %10 to i64
  %12 = icmp ult i64 %11, %2
  br i1 %12, label %17, label %22

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %15 = load i64, i64* %14, align 8, !tbaa !3
  %16 = icmp ult i64 %15, %2
  br i1 %16, label %17, label %19

17:                                               ; preds = %13, %9
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %18) #19
  unreachable

19:                                               ; preds = %13
  %20 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %21 = load i32*, i32** %20, align 8, !tbaa !3
  br label %25

22:                                               ; preds = %9
  %23 = bitcast %"class.std::__1::basic_string.3"* %1 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %24 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %23, i64 0, i32 1, i64 0
  br label %25

25:                                               ; preds = %19, %22
  %26 = phi i64 [ %15, %19 ], [ %11, %22 ]
  %27 = phi i32* [ %21, %19 ], [ %24, %22 ]
  %28 = getelementptr inbounds i32, i32* %27, i64 %2
  %29 = sub i64 %26, %2
  %30 = icmp ult i64 %29, %3
  %31 = select i1 %30, i64 %29, i64 %3
  %32 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %33 = load i8, i8* %32, align 8, !tbaa !3
  %34 = and i8 %33, 1
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %43, label %36

36:                                               ; preds = %25
  %37 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %38 = load i64, i64* %37, align 8, !tbaa !3
  %39 = and i64 %38, -2
  %40 = add i64 %39, -1
  %41 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %42 = load i64, i64* %41, align 8, !tbaa !3
  br label %46

43:                                               ; preds = %25
  %44 = lshr i8 %33, 1
  %45 = zext i8 %44 to i64
  br label %46

46:                                               ; preds = %43, %36
  %47 = phi i64 [ %40, %36 ], [ 4, %43 ]
  %48 = phi i64 [ %42, %36 ], [ %45, %43 ]
  %49 = sub i64 %47, %48
  %50 = icmp ult i64 %49, %31
  br i1 %50, label %75, label %51

51:                                               ; preds = %46
  %52 = icmp eq i64 %31, 0
  br i1 %52, label %78, label %53

53:                                               ; preds = %51
  br i1 %35, label %57, label %54

54:                                               ; preds = %53
  %55 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %56 = load i32*, i32** %55, align 8, !tbaa !3
  br label %60

57:                                               ; preds = %53
  %58 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %59 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %58, i64 0, i32 1, i64 0
  br label %60

60:                                               ; preds = %57, %54
  %61 = phi i32* [ %56, %54 ], [ %59, %57 ]
  %62 = getelementptr inbounds i32, i32* %61, i64 %48
  %63 = tail call i32* @wmemcpy(i32* %62, i32* %28, i64 %31) #20
  %64 = add i64 %48, %31
  %65 = load i8, i8* %32, align 8, !tbaa !3
  %66 = and i8 %65, 1
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %70, label %68

68:                                               ; preds = %60
  %69 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %64, i64* %69, align 8, !tbaa !3
  br label %73

70:                                               ; preds = %60
  %71 = trunc i64 %64 to i8
  %72 = shl i8 %71, 1
  store i8 %72, i8* %32, align 8, !tbaa !3
  br label %73

73:                                               ; preds = %70, %68
  %74 = getelementptr inbounds i32, i32* %61, i64 %64
  store i32 0, i32* %74, align 4, !tbaa !7
  br label %78

75:                                               ; preds = %46
  %76 = add i64 %48, %31
  %77 = sub i64 %76, %47
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %47, i64 %77, i64 %48, i64 %48, i64 0, i64 %31, i32* %28)
  br label %78

78:                                               ; preds = %51, %73, %75
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEPKw(%"class.std::__1::basic_string.3"* %0, i32* %1) local_unnamed_addr #4 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = tail call i64 @wcslen(i32* %1) #20
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = icmp eq i64 %3, -1
  br i1 %7, label %9, label %10

9:                                                ; preds = %2
  br i1 %8, label %11, label %19

10:                                               ; preds = %2
  br i1 %8, label %11, label %14

11:                                               ; preds = %10, %9
  %12 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  invoke void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %12) #19
          to label %13 unwind label %39

13:                                               ; preds = %11
  unreachable

14:                                               ; preds = %10
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8, !tbaa !3
  br label %24

19:                                               ; preds = %9
  %20 = lshr i8 %5, 1
  %21 = zext i8 %20 to i64
  %22 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %23 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %22, i64 0, i32 1, i64 0
  br label %24

24:                                               ; preds = %19, %14
  %25 = phi i64 [ %16, %14 ], [ %21, %19 ]
  %26 = phi i32* [ %18, %14 ], [ %23, %19 ]
  %27 = icmp ugt i64 %25, %3
  %28 = select i1 %27, i64 %3, i64 %25
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %33, label %30

30:                                               ; preds = %24
  %31 = tail call i32 @wmemcmp(i32* %26, i32* %1, i64 %28) #20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %37

33:                                               ; preds = %30, %24
  %34 = icmp ult i64 %25, %3
  %35 = zext i1 %27 to i32
  %36 = select i1 %34, i32 -1, i32 %35
  br label %37

37:                                               ; preds = %33, %30
  %38 = phi i32 [ %36, %33 ], [ %31, %30 ]
  ret i32 %38

39:                                               ; preds = %11
  %40 = landingpad { i8*, i32 }
          catch i8* null
  %41 = extractvalue { i8*, i32 } %40, 0
  tail call void @__clang_call_terminate(i8* %41) #23
  unreachable
}

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %3, i64 %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  %14 = icmp eq i64 %4, -1
  %15 = or i1 %14, %13
  br i1 %15, label %22, label %30

16:                                               ; preds = %5
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !3
  %19 = icmp ult i64 %18, %1
  %20 = icmp eq i64 %4, -1
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %24

22:                                               ; preds = %16, %10
  %23 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %23) #19
  unreachable

24:                                               ; preds = %16
  %25 = sub i64 %18, %1
  %26 = icmp ult i64 %25, %2
  %27 = select i1 %26, i64 %25, i64 %2
  %28 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i32*, i32** %28, align 8, !tbaa !3
  br label %36

30:                                               ; preds = %10
  %31 = sub i64 %12, %1
  %32 = icmp ult i64 %31, %2
  %33 = select i1 %32, i64 %31, i64 %2
  %34 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %35 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %34, i64 0, i32 1, i64 0
  br label %36

36:                                               ; preds = %24, %30
  %37 = phi i64 [ %27, %24 ], [ %33, %30 ]
  %38 = phi i32* [ %29, %24 ], [ %35, %30 ]
  %39 = icmp ugt i64 %37, %4
  %40 = select i1 %39, i64 %4, i64 %37
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %46, label %42

42:                                               ; preds = %36
  %43 = getelementptr inbounds i32, i32* %38, i64 %1
  %44 = tail call i32 @wmemcmp(i32* %43, i32* %3, i64 %40) #20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %36, %42
  %47 = icmp ult i64 %37, %4
  %48 = zext i1 %39 to i32
  %49 = select i1 %47, i32 -1, i32 %48
  ret i32 %49

50:                                               ; preds = %42
  ret i32 %44
}

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmPKw(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %3) local_unnamed_addr #2 comdat align 2 {
  %5 = tail call i64 @wcslen(i32* %3) #20
  %6 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %16

10:                                               ; preds = %4
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %1
  %14 = icmp eq i64 %5, -1
  %15 = or i1 %14, %13
  br i1 %15, label %22, label %30

16:                                               ; preds = %4
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %18 = load i64, i64* %17, align 8, !tbaa !3
  %19 = icmp ult i64 %18, %1
  %20 = icmp eq i64 %5, -1
  %21 = or i1 %20, %19
  br i1 %21, label %22, label %24

22:                                               ; preds = %16, %10
  %23 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %23) #19
  unreachable

24:                                               ; preds = %16
  %25 = sub i64 %18, %1
  %26 = icmp ult i64 %25, %2
  %27 = select i1 %26, i64 %25, i64 %2
  %28 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %29 = load i32*, i32** %28, align 8, !tbaa !3
  br label %36

30:                                               ; preds = %10
  %31 = sub i64 %12, %1
  %32 = icmp ult i64 %31, %2
  %33 = select i1 %32, i64 %31, i64 %2
  %34 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %35 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %34, i64 0, i32 1, i64 0
  br label %36

36:                                               ; preds = %30, %24
  %37 = phi i64 [ %27, %24 ], [ %33, %30 ]
  %38 = phi i32* [ %29, %24 ], [ %35, %30 ]
  %39 = icmp ugt i64 %37, %5
  %40 = select i1 %39, i64 %5, i64 %37
  %41 = icmp eq i64 %40, 0
  br i1 %41, label %46, label %42

42:                                               ; preds = %36
  %43 = getelementptr inbounds i32, i32* %38, i64 %1
  %44 = tail call i32 @wmemcmp(i32* %43, i32* %3, i64 %40) #20
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %42, %36
  %47 = icmp ult i64 %37, %5
  %48 = zext i1 %39 to i32
  %49 = select i1 %47, i32 -1, i32 %48
  br label %50

50:                                               ; preds = %42, %46
  %51 = phi i32 [ %49, %46 ], [ %44, %42 ]
  ret i32 %51
}

; Function Attrs: uwtable
define weak_odr nonnull align 4 dereferenceable(4) i32* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE2atEm(%"class.std::__1::basic_string.3"* %0, i64 %1) local_unnamed_addr #2 comdat align 2 {
  %3 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %4 = load i8, i8* %3, align 8, !tbaa !3
  %5 = and i8 %4, 1
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %2
  %8 = lshr i8 %4, 1
  %9 = zext i8 %8 to i64
  %10 = icmp ugt i64 %9, %1
  br i1 %10, label %20, label %15

11:                                               ; preds = %2
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp ugt i64 %13, %1
  br i1 %14, label %17, label %15

15:                                               ; preds = %11, %7
  %16 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %16) #19
  unreachable

17:                                               ; preds = %11
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i32*, i32** %18, align 8, !tbaa !3
  br label %23

20:                                               ; preds = %7
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %21, i64 0, i32 1, i64 0
  br label %23

23:                                               ; preds = %17, %20
  %24 = phi i32* [ %19, %17 ], [ %22, %20 ]
  %25 = getelementptr inbounds i32, i32* %24, i64 %1
  ret i32* %25
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6assignEPKw(%"class.std::__1::basic_string.3"* %0, i32* %1) local_unnamed_addr #2 comdat align 2 {
  %3 = tail call i64 @wcslen(i32* nonnull %1) #20
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %2
  %9 = icmp ugt i64 %3, 4
  br i1 %9, label %40, label %19

10:                                               ; preds = %2
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %12 = load i64, i64* %11, align 8, !tbaa !3
  %13 = and i64 %12, -2
  %14 = add i64 %13, -1
  %15 = icmp ult i64 %14, %3
  br i1 %15, label %37, label %16

16:                                               ; preds = %10
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8, !tbaa !3
  br label %22

19:                                               ; preds = %8
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %20, i64 0, i32 1, i64 0
  br label %22

22:                                               ; preds = %19, %16
  %23 = phi i32* [ %18, %16 ], [ %21, %19 ]
  %24 = icmp eq i64 %3, 0
  br i1 %24, label %27, label %25

25:                                               ; preds = %22
  %26 = tail call i32* @wmemmove(i32* %23, i32* nonnull %1, i64 %3) #20
  br label %27

27:                                               ; preds = %25, %22
  %28 = getelementptr inbounds i32, i32* %23, i64 %3
  store i32 0, i32* %28, align 4, !tbaa !7
  %29 = load i8, i8* %4, align 8, !tbaa !3
  %30 = and i8 %29, 1
  %31 = icmp eq i8 %30, 0
  br i1 %31, label %34, label %32

32:                                               ; preds = %27
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %3, i64* %33, align 8, !tbaa !3
  br label %47

34:                                               ; preds = %27
  %35 = trunc i64 %3 to i8
  %36 = shl i8 %35, 1
  store i8 %36, i8* %4, align 8, !tbaa !3
  br label %47

37:                                               ; preds = %10
  %38 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %39 = load i64, i64* %38, align 8, !tbaa !3
  br label %43

40:                                               ; preds = %8
  %41 = lshr i8 %5, 1
  %42 = zext i8 %41 to i64
  br label %43

43:                                               ; preds = %40, %37
  %44 = phi i64 [ %14, %37 ], [ 4, %40 ]
  %45 = phi i64 [ %39, %37 ], [ %42, %40 ]
  %46 = sub i64 %3, %44
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %44, i64 %46, i64 %45, i64 0, i64 %45, i64 %3, i32* nonnull %1)
  br label %47

47:                                               ; preds = %43, %34, %32
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: nounwind uwtable
define weak_odr i64 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE4findEPKwmm(%"class.std::__1::basic_string.3"* %0, i32* %1, i64 %2, i64 %3) local_unnamed_addr #4 comdat align 2 {
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %14, label %9

9:                                                ; preds = %4
  %10 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %11 = load i32*, i32** %10, align 8, !tbaa !3
  %12 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  br label %19

14:                                               ; preds = %4
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %6, 1
  %18 = zext i8 %17 to i64
  br label %19

19:                                               ; preds = %9, %14
  %20 = phi i32* [ %11, %9 ], [ %16, %14 ]
  %21 = phi i64 [ %13, %9 ], [ %18, %14 ]
  %22 = icmp ult i64 %21, %2
  br i1 %22, label %63, label %23

23:                                               ; preds = %19
  %24 = icmp eq i64 %3, 0
  br i1 %24, label %63, label %25

25:                                               ; preds = %23
  %26 = getelementptr inbounds i32, i32* %20, i64 %2
  %27 = getelementptr inbounds i32, i32* %20, i64 %21
  %28 = ptrtoint i32* %27 to i64
  %29 = ptrtoint i32* %26 to i64
  %30 = sub i64 %28, %29
  %31 = ashr exact i64 %30, 2
  %32 = icmp slt i64 %31, %3
  br i1 %32, label %55, label %33

33:                                               ; preds = %25
  %34 = load i32, i32* %1, align 4, !tbaa !7
  br label %35

35:                                               ; preds = %49, %33
  %36 = phi i64 [ %53, %49 ], [ %31, %33 ]
  %37 = phi i32* [ %50, %49 ], [ %26, %33 ]
  %38 = sub nsw i64 %36, %3
  %39 = add nsw i64 %38, 1
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %55, label %41

41:                                               ; preds = %35
  %42 = tail call i32* @wmemchr(i32* %37, i32 signext %34, i64 %39) #20
  %43 = icmp eq i32* %42, null
  br i1 %43, label %55, label %44

44:                                               ; preds = %41
  %45 = tail call i32 @wmemcmp(i32* nonnull %42, i32* nonnull %1, i64 %3) #20
  %46 = icmp eq i32 %45, 0
  br i1 %46, label %47, label %49

47:                                               ; preds = %44
  %48 = ptrtoint i32* %42 to i64
  br label %55

49:                                               ; preds = %44
  %50 = getelementptr inbounds i32, i32* %42, i64 1
  %51 = ptrtoint i32* %50 to i64
  %52 = sub i64 %28, %51
  %53 = ashr exact i64 %52, 2
  %54 = icmp slt i64 %53, %3
  br i1 %54, label %55, label %35

55:                                               ; preds = %49, %41, %35, %47, %25
  %56 = phi i64 [ %28, %25 ], [ %48, %47 ], [ %28, %35 ], [ %28, %41 ], [ %28, %49 ]
  %57 = phi i32* [ %27, %25 ], [ %42, %47 ], [ %27, %35 ], [ %27, %41 ], [ %27, %49 ]
  %58 = icmp eq i32* %57, %27
  %59 = ptrtoint i32* %20 to i64
  %60 = sub i64 %56, %59
  %61 = ashr exact i64 %60, 2
  %62 = select i1 %58, i64 -1, i64 %61
  br label %63

63:                                               ; preds = %19, %23, %55
  %64 = phi i64 [ -1, %19 ], [ %2, %23 ], [ %62, %55 ]
  ret i64 %64
}

; Function Attrs: uwtable
define weak_odr i32 @_ZNKSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7compareEmmRKS5_mm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %3, i64 %4, i64 %5) local_unnamed_addr #2 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %7 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  %11 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %12 = load i32*, i32** %11, align 8
  %13 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8
  %15 = bitcast %"class.std::__1::basic_string.3"* %3 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %15, i64 0, i32 1, i64 0
  %17 = lshr i8 %8, 1
  %18 = zext i8 %17 to i64
  %19 = select i1 %10, i32* %16, i32* %12
  %20 = select i1 %10, i64 %18, i64 %14
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %22 = load i8, i8* %21, align 8, !tbaa !3
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %30, label %25

25:                                               ; preds = %6
  %26 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %27 = load i32*, i32** %26, align 8, !tbaa !3
  %28 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %29 = load i64, i64* %28, align 8, !tbaa !3
  br label %35

30:                                               ; preds = %6
  %31 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %32 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %31, i64 0, i32 1, i64 0
  %33 = lshr i8 %22, 1
  %34 = zext i8 %33 to i64
  br label %35

35:                                               ; preds = %30, %25
  %36 = phi i32* [ %27, %25 ], [ %32, %30 ]
  %37 = phi i64 [ %29, %25 ], [ %34, %30 ]
  %38 = icmp ult i64 %37, %1
  br i1 %38, label %39, label %40

39:                                               ; preds = %35
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i64 0, i64 0)) #19
  unreachable

40:                                               ; preds = %35
  %41 = getelementptr inbounds i32, i32* %36, i64 %1
  %42 = sub i64 %37, %1
  %43 = icmp ult i64 %42, %2
  %44 = select i1 %43, i64 %42, i64 %2
  %45 = icmp ult i64 %20, %4
  br i1 %45, label %46, label %47

46:                                               ; preds = %40
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.16, i64 0, i64 0)) #19
  unreachable

47:                                               ; preds = %40
  %48 = sub i64 %20, %4
  %49 = icmp ult i64 %48, %5
  %50 = select i1 %49, i64 %48, i64 %5
  %51 = icmp ugt i64 %44, %50
  %52 = select i1 %51, i64 %50, i64 %44
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %58, label %54

54:                                               ; preds = %47
  %55 = getelementptr inbounds i32, i32* %19, i64 %4
  %56 = tail call i32 @wmemcmp(i32* %41, i32* %55, i64 %52) #20
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %63

58:                                               ; preds = %54, %47
  %59 = icmp eq i64 %44, %50
  br i1 %59, label %63, label %60

60:                                               ; preds = %58
  %61 = icmp ult i64 %44, %50
  %62 = select i1 %61, i32 -1, i32 1
  br label %63

63:                                               ; preds = %54, %58, %60
  %64 = phi i32 [ %56, %54 ], [ %62, %60 ], [ 0, %58 ]
  ret i32 %64
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEaSERKS5_(%"class.std::__1::basic_string.3"* %0, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %1) local_unnamed_addr #2 comdat align 2 {
  %3 = icmp eq %"class.std::__1::basic_string.3"* %0, %1
  br i1 %3, label %65, label %4

4:                                                ; preds = %2
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = bitcast %"class.std::__1::basic_string.3"* %1 to i8*
  %10 = load i8, i8* %9, align 8, !tbaa !3
  %11 = and i8 %10, 1
  %12 = icmp eq i8 %11, 0
  br i1 %8, label %13, label %35

13:                                               ; preds = %4
  br i1 %12, label %14, label %15

14:                                               ; preds = %13
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %5, i8* nonnull align 8 dereferenceable(24) %9, i64 24, i1 false), !tbaa.struct !6
  br label %65

15:                                               ; preds = %13
  %16 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %17 = load i32*, i32** %16, align 8, !tbaa !3
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %19 = load i64, i64* %18, align 8, !tbaa !3
  %20 = icmp ult i64 %19, 5
  br i1 %20, label %21, label %31

21:                                               ; preds = %15
  %22 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %23 = trunc i64 %19 to i8
  %24 = shl nuw nsw i8 %23, 1
  store i8 %24, i8* %5, align 8, !tbaa !3
  %25 = icmp eq i64 %19, 0
  br i1 %25, label %29, label %26

26:                                               ; preds = %21
  %27 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %22, i64 0, i32 1, i64 0
  %28 = tail call i32* @wmemcpy(i32* nonnull %27, i32* %17, i64 %19) #20
  br label %29

29:                                               ; preds = %26, %21
  %30 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %22, i64 0, i32 1, i64 %19
  store i32 0, i32* %30, align 4, !tbaa !7
  br label %65

31:                                               ; preds = %15
  %32 = lshr i8 %6, 1
  %33 = zext i8 %32 to i64
  %34 = add i64 %19, -4
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 4, i64 %34, i64 %33, i64 0, i64 %33, i64 %19, i32* %17)
  br label %65

35:                                               ; preds = %4
  %36 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %37 = load i32*, i32** %36, align 8
  %38 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %39 = load i64, i64* %38, align 8
  %40 = bitcast %"class.std::__1::basic_string.3"* %1 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %41 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %40, i64 0, i32 1, i64 0
  %42 = lshr i8 %10, 1
  %43 = zext i8 %42 to i64
  %44 = select i1 %12, i32* %41, i32* %37
  %45 = select i1 %12, i64 %43, i64 %39
  %46 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %47 = load i64, i64* %46, align 8, !tbaa !3
  %48 = and i64 %47, -2
  %49 = icmp ugt i64 %48, %45
  br i1 %49, label %50, label %59

50:                                               ; preds = %35
  %51 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %52 = load i32*, i32** %51, align 8, !tbaa !3
  %53 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %45, i64* %53, align 8, !tbaa !3
  %54 = icmp eq i64 %45, 0
  br i1 %54, label %57, label %55

55:                                               ; preds = %50
  %56 = tail call i32* @wmemcpy(i32* %52, i32* %44, i64 %45) #20
  br label %57

57:                                               ; preds = %55, %50
  %58 = getelementptr inbounds i32, i32* %52, i64 %45
  store i32 0, i32* %58, align 4, !tbaa !7
  br label %65

59:                                               ; preds = %35
  %60 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %61 = load i64, i64* %60, align 8, !tbaa !3
  %62 = add i64 %48, -1
  %63 = add i64 %45, 1
  %64 = sub i64 %63, %48
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %62, i64 %64, i64 %61, i64 0, i64 %61, i64 %45, i32* %44)
  br label %65

65:                                               ; preds = %59, %57, %31, %29, %14, %2
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6appendEPKw(%"class.std::__1::basic_string.3"* %0, i32* %1) local_unnamed_addr #2 comdat align 2 {
  %3 = tail call i64 @wcslen(i32* %1) #20
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %15, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %10 = load i64, i64* %9, align 8, !tbaa !3
  %11 = and i64 %10, -2
  %12 = add i64 %11, -1
  %13 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  br label %18

15:                                               ; preds = %2
  %16 = lshr i8 %5, 1
  %17 = zext i8 %16 to i64
  br label %18

18:                                               ; preds = %15, %8
  %19 = phi i64 [ %12, %8 ], [ 4, %15 ]
  %20 = phi i64 [ %14, %8 ], [ %17, %15 ]
  %21 = sub i64 %19, %20
  %22 = icmp ult i64 %21, %3
  br i1 %22, label %47, label %23

23:                                               ; preds = %18
  %24 = icmp eq i64 %3, 0
  br i1 %24, label %50, label %25

25:                                               ; preds = %23
  br i1 %7, label %29, label %26

26:                                               ; preds = %25
  %27 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %28 = load i32*, i32** %27, align 8, !tbaa !3
  br label %32

29:                                               ; preds = %25
  %30 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %31 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %30, i64 0, i32 1, i64 0
  br label %32

32:                                               ; preds = %29, %26
  %33 = phi i32* [ %28, %26 ], [ %31, %29 ]
  %34 = getelementptr inbounds i32, i32* %33, i64 %20
  %35 = tail call i32* @wmemcpy(i32* %34, i32* %1, i64 %3) #20
  %36 = add i64 %20, %3
  %37 = load i8, i8* %4, align 8, !tbaa !3
  %38 = and i8 %37, 1
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %42, label %40

40:                                               ; preds = %32
  %41 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %36, i64* %41, align 8, !tbaa !3
  br label %45

42:                                               ; preds = %32
  %43 = trunc i64 %36 to i8
  %44 = shl i8 %43, 1
  store i8 %44, i8* %4, align 8, !tbaa !3
  br label %45

45:                                               ; preds = %42, %40
  %46 = getelementptr inbounds i32, i32* %33, i64 %36
  store i32 0, i32* %46, align 4, !tbaa !7
  br label %50

47:                                               ; preds = %18
  %48 = add i64 %20, %3
  %49 = sub i64 %48, %19
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE21__grow_by_and_replaceEmmmmmmPKw(%"class.std::__1::basic_string.3"* nonnull %0, i64 %19, i64 %49, i64 %20, i64 %20, i64 0, i64 %3, i32* %1)
  br label %50

50:                                               ; preds = %23, %45, %47
  ret %"class.std::__1::basic_string.3"* %0
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmRKS5_mm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %3, i64 %4, i64 %5) local_unnamed_addr #2 comdat align 2 {
  %7 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %8 = load i8, i8* %7, align 8, !tbaa !3
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %15

11:                                               ; preds = %6
  %12 = lshr i8 %8, 1
  %13 = zext i8 %12 to i64
  %14 = icmp ult i64 %13, %4
  br i1 %14, label %19, label %24

15:                                               ; preds = %6
  %16 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %17 = load i64, i64* %16, align 8, !tbaa !3
  %18 = icmp ult i64 %17, %4
  br i1 %18, label %19, label %21

19:                                               ; preds = %15, %11
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %20) #19
  unreachable

21:                                               ; preds = %15
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %23 = load i32*, i32** %22, align 8, !tbaa !3
  br label %27

24:                                               ; preds = %11
  %25 = bitcast %"class.std::__1::basic_string.3"* %3 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %25, i64 0, i32 1, i64 0
  br label %27

27:                                               ; preds = %21, %24
  %28 = phi i64 [ %17, %21 ], [ %13, %24 ]
  %29 = phi i32* [ %23, %21 ], [ %26, %24 ]
  %30 = getelementptr inbounds i32, i32* %29, i64 %4
  %31 = sub i64 %28, %4
  %32 = icmp ult i64 %31, %5
  %33 = select i1 %32, i64 %31, i64 %5
  %34 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE7replaceEmmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i64 %2, i32* %30, i64 %33)
  ret %"class.std::__1::basic_string.3"* %34
}

; Function Attrs: uwtable
define weak_odr i32* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertENS_11__wrap_iterIPKwEEw(%"class.std::__1::basic_string.3"* %0, i32* %1, i32 signext %2) local_unnamed_addr #2 comdat align 2 {
  %4 = ptrtoint i32* %1 to i64
  %5 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %9, label %17

9:                                                ; preds = %3
  %10 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = ptrtoint i32* %11 to i64
  %13 = sub i64 %4, %12
  %14 = ashr exact i64 %13, 2
  %15 = lshr i8 %6, 1
  %16 = icmp eq i8 %15, 4
  br i1 %16, label %30, label %37

17:                                               ; preds = %3
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = bitcast i32** %18 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !3
  %21 = sub i64 %4, %20
  %22 = ashr exact i64 %21, 2
  %23 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %24 = load i64, i64* %23, align 8, !tbaa !3
  %25 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %26 = load i64, i64* %25, align 8, !tbaa !3
  %27 = and i64 %26, -2
  %28 = add i64 %27, -1
  %29 = icmp eq i64 %28, %24
  br i1 %29, label %30, label %35

30:                                               ; preds = %17, %9
  %31 = phi i64 [ %24, %17 ], [ 4, %9 ]
  %32 = phi i64 [ %22, %17 ], [ %14, %9 ]
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %31, i64 1, i64 %31, i64 %32, i64 0, i64 1)
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i32*, i32** %33, align 8, !tbaa !3
  br label %49

35:                                               ; preds = %17
  %36 = inttoptr i64 %20 to i32*
  br label %39

37:                                               ; preds = %9
  %38 = zext i8 %15 to i64
  br label %39

39:                                               ; preds = %35, %37
  %40 = phi i64 [ %24, %35 ], [ %38, %37 ]
  %41 = phi i64 [ %22, %35 ], [ %14, %37 ]
  %42 = phi i32* [ %36, %35 ], [ %11, %37 ]
  %43 = sub i64 %40, %41
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %49, label %45

45:                                               ; preds = %39
  %46 = getelementptr inbounds i32, i32* %42, i64 %41
  %47 = getelementptr inbounds i32, i32* %46, i64 1
  %48 = tail call i32* @wmemmove(i32* nonnull %47, i32* %46, i64 %43) #20
  br label %49

49:                                               ; preds = %45, %39, %30
  %50 = phi i64 [ %32, %30 ], [ %41, %39 ], [ %41, %45 ]
  %51 = phi i64 [ %31, %30 ], [ %40, %39 ], [ %40, %45 ]
  %52 = phi i32* [ %34, %30 ], [ %42, %39 ], [ %42, %45 ]
  %53 = getelementptr inbounds i32, i32* %52, i64 %50
  store i32 %2, i32* %53, align 4, !tbaa !7
  %54 = add i64 %51, 1
  %55 = getelementptr inbounds i32, i32* %52, i64 %54
  store i32 0, i32* %55, align 4, !tbaa !7
  %56 = load i8, i8* %5, align 8, !tbaa !3
  %57 = and i8 %56, 1
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %61, label %59

59:                                               ; preds = %49
  %60 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %54, i64* %60, align 8, !tbaa !3
  br label %64

61:                                               ; preds = %49
  %62 = trunc i64 %54 to i8
  %63 = shl i8 %62, 1
  store i8 %63, i8* %5, align 8, !tbaa !3
  br label %64

64:                                               ; preds = %59, %61
  %65 = phi i8 [ %56, %59 ], [ %63, %61 ]
  %66 = and i8 %65, 1
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %71, label %68

68:                                               ; preds = %64
  %69 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %70 = load i32*, i32** %69, align 8, !tbaa !3
  br label %74

71:                                               ; preds = %64
  %72 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %73 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %72, i64 0, i32 1, i64 0
  br label %74

74:                                               ; preds = %68, %71
  %75 = phi i32* [ %70, %68 ], [ %73, %71 ]
  %76 = getelementptr inbounds i32, i32* %75, i64 %50
  ret i32* %76
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* %0, i64 %1, i32 signext %2) local_unnamed_addr #2 comdat align 2 {
  %4 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %5 = load i8, i8* %4, align 8, !tbaa !3
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  br i1 %7, label %8, label %12

8:                                                ; preds = %3
  %9 = lshr i8 %5, 1
  %10 = zext i8 %9 to i64
  %11 = icmp ult i64 %10, %1
  br i1 %11, label %16, label %68

12:                                               ; preds = %3
  %13 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %14 = load i64, i64* %13, align 8, !tbaa !3
  %15 = icmp ult i64 %14, %1
  br i1 %15, label %19, label %64

16:                                               ; preds = %8
  %17 = sub i64 %1, %10
  %18 = icmp eq i64 %17, 0
  br i1 %18, label %73, label %28

19:                                               ; preds = %12
  %20 = sub i64 %1, %14
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %73, label %22

22:                                               ; preds = %19
  %23 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %24 = load i64, i64* %23, align 8, !tbaa !3
  %25 = and i64 %24, -2
  %26 = add i64 %25, -1
  %27 = trunc i64 %24 to i8
  br label %28

28:                                               ; preds = %16, %22
  %29 = phi i64 [ %20, %22 ], [ %17, %16 ]
  %30 = phi i8 [ %27, %22 ], [ %5, %16 ]
  %31 = phi i64 [ %26, %22 ], [ 4, %16 ]
  %32 = phi i64 [ %14, %22 ], [ %10, %16 ]
  %33 = sub i64 %31, %32
  %34 = icmp ult i64 %33, %29
  br i1 %34, label %35, label %39

35:                                               ; preds = %28
  %36 = add i64 %32, %29
  %37 = sub i64 %36, %31
  tail call void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string.3"* nonnull %0, i64 %31, i64 %37, i64 %32, i64 %32, i64 0, i64 0)
  %38 = load i8, i8* %4, align 8, !tbaa !3
  br label %39

39:                                               ; preds = %35, %28
  %40 = phi i8 [ %38, %35 ], [ %30, %28 ]
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %39
  %44 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %45 = load i32*, i32** %44, align 8, !tbaa !3
  br label %49

46:                                               ; preds = %39
  %47 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %48 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %47, i64 0, i32 1, i64 0
  br label %49

49:                                               ; preds = %46, %43
  %50 = phi i32* [ %45, %43 ], [ %48, %46 ]
  %51 = getelementptr inbounds i32, i32* %50, i64 %32
  %52 = tail call i32* @wmemset(i32* %51, i32 signext %2, i64 %29) #20
  %53 = add i64 %32, %29
  %54 = load i8, i8* %4, align 8, !tbaa !3
  %55 = and i8 %54, 1
  %56 = icmp eq i8 %55, 0
  br i1 %56, label %59, label %57

57:                                               ; preds = %49
  %58 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %53, i64* %58, align 8, !tbaa !3
  br label %62

59:                                               ; preds = %49
  %60 = trunc i64 %53 to i8
  %61 = shl i8 %60, 1
  store i8 %61, i8* %4, align 8, !tbaa !3
  br label %62

62:                                               ; preds = %59, %57
  %63 = getelementptr inbounds i32, i32* %50, i64 %53
  store i32 0, i32* %63, align 4, !tbaa !7
  br label %73

64:                                               ; preds = %12
  %65 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %66 = load i32*, i32** %65, align 8, !tbaa !3
  %67 = getelementptr inbounds i32, i32* %66, i64 %1
  store i32 0, i32* %67, align 4, !tbaa !7
  store i64 %1, i64* %13, align 8, !tbaa !3
  br label %73

68:                                               ; preds = %8
  %69 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %70 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %69, i64 0, i32 1, i64 %1
  store i32 0, i32* %70, align 4, !tbaa !7
  %71 = trunc i64 %1 to i8
  %72 = shl i8 %71, 1
  store i8 %72, i8* %4, align 8, !tbaa !3
  br label %73

73:                                               ; preds = %19, %68, %64, %62, %16
  ret void
}

; Function Attrs: uwtable
define weak_odr nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmRKS5_mm(%"class.std::__1::basic_string.3"* %0, i64 %1, %"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %2, i64 %3, i64 %4) local_unnamed_addr #2 comdat align 2 {
  %6 = bitcast %"class.std::__1::basic_string.3"* %2 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %14

10:                                               ; preds = %5
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = icmp ult i64 %12, %3
  br i1 %13, label %18, label %23

14:                                               ; preds = %5
  %15 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %16 = load i64, i64* %15, align 8, !tbaa !3
  %17 = icmp ult i64 %16, %3
  br i1 %17, label %18, label %20

18:                                               ; preds = %14, %10
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__basic_string_common"* %19) #19
  unreachable

20:                                               ; preds = %14
  %21 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %22 = load i32*, i32** %21, align 8, !tbaa !3
  br label %26

23:                                               ; preds = %10
  %24 = bitcast %"class.std::__1::basic_string.3"* %2 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %25 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %24, i64 0, i32 1, i64 0
  br label %26

26:                                               ; preds = %20, %23
  %27 = phi i64 [ %16, %20 ], [ %12, %23 ]
  %28 = phi i32* [ %22, %20 ], [ %25, %23 ]
  %29 = getelementptr inbounds i32, i32* %28, i64 %3
  %30 = sub i64 %27, %3
  %31 = icmp ult i64 %30, %4
  %32 = select i1 %31, i64 %30, i64 %4
  %33 = tail call nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string.3"* @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6insertEmPKwm(%"class.std::__1::basic_string.3"* %0, i64 %1, i32* %29, i64 %32)
  ret %"class.std::__1::basic_string.3"* %33
}

; Function Attrs: uwtable
define weak_odr void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(%"class.std::__1::basic_string"* noalias sret align 8 %0, i8* %1, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %2) local_unnamed_addr #2 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false) #20
  %5 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #20
  %6 = bitcast %"class.std::__1::basic_string"* %2 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !3
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %11 = load i64, i64* %10, align 8
  %12 = lshr i8 %7, 1
  %13 = zext i8 %12 to i64
  %14 = select i1 %9, i64 %13, i64 %11
  %15 = add i64 %14, %5
  %16 = icmp ugt i64 %15, -17
  br i1 %16, label %17, label %20

17:                                               ; preds = %3
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  invoke void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %18) #19
          to label %19 unwind label %48

19:                                               ; preds = %17
  unreachable

20:                                               ; preds = %3
  %21 = icmp ult i64 %15, 23
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = trunc i64 %5 to i8
  %24 = shl i8 %23, 1
  store i8 %24, i8* %4, align 8, !tbaa !3
  %25 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  br label %36

27:                                               ; preds = %20
  %28 = add nuw i64 %15, 16
  %29 = and i64 %28, -16
  %30 = invoke noalias nonnull i8* @_Znwm(i64 %29) #21
          to label %31 unwind label %48

31:                                               ; preds = %27
  %32 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %30, i8** %32, align 8, !tbaa !3
  %33 = or i64 %29, 1
  %34 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %33, i64* %34, align 8, !tbaa !3
  %35 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %5, i64* %35, align 8, !tbaa !3
  br label %36

36:                                               ; preds = %31, %22
  %37 = phi i8* [ %26, %22 ], [ %30, %31 ]
  %38 = icmp eq i64 %5, 0
  br i1 %38, label %40, label %39

39:                                               ; preds = %36
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %37, i8* align 1 %1, i64 %5, i1 false) #20
  br label %40

40:                                               ; preds = %39, %36
  %41 = getelementptr inbounds i8, i8* %37, i64 %5
  store i8 0, i8* %41, align 1, !tbaa !3
  %42 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %43 = load i8*, i8** %42, align 8
  %44 = bitcast %"class.std::__1::basic_string"* %2 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %45 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %44, i64 0, i32 1, i64 0
  %46 = select i1 %9, i8* %45, i8* %43
  %47 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %0, i8* %46, i64 %14)
          to label %57 unwind label %48

48:                                               ; preds = %27, %17, %40
  %49 = landingpad { i8*, i32 }
          cleanup
  %50 = load i8, i8* %4, align 8, !tbaa !3
  %51 = and i8 %50, 1
  %52 = icmp eq i8 %51, 0
  br i1 %52, label %56, label %53

53:                                               ; preds = %48
  %54 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %55 = load i8*, i8** %54, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %55) #22
  br label %56

56:                                               ; preds = %48, %53
  resume { i8*, i32 } %49

57:                                               ; preds = %40
  ret void
}

; Function Attrs: uwtable
define i32 @_ZNSt3__14stoiERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca i8*, align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = bitcast %"class.std::__1::basic_string"* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %9) #20
  store i8 8, i8* %9, align 8, !tbaa !3
  %10 = bitcast %"class.std::__1::basic_string"* %8 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = bitcast i8* %11 to i32*
  store i32 1768911987, i32* %12, align 1
  %13 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 4
  store i8 0, i8* %13, align 1, !tbaa !3
  %14 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #20
  store i8* null, i8** %7, align 8, !tbaa !9
  %15 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %16 = load i8, i8* %15, align 8, !tbaa !3
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %20 = load i8*, i8** %19, align 8
  %21 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %21, i64 0, i32 1, i64 0
  %23 = select i1 %18, i8* %22, i8* %20
  %24 = tail call i32* @__errno_location() #24
  %25 = load i32, i32* %24, align 4, !tbaa !11
  store i32 0, i32* %24, align 4, !tbaa !11
  %26 = call i64 @strtol(i8* %23, i8** nonnull %7, i32 %2) #20
  %27 = load i32, i32* %24, align 4, !tbaa !11
  store i32 %25, i32* %24, align 4, !tbaa !11
  %28 = icmp eq i32 %27, 34
  br i1 %28, label %29, label %50

29:                                               ; preds = %3
  %30 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %30) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %6, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %31 unwind label %113

31:                                               ; preds = %29
  %32 = call i8* @__cxa_allocate_exception(i64 16) #20
  %33 = bitcast i8* %32 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %33, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6)
          to label %34 unwind label %37

34:                                               ; preds = %31
  %35 = bitcast i8* %32 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %35, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %32, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %36 unwind label %39

36:                                               ; preds = %34
  unreachable

37:                                               ; preds = %31
  %38 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %32) #20
  br label %41

39:                                               ; preds = %34
  %40 = landingpad { i8*, i32 }
          cleanup
  br label %41

41:                                               ; preds = %39, %37
  %42 = phi { i8*, i32 } [ %40, %39 ], [ %38, %37 ]
  %43 = load i8, i8* %30, align 8, !tbaa !3
  %44 = and i8 %43, 1
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %48 = load i8*, i8** %47, align 8, !tbaa !3
  call void @_ZdlPv(i8* %48) #22
  br label %49

49:                                               ; preds = %46, %41
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %30) #20
  br label %115

50:                                               ; preds = %3
  %51 = load i8*, i8** %7, align 8, !tbaa !9
  %52 = icmp eq i8* %51, %23
  %53 = ptrtoint i8* %51 to i64
  br i1 %52, label %54, label %75

54:                                               ; preds = %50
  %55 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %55) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %56 unwind label %113

56:                                               ; preds = %54
  %57 = call i8* @__cxa_allocate_exception(i64 16) #20
  %58 = bitcast i8* %57 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %58, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %59 unwind label %62

59:                                               ; preds = %56
  %60 = bitcast i8* %57 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %60, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %57, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %61 unwind label %64

61:                                               ; preds = %59
  unreachable

62:                                               ; preds = %56
  %63 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %57) #20
  br label %66

64:                                               ; preds = %59
  %65 = landingpad { i8*, i32 }
          cleanup
  br label %66

66:                                               ; preds = %64, %62
  %67 = phi { i8*, i32 } [ %65, %64 ], [ %63, %62 ]
  %68 = load i8, i8* %55, align 8, !tbaa !3
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  br i1 %70, label %74, label %71

71:                                               ; preds = %66
  %72 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %73 = load i8*, i8** %72, align 8, !tbaa !3
  call void @_ZdlPv(i8* %73) #22
  br label %74

74:                                               ; preds = %71, %66
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %55) #20
  br label %115

75:                                               ; preds = %50
  %76 = icmp eq i64* %1, null
  br i1 %76, label %80, label %77

77:                                               ; preds = %75
  %78 = ptrtoint i8* %23 to i64
  %79 = sub i64 %53, %78
  store i64 %79, i64* %1, align 8, !tbaa !15
  br label %80

80:                                               ; preds = %77, %75
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #20
  %81 = add i64 %26, 2147483648
  %82 = icmp ugt i64 %81, 4294967295
  br i1 %82, label %83, label %104

83:                                               ; preds = %80
  %84 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %84) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %85 unwind label %113

85:                                               ; preds = %83
  %86 = call i8* @__cxa_allocate_exception(i64 16) #20
  %87 = bitcast i8* %86 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %87, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %88 unwind label %91

88:                                               ; preds = %85
  %89 = bitcast i8* %86 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %89, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %86, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %90 unwind label %93

90:                                               ; preds = %88
  unreachable

91:                                               ; preds = %85
  %92 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %86) #20
  br label %95

93:                                               ; preds = %88
  %94 = landingpad { i8*, i32 }
          cleanup
  br label %95

95:                                               ; preds = %93, %91
  %96 = phi { i8*, i32 } [ %94, %93 ], [ %92, %91 ]
  %97 = load i8, i8* %84, align 8, !tbaa !3
  %98 = and i8 %97, 1
  %99 = icmp eq i8 %98, 0
  br i1 %99, label %103, label %100

100:                                              ; preds = %95
  %101 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %102 = load i8*, i8** %101, align 8, !tbaa !3
  call void @_ZdlPv(i8* %102) #22
  br label %103

103:                                              ; preds = %100, %95
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %84) #20
  br label %115

104:                                              ; preds = %80
  %105 = load i8, i8* %9, align 8, !tbaa !3
  %106 = and i8 %105, 1
  %107 = icmp eq i8 %106, 0
  br i1 %107, label %111, label %108

108:                                              ; preds = %104
  %109 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %110 = load i8*, i8** %109, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %110) #22
  br label %111

111:                                              ; preds = %104, %108
  %112 = trunc i64 %26 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #20
  ret i32 %112

113:                                              ; preds = %83, %54, %29
  %114 = landingpad { i8*, i32 }
          cleanup
  br label %115

115:                                              ; preds = %103, %74, %49, %113
  %116 = phi { i8*, i32 } [ %114, %113 ], [ %42, %49 ], [ %67, %74 ], [ %96, %103 ]
  %117 = load i8, i8* %9, align 8, !tbaa !3
  %118 = and i8 %117, 1
  %119 = icmp eq i8 %118, 0
  br i1 %119, label %123, label %120

120:                                              ; preds = %115
  %121 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %122 = load i8*, i8** %121, align 8, !tbaa !3
  call void @_ZdlPv(i8* %122) #22
  br label %123

123:                                              ; preds = %115, %120
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #20
  resume { i8*, i32 } %116
}

; Function Attrs: uwtable
define i32 @_ZNSt3__14stoiERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPmi(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca i32*, align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = bitcast %"class.std::__1::basic_string"* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %9) #20
  store i8 8, i8* %9, align 8, !tbaa !3
  %10 = bitcast %"class.std::__1::basic_string"* %8 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = bitcast i8* %11 to i32*
  store i32 1768911987, i32* %12, align 1
  %13 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 4
  store i8 0, i8* %13, align 1, !tbaa !3
  %14 = bitcast i32** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #20
  store i32* null, i32** %7, align 8, !tbaa !9
  %15 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %16 = load i8, i8* %15, align 8, !tbaa !3
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  %19 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %20 = load i32*, i32** %19, align 8
  %21 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %22 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %21, i64 0, i32 1, i64 0
  %23 = select i1 %18, i32* %22, i32* %20
  %24 = tail call i32* @__errno_location() #24
  %25 = load i32, i32* %24, align 4, !tbaa !11
  store i32 0, i32* %24, align 4, !tbaa !11
  %26 = call i64 @wcstol(i32* %23, i32** nonnull %7, i32 %2) #20
  %27 = load i32, i32* %24, align 4, !tbaa !11
  store i32 %25, i32* %24, align 4, !tbaa !11
  %28 = icmp eq i32 %27, 34
  br i1 %28, label %29, label %50

29:                                               ; preds = %3
  %30 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %30) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %6, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %31 unwind label %114

31:                                               ; preds = %29
  %32 = call i8* @__cxa_allocate_exception(i64 16) #20
  %33 = bitcast i8* %32 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %33, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6)
          to label %34 unwind label %37

34:                                               ; preds = %31
  %35 = bitcast i8* %32 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %35, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %32, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %36 unwind label %39

36:                                               ; preds = %34
  unreachable

37:                                               ; preds = %31
  %38 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %32) #20
  br label %41

39:                                               ; preds = %34
  %40 = landingpad { i8*, i32 }
          cleanup
  br label %41

41:                                               ; preds = %39, %37
  %42 = phi { i8*, i32 } [ %40, %39 ], [ %38, %37 ]
  %43 = load i8, i8* %30, align 8, !tbaa !3
  %44 = and i8 %43, 1
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %49, label %46

46:                                               ; preds = %41
  %47 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %48 = load i8*, i8** %47, align 8, !tbaa !3
  call void @_ZdlPv(i8* %48) #22
  br label %49

49:                                               ; preds = %46, %41
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %30) #20
  br label %116

50:                                               ; preds = %3
  %51 = load i32*, i32** %7, align 8, !tbaa !9
  %52 = icmp eq i32* %51, %23
  %53 = ptrtoint i32* %51 to i64
  br i1 %52, label %54, label %75

54:                                               ; preds = %50
  %55 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %55) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %56 unwind label %114

56:                                               ; preds = %54
  %57 = call i8* @__cxa_allocate_exception(i64 16) #20
  %58 = bitcast i8* %57 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %58, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %59 unwind label %62

59:                                               ; preds = %56
  %60 = bitcast i8* %57 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %60, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %57, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %61 unwind label %64

61:                                               ; preds = %59
  unreachable

62:                                               ; preds = %56
  %63 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %57) #20
  br label %66

64:                                               ; preds = %59
  %65 = landingpad { i8*, i32 }
          cleanup
  br label %66

66:                                               ; preds = %64, %62
  %67 = phi { i8*, i32 } [ %65, %64 ], [ %63, %62 ]
  %68 = load i8, i8* %55, align 8, !tbaa !3
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  br i1 %70, label %74, label %71

71:                                               ; preds = %66
  %72 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %73 = load i8*, i8** %72, align 8, !tbaa !3
  call void @_ZdlPv(i8* %73) #22
  br label %74

74:                                               ; preds = %71, %66
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %55) #20
  br label %116

75:                                               ; preds = %50
  %76 = icmp eq i64* %1, null
  br i1 %76, label %81, label %77

77:                                               ; preds = %75
  %78 = ptrtoint i32* %23 to i64
  %79 = sub i64 %53, %78
  %80 = ashr exact i64 %79, 2
  store i64 %80, i64* %1, align 8, !tbaa !15
  br label %81

81:                                               ; preds = %77, %75
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #20
  %82 = add i64 %26, 2147483648
  %83 = icmp ugt i64 %82, 4294967295
  br i1 %83, label %84, label %105

84:                                               ; preds = %81
  %85 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %85) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %86 unwind label %114

86:                                               ; preds = %84
  %87 = call i8* @__cxa_allocate_exception(i64 16) #20
  %88 = bitcast i8* %87 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %88, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %89 unwind label %92

89:                                               ; preds = %86
  %90 = bitcast i8* %87 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %90, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %87, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %91 unwind label %94

91:                                               ; preds = %89
  unreachable

92:                                               ; preds = %86
  %93 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %87) #20
  br label %96

94:                                               ; preds = %89
  %95 = landingpad { i8*, i32 }
          cleanup
  br label %96

96:                                               ; preds = %94, %92
  %97 = phi { i8*, i32 } [ %95, %94 ], [ %93, %92 ]
  %98 = load i8, i8* %85, align 8, !tbaa !3
  %99 = and i8 %98, 1
  %100 = icmp eq i8 %99, 0
  br i1 %100, label %104, label %101

101:                                              ; preds = %96
  %102 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %103 = load i8*, i8** %102, align 8, !tbaa !3
  call void @_ZdlPv(i8* %103) #22
  br label %104

104:                                              ; preds = %101, %96
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %85) #20
  br label %116

105:                                              ; preds = %81
  %106 = load i8, i8* %9, align 8, !tbaa !3
  %107 = and i8 %106, 1
  %108 = icmp eq i8 %107, 0
  br i1 %108, label %112, label %109

109:                                              ; preds = %105
  %110 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %111 = load i8*, i8** %110, align 8, !tbaa !3
  call void @_ZdlPv(i8* %111) #22
  br label %112

112:                                              ; preds = %105, %109
  %113 = trunc i64 %26 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #20
  ret i32 %113

114:                                              ; preds = %84, %54, %29
  %115 = landingpad { i8*, i32 }
          cleanup
  br label %116

116:                                              ; preds = %104, %74, %49, %114
  %117 = phi { i8*, i32 } [ %115, %114 ], [ %42, %49 ], [ %67, %74 ], [ %97, %104 ]
  %118 = load i8, i8* %9, align 8, !tbaa !3
  %119 = and i8 %118, 1
  %120 = icmp eq i8 %119, 0
  br i1 %120, label %124, label %121

121:                                              ; preds = %116
  %122 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %123 = load i8*, i8** %122, align 8, !tbaa !3
  call void @_ZdlPv(i8* %123) #22
  br label %124

124:                                              ; preds = %116, %121
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %9) #20
  resume { i8*, i32 } %117
}

; Function Attrs: uwtable
define i64 @_ZNSt3__14stolERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 8, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 1819243635, i32* %11, align 1
  %12 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 4
  store i8 0, i8* %12, align 1, !tbaa !3
  %13 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #20
  store i8* null, i8** %6, align 8, !tbaa !9
  %14 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %15 = load i8, i8* %14, align 8, !tbaa !3
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %20, i64 0, i32 1, i64 0
  %22 = select i1 %17, i8* %21, i8* %19
  %23 = tail call i32* @__errno_location() #24
  %24 = load i32, i32* %23, align 4, !tbaa !11
  store i32 0, i32* %23, align 4, !tbaa !11
  %25 = call i64 @strtol(i8* %22, i8** nonnull %6, i32 %2) #20
  %26 = load i32, i32* %23, align 4, !tbaa !11
  store i32 %24, i32* %23, align 4, !tbaa !11
  %27 = icmp eq i32 %26, 34
  br i1 %27, label %28, label %49

28:                                               ; preds = %3
  %29 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %29) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %30 unwind label %87

30:                                               ; preds = %28
  %31 = call i8* @__cxa_allocate_exception(i64 16) #20
  %32 = bitcast i8* %31 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %32, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %33 unwind label %36

33:                                               ; preds = %30
  %34 = bitcast i8* %31 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %34, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %31, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %35 unwind label %38

35:                                               ; preds = %33
  unreachable

36:                                               ; preds = %30
  %37 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %31) #20
  br label %40

38:                                               ; preds = %33
  %39 = landingpad { i8*, i32 }
          cleanup
  br label %40

40:                                               ; preds = %38, %36
  %41 = phi { i8*, i32 } [ %39, %38 ], [ %37, %36 ]
  %42 = load i8, i8* %29, align 8, !tbaa !3
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %40
  %46 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %47 = load i8*, i8** %46, align 8, !tbaa !3
  call void @_ZdlPv(i8* %47) #22
  br label %48

48:                                               ; preds = %45, %40
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %29) #20
  br label %89

49:                                               ; preds = %3
  %50 = load i8*, i8** %6, align 8, !tbaa !9
  %51 = icmp eq i8* %50, %22
  %52 = ptrtoint i8* %50 to i64
  br i1 %51, label %53, label %74

53:                                               ; preds = %49
  %54 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %54) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %55 unwind label %87

55:                                               ; preds = %53
  %56 = call i8* @__cxa_allocate_exception(i64 16) #20
  %57 = bitcast i8* %56 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %57, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %58 unwind label %61

58:                                               ; preds = %55
  %59 = bitcast i8* %56 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %59, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %56, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %60 unwind label %63

60:                                               ; preds = %58
  unreachable

61:                                               ; preds = %55
  %62 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %56) #20
  br label %65

63:                                               ; preds = %58
  %64 = landingpad { i8*, i32 }
          cleanup
  br label %65

65:                                               ; preds = %63, %61
  %66 = phi { i8*, i32 } [ %64, %63 ], [ %62, %61 ]
  %67 = load i8, i8* %54, align 8, !tbaa !3
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %65
  %71 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !3
  call void @_ZdlPv(i8* %72) #22
  br label %73

73:                                               ; preds = %70, %65
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %54) #20
  br label %89

74:                                               ; preds = %49
  %75 = icmp eq i64* %1, null
  br i1 %75, label %79, label %76

76:                                               ; preds = %74
  %77 = ptrtoint i8* %22 to i64
  %78 = sub i64 %52, %77
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %76, %74
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #20
  %80 = load i8, i8* %8, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %25

87:                                               ; preds = %53, %28
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %73, %48, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %41, %48 ], [ %66, %73 ]
  %91 = load i8, i8* %8, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define i64 @_ZNSt3__14stolERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPmi(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i32*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 8, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  %11 = bitcast i8* %10 to i32*
  store i32 1819243635, i32* %11, align 1
  %12 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 4
  store i8 0, i8* %12, align 1, !tbaa !3
  %13 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #20
  store i32* null, i32** %6, align 8, !tbaa !9
  %14 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %15 = load i8, i8* %14, align 8, !tbaa !3
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  %18 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %19 = load i32*, i32** %18, align 8
  %20 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %21 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %20, i64 0, i32 1, i64 0
  %22 = select i1 %17, i32* %21, i32* %19
  %23 = tail call i32* @__errno_location() #24
  %24 = load i32, i32* %23, align 4, !tbaa !11
  store i32 0, i32* %23, align 4, !tbaa !11
  %25 = call i64 @wcstol(i32* %22, i32** nonnull %6, i32 %2) #20
  %26 = load i32, i32* %23, align 4, !tbaa !11
  store i32 %24, i32* %23, align 4, !tbaa !11
  %27 = icmp eq i32 %26, 34
  br i1 %27, label %28, label %49

28:                                               ; preds = %3
  %29 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %29) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %30 unwind label %88

30:                                               ; preds = %28
  %31 = call i8* @__cxa_allocate_exception(i64 16) #20
  %32 = bitcast i8* %31 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %32, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %33 unwind label %36

33:                                               ; preds = %30
  %34 = bitcast i8* %31 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %34, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %31, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %35 unwind label %38

35:                                               ; preds = %33
  unreachable

36:                                               ; preds = %30
  %37 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %31) #20
  br label %40

38:                                               ; preds = %33
  %39 = landingpad { i8*, i32 }
          cleanup
  br label %40

40:                                               ; preds = %38, %36
  %41 = phi { i8*, i32 } [ %39, %38 ], [ %37, %36 ]
  %42 = load i8, i8* %29, align 8, !tbaa !3
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %40
  %46 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %47 = load i8*, i8** %46, align 8, !tbaa !3
  call void @_ZdlPv(i8* %47) #22
  br label %48

48:                                               ; preds = %45, %40
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %29) #20
  br label %90

49:                                               ; preds = %3
  %50 = load i32*, i32** %6, align 8, !tbaa !9
  %51 = icmp eq i32* %50, %22
  %52 = ptrtoint i32* %50 to i64
  br i1 %51, label %53, label %74

53:                                               ; preds = %49
  %54 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %54) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %55 unwind label %88

55:                                               ; preds = %53
  %56 = call i8* @__cxa_allocate_exception(i64 16) #20
  %57 = bitcast i8* %56 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %57, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %58 unwind label %61

58:                                               ; preds = %55
  %59 = bitcast i8* %56 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %59, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %56, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %60 unwind label %63

60:                                               ; preds = %58
  unreachable

61:                                               ; preds = %55
  %62 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %56) #20
  br label %65

63:                                               ; preds = %58
  %64 = landingpad { i8*, i32 }
          cleanup
  br label %65

65:                                               ; preds = %63, %61
  %66 = phi { i8*, i32 } [ %64, %63 ], [ %62, %61 ]
  %67 = load i8, i8* %54, align 8, !tbaa !3
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %65
  %71 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !3
  call void @_ZdlPv(i8* %72) #22
  br label %73

73:                                               ; preds = %70, %65
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %54) #20
  br label %90

74:                                               ; preds = %49
  %75 = icmp eq i64* %1, null
  br i1 %75, label %80, label %76

76:                                               ; preds = %74
  %77 = ptrtoint i32* %22 to i64
  %78 = sub i64 %52, %77
  %79 = ashr exact i64 %78, 2
  store i64 %79, i64* %1, align 8, !tbaa !15
  br label %80

80:                                               ; preds = %76, %74
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #20
  %81 = load i8, i8* %8, align 8, !tbaa !3
  %82 = and i8 %81, 1
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %87, label %84

84:                                               ; preds = %80
  %85 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %86 = load i8*, i8** %85, align 8, !tbaa !3
  call void @_ZdlPv(i8* %86) #22
  br label %87

87:                                               ; preds = %80, %84
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %25

88:                                               ; preds = %53, %28
  %89 = landingpad { i8*, i32 }
          cleanup
  br label %90

90:                                               ; preds = %73, %48, %88
  %91 = phi { i8*, i32 } [ %89, %88 ], [ %41, %48 ], [ %66, %73 ]
  %92 = load i8, i8* %8, align 8, !tbaa !3
  %93 = and i8 %92, 1
  %94 = icmp eq i8 %93, 0
  br i1 %94, label %98, label %95

95:                                               ; preds = %90
  %96 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %97 = load i8*, i8** %96, align 8, !tbaa !3
  call void @_ZdlPv(i8* %97) #22
  br label %98

98:                                               ; preds = %90, %95
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %91
}

; Function Attrs: uwtable
define i64 @_ZNSt3__15stoulERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 10, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %10, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 5, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 5
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i8* null, i8** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i8* %20, i8* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @strtoul(i8* %21, i8** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %86

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %88

48:                                               ; preds = %3
  %49 = load i8*, i8** %6, align 8, !tbaa !9
  %50 = icmp eq i8* %49, %21
  %51 = ptrtoint i8* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %86

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %88

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %78, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i8* %21 to i64
  %77 = sub i64 %51, %76
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %79 = load i8, i8* %8, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

86:                                               ; preds = %52, %27
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %72, %47, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %40, %47 ], [ %65, %72 ]
  %90 = load i8, i8* %8, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define i64 @_ZNSt3__15stoulERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPmi(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i32*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 10, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %10, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i64 5, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 5
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i32* null, i32** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i32* %20, i32* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @wcstoul(i32* %21, i32** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %87

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %89

48:                                               ; preds = %3
  %49 = load i32*, i32** %6, align 8, !tbaa !9
  %50 = icmp eq i32* %49, %21
  %51 = ptrtoint i32* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %87

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %89

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i32* %21 to i64
  %77 = sub i64 %51, %76
  %78 = ashr exact i64 %77, 2
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %80 = load i8, i8* %8, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

87:                                               ; preds = %52, %27
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %72, %47, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %40, %47 ], [ %65, %72 ]
  %91 = load i8, i8* %8, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define i64 @_ZNSt3__15stollERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 10, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %10, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 5, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 5
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i8* null, i8** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i8* %20, i8* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @strtoll(i8* %21, i8** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %86

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %88

48:                                               ; preds = %3
  %49 = load i8*, i8** %6, align 8, !tbaa !9
  %50 = icmp eq i8* %49, %21
  %51 = ptrtoint i8* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %86

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %88

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %78, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i8* %21 to i64
  %77 = sub i64 %51, %76
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %79 = load i8, i8* %8, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

86:                                               ; preds = %52, %27
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %72, %47, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %40, %47 ], [ %65, %72 ]
  %90 = load i8, i8* %8, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define i64 @_ZNSt3__15stollERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPmi(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i32*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 10, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %10, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.4, i64 0, i64 0), i64 5, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 5
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i32* null, i32** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i32* %20, i32* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @wcstoll(i32* %21, i32** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %87

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %89

48:                                               ; preds = %3
  %49 = load i32*, i32** %6, align 8, !tbaa !9
  %50 = icmp eq i32* %49, %21
  %51 = ptrtoint i32* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %87

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %89

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i32* %21 to i64
  %77 = sub i64 %51, %76
  %78 = ashr exact i64 %77, 2
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %80 = load i8, i8* %8, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

87:                                               ; preds = %52, %27
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %72, %47, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %40, %47 ], [ %65, %72 ]
  %91 = load i8, i8* %8, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define i64 @_ZNSt3__16stoullERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPmi(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i8*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 12, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %10, i8* nonnull align 1 dereferenceable(6) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i64 6, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 6
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i8* null, i8** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i8* %20, i8* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @strtoull(i8* %21, i8** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %86

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %88

48:                                               ; preds = %3
  %49 = load i8*, i8** %6, align 8, !tbaa !9
  %50 = icmp eq i8* %49, %21
  %51 = ptrtoint i8* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %86

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %88

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %78, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i8* %21 to i64
  %77 = sub i64 %51, %76
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %79 = load i8, i8* %8, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

86:                                               ; preds = %52, %27
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %72, %47, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %40, %47 ], [ %65, %72 ]
  %90 = load i8, i8* %8, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define i64 @_ZNSt3__16stoullERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPmi(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1, i32 %2) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = alloca i32*, align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #20
  store i8 12, i8* %8, align 8, !tbaa !3
  %9 = bitcast %"class.std::__1::basic_string"* %7 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(6) %10, i8* nonnull align 1 dereferenceable(6) getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), i64 6, i1 false) #20
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %9, i64 0, i32 1, i64 6
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i32* null, i32** %6, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i32* %20, i32* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call i64 @wcstoull(i32* %21, i32** nonnull %6, i32 %2) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %3
  %28 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %87

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %89

48:                                               ; preds = %3
  %49 = load i32*, i32** %6, align 8, !tbaa !9
  %50 = icmp eq i32* %49, %21
  %51 = ptrtoint i32* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %7, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %87

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %5)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %89

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i32* %21 to i64
  %77 = sub i64 %51, %76
  %78 = ashr exact i64 %77, 2
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %80 = load i8, i8* %8, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  ret i64 %24

87:                                               ; preds = %52, %27
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %72, %47, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %40, %47 ], [ %65, %72 ]
  %91 = load i8, i8* %8, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define float @_ZNSt3__14stofERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 8, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  %10 = bitcast i8* %9 to i32*
  store i32 1718580339, i32* %10, align 1
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 4
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i8* null, i8** %5, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i8* %20, i8* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call float @strtof(i8* %21, i8** nonnull %5) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %2
  %28 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %86

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %88

48:                                               ; preds = %2
  %49 = load i8*, i8** %5, align 8, !tbaa !9
  %50 = icmp eq i8* %49, %21
  %51 = ptrtoint i8* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %86

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %88

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %78, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i8* %21 to i64
  %77 = sub i64 %51, %76
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %79 = load i8, i8* %7, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret float %24

86:                                               ; preds = %52, %27
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %72, %47, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %40, %47 ], [ %65, %72 ]
  %90 = load i8, i8* %7, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define float @_ZNSt3__14stofERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPm(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i32*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 8, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  %10 = bitcast i8* %9 to i32*
  store i32 1718580339, i32* %10, align 1
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 4
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i32** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i32* null, i32** %5, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i32* %20, i32* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call float @wcstof(i32* %21, i32** nonnull %5) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %2
  %28 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %87

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %89

48:                                               ; preds = %2
  %49 = load i32*, i32** %5, align 8, !tbaa !9
  %50 = icmp eq i32* %49, %21
  %51 = ptrtoint i32* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %87

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %89

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i32* %21 to i64
  %77 = sub i64 %51, %76
  %78 = ashr exact i64 %77, 2
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %80 = load i8, i8* %7, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret float %24

87:                                               ; preds = %52, %27
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %72, %47, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %40, %47 ], [ %65, %72 ]
  %91 = load i8, i8* %7, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define double @_ZNSt3__14stodERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 8, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  %10 = bitcast i8* %9 to i32*
  store i32 1685025907, i32* %10, align 1
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 4
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i8* null, i8** %5, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i8* %20, i8* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call double @strtod(i8* %21, i8** nonnull %5) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %2
  %28 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %86

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %88

48:                                               ; preds = %2
  %49 = load i8*, i8** %5, align 8, !tbaa !9
  %50 = icmp eq i8* %49, %21
  %51 = ptrtoint i8* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %86

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %88

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %78, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i8* %21 to i64
  %77 = sub i64 %51, %76
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %79 = load i8, i8* %7, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret double %24

86:                                               ; preds = %52, %27
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %72, %47, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %40, %47 ], [ %65, %72 ]
  %90 = load i8, i8* %7, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define double @_ZNSt3__14stodERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPm(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i32*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 8, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  %10 = bitcast i8* %9 to i32*
  store i32 1685025907, i32* %10, align 1
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 4
  store i8 0, i8* %11, align 1, !tbaa !3
  %12 = bitcast i32** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #20
  store i32* null, i32** %5, align 8, !tbaa !9
  %13 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %14 = load i8, i8* %13, align 8, !tbaa !3
  %15 = and i8 %14, 1
  %16 = icmp eq i8 %15, 0
  %17 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %18 = load i32*, i32** %17, align 8
  %19 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %19, i64 0, i32 1, i64 0
  %21 = select i1 %16, i32* %20, i32* %18
  %22 = tail call i32* @__errno_location() #24
  %23 = load i32, i32* %22, align 4, !tbaa !11
  store i32 0, i32* %22, align 4, !tbaa !11
  %24 = call double @wcstod(i32* %21, i32** nonnull %5) #20
  %25 = load i32, i32* %22, align 4, !tbaa !11
  store i32 %23, i32* %22, align 4, !tbaa !11
  %26 = icmp eq i32 %25, 34
  br i1 %26, label %27, label %48

27:                                               ; preds = %2
  %28 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %28) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %29 unwind label %87

29:                                               ; preds = %27
  %30 = call i8* @__cxa_allocate_exception(i64 16) #20
  %31 = bitcast i8* %30 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %31, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %32 unwind label %35

32:                                               ; preds = %29
  %33 = bitcast i8* %30 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %33, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %30, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %34 unwind label %37

34:                                               ; preds = %32
  unreachable

35:                                               ; preds = %29
  %36 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %30) #20
  br label %39

37:                                               ; preds = %32
  %38 = landingpad { i8*, i32 }
          cleanup
  br label %39

39:                                               ; preds = %37, %35
  %40 = phi { i8*, i32 } [ %38, %37 ], [ %36, %35 ]
  %41 = load i8, i8* %28, align 8, !tbaa !3
  %42 = and i8 %41, 1
  %43 = icmp eq i8 %42, 0
  br i1 %43, label %47, label %44

44:                                               ; preds = %39
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  call void @_ZdlPv(i8* %46) #22
  br label %47

47:                                               ; preds = %44, %39
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %28) #20
  br label %89

48:                                               ; preds = %2
  %49 = load i32*, i32** %5, align 8, !tbaa !9
  %50 = icmp eq i32* %49, %21
  %51 = ptrtoint i32* %49 to i64
  br i1 %50, label %52, label %73

52:                                               ; preds = %48
  %53 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %53) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %54 unwind label %87

54:                                               ; preds = %52
  %55 = call i8* @__cxa_allocate_exception(i64 16) #20
  %56 = bitcast i8* %55 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %56, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %57 unwind label %60

57:                                               ; preds = %54
  %58 = bitcast i8* %55 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %58, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %55, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %59 unwind label %62

59:                                               ; preds = %57
  unreachable

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %55) #20
  br label %64

62:                                               ; preds = %57
  %63 = landingpad { i8*, i32 }
          cleanup
  br label %64

64:                                               ; preds = %62, %60
  %65 = phi { i8*, i32 } [ %63, %62 ], [ %61, %60 ]
  %66 = load i8, i8* %53, align 8, !tbaa !3
  %67 = and i8 %66, 1
  %68 = icmp eq i8 %67, 0
  br i1 %68, label %72, label %69

69:                                               ; preds = %64
  %70 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %71 = load i8*, i8** %70, align 8, !tbaa !3
  call void @_ZdlPv(i8* %71) #22
  br label %72

72:                                               ; preds = %69, %64
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %53) #20
  br label %89

73:                                               ; preds = %48
  %74 = icmp eq i64* %1, null
  br i1 %74, label %79, label %75

75:                                               ; preds = %73
  %76 = ptrtoint i32* %21 to i64
  %77 = sub i64 %51, %76
  %78 = ashr exact i64 %77, 2
  store i64 %78, i64* %1, align 8, !tbaa !15
  br label %79

79:                                               ; preds = %75, %73
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #20
  %80 = load i8, i8* %7, align 8, !tbaa !3
  %81 = and i8 %80, 1
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %86, label %83

83:                                               ; preds = %79
  %84 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %85 = load i8*, i8** %84, align 8, !tbaa !3
  call void @_ZdlPv(i8* %85) #22
  br label %86

86:                                               ; preds = %79, %83
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret double %24

87:                                               ; preds = %52, %27
  %88 = landingpad { i8*, i32 }
          cleanup
  br label %89

89:                                               ; preds = %72, %47, %87
  %90 = phi { i8*, i32 } [ %88, %87 ], [ %40, %47 ], [ %65, %72 ]
  %91 = load i8, i8* %7, align 8, !tbaa !3
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  br i1 %93, label %97, label %94

94:                                               ; preds = %89
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %96 = load i8*, i8** %95, align 8, !tbaa !3
  call void @_ZdlPv(i8* %96) #22
  br label %97

97:                                               ; preds = %89, %94
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %90
}

; Function Attrs: uwtable
define x86_fp80 @_ZNSt3__15stoldERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPm(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i8*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 10, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %9, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i64 5, i1 false) #20
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 5
  store i8 0, i8* %10, align 1, !tbaa !3
  %11 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #20
  store i8* null, i8** %5, align 8, !tbaa !9
  %12 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %13 = load i8, i8* %12, align 8, !tbaa !3
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %17 = load i8*, i8** %16, align 8
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %18, i64 0, i32 1, i64 0
  %20 = select i1 %15, i8* %19, i8* %17
  %21 = tail call i32* @__errno_location() #24
  %22 = load i32, i32* %21, align 4, !tbaa !11
  store i32 0, i32* %21, align 4, !tbaa !11
  %23 = call x86_fp80 @strtold(i8* %20, i8** nonnull %5) #20
  %24 = load i32, i32* %21, align 4, !tbaa !11
  store i32 %22, i32* %21, align 4, !tbaa !11
  %25 = icmp eq i32 %24, 34
  br i1 %25, label %26, label %47

26:                                               ; preds = %2
  %27 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %27) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %28 unwind label %85

28:                                               ; preds = %26
  %29 = call i8* @__cxa_allocate_exception(i64 16) #20
  %30 = bitcast i8* %29 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %30, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %31 unwind label %34

31:                                               ; preds = %28
  %32 = bitcast i8* %29 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %32, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %29, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %33 unwind label %36

33:                                               ; preds = %31
  unreachable

34:                                               ; preds = %28
  %35 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %29) #20
  br label %38

36:                                               ; preds = %31
  %37 = landingpad { i8*, i32 }
          cleanup
  br label %38

38:                                               ; preds = %36, %34
  %39 = phi { i8*, i32 } [ %37, %36 ], [ %35, %34 ]
  %40 = load i8, i8* %27, align 8, !tbaa !3
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %38
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %45 = load i8*, i8** %44, align 8, !tbaa !3
  call void @_ZdlPv(i8* %45) #22
  br label %46

46:                                               ; preds = %43, %38
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %27) #20
  br label %87

47:                                               ; preds = %2
  %48 = load i8*, i8** %5, align 8, !tbaa !9
  %49 = icmp eq i8* %48, %20
  %50 = ptrtoint i8* %48 to i64
  br i1 %49, label %51, label %72

51:                                               ; preds = %47
  %52 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %52) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %53 unwind label %85

53:                                               ; preds = %51
  %54 = call i8* @__cxa_allocate_exception(i64 16) #20
  %55 = bitcast i8* %54 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %55, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %56 unwind label %59

56:                                               ; preds = %53
  %57 = bitcast i8* %54 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %57, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %54, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %58 unwind label %61

58:                                               ; preds = %56
  unreachable

59:                                               ; preds = %53
  %60 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %54) #20
  br label %63

61:                                               ; preds = %56
  %62 = landingpad { i8*, i32 }
          cleanup
  br label %63

63:                                               ; preds = %61, %59
  %64 = phi { i8*, i32 } [ %62, %61 ], [ %60, %59 ]
  %65 = load i8, i8* %52, align 8, !tbaa !3
  %66 = and i8 %65, 1
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %71, label %68

68:                                               ; preds = %63
  %69 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %70 = load i8*, i8** %69, align 8, !tbaa !3
  call void @_ZdlPv(i8* %70) #22
  br label %71

71:                                               ; preds = %68, %63
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %52) #20
  br label %87

72:                                               ; preds = %47
  %73 = icmp eq i64* %1, null
  br i1 %73, label %77, label %74

74:                                               ; preds = %72
  %75 = ptrtoint i8* %20 to i64
  %76 = sub i64 %50, %75
  store i64 %76, i64* %1, align 8, !tbaa !15
  br label %77

77:                                               ; preds = %74, %72
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #20
  %78 = load i8, i8* %7, align 8, !tbaa !3
  %79 = and i8 %78, 1
  %80 = icmp eq i8 %79, 0
  br i1 %80, label %84, label %81

81:                                               ; preds = %77
  %82 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %83 = load i8*, i8** %82, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %83) #22
  br label %84

84:                                               ; preds = %77, %81
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret x86_fp80 %23

85:                                               ; preds = %51, %26
  %86 = landingpad { i8*, i32 }
          cleanup
  br label %87

87:                                               ; preds = %71, %46, %85
  %88 = phi { i8*, i32 } [ %86, %85 ], [ %39, %46 ], [ %64, %71 ]
  %89 = load i8, i8* %7, align 8, !tbaa !3
  %90 = and i8 %89, 1
  %91 = icmp eq i8 %90, 0
  br i1 %91, label %95, label %92

92:                                               ; preds = %87
  %93 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %94 = load i8*, i8** %93, align 8, !tbaa !3
  call void @_ZdlPv(i8* %94) #22
  br label %95

95:                                               ; preds = %87, %92
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %88
}

; Function Attrs: uwtable
define x86_fp80 @_ZNSt3__15stoldERKNS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPm(%"class.std::__1::basic_string.3"* nonnull align 8 dereferenceable(24) %0, i64* %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca i32*, align 8
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %7) #20
  store i8 10, i8* %7, align 8, !tbaa !3
  %8 = bitcast %"class.std::__1::basic_string"* %6 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %9 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(5) %9, i8* nonnull align 1 dereferenceable(5) getelementptr inbounds ([6 x i8], [6 x i8]* @.str.8, i64 0, i64 0), i64 5, i1 false) #20
  %10 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %8, i64 0, i32 1, i64 5
  store i8 0, i8* %10, align 1, !tbaa !3
  %11 = bitcast i32** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %11) #20
  store i32* null, i32** %5, align 8, !tbaa !9
  %12 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  %13 = load i8, i8* %12, align 8, !tbaa !3
  %14 = and i8 %13, 1
  %15 = icmp eq i8 %14, 0
  %16 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %17 = load i32*, i32** %16, align 8
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %18, i64 0, i32 1, i64 0
  %20 = select i1 %15, i32* %19, i32* %17
  %21 = tail call i32* @__errno_location() #24
  %22 = load i32, i32* %21, align 4, !tbaa !11
  store i32 0, i32* %21, align 4, !tbaa !11
  %23 = call x86_fp80 @wcstold(i32* %20, i32** nonnull %5) #20
  %24 = load i32, i32* %21, align 4, !tbaa !11
  store i32 %22, i32* %21, align 4, !tbaa !11
  %25 = icmp eq i32 %24, 34
  br i1 %25, label %26, label %47

26:                                               ; preds = %2
  %27 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %27) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.15, i64 0, i64 0))
          to label %28 unwind label %86

28:                                               ; preds = %26
  %29 = call i8* @__cxa_allocate_exception(i64 16) #20
  %30 = bitcast i8* %29 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %30, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3)
          to label %31 unwind label %34

31:                                               ; preds = %28
  %32 = bitcast i8* %29 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %32, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %29, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #19
          to label %33 unwind label %36

33:                                               ; preds = %31
  unreachable

34:                                               ; preds = %28
  %35 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %29) #20
  br label %38

36:                                               ; preds = %31
  %37 = landingpad { i8*, i32 }
          cleanup
  br label %38

38:                                               ; preds = %36, %34
  %39 = phi { i8*, i32 } [ %37, %36 ], [ %35, %34 ]
  %40 = load i8, i8* %27, align 8, !tbaa !3
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %38
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %45 = load i8*, i8** %44, align 8, !tbaa !3
  call void @_ZdlPv(i8* %45) #22
  br label %46

46:                                               ; preds = %43, %38
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %27) #20
  br label %88

47:                                               ; preds = %2
  %48 = load i32*, i32** %5, align 8, !tbaa !9
  %49 = icmp eq i32* %48, %20
  %50 = ptrtoint i32* %48 to i64
  br i1 %49, label %51, label %72

51:                                               ; preds = %47
  %52 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %52) #20
  invoke void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* nonnull sret align 8 %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.14, i64 0, i64 0))
          to label %53 unwind label %86

53:                                               ; preds = %51
  %54 = call i8* @__cxa_allocate_exception(i64 16) #20
  %55 = bitcast i8* %54 to %"class.std::logic_error"*
  invoke void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"* %55, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %4)
          to label %56 unwind label %59

56:                                               ; preds = %53
  %57 = bitcast i8* %54 to i32 (...)***
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt16invalid_argument, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %57, align 8, !tbaa !13
  invoke void @__cxa_throw(i8* %54, i8* bitcast (i8** @_ZTISt16invalid_argument to i8*), i8* bitcast (void (%"class.std::invalid_argument"*)* @_ZNSt16invalid_argumentD1Ev to i8*)) #19
          to label %58 unwind label %61

58:                                               ; preds = %56
  unreachable

59:                                               ; preds = %53
  %60 = landingpad { i8*, i32 }
          cleanup
  call void @__cxa_free_exception(i8* %54) #20
  br label %63

61:                                               ; preds = %56
  %62 = landingpad { i8*, i32 }
          cleanup
  br label %63

63:                                               ; preds = %61, %59
  %64 = phi { i8*, i32 } [ %62, %61 ], [ %60, %59 ]
  %65 = load i8, i8* %52, align 8, !tbaa !3
  %66 = and i8 %65, 1
  %67 = icmp eq i8 %66, 0
  br i1 %67, label %71, label %68

68:                                               ; preds = %63
  %69 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %70 = load i8*, i8** %69, align 8, !tbaa !3
  call void @_ZdlPv(i8* %70) #22
  br label %71

71:                                               ; preds = %68, %63
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %52) #20
  br label %88

72:                                               ; preds = %47
  %73 = icmp eq i64* %1, null
  br i1 %73, label %78, label %74

74:                                               ; preds = %72
  %75 = ptrtoint i32* %20 to i64
  %76 = sub i64 %50, %75
  %77 = ashr exact i64 %76, 2
  store i64 %77, i64* %1, align 8, !tbaa !15
  br label %78

78:                                               ; preds = %74, %72
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %11) #20
  %79 = load i8, i8* %7, align 8, !tbaa !3
  %80 = and i8 %79, 1
  %81 = icmp eq i8 %80, 0
  br i1 %81, label %85, label %82

82:                                               ; preds = %78
  %83 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  call void @_ZdlPv(i8* %84) #22
  br label %85

85:                                               ; preds = %78, %82
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  ret x86_fp80 %23

86:                                               ; preds = %51, %26
  %87 = landingpad { i8*, i32 }
          cleanup
  br label %88

88:                                               ; preds = %71, %46, %86
  %89 = phi { i8*, i32 } [ %87, %86 ], [ %39, %46 ], [ %64, %71 ]
  %90 = load i8, i8* %7, align 8, !tbaa !3
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  br i1 %92, label %96, label %93

93:                                               ; preds = %88
  %94 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8, !tbaa !3
  call void @_ZdlPv(i8* %95) #22
  br label %96

96:                                               ; preds = %88, %93
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %7) #20
  resume { i8*, i32 } %89
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* noalias sret align 8 %0, i32 %1) local_unnamed_addr #2 {
  %3 = alloca [11 x i8], align 1
  %4 = ptrtoint [11 x i8]* %3 to i64
  %5 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %5) #20, !noalias !17
  %6 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 11
  %7 = icmp sgt i32 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 1, !tbaa !3, !noalias !17
  %10 = sub i32 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i32 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 9
  br i1 %17, label %33, label %18

18:                                               ; preds = %11
  %19 = or i32 %13, 1
  %20 = call i32 @llvm.ctlz.i32(i32 %19, i1 true) #20, !range !20
  %21 = sub nuw nsw i32 32, %20
  %22 = mul nuw nsw i32 %21, 1233
  %23 = lshr i32 %22, 12
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZNSt3__16__itoaL10__pow10_32E, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !11
  %27 = icmp ugt i32 %26, %13
  %28 = sext i1 %27 to i32
  %29 = add nuw nsw i32 %23, 1
  %30 = add nsw i32 %29, %28
  %31 = sext i32 %30 to i64
  %32 = icmp slt i64 %16, %31
  br i1 %32, label %36, label %33

33:                                               ; preds = %18, %11
  %34 = call i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32 %13, i8* nonnull %12) #20
  %35 = ptrtoint i8* %34 to i64
  br label %36

36:                                               ; preds = %33, %18
  %37 = phi i64 [ %14, %18 ], [ %35, %33 ]
  %38 = phi i8* [ %6, %18 ], [ %34, %33 ]
  %39 = sub i64 %37, %4
  %40 = icmp ugt i64 %39, -17
  br i1 %40, label %41, label %43

41:                                               ; preds = %36
  %42 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %42) #19
  unreachable

43:                                               ; preds = %36
  %44 = icmp ult i64 %39, 23
  br i1 %44, label %45, label %51

45:                                               ; preds = %43
  %46 = trunc i64 %39 to i8
  %47 = shl nuw nsw i8 %46, 1
  %48 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %47, i8* %48, align 8, !tbaa !3, !alias.scope !17
  %49 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %50 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %49, i64 0, i32 1, i64 0
  br label %59

51:                                               ; preds = %43
  %52 = add nuw i64 %39, 16
  %53 = and i64 %52, -16
  %54 = call noalias nonnull i8* @_Znwm(i64 %53) #21
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %54, i8** %55, align 8, !tbaa !3, !alias.scope !17
  %56 = or i64 %53, 1
  %57 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %56, i64* %57, align 8, !tbaa !3, !alias.scope !17
  %58 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %39, i64* %58, align 8, !tbaa !3, !alias.scope !17
  br label %59

59:                                               ; preds = %51, %45
  %60 = phi i8* [ %50, %45 ], [ %54, %51 ]
  %61 = icmp eq i8* %5, %38
  br i1 %61, label %158, label %62

62:                                               ; preds = %59
  %63 = sub i64 0, %4
  %64 = getelementptr i8, i8* %38, i64 %63
  %65 = ptrtoint i8* %64 to i64
  %66 = icmp ult i8* %64, inttoptr (i64 32 to i8*)
  br i1 %66, label %148, label %67

67:                                               ; preds = %62
  %68 = and i64 %65, -32
  %69 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %68
  %70 = getelementptr i8, i8* %60, i64 %68
  %71 = add i64 %68, -32
  %72 = lshr exact i64 %71, 5
  %73 = add nuw nsw i64 %72, 1
  %74 = and i64 %73, 3
  %75 = icmp ult i64 %71, 96
  br i1 %75, label %127, label %76

76:                                               ; preds = %67
  %77 = and i64 %73, 1152921504606846972
  br label %78

78:                                               ; preds = %78, %76
  %79 = phi i64 [ 0, %76 ], [ %124, %78 ]
  %80 = phi i64 [ %77, %76 ], [ %125, %78 ]
  %81 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %79
  %82 = getelementptr i8, i8* %60, i64 %79
  %83 = bitcast i8* %81 to <16 x i8>*
  %84 = load <16 x i8>, <16 x i8>* %83, align 1, !tbaa !3, !noalias !17
  %85 = getelementptr i8, i8* %81, i64 16
  %86 = bitcast i8* %85 to <16 x i8>*
  %87 = load <16 x i8>, <16 x i8>* %86, align 1, !tbaa !3, !noalias !17
  %88 = bitcast i8* %82 to <16 x i8>*
  store <16 x i8> %84, <16 x i8>* %88, align 1, !tbaa !3
  %89 = getelementptr i8, i8* %82, i64 16
  %90 = bitcast i8* %89 to <16 x i8>*
  store <16 x i8> %87, <16 x i8>* %90, align 1, !tbaa !3
  %91 = or i64 %79, 32
  %92 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %91
  %93 = getelementptr i8, i8* %60, i64 %91
  %94 = bitcast i8* %92 to <16 x i8>*
  %95 = load <16 x i8>, <16 x i8>* %94, align 1, !tbaa !3, !noalias !17
  %96 = getelementptr i8, i8* %92, i64 16
  %97 = bitcast i8* %96 to <16 x i8>*
  %98 = load <16 x i8>, <16 x i8>* %97, align 1, !tbaa !3, !noalias !17
  %99 = bitcast i8* %93 to <16 x i8>*
  store <16 x i8> %95, <16 x i8>* %99, align 1, !tbaa !3
  %100 = getelementptr i8, i8* %93, i64 16
  %101 = bitcast i8* %100 to <16 x i8>*
  store <16 x i8> %98, <16 x i8>* %101, align 1, !tbaa !3
  %102 = or i64 %79, 64
  %103 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %102
  %104 = getelementptr i8, i8* %60, i64 %102
  %105 = bitcast i8* %103 to <16 x i8>*
  %106 = load <16 x i8>, <16 x i8>* %105, align 1, !tbaa !3, !noalias !17
  %107 = getelementptr i8, i8* %103, i64 16
  %108 = bitcast i8* %107 to <16 x i8>*
  %109 = load <16 x i8>, <16 x i8>* %108, align 1, !tbaa !3, !noalias !17
  %110 = bitcast i8* %104 to <16 x i8>*
  store <16 x i8> %106, <16 x i8>* %110, align 1, !tbaa !3
  %111 = getelementptr i8, i8* %104, i64 16
  %112 = bitcast i8* %111 to <16 x i8>*
  store <16 x i8> %109, <16 x i8>* %112, align 1, !tbaa !3
  %113 = or i64 %79, 96
  %114 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %113
  %115 = getelementptr i8, i8* %60, i64 %113
  %116 = bitcast i8* %114 to <16 x i8>*
  %117 = load <16 x i8>, <16 x i8>* %116, align 1, !tbaa !3, !noalias !17
  %118 = getelementptr i8, i8* %114, i64 16
  %119 = bitcast i8* %118 to <16 x i8>*
  %120 = load <16 x i8>, <16 x i8>* %119, align 1, !tbaa !3, !noalias !17
  %121 = bitcast i8* %115 to <16 x i8>*
  store <16 x i8> %117, <16 x i8>* %121, align 1, !tbaa !3
  %122 = getelementptr i8, i8* %115, i64 16
  %123 = bitcast i8* %122 to <16 x i8>*
  store <16 x i8> %120, <16 x i8>* %123, align 1, !tbaa !3
  %124 = add i64 %79, 128
  %125 = add i64 %80, -4
  %126 = icmp eq i64 %125, 0
  br i1 %126, label %127, label %78, !llvm.loop !21

127:                                              ; preds = %78, %67
  %128 = phi i64 [ 0, %67 ], [ %124, %78 ]
  %129 = icmp eq i64 %74, 0
  br i1 %129, label %146, label %130

130:                                              ; preds = %127, %130
  %131 = phi i64 [ %143, %130 ], [ %128, %127 ]
  %132 = phi i64 [ %144, %130 ], [ %74, %127 ]
  %133 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %131
  %134 = getelementptr i8, i8* %60, i64 %131
  %135 = bitcast i8* %133 to <16 x i8>*
  %136 = load <16 x i8>, <16 x i8>* %135, align 1, !tbaa !3, !noalias !17
  %137 = getelementptr i8, i8* %133, i64 16
  %138 = bitcast i8* %137 to <16 x i8>*
  %139 = load <16 x i8>, <16 x i8>* %138, align 1, !tbaa !3, !noalias !17
  %140 = bitcast i8* %134 to <16 x i8>*
  store <16 x i8> %136, <16 x i8>* %140, align 1, !tbaa !3
  %141 = getelementptr i8, i8* %134, i64 16
  %142 = bitcast i8* %141 to <16 x i8>*
  store <16 x i8> %139, <16 x i8>* %142, align 1, !tbaa !3
  %143 = add i64 %131, 32
  %144 = add i64 %132, -1
  %145 = icmp eq i64 %144, 0
  br i1 %145, label %146, label %130, !llvm.loop !23

146:                                              ; preds = %130, %127
  %147 = icmp eq i64 %68, %65
  br i1 %147, label %158, label %148

148:                                              ; preds = %146, %62
  %149 = phi i8* [ %5, %62 ], [ %69, %146 ]
  %150 = phi i8* [ %60, %62 ], [ %70, %146 ]
  br label %151

151:                                              ; preds = %148, %151
  %152 = phi i8* [ %155, %151 ], [ %149, %148 ]
  %153 = phi i8* [ %156, %151 ], [ %150, %148 ]
  %154 = load i8, i8* %152, align 1, !tbaa !3, !noalias !17
  store i8 %154, i8* %153, align 1, !tbaa !3
  %155 = getelementptr inbounds i8, i8* %152, i64 1
  %156 = getelementptr inbounds i8, i8* %153, i64 1
  %157 = icmp eq i8* %155, %38
  br i1 %157, label %158, label %151, !llvm.loop !25

158:                                              ; preds = %151, %146, %59
  %159 = phi i8* [ %60, %59 ], [ %70, %146 ], [ %156, %151 ]
  store i8 0, i8* %159, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %5) #20, !noalias !17
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEl(%"class.std::__1::basic_string"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [20 x i8], align 16
  %4 = ptrtoint [20 x i8]* %3 to i64
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #20, !noalias !27
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 20
  %7 = icmp sgt i64 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 16, !tbaa !3, !noalias !27
  %10 = sub i64 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i64 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 19
  br i1 %17, label %34, label %18

18:                                               ; preds = %11
  %19 = or i64 %13, 1
  %20 = call i64 @llvm.ctlz.i64(i64 %19, i1 true) #20, !range !30
  %21 = trunc i64 %20 to i32
  %22 = sub nuw nsw i32 64, %21
  %23 = mul nuw nsw i32 %22, 1233
  %24 = lshr i32 %23, 12
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [20 x i64], [20 x i64]* @_ZNSt3__16__itoaL10__pow10_64E, i64 0, i64 %25
  %27 = load i64, i64* %26, align 8, !tbaa !15
  %28 = icmp ugt i64 %27, %13
  %29 = sext i1 %28 to i32
  %30 = add nuw nsw i32 %24, 1
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %16, %32
  br i1 %33, label %37, label %34

34:                                               ; preds = %18, %11
  %35 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %13, i8* nonnull %12) #20
  %36 = ptrtoint i8* %35 to i64
  br label %37

37:                                               ; preds = %34, %18
  %38 = phi i64 [ %14, %18 ], [ %36, %34 ]
  %39 = phi i8* [ %6, %18 ], [ %35, %34 ]
  %40 = sub i64 %38, %4
  %41 = icmp ugt i64 %40, -17
  br i1 %41, label %42, label %44

42:                                               ; preds = %37
  %43 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %43) #19
  unreachable

44:                                               ; preds = %37
  %45 = icmp ult i64 %40, 23
  br i1 %45, label %46, label %52

46:                                               ; preds = %44
  %47 = trunc i64 %40 to i8
  %48 = shl nuw nsw i8 %47, 1
  %49 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %48, i8* %49, align 8, !tbaa !3, !alias.scope !27
  %50 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %50, i64 0, i32 1, i64 0
  br label %60

52:                                               ; preds = %44
  %53 = add nuw i64 %40, 16
  %54 = and i64 %53, -16
  %55 = call noalias nonnull i8* @_Znwm(i64 %54) #21
  %56 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %55, i8** %56, align 8, !tbaa !3, !alias.scope !27
  %57 = or i64 %54, 1
  %58 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %57, i64* %58, align 8, !tbaa !3, !alias.scope !27
  %59 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %40, i64* %59, align 8, !tbaa !3, !alias.scope !27
  br label %60

60:                                               ; preds = %52, %46
  %61 = phi i8* [ %51, %46 ], [ %55, %52 ]
  %62 = icmp eq i8* %5, %39
  br i1 %62, label %159, label %63

63:                                               ; preds = %60
  %64 = sub i64 0, %4
  %65 = getelementptr i8, i8* %39, i64 %64
  %66 = ptrtoint i8* %65 to i64
  %67 = icmp ult i8* %65, inttoptr (i64 32 to i8*)
  br i1 %67, label %149, label %68

68:                                               ; preds = %63
  %69 = and i64 %66, -32
  %70 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %69
  %71 = getelementptr i8, i8* %61, i64 %69
  %72 = add i64 %69, -32
  %73 = lshr exact i64 %72, 5
  %74 = add nuw nsw i64 %73, 1
  %75 = and i64 %74, 3
  %76 = icmp ult i64 %72, 96
  br i1 %76, label %128, label %77

77:                                               ; preds = %68
  %78 = and i64 %74, 1152921504606846972
  br label %79

79:                                               ; preds = %79, %77
  %80 = phi i64 [ 0, %77 ], [ %125, %79 ]
  %81 = phi i64 [ %78, %77 ], [ %126, %79 ]
  %82 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %80
  %83 = getelementptr i8, i8* %61, i64 %80
  %84 = bitcast i8* %82 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 16, !tbaa !3, !noalias !27
  %86 = getelementptr i8, i8* %82, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 16, !tbaa !3, !noalias !27
  %89 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !3
  %90 = getelementptr i8, i8* %83, i64 16
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %91, align 1, !tbaa !3
  %92 = or i64 %80, 32
  %93 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %92
  %94 = getelementptr i8, i8* %61, i64 %92
  %95 = bitcast i8* %93 to <16 x i8>*
  %96 = load <16 x i8>, <16 x i8>* %95, align 16, !tbaa !3, !noalias !27
  %97 = getelementptr i8, i8* %93, i64 16
  %98 = bitcast i8* %97 to <16 x i8>*
  %99 = load <16 x i8>, <16 x i8>* %98, align 16, !tbaa !3, !noalias !27
  %100 = bitcast i8* %94 to <16 x i8>*
  store <16 x i8> %96, <16 x i8>* %100, align 1, !tbaa !3
  %101 = getelementptr i8, i8* %94, i64 16
  %102 = bitcast i8* %101 to <16 x i8>*
  store <16 x i8> %99, <16 x i8>* %102, align 1, !tbaa !3
  %103 = or i64 %80, 64
  %104 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %103
  %105 = getelementptr i8, i8* %61, i64 %103
  %106 = bitcast i8* %104 to <16 x i8>*
  %107 = load <16 x i8>, <16 x i8>* %106, align 16, !tbaa !3, !noalias !27
  %108 = getelementptr i8, i8* %104, i64 16
  %109 = bitcast i8* %108 to <16 x i8>*
  %110 = load <16 x i8>, <16 x i8>* %109, align 16, !tbaa !3, !noalias !27
  %111 = bitcast i8* %105 to <16 x i8>*
  store <16 x i8> %107, <16 x i8>* %111, align 1, !tbaa !3
  %112 = getelementptr i8, i8* %105, i64 16
  %113 = bitcast i8* %112 to <16 x i8>*
  store <16 x i8> %110, <16 x i8>* %113, align 1, !tbaa !3
  %114 = or i64 %80, 96
  %115 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %114
  %116 = getelementptr i8, i8* %61, i64 %114
  %117 = bitcast i8* %115 to <16 x i8>*
  %118 = load <16 x i8>, <16 x i8>* %117, align 16, !tbaa !3, !noalias !27
  %119 = getelementptr i8, i8* %115, i64 16
  %120 = bitcast i8* %119 to <16 x i8>*
  %121 = load <16 x i8>, <16 x i8>* %120, align 16, !tbaa !3, !noalias !27
  %122 = bitcast i8* %116 to <16 x i8>*
  store <16 x i8> %118, <16 x i8>* %122, align 1, !tbaa !3
  %123 = getelementptr i8, i8* %116, i64 16
  %124 = bitcast i8* %123 to <16 x i8>*
  store <16 x i8> %121, <16 x i8>* %124, align 1, !tbaa !3
  %125 = add i64 %80, 128
  %126 = add i64 %81, -4
  %127 = icmp eq i64 %126, 0
  br i1 %127, label %128, label %79, !llvm.loop !31

128:                                              ; preds = %79, %68
  %129 = phi i64 [ 0, %68 ], [ %125, %79 ]
  %130 = icmp eq i64 %75, 0
  br i1 %130, label %147, label %131

131:                                              ; preds = %128, %131
  %132 = phi i64 [ %144, %131 ], [ %129, %128 ]
  %133 = phi i64 [ %145, %131 ], [ %75, %128 ]
  %134 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %132
  %135 = getelementptr i8, i8* %61, i64 %132
  %136 = bitcast i8* %134 to <16 x i8>*
  %137 = load <16 x i8>, <16 x i8>* %136, align 16, !tbaa !3, !noalias !27
  %138 = getelementptr i8, i8* %134, i64 16
  %139 = bitcast i8* %138 to <16 x i8>*
  %140 = load <16 x i8>, <16 x i8>* %139, align 16, !tbaa !3, !noalias !27
  %141 = bitcast i8* %135 to <16 x i8>*
  store <16 x i8> %137, <16 x i8>* %141, align 1, !tbaa !3
  %142 = getelementptr i8, i8* %135, i64 16
  %143 = bitcast i8* %142 to <16 x i8>*
  store <16 x i8> %140, <16 x i8>* %143, align 1, !tbaa !3
  %144 = add i64 %132, 32
  %145 = add i64 %133, -1
  %146 = icmp eq i64 %145, 0
  br i1 %146, label %147, label %131, !llvm.loop !32

147:                                              ; preds = %131, %128
  %148 = icmp eq i64 %69, %66
  br i1 %148, label %159, label %149

149:                                              ; preds = %147, %63
  %150 = phi i8* [ %5, %63 ], [ %70, %147 ]
  %151 = phi i8* [ %61, %63 ], [ %71, %147 ]
  br label %152

152:                                              ; preds = %149, %152
  %153 = phi i8* [ %156, %152 ], [ %150, %149 ]
  %154 = phi i8* [ %157, %152 ], [ %151, %149 ]
  %155 = load i8, i8* %153, align 1, !tbaa !3, !noalias !27
  store i8 %155, i8* %154, align 1, !tbaa !3
  %156 = getelementptr inbounds i8, i8* %153, i64 1
  %157 = getelementptr inbounds i8, i8* %154, i64 1
  %158 = icmp eq i8* %156, %39
  br i1 %158, label %159, label %152, !llvm.loop !33

159:                                              ; preds = %152, %147, %60
  %160 = phi i8* [ %61, %60 ], [ %71, %147 ], [ %157, %152 ]
  store i8 0, i8* %160, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #20, !noalias !27
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEx(%"class.std::__1::basic_string"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [20 x i8], align 16
  %4 = ptrtoint [20 x i8]* %3 to i64
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #20, !noalias !34
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 20
  %7 = icmp sgt i64 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 16, !tbaa !3, !noalias !34
  %10 = sub i64 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i64 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 19
  br i1 %17, label %34, label %18

18:                                               ; preds = %11
  %19 = or i64 %13, 1
  %20 = call i64 @llvm.ctlz.i64(i64 %19, i1 true) #20, !range !30
  %21 = trunc i64 %20 to i32
  %22 = sub nuw nsw i32 64, %21
  %23 = mul nuw nsw i32 %22, 1233
  %24 = lshr i32 %23, 12
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [20 x i64], [20 x i64]* @_ZNSt3__16__itoaL10__pow10_64E, i64 0, i64 %25
  %27 = load i64, i64* %26, align 8, !tbaa !15
  %28 = icmp ugt i64 %27, %13
  %29 = sext i1 %28 to i32
  %30 = add nuw nsw i32 %24, 1
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %16, %32
  br i1 %33, label %37, label %34

34:                                               ; preds = %18, %11
  %35 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %13, i8* nonnull %12) #20
  %36 = ptrtoint i8* %35 to i64
  br label %37

37:                                               ; preds = %34, %18
  %38 = phi i64 [ %14, %18 ], [ %36, %34 ]
  %39 = phi i8* [ %6, %18 ], [ %35, %34 ]
  %40 = sub i64 %38, %4
  %41 = icmp ugt i64 %40, -17
  br i1 %41, label %42, label %44

42:                                               ; preds = %37
  %43 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %43) #19
  unreachable

44:                                               ; preds = %37
  %45 = icmp ult i64 %40, 23
  br i1 %45, label %46, label %52

46:                                               ; preds = %44
  %47 = trunc i64 %40 to i8
  %48 = shl nuw nsw i8 %47, 1
  %49 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %48, i8* %49, align 8, !tbaa !3, !alias.scope !34
  %50 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %50, i64 0, i32 1, i64 0
  br label %60

52:                                               ; preds = %44
  %53 = add nuw i64 %40, 16
  %54 = and i64 %53, -16
  %55 = call noalias nonnull i8* @_Znwm(i64 %54) #21
  %56 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %55, i8** %56, align 8, !tbaa !3, !alias.scope !34
  %57 = or i64 %54, 1
  %58 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %57, i64* %58, align 8, !tbaa !3, !alias.scope !34
  %59 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %40, i64* %59, align 8, !tbaa !3, !alias.scope !34
  br label %60

60:                                               ; preds = %52, %46
  %61 = phi i8* [ %51, %46 ], [ %55, %52 ]
  %62 = icmp eq i8* %5, %39
  br i1 %62, label %159, label %63

63:                                               ; preds = %60
  %64 = sub i64 0, %4
  %65 = getelementptr i8, i8* %39, i64 %64
  %66 = ptrtoint i8* %65 to i64
  %67 = icmp ult i8* %65, inttoptr (i64 32 to i8*)
  br i1 %67, label %149, label %68

68:                                               ; preds = %63
  %69 = and i64 %66, -32
  %70 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %69
  %71 = getelementptr i8, i8* %61, i64 %69
  %72 = add i64 %69, -32
  %73 = lshr exact i64 %72, 5
  %74 = add nuw nsw i64 %73, 1
  %75 = and i64 %74, 3
  %76 = icmp ult i64 %72, 96
  br i1 %76, label %128, label %77

77:                                               ; preds = %68
  %78 = and i64 %74, 1152921504606846972
  br label %79

79:                                               ; preds = %79, %77
  %80 = phi i64 [ 0, %77 ], [ %125, %79 ]
  %81 = phi i64 [ %78, %77 ], [ %126, %79 ]
  %82 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %80
  %83 = getelementptr i8, i8* %61, i64 %80
  %84 = bitcast i8* %82 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 16, !tbaa !3, !noalias !34
  %86 = getelementptr i8, i8* %82, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 16, !tbaa !3, !noalias !34
  %89 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !3
  %90 = getelementptr i8, i8* %83, i64 16
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %91, align 1, !tbaa !3
  %92 = or i64 %80, 32
  %93 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %92
  %94 = getelementptr i8, i8* %61, i64 %92
  %95 = bitcast i8* %93 to <16 x i8>*
  %96 = load <16 x i8>, <16 x i8>* %95, align 16, !tbaa !3, !noalias !34
  %97 = getelementptr i8, i8* %93, i64 16
  %98 = bitcast i8* %97 to <16 x i8>*
  %99 = load <16 x i8>, <16 x i8>* %98, align 16, !tbaa !3, !noalias !34
  %100 = bitcast i8* %94 to <16 x i8>*
  store <16 x i8> %96, <16 x i8>* %100, align 1, !tbaa !3
  %101 = getelementptr i8, i8* %94, i64 16
  %102 = bitcast i8* %101 to <16 x i8>*
  store <16 x i8> %99, <16 x i8>* %102, align 1, !tbaa !3
  %103 = or i64 %80, 64
  %104 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %103
  %105 = getelementptr i8, i8* %61, i64 %103
  %106 = bitcast i8* %104 to <16 x i8>*
  %107 = load <16 x i8>, <16 x i8>* %106, align 16, !tbaa !3, !noalias !34
  %108 = getelementptr i8, i8* %104, i64 16
  %109 = bitcast i8* %108 to <16 x i8>*
  %110 = load <16 x i8>, <16 x i8>* %109, align 16, !tbaa !3, !noalias !34
  %111 = bitcast i8* %105 to <16 x i8>*
  store <16 x i8> %107, <16 x i8>* %111, align 1, !tbaa !3
  %112 = getelementptr i8, i8* %105, i64 16
  %113 = bitcast i8* %112 to <16 x i8>*
  store <16 x i8> %110, <16 x i8>* %113, align 1, !tbaa !3
  %114 = or i64 %80, 96
  %115 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %114
  %116 = getelementptr i8, i8* %61, i64 %114
  %117 = bitcast i8* %115 to <16 x i8>*
  %118 = load <16 x i8>, <16 x i8>* %117, align 16, !tbaa !3, !noalias !34
  %119 = getelementptr i8, i8* %115, i64 16
  %120 = bitcast i8* %119 to <16 x i8>*
  %121 = load <16 x i8>, <16 x i8>* %120, align 16, !tbaa !3, !noalias !34
  %122 = bitcast i8* %116 to <16 x i8>*
  store <16 x i8> %118, <16 x i8>* %122, align 1, !tbaa !3
  %123 = getelementptr i8, i8* %116, i64 16
  %124 = bitcast i8* %123 to <16 x i8>*
  store <16 x i8> %121, <16 x i8>* %124, align 1, !tbaa !3
  %125 = add i64 %80, 128
  %126 = add i64 %81, -4
  %127 = icmp eq i64 %126, 0
  br i1 %127, label %128, label %79, !llvm.loop !37

128:                                              ; preds = %79, %68
  %129 = phi i64 [ 0, %68 ], [ %125, %79 ]
  %130 = icmp eq i64 %75, 0
  br i1 %130, label %147, label %131

131:                                              ; preds = %128, %131
  %132 = phi i64 [ %144, %131 ], [ %129, %128 ]
  %133 = phi i64 [ %145, %131 ], [ %75, %128 ]
  %134 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %132
  %135 = getelementptr i8, i8* %61, i64 %132
  %136 = bitcast i8* %134 to <16 x i8>*
  %137 = load <16 x i8>, <16 x i8>* %136, align 16, !tbaa !3, !noalias !34
  %138 = getelementptr i8, i8* %134, i64 16
  %139 = bitcast i8* %138 to <16 x i8>*
  %140 = load <16 x i8>, <16 x i8>* %139, align 16, !tbaa !3, !noalias !34
  %141 = bitcast i8* %135 to <16 x i8>*
  store <16 x i8> %137, <16 x i8>* %141, align 1, !tbaa !3
  %142 = getelementptr i8, i8* %135, i64 16
  %143 = bitcast i8* %142 to <16 x i8>*
  store <16 x i8> %140, <16 x i8>* %143, align 1, !tbaa !3
  %144 = add i64 %132, 32
  %145 = add i64 %133, -1
  %146 = icmp eq i64 %145, 0
  br i1 %146, label %147, label %131, !llvm.loop !38

147:                                              ; preds = %131, %128
  %148 = icmp eq i64 %69, %66
  br i1 %148, label %159, label %149

149:                                              ; preds = %147, %63
  %150 = phi i8* [ %5, %63 ], [ %70, %147 ]
  %151 = phi i8* [ %61, %63 ], [ %71, %147 ]
  br label %152

152:                                              ; preds = %149, %152
  %153 = phi i8* [ %156, %152 ], [ %150, %149 ]
  %154 = phi i8* [ %157, %152 ], [ %151, %149 ]
  %155 = load i8, i8* %153, align 1, !tbaa !3, !noalias !34
  store i8 %155, i8* %154, align 1, !tbaa !3
  %156 = getelementptr inbounds i8, i8* %153, i64 1
  %157 = getelementptr inbounds i8, i8* %154, i64 1
  %158 = icmp eq i8* %156, %39
  br i1 %158, label %159, label %152, !llvm.loop !39

159:                                              ; preds = %152, %147, %60
  %160 = phi i8* [ %61, %60 ], [ %71, %147 ], [ %157, %152 ]
  store i8 0, i8* %160, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #20, !noalias !34
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEj(%"class.std::__1::basic_string"* noalias sret align 8 %0, i32 %1) local_unnamed_addr #2 {
  %3 = alloca [11 x i8], align 1
  %4 = ptrtoint [11 x i8]* %3 to i64
  %5 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %5) #20, !noalias !40
  %6 = call i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32 %1, i8* nonnull %5) #20, !noalias !40
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, -17
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 23
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !40
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %18, i64 0, i32 1, i64 0
  br label %28

20:                                               ; preds = %12
  %21 = add nuw i64 %8, 16
  %22 = and i64 %21, -16
  %23 = call noalias nonnull i8* @_Znwm(i64 %22) #21
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %23, i8** %24, align 8, !tbaa !3, !alias.scope !40
  %25 = or i64 %22, 1
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %25, i64* %26, align 8, !tbaa !3, !alias.scope !40
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %27, align 8, !tbaa !3, !alias.scope !40
  br label %28

28:                                               ; preds = %20, %14
  %29 = phi i8* [ %19, %14 ], [ %23, %20 ]
  %30 = icmp eq i8* %5, %6
  br i1 %30, label %126, label %31

31:                                               ; preds = %28
  %32 = ptrtoint i8* %6 to i64
  %33 = sub i64 %32, %4
  %34 = icmp ult i64 %33, 32
  br i1 %34, label %116, label %35

35:                                               ; preds = %31
  %36 = and i64 %33, -32
  %37 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %36
  %38 = getelementptr i8, i8* %29, i64 %36
  %39 = add i64 %36, -32
  %40 = lshr exact i64 %39, 5
  %41 = add nuw nsw i64 %40, 1
  %42 = and i64 %41, 3
  %43 = icmp ult i64 %39, 96
  br i1 %43, label %95, label %44

44:                                               ; preds = %35
  %45 = and i64 %41, 1152921504606846972
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i64 [ 0, %44 ], [ %92, %46 ]
  %48 = phi i64 [ %45, %44 ], [ %93, %46 ]
  %49 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %47
  %50 = getelementptr i8, i8* %29, i64 %47
  %51 = bitcast i8* %49 to <16 x i8>*
  %52 = load <16 x i8>, <16 x i8>* %51, align 1, !tbaa !3, !noalias !40
  %53 = getelementptr i8, i8* %49, i64 16
  %54 = bitcast i8* %53 to <16 x i8>*
  %55 = load <16 x i8>, <16 x i8>* %54, align 1, !tbaa !3, !noalias !40
  %56 = bitcast i8* %50 to <16 x i8>*
  store <16 x i8> %52, <16 x i8>* %56, align 1, !tbaa !3
  %57 = getelementptr i8, i8* %50, i64 16
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %55, <16 x i8>* %58, align 1, !tbaa !3
  %59 = or i64 %47, 32
  %60 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %59
  %61 = getelementptr i8, i8* %29, i64 %59
  %62 = bitcast i8* %60 to <16 x i8>*
  %63 = load <16 x i8>, <16 x i8>* %62, align 1, !tbaa !3, !noalias !40
  %64 = getelementptr i8, i8* %60, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  %66 = load <16 x i8>, <16 x i8>* %65, align 1, !tbaa !3, !noalias !40
  %67 = bitcast i8* %61 to <16 x i8>*
  store <16 x i8> %63, <16 x i8>* %67, align 1, !tbaa !3
  %68 = getelementptr i8, i8* %61, i64 16
  %69 = bitcast i8* %68 to <16 x i8>*
  store <16 x i8> %66, <16 x i8>* %69, align 1, !tbaa !3
  %70 = or i64 %47, 64
  %71 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %70
  %72 = getelementptr i8, i8* %29, i64 %70
  %73 = bitcast i8* %71 to <16 x i8>*
  %74 = load <16 x i8>, <16 x i8>* %73, align 1, !tbaa !3, !noalias !40
  %75 = getelementptr i8, i8* %71, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  %77 = load <16 x i8>, <16 x i8>* %76, align 1, !tbaa !3, !noalias !40
  %78 = bitcast i8* %72 to <16 x i8>*
  store <16 x i8> %74, <16 x i8>* %78, align 1, !tbaa !3
  %79 = getelementptr i8, i8* %72, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %77, <16 x i8>* %80, align 1, !tbaa !3
  %81 = or i64 %47, 96
  %82 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %81
  %83 = getelementptr i8, i8* %29, i64 %81
  %84 = bitcast i8* %82 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 1, !tbaa !3, !noalias !40
  %86 = getelementptr i8, i8* %82, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 1, !tbaa !3, !noalias !40
  %89 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !3
  %90 = getelementptr i8, i8* %83, i64 16
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %91, align 1, !tbaa !3
  %92 = add i64 %47, 128
  %93 = add i64 %48, -4
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %95, label %46, !llvm.loop !43

95:                                               ; preds = %46, %35
  %96 = phi i64 [ 0, %35 ], [ %92, %46 ]
  %97 = icmp eq i64 %42, 0
  br i1 %97, label %114, label %98

98:                                               ; preds = %95, %98
  %99 = phi i64 [ %111, %98 ], [ %96, %95 ]
  %100 = phi i64 [ %112, %98 ], [ %42, %95 ]
  %101 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %99
  %102 = getelementptr i8, i8* %29, i64 %99
  %103 = bitcast i8* %101 to <16 x i8>*
  %104 = load <16 x i8>, <16 x i8>* %103, align 1, !tbaa !3, !noalias !40
  %105 = getelementptr i8, i8* %101, i64 16
  %106 = bitcast i8* %105 to <16 x i8>*
  %107 = load <16 x i8>, <16 x i8>* %106, align 1, !tbaa !3, !noalias !40
  %108 = bitcast i8* %102 to <16 x i8>*
  store <16 x i8> %104, <16 x i8>* %108, align 1, !tbaa !3
  %109 = getelementptr i8, i8* %102, i64 16
  %110 = bitcast i8* %109 to <16 x i8>*
  store <16 x i8> %107, <16 x i8>* %110, align 1, !tbaa !3
  %111 = add i64 %99, 32
  %112 = add i64 %100, -1
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %114, label %98, !llvm.loop !44

114:                                              ; preds = %98, %95
  %115 = icmp eq i64 %33, %36
  br i1 %115, label %126, label %116

116:                                              ; preds = %114, %31
  %117 = phi i8* [ %5, %31 ], [ %37, %114 ]
  %118 = phi i8* [ %29, %31 ], [ %38, %114 ]
  br label %119

119:                                              ; preds = %116, %119
  %120 = phi i8* [ %123, %119 ], [ %117, %116 ]
  %121 = phi i8* [ %124, %119 ], [ %118, %116 ]
  %122 = load i8, i8* %120, align 1, !tbaa !3, !noalias !40
  store i8 %122, i8* %121, align 1, !tbaa !3
  %123 = getelementptr inbounds i8, i8* %120, i64 1
  %124 = getelementptr inbounds i8, i8* %121, i64 1
  %125 = icmp eq i8* %123, %6
  br i1 %125, label %126, label %119, !llvm.loop !45

126:                                              ; preds = %119, %114, %28
  %127 = phi i8* [ %29, %28 ], [ %38, %114 ], [ %124, %119 ]
  store i8 0, i8* %127, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %5) #20, !noalias !40
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEm(%"class.std::__1::basic_string"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [21 x i8], align 16
  %4 = ptrtoint [21 x i8]* %3 to i64
  %5 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %5) #20, !noalias !46
  %6 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %1, i8* nonnull %5) #20, !noalias !46
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, -17
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 23
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !46
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %18, i64 0, i32 1, i64 0
  br label %28

20:                                               ; preds = %12
  %21 = add nuw i64 %8, 16
  %22 = and i64 %21, -16
  %23 = call noalias nonnull i8* @_Znwm(i64 %22) #21
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %23, i8** %24, align 8, !tbaa !3, !alias.scope !46
  %25 = or i64 %22, 1
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %25, i64* %26, align 8, !tbaa !3, !alias.scope !46
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %27, align 8, !tbaa !3, !alias.scope !46
  br label %28

28:                                               ; preds = %20, %14
  %29 = phi i8* [ %19, %14 ], [ %23, %20 ]
  %30 = icmp eq i8* %5, %6
  br i1 %30, label %126, label %31

31:                                               ; preds = %28
  %32 = ptrtoint i8* %6 to i64
  %33 = sub i64 %32, %4
  %34 = icmp ult i64 %33, 32
  br i1 %34, label %116, label %35

35:                                               ; preds = %31
  %36 = and i64 %33, -32
  %37 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %36
  %38 = getelementptr i8, i8* %29, i64 %36
  %39 = add i64 %36, -32
  %40 = lshr exact i64 %39, 5
  %41 = add nuw nsw i64 %40, 1
  %42 = and i64 %41, 3
  %43 = icmp ult i64 %39, 96
  br i1 %43, label %95, label %44

44:                                               ; preds = %35
  %45 = and i64 %41, 1152921504606846972
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i64 [ 0, %44 ], [ %92, %46 ]
  %48 = phi i64 [ %45, %44 ], [ %93, %46 ]
  %49 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %47
  %50 = getelementptr i8, i8* %29, i64 %47
  %51 = bitcast i8* %49 to <16 x i8>*
  %52 = load <16 x i8>, <16 x i8>* %51, align 16, !tbaa !3, !noalias !46
  %53 = getelementptr i8, i8* %49, i64 16
  %54 = bitcast i8* %53 to <16 x i8>*
  %55 = load <16 x i8>, <16 x i8>* %54, align 16, !tbaa !3, !noalias !46
  %56 = bitcast i8* %50 to <16 x i8>*
  store <16 x i8> %52, <16 x i8>* %56, align 1, !tbaa !3
  %57 = getelementptr i8, i8* %50, i64 16
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %55, <16 x i8>* %58, align 1, !tbaa !3
  %59 = or i64 %47, 32
  %60 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %59
  %61 = getelementptr i8, i8* %29, i64 %59
  %62 = bitcast i8* %60 to <16 x i8>*
  %63 = load <16 x i8>, <16 x i8>* %62, align 16, !tbaa !3, !noalias !46
  %64 = getelementptr i8, i8* %60, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  %66 = load <16 x i8>, <16 x i8>* %65, align 16, !tbaa !3, !noalias !46
  %67 = bitcast i8* %61 to <16 x i8>*
  store <16 x i8> %63, <16 x i8>* %67, align 1, !tbaa !3
  %68 = getelementptr i8, i8* %61, i64 16
  %69 = bitcast i8* %68 to <16 x i8>*
  store <16 x i8> %66, <16 x i8>* %69, align 1, !tbaa !3
  %70 = or i64 %47, 64
  %71 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %70
  %72 = getelementptr i8, i8* %29, i64 %70
  %73 = bitcast i8* %71 to <16 x i8>*
  %74 = load <16 x i8>, <16 x i8>* %73, align 16, !tbaa !3, !noalias !46
  %75 = getelementptr i8, i8* %71, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  %77 = load <16 x i8>, <16 x i8>* %76, align 16, !tbaa !3, !noalias !46
  %78 = bitcast i8* %72 to <16 x i8>*
  store <16 x i8> %74, <16 x i8>* %78, align 1, !tbaa !3
  %79 = getelementptr i8, i8* %72, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %77, <16 x i8>* %80, align 1, !tbaa !3
  %81 = or i64 %47, 96
  %82 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %81
  %83 = getelementptr i8, i8* %29, i64 %81
  %84 = bitcast i8* %82 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 16, !tbaa !3, !noalias !46
  %86 = getelementptr i8, i8* %82, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 16, !tbaa !3, !noalias !46
  %89 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !3
  %90 = getelementptr i8, i8* %83, i64 16
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %91, align 1, !tbaa !3
  %92 = add i64 %47, 128
  %93 = add i64 %48, -4
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %95, label %46, !llvm.loop !49

95:                                               ; preds = %46, %35
  %96 = phi i64 [ 0, %35 ], [ %92, %46 ]
  %97 = icmp eq i64 %42, 0
  br i1 %97, label %114, label %98

98:                                               ; preds = %95, %98
  %99 = phi i64 [ %111, %98 ], [ %96, %95 ]
  %100 = phi i64 [ %112, %98 ], [ %42, %95 ]
  %101 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %99
  %102 = getelementptr i8, i8* %29, i64 %99
  %103 = bitcast i8* %101 to <16 x i8>*
  %104 = load <16 x i8>, <16 x i8>* %103, align 16, !tbaa !3, !noalias !46
  %105 = getelementptr i8, i8* %101, i64 16
  %106 = bitcast i8* %105 to <16 x i8>*
  %107 = load <16 x i8>, <16 x i8>* %106, align 16, !tbaa !3, !noalias !46
  %108 = bitcast i8* %102 to <16 x i8>*
  store <16 x i8> %104, <16 x i8>* %108, align 1, !tbaa !3
  %109 = getelementptr i8, i8* %102, i64 16
  %110 = bitcast i8* %109 to <16 x i8>*
  store <16 x i8> %107, <16 x i8>* %110, align 1, !tbaa !3
  %111 = add i64 %99, 32
  %112 = add i64 %100, -1
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %114, label %98, !llvm.loop !50

114:                                              ; preds = %98, %95
  %115 = icmp eq i64 %33, %36
  br i1 %115, label %126, label %116

116:                                              ; preds = %114, %31
  %117 = phi i8* [ %5, %31 ], [ %37, %114 ]
  %118 = phi i8* [ %29, %31 ], [ %38, %114 ]
  br label %119

119:                                              ; preds = %116, %119
  %120 = phi i8* [ %123, %119 ], [ %117, %116 ]
  %121 = phi i8* [ %124, %119 ], [ %118, %116 ]
  %122 = load i8, i8* %120, align 1, !tbaa !3, !noalias !46
  store i8 %122, i8* %121, align 1, !tbaa !3
  %123 = getelementptr inbounds i8, i8* %120, i64 1
  %124 = getelementptr inbounds i8, i8* %121, i64 1
  %125 = icmp eq i8* %123, %6
  br i1 %125, label %126, label %119, !llvm.loop !51

126:                                              ; preds = %119, %114, %28
  %127 = phi i8* [ %29, %28 ], [ %38, %114 ], [ %124, %119 ]
  store i8 0, i8* %127, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %5) #20, !noalias !46
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEy(%"class.std::__1::basic_string"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [21 x i8], align 16
  %4 = ptrtoint [21 x i8]* %3 to i64
  %5 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %5) #20, !noalias !52
  %6 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %1, i8* nonnull %5) #20, !noalias !52
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, -17
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 23
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !52
  %18 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %18, i64 0, i32 1, i64 0
  br label %28

20:                                               ; preds = %12
  %21 = add nuw i64 %8, 16
  %22 = and i64 %21, -16
  %23 = call noalias nonnull i8* @_Znwm(i64 %22) #21
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %23, i8** %24, align 8, !tbaa !3, !alias.scope !52
  %25 = or i64 %22, 1
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %25, i64* %26, align 8, !tbaa !3, !alias.scope !52
  %27 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %27, align 8, !tbaa !3, !alias.scope !52
  br label %28

28:                                               ; preds = %20, %14
  %29 = phi i8* [ %19, %14 ], [ %23, %20 ]
  %30 = icmp eq i8* %5, %6
  br i1 %30, label %126, label %31

31:                                               ; preds = %28
  %32 = ptrtoint i8* %6 to i64
  %33 = sub i64 %32, %4
  %34 = icmp ult i64 %33, 32
  br i1 %34, label %116, label %35

35:                                               ; preds = %31
  %36 = and i64 %33, -32
  %37 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %36
  %38 = getelementptr i8, i8* %29, i64 %36
  %39 = add i64 %36, -32
  %40 = lshr exact i64 %39, 5
  %41 = add nuw nsw i64 %40, 1
  %42 = and i64 %41, 3
  %43 = icmp ult i64 %39, 96
  br i1 %43, label %95, label %44

44:                                               ; preds = %35
  %45 = and i64 %41, 1152921504606846972
  br label %46

46:                                               ; preds = %46, %44
  %47 = phi i64 [ 0, %44 ], [ %92, %46 ]
  %48 = phi i64 [ %45, %44 ], [ %93, %46 ]
  %49 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %47
  %50 = getelementptr i8, i8* %29, i64 %47
  %51 = bitcast i8* %49 to <16 x i8>*
  %52 = load <16 x i8>, <16 x i8>* %51, align 16, !tbaa !3, !noalias !52
  %53 = getelementptr i8, i8* %49, i64 16
  %54 = bitcast i8* %53 to <16 x i8>*
  %55 = load <16 x i8>, <16 x i8>* %54, align 16, !tbaa !3, !noalias !52
  %56 = bitcast i8* %50 to <16 x i8>*
  store <16 x i8> %52, <16 x i8>* %56, align 1, !tbaa !3
  %57 = getelementptr i8, i8* %50, i64 16
  %58 = bitcast i8* %57 to <16 x i8>*
  store <16 x i8> %55, <16 x i8>* %58, align 1, !tbaa !3
  %59 = or i64 %47, 32
  %60 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %59
  %61 = getelementptr i8, i8* %29, i64 %59
  %62 = bitcast i8* %60 to <16 x i8>*
  %63 = load <16 x i8>, <16 x i8>* %62, align 16, !tbaa !3, !noalias !52
  %64 = getelementptr i8, i8* %60, i64 16
  %65 = bitcast i8* %64 to <16 x i8>*
  %66 = load <16 x i8>, <16 x i8>* %65, align 16, !tbaa !3, !noalias !52
  %67 = bitcast i8* %61 to <16 x i8>*
  store <16 x i8> %63, <16 x i8>* %67, align 1, !tbaa !3
  %68 = getelementptr i8, i8* %61, i64 16
  %69 = bitcast i8* %68 to <16 x i8>*
  store <16 x i8> %66, <16 x i8>* %69, align 1, !tbaa !3
  %70 = or i64 %47, 64
  %71 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %70
  %72 = getelementptr i8, i8* %29, i64 %70
  %73 = bitcast i8* %71 to <16 x i8>*
  %74 = load <16 x i8>, <16 x i8>* %73, align 16, !tbaa !3, !noalias !52
  %75 = getelementptr i8, i8* %71, i64 16
  %76 = bitcast i8* %75 to <16 x i8>*
  %77 = load <16 x i8>, <16 x i8>* %76, align 16, !tbaa !3, !noalias !52
  %78 = bitcast i8* %72 to <16 x i8>*
  store <16 x i8> %74, <16 x i8>* %78, align 1, !tbaa !3
  %79 = getelementptr i8, i8* %72, i64 16
  %80 = bitcast i8* %79 to <16 x i8>*
  store <16 x i8> %77, <16 x i8>* %80, align 1, !tbaa !3
  %81 = or i64 %47, 96
  %82 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %81
  %83 = getelementptr i8, i8* %29, i64 %81
  %84 = bitcast i8* %82 to <16 x i8>*
  %85 = load <16 x i8>, <16 x i8>* %84, align 16, !tbaa !3, !noalias !52
  %86 = getelementptr i8, i8* %82, i64 16
  %87 = bitcast i8* %86 to <16 x i8>*
  %88 = load <16 x i8>, <16 x i8>* %87, align 16, !tbaa !3, !noalias !52
  %89 = bitcast i8* %83 to <16 x i8>*
  store <16 x i8> %85, <16 x i8>* %89, align 1, !tbaa !3
  %90 = getelementptr i8, i8* %83, i64 16
  %91 = bitcast i8* %90 to <16 x i8>*
  store <16 x i8> %88, <16 x i8>* %91, align 1, !tbaa !3
  %92 = add i64 %47, 128
  %93 = add i64 %48, -4
  %94 = icmp eq i64 %93, 0
  br i1 %94, label %95, label %46, !llvm.loop !55

95:                                               ; preds = %46, %35
  %96 = phi i64 [ 0, %35 ], [ %92, %46 ]
  %97 = icmp eq i64 %42, 0
  br i1 %97, label %114, label %98

98:                                               ; preds = %95, %98
  %99 = phi i64 [ %111, %98 ], [ %96, %95 ]
  %100 = phi i64 [ %112, %98 ], [ %42, %95 ]
  %101 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %99
  %102 = getelementptr i8, i8* %29, i64 %99
  %103 = bitcast i8* %101 to <16 x i8>*
  %104 = load <16 x i8>, <16 x i8>* %103, align 16, !tbaa !3, !noalias !52
  %105 = getelementptr i8, i8* %101, i64 16
  %106 = bitcast i8* %105 to <16 x i8>*
  %107 = load <16 x i8>, <16 x i8>* %106, align 16, !tbaa !3, !noalias !52
  %108 = bitcast i8* %102 to <16 x i8>*
  store <16 x i8> %104, <16 x i8>* %108, align 1, !tbaa !3
  %109 = getelementptr i8, i8* %102, i64 16
  %110 = bitcast i8* %109 to <16 x i8>*
  store <16 x i8> %107, <16 x i8>* %110, align 1, !tbaa !3
  %111 = add i64 %99, 32
  %112 = add i64 %100, -1
  %113 = icmp eq i64 %112, 0
  br i1 %113, label %114, label %98, !llvm.loop !56

114:                                              ; preds = %98, %95
  %115 = icmp eq i64 %33, %36
  br i1 %115, label %126, label %116

116:                                              ; preds = %114, %31
  %117 = phi i8* [ %5, %31 ], [ %37, %114 ]
  %118 = phi i8* [ %29, %31 ], [ %38, %114 ]
  br label %119

119:                                              ; preds = %116, %119
  %120 = phi i8* [ %123, %119 ], [ %117, %116 ]
  %121 = phi i8* [ %124, %119 ], [ %118, %116 ]
  %122 = load i8, i8* %120, align 1, !tbaa !3, !noalias !52
  store i8 %122, i8* %121, align 1, !tbaa !3
  %123 = getelementptr inbounds i8, i8* %120, i64 1
  %124 = getelementptr inbounds i8, i8* %121, i64 1
  %125 = icmp eq i8* %123, %6
  br i1 %125, label %126, label %119, !llvm.loop !57

126:                                              ; preds = %119, %114, %28
  %127 = phi i8* [ %29, %28 ], [ %38, %114 ], [ %124, %119 ]
  store i8 0, i8* %127, align 1, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %5) #20, !noalias !52
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEi(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i32 %1) local_unnamed_addr #2 {
  %3 = alloca [11 x i8], align 1
  %4 = ptrtoint [11 x i8]* %3 to i64
  %5 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %5) #20, !noalias !58
  %6 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 11
  %7 = icmp sgt i32 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 1, !tbaa !3, !noalias !58
  %10 = sub i32 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i32 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 9
  br i1 %17, label %33, label %18

18:                                               ; preds = %11
  %19 = or i32 %13, 1
  %20 = call i32 @llvm.ctlz.i32(i32 %19, i1 true) #20, !range !20
  %21 = sub nuw nsw i32 32, %20
  %22 = mul nuw nsw i32 %21, 1233
  %23 = lshr i32 %22, 12
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* @_ZNSt3__16__itoaL10__pow10_32E, i64 0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !11
  %27 = icmp ugt i32 %26, %13
  %28 = sext i1 %27 to i32
  %29 = add nuw nsw i32 %23, 1
  %30 = add nsw i32 %29, %28
  %31 = sext i32 %30 to i64
  %32 = icmp slt i64 %16, %31
  br i1 %32, label %36, label %33

33:                                               ; preds = %18, %11
  %34 = call i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32 %13, i8* nonnull %12) #20
  %35 = ptrtoint i8* %34 to i64
  br label %36

36:                                               ; preds = %33, %18
  %37 = phi i64 [ %14, %18 ], [ %35, %33 ]
  %38 = phi i8* [ %6, %18 ], [ %34, %33 ]
  %39 = sub i64 %37, %4
  %40 = icmp ugt i64 %39, 4611686018427387887
  br i1 %40, label %41, label %43

41:                                               ; preds = %36
  %42 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %42) #19
  unreachable

43:                                               ; preds = %36
  %44 = icmp ult i64 %39, 5
  br i1 %44, label %45, label %51

45:                                               ; preds = %43
  %46 = trunc i64 %39 to i8
  %47 = shl nuw nsw i8 %46, 1
  %48 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %47, i8* %48, align 8, !tbaa !3, !alias.scope !58
  %49 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %50 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %49, i64 0, i32 1, i64 0
  br label %65

51:                                               ; preds = %43
  %52 = add nuw nsw i64 %39, 4
  %53 = and i64 %52, -4
  %54 = icmp ugt i64 %53, 4611686018427387903
  br i1 %54, label %55, label %56

55:                                               ; preds = %51
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

56:                                               ; preds = %51
  %57 = shl nuw i64 %53, 2
  %58 = call noalias nonnull i8* @_Znwm(i64 %57) #21
  %59 = bitcast i8* %58 to i32*
  %60 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %61 = bitcast i32** %60 to i8**
  store i8* %58, i8** %61, align 8, !tbaa !3, !alias.scope !58
  %62 = or i64 %53, 1
  %63 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %62, i64* %63, align 8, !tbaa !3, !alias.scope !58
  %64 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %39, i64* %64, align 8, !tbaa !3, !alias.scope !58
  br label %65

65:                                               ; preds = %56, %45
  %66 = phi i32* [ %50, %45 ], [ %59, %56 ]
  %67 = icmp eq i8* %5, %38
  br i1 %67, label %144, label %68

68:                                               ; preds = %65
  %69 = sub i64 0, %4
  %70 = getelementptr i8, i8* %38, i64 %69
  %71 = ptrtoint i8* %70 to i64
  %72 = icmp ult i8* %70, inttoptr (i64 8 to i8*)
  br i1 %72, label %133, label %73

73:                                               ; preds = %68
  %74 = and i64 %71, -8
  %75 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %74
  %76 = getelementptr i32, i32* %66, i64 %74
  %77 = add i64 %74, -8
  %78 = lshr exact i64 %77, 3
  %79 = add nuw nsw i64 %78, 1
  %80 = and i64 %79, 1
  %81 = icmp eq i64 %77, 0
  br i1 %81, label %115, label %82

82:                                               ; preds = %73
  %83 = and i64 %79, 4611686018427387902
  br label %84

84:                                               ; preds = %84, %82
  %85 = phi i64 [ 0, %82 ], [ %112, %84 ]
  %86 = phi i64 [ %83, %82 ], [ %113, %84 ]
  %87 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %85
  %88 = getelementptr i32, i32* %66, i64 %85
  %89 = bitcast i8* %87 to <4 x i8>*
  %90 = load <4 x i8>, <4 x i8>* %89, align 1, !tbaa !3, !noalias !58
  %91 = getelementptr i8, i8* %87, i64 4
  %92 = bitcast i8* %91 to <4 x i8>*
  %93 = load <4 x i8>, <4 x i8>* %92, align 1, !tbaa !3, !noalias !58
  %94 = sext <4 x i8> %90 to <4 x i32>
  %95 = sext <4 x i8> %93 to <4 x i32>
  %96 = bitcast i32* %88 to <4 x i32>*
  store <4 x i32> %94, <4 x i32>* %96, align 4, !tbaa !7
  %97 = getelementptr i32, i32* %88, i64 4
  %98 = bitcast i32* %97 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %98, align 4, !tbaa !7
  %99 = or i64 %85, 8
  %100 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %99
  %101 = getelementptr i32, i32* %66, i64 %99
  %102 = bitcast i8* %100 to <4 x i8>*
  %103 = load <4 x i8>, <4 x i8>* %102, align 1, !tbaa !3, !noalias !58
  %104 = getelementptr i8, i8* %100, i64 4
  %105 = bitcast i8* %104 to <4 x i8>*
  %106 = load <4 x i8>, <4 x i8>* %105, align 1, !tbaa !3, !noalias !58
  %107 = sext <4 x i8> %103 to <4 x i32>
  %108 = sext <4 x i8> %106 to <4 x i32>
  %109 = bitcast i32* %101 to <4 x i32>*
  store <4 x i32> %107, <4 x i32>* %109, align 4, !tbaa !7
  %110 = getelementptr i32, i32* %101, i64 4
  %111 = bitcast i32* %110 to <4 x i32>*
  store <4 x i32> %108, <4 x i32>* %111, align 4, !tbaa !7
  %112 = add i64 %85, 16
  %113 = add i64 %86, -2
  %114 = icmp eq i64 %113, 0
  br i1 %114, label %115, label %84, !llvm.loop !61

115:                                              ; preds = %84, %73
  %116 = phi i64 [ 0, %73 ], [ %112, %84 ]
  %117 = icmp eq i64 %80, 0
  br i1 %117, label %131, label %118

118:                                              ; preds = %115
  %119 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %116
  %120 = getelementptr i32, i32* %66, i64 %116
  %121 = bitcast i8* %119 to <4 x i8>*
  %122 = load <4 x i8>, <4 x i8>* %121, align 1, !tbaa !3, !noalias !58
  %123 = getelementptr i8, i8* %119, i64 4
  %124 = bitcast i8* %123 to <4 x i8>*
  %125 = load <4 x i8>, <4 x i8>* %124, align 1, !tbaa !3, !noalias !58
  %126 = sext <4 x i8> %122 to <4 x i32>
  %127 = sext <4 x i8> %125 to <4 x i32>
  %128 = bitcast i32* %120 to <4 x i32>*
  store <4 x i32> %126, <4 x i32>* %128, align 4, !tbaa !7
  %129 = getelementptr i32, i32* %120, i64 4
  %130 = bitcast i32* %129 to <4 x i32>*
  store <4 x i32> %127, <4 x i32>* %130, align 4, !tbaa !7
  br label %131

131:                                              ; preds = %115, %118
  %132 = icmp eq i64 %74, %71
  br i1 %132, label %144, label %133

133:                                              ; preds = %131, %68
  %134 = phi i8* [ %5, %68 ], [ %75, %131 ]
  %135 = phi i32* [ %66, %68 ], [ %76, %131 ]
  br label %136

136:                                              ; preds = %133, %136
  %137 = phi i8* [ %141, %136 ], [ %134, %133 ]
  %138 = phi i32* [ %142, %136 ], [ %135, %133 ]
  %139 = load i8, i8* %137, align 1, !tbaa !3, !noalias !58
  %140 = sext i8 %139 to i32
  store i32 %140, i32* %138, align 4, !tbaa !7
  %141 = getelementptr inbounds i8, i8* %137, i64 1
  %142 = getelementptr inbounds i32, i32* %138, i64 1
  %143 = icmp eq i8* %141, %38
  br i1 %143, label %144, label %136, !llvm.loop !62

144:                                              ; preds = %136, %131, %65
  %145 = phi i32* [ %66, %65 ], [ %76, %131 ], [ %142, %136 ]
  store i32 0, i32* %145, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %5) #20, !noalias !58
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEl(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [20 x i8], align 16
  %4 = ptrtoint [20 x i8]* %3 to i64
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #20, !noalias !63
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 20
  %7 = icmp sgt i64 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 16, !tbaa !3, !noalias !63
  %10 = sub i64 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i64 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 19
  br i1 %17, label %34, label %18

18:                                               ; preds = %11
  %19 = or i64 %13, 1
  %20 = call i64 @llvm.ctlz.i64(i64 %19, i1 true) #20, !range !30
  %21 = trunc i64 %20 to i32
  %22 = sub nuw nsw i32 64, %21
  %23 = mul nuw nsw i32 %22, 1233
  %24 = lshr i32 %23, 12
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [20 x i64], [20 x i64]* @_ZNSt3__16__itoaL10__pow10_64E, i64 0, i64 %25
  %27 = load i64, i64* %26, align 8, !tbaa !15
  %28 = icmp ugt i64 %27, %13
  %29 = sext i1 %28 to i32
  %30 = add nuw nsw i32 %24, 1
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %16, %32
  br i1 %33, label %37, label %34

34:                                               ; preds = %18, %11
  %35 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %13, i8* nonnull %12) #20
  %36 = ptrtoint i8* %35 to i64
  br label %37

37:                                               ; preds = %34, %18
  %38 = phi i64 [ %14, %18 ], [ %36, %34 ]
  %39 = phi i8* [ %6, %18 ], [ %35, %34 ]
  %40 = sub i64 %38, %4
  %41 = icmp ugt i64 %40, 4611686018427387887
  br i1 %41, label %42, label %44

42:                                               ; preds = %37
  %43 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %43) #19
  unreachable

44:                                               ; preds = %37
  %45 = icmp ult i64 %40, 5
  br i1 %45, label %46, label %52

46:                                               ; preds = %44
  %47 = trunc i64 %40 to i8
  %48 = shl nuw nsw i8 %47, 1
  %49 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %48, i8* %49, align 8, !tbaa !3, !alias.scope !63
  %50 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %50, i64 0, i32 1, i64 0
  br label %66

52:                                               ; preds = %44
  %53 = add nuw nsw i64 %40, 4
  %54 = and i64 %53, -4
  %55 = icmp ugt i64 %54, 4611686018427387903
  br i1 %55, label %56, label %57

56:                                               ; preds = %52
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

57:                                               ; preds = %52
  %58 = shl nuw i64 %54, 2
  %59 = call noalias nonnull i8* @_Znwm(i64 %58) #21
  %60 = bitcast i8* %59 to i32*
  %61 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %62 = bitcast i32** %61 to i8**
  store i8* %59, i8** %62, align 8, !tbaa !3, !alias.scope !63
  %63 = or i64 %54, 1
  %64 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %63, i64* %64, align 8, !tbaa !3, !alias.scope !63
  %65 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %40, i64* %65, align 8, !tbaa !3, !alias.scope !63
  br label %66

66:                                               ; preds = %57, %46
  %67 = phi i32* [ %51, %46 ], [ %60, %57 ]
  %68 = icmp eq i8* %5, %39
  br i1 %68, label %145, label %69

69:                                               ; preds = %66
  %70 = sub i64 0, %4
  %71 = getelementptr i8, i8* %39, i64 %70
  %72 = ptrtoint i8* %71 to i64
  %73 = icmp ult i8* %71, inttoptr (i64 8 to i8*)
  br i1 %73, label %134, label %74

74:                                               ; preds = %69
  %75 = and i64 %72, -8
  %76 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %75
  %77 = getelementptr i32, i32* %67, i64 %75
  %78 = add i64 %75, -8
  %79 = lshr exact i64 %78, 3
  %80 = add nuw nsw i64 %79, 1
  %81 = and i64 %80, 1
  %82 = icmp eq i64 %78, 0
  br i1 %82, label %116, label %83

83:                                               ; preds = %74
  %84 = and i64 %80, 4611686018427387902
  br label %85

85:                                               ; preds = %85, %83
  %86 = phi i64 [ 0, %83 ], [ %113, %85 ]
  %87 = phi i64 [ %84, %83 ], [ %114, %85 ]
  %88 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %86
  %89 = getelementptr i32, i32* %67, i64 %86
  %90 = bitcast i8* %88 to <4 x i8>*
  %91 = load <4 x i8>, <4 x i8>* %90, align 16, !tbaa !3, !noalias !63
  %92 = getelementptr i8, i8* %88, i64 4
  %93 = bitcast i8* %92 to <4 x i8>*
  %94 = load <4 x i8>, <4 x i8>* %93, align 4, !tbaa !3, !noalias !63
  %95 = sext <4 x i8> %91 to <4 x i32>
  %96 = sext <4 x i8> %94 to <4 x i32>
  %97 = bitcast i32* %89 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %97, align 4, !tbaa !7
  %98 = getelementptr i32, i32* %89, i64 4
  %99 = bitcast i32* %98 to <4 x i32>*
  store <4 x i32> %96, <4 x i32>* %99, align 4, !tbaa !7
  %100 = or i64 %86, 8
  %101 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %100
  %102 = getelementptr i32, i32* %67, i64 %100
  %103 = bitcast i8* %101 to <4 x i8>*
  %104 = load <4 x i8>, <4 x i8>* %103, align 8, !tbaa !3, !noalias !63
  %105 = getelementptr i8, i8* %101, i64 4
  %106 = bitcast i8* %105 to <4 x i8>*
  %107 = load <4 x i8>, <4 x i8>* %106, align 4, !tbaa !3, !noalias !63
  %108 = sext <4 x i8> %104 to <4 x i32>
  %109 = sext <4 x i8> %107 to <4 x i32>
  %110 = bitcast i32* %102 to <4 x i32>*
  store <4 x i32> %108, <4 x i32>* %110, align 4, !tbaa !7
  %111 = getelementptr i32, i32* %102, i64 4
  %112 = bitcast i32* %111 to <4 x i32>*
  store <4 x i32> %109, <4 x i32>* %112, align 4, !tbaa !7
  %113 = add i64 %86, 16
  %114 = add i64 %87, -2
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %116, label %85, !llvm.loop !66

116:                                              ; preds = %85, %74
  %117 = phi i64 [ 0, %74 ], [ %113, %85 ]
  %118 = icmp eq i64 %81, 0
  br i1 %118, label %132, label %119

119:                                              ; preds = %116
  %120 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %117
  %121 = getelementptr i32, i32* %67, i64 %117
  %122 = bitcast i8* %120 to <4 x i8>*
  %123 = load <4 x i8>, <4 x i8>* %122, align 8, !tbaa !3, !noalias !63
  %124 = getelementptr i8, i8* %120, i64 4
  %125 = bitcast i8* %124 to <4 x i8>*
  %126 = load <4 x i8>, <4 x i8>* %125, align 4, !tbaa !3, !noalias !63
  %127 = sext <4 x i8> %123 to <4 x i32>
  %128 = sext <4 x i8> %126 to <4 x i32>
  %129 = bitcast i32* %121 to <4 x i32>*
  store <4 x i32> %127, <4 x i32>* %129, align 4, !tbaa !7
  %130 = getelementptr i32, i32* %121, i64 4
  %131 = bitcast i32* %130 to <4 x i32>*
  store <4 x i32> %128, <4 x i32>* %131, align 4, !tbaa !7
  br label %132

132:                                              ; preds = %116, %119
  %133 = icmp eq i64 %75, %72
  br i1 %133, label %145, label %134

134:                                              ; preds = %132, %69
  %135 = phi i8* [ %5, %69 ], [ %76, %132 ]
  %136 = phi i32* [ %67, %69 ], [ %77, %132 ]
  br label %137

137:                                              ; preds = %134, %137
  %138 = phi i8* [ %142, %137 ], [ %135, %134 ]
  %139 = phi i32* [ %143, %137 ], [ %136, %134 ]
  %140 = load i8, i8* %138, align 1, !tbaa !3, !noalias !63
  %141 = sext i8 %140 to i32
  store i32 %141, i32* %139, align 4, !tbaa !7
  %142 = getelementptr inbounds i8, i8* %138, i64 1
  %143 = getelementptr inbounds i32, i32* %139, i64 1
  %144 = icmp eq i8* %142, %39
  br i1 %144, label %145, label %137, !llvm.loop !67

145:                                              ; preds = %137, %132, %66
  %146 = phi i32* [ %67, %66 ], [ %77, %132 ], [ %143, %137 ]
  store i32 0, i32* %146, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #20, !noalias !63
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEx(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [20 x i8], align 16
  %4 = ptrtoint [20 x i8]* %3 to i64
  %5 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 20, i8* nonnull %5) #20, !noalias !68
  %6 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 20
  %7 = icmp sgt i64 %1, -1
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = getelementptr inbounds [20 x i8], [20 x i8]* %3, i64 0, i64 1
  store i8 45, i8* %5, align 16, !tbaa !3, !noalias !68
  %10 = sub i64 0, %1
  br label %11

11:                                               ; preds = %8, %2
  %12 = phi i8* [ %9, %8 ], [ %5, %2 ]
  %13 = phi i64 [ %10, %8 ], [ %1, %2 ]
  %14 = ptrtoint i8* %6 to i64
  %15 = ptrtoint i8* %12 to i64
  %16 = sub i64 %14, %15
  %17 = icmp sgt i64 %16, 19
  br i1 %17, label %34, label %18

18:                                               ; preds = %11
  %19 = or i64 %13, 1
  %20 = call i64 @llvm.ctlz.i64(i64 %19, i1 true) #20, !range !30
  %21 = trunc i64 %20 to i32
  %22 = sub nuw nsw i32 64, %21
  %23 = mul nuw nsw i32 %22, 1233
  %24 = lshr i32 %23, 12
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds [20 x i64], [20 x i64]* @_ZNSt3__16__itoaL10__pow10_64E, i64 0, i64 %25
  %27 = load i64, i64* %26, align 8, !tbaa !15
  %28 = icmp ugt i64 %27, %13
  %29 = sext i1 %28 to i32
  %30 = add nuw nsw i32 %24, 1
  %31 = add nsw i32 %30, %29
  %32 = sext i32 %31 to i64
  %33 = icmp slt i64 %16, %32
  br i1 %33, label %37, label %34

34:                                               ; preds = %18, %11
  %35 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %13, i8* nonnull %12) #20
  %36 = ptrtoint i8* %35 to i64
  br label %37

37:                                               ; preds = %34, %18
  %38 = phi i64 [ %14, %18 ], [ %36, %34 ]
  %39 = phi i8* [ %6, %18 ], [ %35, %34 ]
  %40 = sub i64 %38, %4
  %41 = icmp ugt i64 %40, 4611686018427387887
  br i1 %41, label %42, label %44

42:                                               ; preds = %37
  %43 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %43) #19
  unreachable

44:                                               ; preds = %37
  %45 = icmp ult i64 %40, 5
  br i1 %45, label %46, label %52

46:                                               ; preds = %44
  %47 = trunc i64 %40 to i8
  %48 = shl nuw nsw i8 %47, 1
  %49 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %48, i8* %49, align 8, !tbaa !3, !alias.scope !68
  %50 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %51 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %50, i64 0, i32 1, i64 0
  br label %66

52:                                               ; preds = %44
  %53 = add nuw nsw i64 %40, 4
  %54 = and i64 %53, -4
  %55 = icmp ugt i64 %54, 4611686018427387903
  br i1 %55, label %56, label %57

56:                                               ; preds = %52
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

57:                                               ; preds = %52
  %58 = shl nuw i64 %54, 2
  %59 = call noalias nonnull i8* @_Znwm(i64 %58) #21
  %60 = bitcast i8* %59 to i32*
  %61 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %62 = bitcast i32** %61 to i8**
  store i8* %59, i8** %62, align 8, !tbaa !3, !alias.scope !68
  %63 = or i64 %54, 1
  %64 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %63, i64* %64, align 8, !tbaa !3, !alias.scope !68
  %65 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %40, i64* %65, align 8, !tbaa !3, !alias.scope !68
  br label %66

66:                                               ; preds = %57, %46
  %67 = phi i32* [ %51, %46 ], [ %60, %57 ]
  %68 = icmp eq i8* %5, %39
  br i1 %68, label %145, label %69

69:                                               ; preds = %66
  %70 = sub i64 0, %4
  %71 = getelementptr i8, i8* %39, i64 %70
  %72 = ptrtoint i8* %71 to i64
  %73 = icmp ult i8* %71, inttoptr (i64 8 to i8*)
  br i1 %73, label %134, label %74

74:                                               ; preds = %69
  %75 = and i64 %72, -8
  %76 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %75
  %77 = getelementptr i32, i32* %67, i64 %75
  %78 = add i64 %75, -8
  %79 = lshr exact i64 %78, 3
  %80 = add nuw nsw i64 %79, 1
  %81 = and i64 %80, 1
  %82 = icmp eq i64 %78, 0
  br i1 %82, label %116, label %83

83:                                               ; preds = %74
  %84 = and i64 %80, 4611686018427387902
  br label %85

85:                                               ; preds = %85, %83
  %86 = phi i64 [ 0, %83 ], [ %113, %85 ]
  %87 = phi i64 [ %84, %83 ], [ %114, %85 ]
  %88 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %86
  %89 = getelementptr i32, i32* %67, i64 %86
  %90 = bitcast i8* %88 to <4 x i8>*
  %91 = load <4 x i8>, <4 x i8>* %90, align 16, !tbaa !3, !noalias !68
  %92 = getelementptr i8, i8* %88, i64 4
  %93 = bitcast i8* %92 to <4 x i8>*
  %94 = load <4 x i8>, <4 x i8>* %93, align 4, !tbaa !3, !noalias !68
  %95 = sext <4 x i8> %91 to <4 x i32>
  %96 = sext <4 x i8> %94 to <4 x i32>
  %97 = bitcast i32* %89 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %97, align 4, !tbaa !7
  %98 = getelementptr i32, i32* %89, i64 4
  %99 = bitcast i32* %98 to <4 x i32>*
  store <4 x i32> %96, <4 x i32>* %99, align 4, !tbaa !7
  %100 = or i64 %86, 8
  %101 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %100
  %102 = getelementptr i32, i32* %67, i64 %100
  %103 = bitcast i8* %101 to <4 x i8>*
  %104 = load <4 x i8>, <4 x i8>* %103, align 8, !tbaa !3, !noalias !68
  %105 = getelementptr i8, i8* %101, i64 4
  %106 = bitcast i8* %105 to <4 x i8>*
  %107 = load <4 x i8>, <4 x i8>* %106, align 4, !tbaa !3, !noalias !68
  %108 = sext <4 x i8> %104 to <4 x i32>
  %109 = sext <4 x i8> %107 to <4 x i32>
  %110 = bitcast i32* %102 to <4 x i32>*
  store <4 x i32> %108, <4 x i32>* %110, align 4, !tbaa !7
  %111 = getelementptr i32, i32* %102, i64 4
  %112 = bitcast i32* %111 to <4 x i32>*
  store <4 x i32> %109, <4 x i32>* %112, align 4, !tbaa !7
  %113 = add i64 %86, 16
  %114 = add i64 %87, -2
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %116, label %85, !llvm.loop !71

116:                                              ; preds = %85, %74
  %117 = phi i64 [ 0, %74 ], [ %113, %85 ]
  %118 = icmp eq i64 %81, 0
  br i1 %118, label %132, label %119

119:                                              ; preds = %116
  %120 = getelementptr [20 x i8], [20 x i8]* %3, i64 0, i64 %117
  %121 = getelementptr i32, i32* %67, i64 %117
  %122 = bitcast i8* %120 to <4 x i8>*
  %123 = load <4 x i8>, <4 x i8>* %122, align 8, !tbaa !3, !noalias !68
  %124 = getelementptr i8, i8* %120, i64 4
  %125 = bitcast i8* %124 to <4 x i8>*
  %126 = load <4 x i8>, <4 x i8>* %125, align 4, !tbaa !3, !noalias !68
  %127 = sext <4 x i8> %123 to <4 x i32>
  %128 = sext <4 x i8> %126 to <4 x i32>
  %129 = bitcast i32* %121 to <4 x i32>*
  store <4 x i32> %127, <4 x i32>* %129, align 4, !tbaa !7
  %130 = getelementptr i32, i32* %121, i64 4
  %131 = bitcast i32* %130 to <4 x i32>*
  store <4 x i32> %128, <4 x i32>* %131, align 4, !tbaa !7
  br label %132

132:                                              ; preds = %116, %119
  %133 = icmp eq i64 %75, %72
  br i1 %133, label %145, label %134

134:                                              ; preds = %132, %69
  %135 = phi i8* [ %5, %69 ], [ %76, %132 ]
  %136 = phi i32* [ %67, %69 ], [ %77, %132 ]
  br label %137

137:                                              ; preds = %134, %137
  %138 = phi i8* [ %142, %137 ], [ %135, %134 ]
  %139 = phi i32* [ %143, %137 ], [ %136, %134 ]
  %140 = load i8, i8* %138, align 1, !tbaa !3, !noalias !68
  %141 = sext i8 %140 to i32
  store i32 %141, i32* %139, align 4, !tbaa !7
  %142 = getelementptr inbounds i8, i8* %138, i64 1
  %143 = getelementptr inbounds i32, i32* %139, i64 1
  %144 = icmp eq i8* %142, %39
  br i1 %144, label %145, label %137, !llvm.loop !72

145:                                              ; preds = %137, %132, %66
  %146 = phi i32* [ %67, %66 ], [ %77, %132 ], [ %143, %137 ]
  store i32 0, i32* %146, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 20, i8* nonnull %5) #20, !noalias !68
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEj(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i32 %1) local_unnamed_addr #2 {
  %3 = alloca [11 x i8], align 1
  %4 = ptrtoint [11 x i8]* %3 to i64
  %5 = getelementptr inbounds [11 x i8], [11 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 11, i8* nonnull %5) #20, !noalias !73
  %6 = call i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32 %1, i8* nonnull %5) #20, !noalias !73
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, 4611686018427387887
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 5
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !73
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %18, i64 0, i32 1, i64 0
  br label %34

20:                                               ; preds = %12
  %21 = add nuw nsw i64 %8, 4
  %22 = and i64 %21, -4
  %23 = icmp ugt i64 %22, 4611686018427387903
  br i1 %23, label %24, label %25

24:                                               ; preds = %20
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

25:                                               ; preds = %20
  %26 = shl nuw i64 %22, 2
  %27 = call noalias nonnull i8* @_Znwm(i64 %26) #21
  %28 = bitcast i8* %27 to i32*
  %29 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %30 = bitcast i32** %29 to i8**
  store i8* %27, i8** %30, align 8, !tbaa !3, !alias.scope !73
  %31 = or i64 %22, 1
  %32 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %31, i64* %32, align 8, !tbaa !3, !alias.scope !73
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %33, align 8, !tbaa !3, !alias.scope !73
  br label %34

34:                                               ; preds = %25, %14
  %35 = phi i32* [ %19, %14 ], [ %28, %25 ]
  %36 = icmp eq i8* %5, %6
  br i1 %36, label %112, label %37

37:                                               ; preds = %34
  %38 = ptrtoint i8* %6 to i64
  %39 = sub i64 %38, %4
  %40 = icmp ult i64 %39, 8
  br i1 %40, label %101, label %41

41:                                               ; preds = %37
  %42 = and i64 %39, -8
  %43 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %42
  %44 = getelementptr i32, i32* %35, i64 %42
  %45 = add i64 %42, -8
  %46 = lshr exact i64 %45, 3
  %47 = add nuw nsw i64 %46, 1
  %48 = and i64 %47, 1
  %49 = icmp eq i64 %45, 0
  br i1 %49, label %83, label %50

50:                                               ; preds = %41
  %51 = and i64 %47, 4611686018427387902
  br label %52

52:                                               ; preds = %52, %50
  %53 = phi i64 [ 0, %50 ], [ %80, %52 ]
  %54 = phi i64 [ %51, %50 ], [ %81, %52 ]
  %55 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %53
  %56 = getelementptr i32, i32* %35, i64 %53
  %57 = bitcast i8* %55 to <4 x i8>*
  %58 = load <4 x i8>, <4 x i8>* %57, align 1, !tbaa !3, !noalias !73
  %59 = getelementptr i8, i8* %55, i64 4
  %60 = bitcast i8* %59 to <4 x i8>*
  %61 = load <4 x i8>, <4 x i8>* %60, align 1, !tbaa !3, !noalias !73
  %62 = sext <4 x i8> %58 to <4 x i32>
  %63 = sext <4 x i8> %61 to <4 x i32>
  %64 = bitcast i32* %56 to <4 x i32>*
  store <4 x i32> %62, <4 x i32>* %64, align 4, !tbaa !7
  %65 = getelementptr i32, i32* %56, i64 4
  %66 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> %63, <4 x i32>* %66, align 4, !tbaa !7
  %67 = or i64 %53, 8
  %68 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %67
  %69 = getelementptr i32, i32* %35, i64 %67
  %70 = bitcast i8* %68 to <4 x i8>*
  %71 = load <4 x i8>, <4 x i8>* %70, align 1, !tbaa !3, !noalias !73
  %72 = getelementptr i8, i8* %68, i64 4
  %73 = bitcast i8* %72 to <4 x i8>*
  %74 = load <4 x i8>, <4 x i8>* %73, align 1, !tbaa !3, !noalias !73
  %75 = sext <4 x i8> %71 to <4 x i32>
  %76 = sext <4 x i8> %74 to <4 x i32>
  %77 = bitcast i32* %69 to <4 x i32>*
  store <4 x i32> %75, <4 x i32>* %77, align 4, !tbaa !7
  %78 = getelementptr i32, i32* %69, i64 4
  %79 = bitcast i32* %78 to <4 x i32>*
  store <4 x i32> %76, <4 x i32>* %79, align 4, !tbaa !7
  %80 = add i64 %53, 16
  %81 = add i64 %54, -2
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %83, label %52, !llvm.loop !76

83:                                               ; preds = %52, %41
  %84 = phi i64 [ 0, %41 ], [ %80, %52 ]
  %85 = icmp eq i64 %48, 0
  br i1 %85, label %99, label %86

86:                                               ; preds = %83
  %87 = getelementptr [11 x i8], [11 x i8]* %3, i64 0, i64 %84
  %88 = getelementptr i32, i32* %35, i64 %84
  %89 = bitcast i8* %87 to <4 x i8>*
  %90 = load <4 x i8>, <4 x i8>* %89, align 1, !tbaa !3, !noalias !73
  %91 = getelementptr i8, i8* %87, i64 4
  %92 = bitcast i8* %91 to <4 x i8>*
  %93 = load <4 x i8>, <4 x i8>* %92, align 1, !tbaa !3, !noalias !73
  %94 = sext <4 x i8> %90 to <4 x i32>
  %95 = sext <4 x i8> %93 to <4 x i32>
  %96 = bitcast i32* %88 to <4 x i32>*
  store <4 x i32> %94, <4 x i32>* %96, align 4, !tbaa !7
  %97 = getelementptr i32, i32* %88, i64 4
  %98 = bitcast i32* %97 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %83, %86
  %100 = icmp eq i64 %39, %42
  br i1 %100, label %112, label %101

101:                                              ; preds = %99, %37
  %102 = phi i8* [ %5, %37 ], [ %43, %99 ]
  %103 = phi i32* [ %35, %37 ], [ %44, %99 ]
  br label %104

104:                                              ; preds = %101, %104
  %105 = phi i8* [ %109, %104 ], [ %102, %101 ]
  %106 = phi i32* [ %110, %104 ], [ %103, %101 ]
  %107 = load i8, i8* %105, align 1, !tbaa !3, !noalias !73
  %108 = sext i8 %107 to i32
  store i32 %108, i32* %106, align 4, !tbaa !7
  %109 = getelementptr inbounds i8, i8* %105, i64 1
  %110 = getelementptr inbounds i32, i32* %106, i64 1
  %111 = icmp eq i8* %109, %6
  br i1 %111, label %112, label %104, !llvm.loop !77

112:                                              ; preds = %104, %99, %34
  %113 = phi i32* [ %35, %34 ], [ %44, %99 ], [ %110, %104 ]
  store i32 0, i32* %113, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 11, i8* nonnull %5) #20, !noalias !73
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEm(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [21 x i8], align 16
  %4 = ptrtoint [21 x i8]* %3 to i64
  %5 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %5) #20, !noalias !78
  %6 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %1, i8* nonnull %5) #20, !noalias !78
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, 4611686018427387887
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 5
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !78
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %18, i64 0, i32 1, i64 0
  br label %34

20:                                               ; preds = %12
  %21 = add nuw nsw i64 %8, 4
  %22 = and i64 %21, -4
  %23 = icmp ugt i64 %22, 4611686018427387903
  br i1 %23, label %24, label %25

24:                                               ; preds = %20
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

25:                                               ; preds = %20
  %26 = shl nuw i64 %22, 2
  %27 = call noalias nonnull i8* @_Znwm(i64 %26) #21
  %28 = bitcast i8* %27 to i32*
  %29 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %30 = bitcast i32** %29 to i8**
  store i8* %27, i8** %30, align 8, !tbaa !3, !alias.scope !78
  %31 = or i64 %22, 1
  %32 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %31, i64* %32, align 8, !tbaa !3, !alias.scope !78
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %33, align 8, !tbaa !3, !alias.scope !78
  br label %34

34:                                               ; preds = %25, %14
  %35 = phi i32* [ %19, %14 ], [ %28, %25 ]
  %36 = icmp eq i8* %5, %6
  br i1 %36, label %112, label %37

37:                                               ; preds = %34
  %38 = ptrtoint i8* %6 to i64
  %39 = sub i64 %38, %4
  %40 = icmp ult i64 %39, 8
  br i1 %40, label %101, label %41

41:                                               ; preds = %37
  %42 = and i64 %39, -8
  %43 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %42
  %44 = getelementptr i32, i32* %35, i64 %42
  %45 = add i64 %42, -8
  %46 = lshr exact i64 %45, 3
  %47 = add nuw nsw i64 %46, 1
  %48 = and i64 %47, 1
  %49 = icmp eq i64 %45, 0
  br i1 %49, label %83, label %50

50:                                               ; preds = %41
  %51 = and i64 %47, 4611686018427387902
  br label %52

52:                                               ; preds = %52, %50
  %53 = phi i64 [ 0, %50 ], [ %80, %52 ]
  %54 = phi i64 [ %51, %50 ], [ %81, %52 ]
  %55 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %53
  %56 = getelementptr i32, i32* %35, i64 %53
  %57 = bitcast i8* %55 to <4 x i8>*
  %58 = load <4 x i8>, <4 x i8>* %57, align 16, !tbaa !3, !noalias !78
  %59 = getelementptr i8, i8* %55, i64 4
  %60 = bitcast i8* %59 to <4 x i8>*
  %61 = load <4 x i8>, <4 x i8>* %60, align 4, !tbaa !3, !noalias !78
  %62 = sext <4 x i8> %58 to <4 x i32>
  %63 = sext <4 x i8> %61 to <4 x i32>
  %64 = bitcast i32* %56 to <4 x i32>*
  store <4 x i32> %62, <4 x i32>* %64, align 4, !tbaa !7
  %65 = getelementptr i32, i32* %56, i64 4
  %66 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> %63, <4 x i32>* %66, align 4, !tbaa !7
  %67 = or i64 %53, 8
  %68 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %67
  %69 = getelementptr i32, i32* %35, i64 %67
  %70 = bitcast i8* %68 to <4 x i8>*
  %71 = load <4 x i8>, <4 x i8>* %70, align 8, !tbaa !3, !noalias !78
  %72 = getelementptr i8, i8* %68, i64 4
  %73 = bitcast i8* %72 to <4 x i8>*
  %74 = load <4 x i8>, <4 x i8>* %73, align 4, !tbaa !3, !noalias !78
  %75 = sext <4 x i8> %71 to <4 x i32>
  %76 = sext <4 x i8> %74 to <4 x i32>
  %77 = bitcast i32* %69 to <4 x i32>*
  store <4 x i32> %75, <4 x i32>* %77, align 4, !tbaa !7
  %78 = getelementptr i32, i32* %69, i64 4
  %79 = bitcast i32* %78 to <4 x i32>*
  store <4 x i32> %76, <4 x i32>* %79, align 4, !tbaa !7
  %80 = add i64 %53, 16
  %81 = add i64 %54, -2
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %83, label %52, !llvm.loop !81

83:                                               ; preds = %52, %41
  %84 = phi i64 [ 0, %41 ], [ %80, %52 ]
  %85 = icmp eq i64 %48, 0
  br i1 %85, label %99, label %86

86:                                               ; preds = %83
  %87 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %84
  %88 = getelementptr i32, i32* %35, i64 %84
  %89 = bitcast i8* %87 to <4 x i8>*
  %90 = load <4 x i8>, <4 x i8>* %89, align 8, !tbaa !3, !noalias !78
  %91 = getelementptr i8, i8* %87, i64 4
  %92 = bitcast i8* %91 to <4 x i8>*
  %93 = load <4 x i8>, <4 x i8>* %92, align 4, !tbaa !3, !noalias !78
  %94 = sext <4 x i8> %90 to <4 x i32>
  %95 = sext <4 x i8> %93 to <4 x i32>
  %96 = bitcast i32* %88 to <4 x i32>*
  store <4 x i32> %94, <4 x i32>* %96, align 4, !tbaa !7
  %97 = getelementptr i32, i32* %88, i64 4
  %98 = bitcast i32* %97 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %83, %86
  %100 = icmp eq i64 %39, %42
  br i1 %100, label %112, label %101

101:                                              ; preds = %99, %37
  %102 = phi i8* [ %5, %37 ], [ %43, %99 ]
  %103 = phi i32* [ %35, %37 ], [ %44, %99 ]
  br label %104

104:                                              ; preds = %101, %104
  %105 = phi i8* [ %109, %104 ], [ %102, %101 ]
  %106 = phi i32* [ %110, %104 ], [ %103, %101 ]
  %107 = load i8, i8* %105, align 1, !tbaa !3, !noalias !78
  %108 = sext i8 %107 to i32
  store i32 %108, i32* %106, align 4, !tbaa !7
  %109 = getelementptr inbounds i8, i8* %105, i64 1
  %110 = getelementptr inbounds i32, i32* %106, i64 1
  %111 = icmp eq i8* %109, %6
  br i1 %111, label %112, label %104, !llvm.loop !82

112:                                              ; preds = %104, %99, %34
  %113 = phi i32* [ %35, %34 ], [ %44, %99 ], [ %110, %104 ]
  store i32 0, i32* %113, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %5) #20, !noalias !78
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEy(%"class.std::__1::basic_string.3"* noalias sret align 8 %0, i64 %1) local_unnamed_addr #2 {
  %3 = alloca [21 x i8], align 16
  %4 = ptrtoint [21 x i8]* %3 to i64
  %5 = getelementptr inbounds [21 x i8], [21 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 21, i8* nonnull %5) #20, !noalias !83
  %6 = call i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %1, i8* nonnull %5) #20, !noalias !83
  %7 = ptrtoint i8* %6 to i64
  %8 = sub i64 %7, %4
  %9 = icmp ugt i64 %8, 4611686018427387887
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string.3"* %0 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #19
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 5
  br i1 %13, label %14, label %20

14:                                               ; preds = %12
  %15 = trunc i64 %8 to i8
  %16 = shl nuw nsw i8 %15, 1
  %17 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  store i8 %16, i8* %17, align 8, !tbaa !3, !alias.scope !83
  %18 = bitcast %"class.std::__1::basic_string.3"* %0 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %19 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %18, i64 0, i32 1, i64 0
  br label %34

20:                                               ; preds = %12
  %21 = add nuw nsw i64 %8, 4
  %22 = and i64 %21, -4
  %23 = icmp ugt i64 %22, 4611686018427387903
  br i1 %23, label %24, label %25

24:                                               ; preds = %20
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.13, i64 0, i64 0)) #19
  unreachable

25:                                               ; preds = %20
  %26 = shl nuw i64 %22, 2
  %27 = call noalias nonnull i8* @_Znwm(i64 %26) #21
  %28 = bitcast i8* %27 to i32*
  %29 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %30 = bitcast i32** %29 to i8**
  store i8* %27, i8** %30, align 8, !tbaa !3, !alias.scope !83
  %31 = or i64 %22, 1
  %32 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %31, i64* %32, align 8, !tbaa !3, !alias.scope !83
  %33 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %33, align 8, !tbaa !3, !alias.scope !83
  br label %34

34:                                               ; preds = %25, %14
  %35 = phi i32* [ %19, %14 ], [ %28, %25 ]
  %36 = icmp eq i8* %5, %6
  br i1 %36, label %112, label %37

37:                                               ; preds = %34
  %38 = ptrtoint i8* %6 to i64
  %39 = sub i64 %38, %4
  %40 = icmp ult i64 %39, 8
  br i1 %40, label %101, label %41

41:                                               ; preds = %37
  %42 = and i64 %39, -8
  %43 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %42
  %44 = getelementptr i32, i32* %35, i64 %42
  %45 = add i64 %42, -8
  %46 = lshr exact i64 %45, 3
  %47 = add nuw nsw i64 %46, 1
  %48 = and i64 %47, 1
  %49 = icmp eq i64 %45, 0
  br i1 %49, label %83, label %50

50:                                               ; preds = %41
  %51 = and i64 %47, 4611686018427387902
  br label %52

52:                                               ; preds = %52, %50
  %53 = phi i64 [ 0, %50 ], [ %80, %52 ]
  %54 = phi i64 [ %51, %50 ], [ %81, %52 ]
  %55 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %53
  %56 = getelementptr i32, i32* %35, i64 %53
  %57 = bitcast i8* %55 to <4 x i8>*
  %58 = load <4 x i8>, <4 x i8>* %57, align 16, !tbaa !3, !noalias !83
  %59 = getelementptr i8, i8* %55, i64 4
  %60 = bitcast i8* %59 to <4 x i8>*
  %61 = load <4 x i8>, <4 x i8>* %60, align 4, !tbaa !3, !noalias !83
  %62 = sext <4 x i8> %58 to <4 x i32>
  %63 = sext <4 x i8> %61 to <4 x i32>
  %64 = bitcast i32* %56 to <4 x i32>*
  store <4 x i32> %62, <4 x i32>* %64, align 4, !tbaa !7
  %65 = getelementptr i32, i32* %56, i64 4
  %66 = bitcast i32* %65 to <4 x i32>*
  store <4 x i32> %63, <4 x i32>* %66, align 4, !tbaa !7
  %67 = or i64 %53, 8
  %68 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %67
  %69 = getelementptr i32, i32* %35, i64 %67
  %70 = bitcast i8* %68 to <4 x i8>*
  %71 = load <4 x i8>, <4 x i8>* %70, align 8, !tbaa !3, !noalias !83
  %72 = getelementptr i8, i8* %68, i64 4
  %73 = bitcast i8* %72 to <4 x i8>*
  %74 = load <4 x i8>, <4 x i8>* %73, align 4, !tbaa !3, !noalias !83
  %75 = sext <4 x i8> %71 to <4 x i32>
  %76 = sext <4 x i8> %74 to <4 x i32>
  %77 = bitcast i32* %69 to <4 x i32>*
  store <4 x i32> %75, <4 x i32>* %77, align 4, !tbaa !7
  %78 = getelementptr i32, i32* %69, i64 4
  %79 = bitcast i32* %78 to <4 x i32>*
  store <4 x i32> %76, <4 x i32>* %79, align 4, !tbaa !7
  %80 = add i64 %53, 16
  %81 = add i64 %54, -2
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %83, label %52, !llvm.loop !86

83:                                               ; preds = %52, %41
  %84 = phi i64 [ 0, %41 ], [ %80, %52 ]
  %85 = icmp eq i64 %48, 0
  br i1 %85, label %99, label %86

86:                                               ; preds = %83
  %87 = getelementptr [21 x i8], [21 x i8]* %3, i64 0, i64 %84
  %88 = getelementptr i32, i32* %35, i64 %84
  %89 = bitcast i8* %87 to <4 x i8>*
  %90 = load <4 x i8>, <4 x i8>* %89, align 8, !tbaa !3, !noalias !83
  %91 = getelementptr i8, i8* %87, i64 4
  %92 = bitcast i8* %91 to <4 x i8>*
  %93 = load <4 x i8>, <4 x i8>* %92, align 4, !tbaa !3, !noalias !83
  %94 = sext <4 x i8> %90 to <4 x i32>
  %95 = sext <4 x i8> %93 to <4 x i32>
  %96 = bitcast i32* %88 to <4 x i32>*
  store <4 x i32> %94, <4 x i32>* %96, align 4, !tbaa !7
  %97 = getelementptr i32, i32* %88, i64 4
  %98 = bitcast i32* %97 to <4 x i32>*
  store <4 x i32> %95, <4 x i32>* %98, align 4, !tbaa !7
  br label %99

99:                                               ; preds = %83, %86
  %100 = icmp eq i64 %39, %42
  br i1 %100, label %112, label %101

101:                                              ; preds = %99, %37
  %102 = phi i8* [ %5, %37 ], [ %43, %99 ]
  %103 = phi i32* [ %35, %37 ], [ %44, %99 ]
  br label %104

104:                                              ; preds = %101, %104
  %105 = phi i8* [ %109, %104 ], [ %102, %101 ]
  %106 = phi i32* [ %110, %104 ], [ %103, %101 ]
  %107 = load i8, i8* %105, align 1, !tbaa !3, !noalias !83
  %108 = sext i8 %107 to i32
  store i32 %108, i32* %106, align 4, !tbaa !7
  %109 = getelementptr inbounds i8, i8* %105, i64 1
  %110 = getelementptr inbounds i32, i32* %106, i64 1
  %111 = icmp eq i8* %109, %6
  br i1 %111, label %112, label %104, !llvm.loop !87

112:                                              ; preds = %104, %99, %34
  %113 = phi i32* [ %35, %34 ], [ %44, %99 ], [ %110, %104 ]
  store i32 0, i32* %113, align 4, !tbaa !7
  call void @llvm.lifetime.end.p0i8(i64 21, i8* nonnull %5) #20, !noalias !83
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEf(%"class.std::__1::basic_string"* noalias nocapture sret align 8 %0, float %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false) #20, !alias.scope !88
  %5 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 22, i8 signext 0)
          to label %15 unwind label %6

6:                                                ; preds = %2
  %7 = landingpad { i8*, i32 }
          cleanup
  %8 = load i8, i8* %4, align 8, !tbaa !3, !alias.scope !88
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %13 = load i8*, i8** %12, align 8, !tbaa !3, !alias.scope !88
  call void @_ZdlPv(i8* %13) #22
  br label %14

14:                                               ; preds = %11, %6
  resume { i8*, i32 } %7

15:                                               ; preds = %2
  %16 = load i8, i8* %4, align 8, !tbaa !3, !noalias !91
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = lshr i8 %16, 1
  %22 = zext i8 %21 to i64
  %23 = select i1 %18, i64 %22, i64 %20
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %25 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  %27 = fpext float %1 to double
  br label %28

28:                                               ; preds = %90, %15
  %29 = phi i8 [ %16, %15 ], [ %91, %90 ]
  %30 = phi i64 [ %23, %15 ], [ %68, %90 ]
  %31 = and i8 %29, 1
  %32 = icmp eq i8 %31, 0
  %33 = load i8*, i8** %24, align 8
  %34 = select i1 %32, i8* %26, i8* %33
  %35 = add i64 %30, 1
  %36 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* nonnull %34, i64 %35, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0), double %27) #20, !noalias !91
  %37 = icmp sgt i32 %36, -1
  br i1 %37, label %38, label %64

38:                                               ; preds = %28
  %39 = zext i32 %36 to i64
  %40 = icmp ult i64 %30, %39
  br i1 %40, label %67, label %41

41:                                               ; preds = %38
  %42 = zext i32 %36 to i64
  %43 = load i8, i8* %4, align 8, !tbaa !3, !noalias !91
  %44 = and i8 %43, 1
  %45 = icmp eq i8 %44, 0
  br i1 %45, label %46, label %50

46:                                               ; preds = %41
  %47 = lshr i8 %43, 1
  %48 = zext i8 %47 to i64
  %49 = icmp ult i64 %48, %42
  br i1 %49, label %53, label %60

50:                                               ; preds = %41
  %51 = load i64, i64* %19, align 8, !tbaa !3, !noalias !91
  %52 = icmp ult i64 %51, %42
  br i1 %52, label %53, label %57

53:                                               ; preds = %50, %46
  %54 = phi i64 [ %51, %50 ], [ %48, %46 ]
  %55 = sub i64 %42, %54
  %56 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %55, i8 signext 0)
          to label %92 unwind label %96

57:                                               ; preds = %50
  %58 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !91
  %59 = getelementptr inbounds i8, i8* %58, i64 %42
  store i8 0, i8* %59, align 1, !tbaa !3, !noalias !91
  store i64 %42, i64* %19, align 8, !tbaa !3, !noalias !91
  br label %92

60:                                               ; preds = %46
  %61 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %42
  store i8 0, i8* %61, align 1, !tbaa !3, !noalias !91
  %62 = trunc i32 %36 to i8
  %63 = shl i8 %62, 1
  store i8 %63, i8* %4, align 8, !tbaa !3, !noalias !91
  br label %92

64:                                               ; preds = %28
  %65 = shl i64 %30, 1
  %66 = or i64 %65, 1
  br label %67

67:                                               ; preds = %64, %38
  %68 = phi i64 [ %66, %64 ], [ %39, %38 ]
  %69 = load i8, i8* %4, align 8, !tbaa !3, !noalias !91
  %70 = and i8 %69, 1
  %71 = icmp eq i8 %70, 0
  br i1 %71, label %72, label %76

72:                                               ; preds = %67
  %73 = lshr i8 %69, 1
  %74 = zext i8 %73 to i64
  %75 = icmp ugt i64 %68, %74
  br i1 %75, label %79, label %86

76:                                               ; preds = %67
  %77 = load i64, i64* %19, align 8, !tbaa !3, !noalias !91
  %78 = icmp ult i64 %77, %68
  br i1 %78, label %79, label %83

79:                                               ; preds = %76, %72
  %80 = phi i64 [ %77, %76 ], [ %74, %72 ]
  %81 = sub i64 %68, %80
  %82 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %81, i8 signext 0)
          to label %90 unwind label %94

83:                                               ; preds = %76
  %84 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !91
  %85 = getelementptr inbounds i8, i8* %84, i64 %68
  store i8 0, i8* %85, align 1, !tbaa !3, !noalias !91
  store i64 %68, i64* %19, align 8, !tbaa !3, !noalias !91
  br label %90

86:                                               ; preds = %72
  %87 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %68
  store i8 0, i8* %87, align 1, !tbaa !3, !noalias !91
  %88 = trunc i64 %68 to i8
  %89 = shl i8 %88, 1
  store i8 %89, i8* %4, align 8, !tbaa !3, !noalias !91
  br label %90

90:                                               ; preds = %79, %86, %83
  %91 = load i8, i8* %4, align 8, !tbaa !3, !noalias !91
  br label %28

92:                                               ; preds = %53, %57, %60
  %93 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %93, i8* nonnull align 8 dereferenceable(24) %4, i64 24, i1 false) #20
  ret void

94:                                               ; preds = %79
  %95 = landingpad { i8*, i32 }
          cleanup
  br label %98

96:                                               ; preds = %53
  %97 = landingpad { i8*, i32 }
          cleanup
  br label %98

98:                                               ; preds = %96, %94
  %99 = phi { i8*, i32 } [ %95, %94 ], [ %97, %96 ]
  %100 = load i8, i8* %4, align 8, !tbaa !3
  %101 = and i8 %100, 1
  %102 = icmp eq i8 %101, 0
  br i1 %102, label %105, label %103

103:                                              ; preds = %98
  %104 = load i8*, i8** %24, align 8, !tbaa !3
  call void @_ZdlPv(i8* %104) #22
  br label %105

105:                                              ; preds = %98, %103
  resume { i8*, i32 } %99
}

; Function Attrs: nofree nounwind
declare i32 @snprintf(i8* noalias nocapture, i64, i8* nocapture readonly, ...) local_unnamed_addr #8

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEd(%"class.std::__1::basic_string"* noalias nocapture sret align 8 %0, double %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false) #20, !alias.scope !94
  %5 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 22, i8 signext 0)
          to label %15 unwind label %6

6:                                                ; preds = %2
  %7 = landingpad { i8*, i32 }
          cleanup
  %8 = load i8, i8* %4, align 8, !tbaa !3, !alias.scope !94
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %13 = load i8*, i8** %12, align 8, !tbaa !3, !alias.scope !94
  call void @_ZdlPv(i8* %13) #22
  br label %14

14:                                               ; preds = %11, %6
  resume { i8*, i32 } %7

15:                                               ; preds = %2
  %16 = load i8, i8* %4, align 8, !tbaa !3, !noalias !97
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = lshr i8 %16, 1
  %22 = zext i8 %21 to i64
  %23 = select i1 %18, i64 %22, i64 %20
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %25 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  br label %27

27:                                               ; preds = %89, %15
  %28 = phi i8 [ %16, %15 ], [ %90, %89 ]
  %29 = phi i64 [ %23, %15 ], [ %67, %89 ]
  %30 = and i8 %28, 1
  %31 = icmp eq i8 %30, 0
  %32 = load i8*, i8** %24, align 8
  %33 = select i1 %31, i8* %26, i8* %32
  %34 = add i64 %29, 1
  %35 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* nonnull %33, i64 %34, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0), double %1) #20, !noalias !97
  %36 = icmp sgt i32 %35, -1
  br i1 %36, label %37, label %63

37:                                               ; preds = %27
  %38 = zext i32 %35 to i64
  %39 = icmp ult i64 %29, %38
  br i1 %39, label %66, label %40

40:                                               ; preds = %37
  %41 = zext i32 %35 to i64
  %42 = load i8, i8* %4, align 8, !tbaa !3, !noalias !97
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %40
  %46 = lshr i8 %42, 1
  %47 = zext i8 %46 to i64
  %48 = icmp ult i64 %47, %41
  br i1 %48, label %52, label %59

49:                                               ; preds = %40
  %50 = load i64, i64* %19, align 8, !tbaa !3, !noalias !97
  %51 = icmp ult i64 %50, %41
  br i1 %51, label %52, label %56

52:                                               ; preds = %49, %45
  %53 = phi i64 [ %50, %49 ], [ %47, %45 ]
  %54 = sub i64 %41, %53
  %55 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %54, i8 signext 0)
          to label %91 unwind label %95

56:                                               ; preds = %49
  %57 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !97
  %58 = getelementptr inbounds i8, i8* %57, i64 %41
  store i8 0, i8* %58, align 1, !tbaa !3, !noalias !97
  store i64 %41, i64* %19, align 8, !tbaa !3, !noalias !97
  br label %91

59:                                               ; preds = %45
  %60 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %41
  store i8 0, i8* %60, align 1, !tbaa !3, !noalias !97
  %61 = trunc i32 %35 to i8
  %62 = shl i8 %61, 1
  store i8 %62, i8* %4, align 8, !tbaa !3, !noalias !97
  br label %91

63:                                               ; preds = %27
  %64 = shl i64 %29, 1
  %65 = or i64 %64, 1
  br label %66

66:                                               ; preds = %63, %37
  %67 = phi i64 [ %65, %63 ], [ %38, %37 ]
  %68 = load i8, i8* %4, align 8, !tbaa !3, !noalias !97
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  br i1 %70, label %71, label %75

71:                                               ; preds = %66
  %72 = lshr i8 %68, 1
  %73 = zext i8 %72 to i64
  %74 = icmp ugt i64 %67, %73
  br i1 %74, label %78, label %85

75:                                               ; preds = %66
  %76 = load i64, i64* %19, align 8, !tbaa !3, !noalias !97
  %77 = icmp ult i64 %76, %67
  br i1 %77, label %78, label %82

78:                                               ; preds = %75, %71
  %79 = phi i64 [ %76, %75 ], [ %73, %71 ]
  %80 = sub i64 %67, %79
  %81 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %80, i8 signext 0)
          to label %89 unwind label %93

82:                                               ; preds = %75
  %83 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !97
  %84 = getelementptr inbounds i8, i8* %83, i64 %67
  store i8 0, i8* %84, align 1, !tbaa !3, !noalias !97
  store i64 %67, i64* %19, align 8, !tbaa !3, !noalias !97
  br label %89

85:                                               ; preds = %71
  %86 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %67
  store i8 0, i8* %86, align 1, !tbaa !3, !noalias !97
  %87 = trunc i64 %67 to i8
  %88 = shl i8 %87, 1
  store i8 %88, i8* %4, align 8, !tbaa !3, !noalias !97
  br label %89

89:                                               ; preds = %78, %85, %82
  %90 = load i8, i8* %4, align 8, !tbaa !3, !noalias !97
  br label %27

91:                                               ; preds = %52, %56, %59
  %92 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %92, i8* nonnull align 8 dereferenceable(24) %4, i64 24, i1 false) #20
  ret void

93:                                               ; preds = %78
  %94 = landingpad { i8*, i32 }
          cleanup
  br label %97

95:                                               ; preds = %52
  %96 = landingpad { i8*, i32 }
          cleanup
  br label %97

97:                                               ; preds = %95, %93
  %98 = phi { i8*, i32 } [ %94, %93 ], [ %96, %95 ]
  %99 = load i8, i8* %4, align 8, !tbaa !3
  %100 = and i8 %99, 1
  %101 = icmp eq i8 %100, 0
  br i1 %101, label %104, label %102

102:                                              ; preds = %97
  %103 = load i8*, i8** %24, align 8, !tbaa !3
  call void @_ZdlPv(i8* %103) #22
  br label %104

104:                                              ; preds = %97, %102
  resume { i8*, i32 } %98
}

; Function Attrs: uwtable
define void @_ZNSt3__19to_stringEe(%"class.std::__1::basic_string"* noalias nocapture sret align 8 %0, x86_fp80 %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false) #20, !alias.scope !100
  %5 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 22, i8 signext 0)
          to label %15 unwind label %6

6:                                                ; preds = %2
  %7 = landingpad { i8*, i32 }
          cleanup
  %8 = load i8, i8* %4, align 8, !tbaa !3, !alias.scope !100
  %9 = and i8 %8, 1
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %14, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %13 = load i8*, i8** %12, align 8, !tbaa !3, !alias.scope !100
  call void @_ZdlPv(i8* %13) #22
  br label %14

14:                                               ; preds = %11, %6
  resume { i8*, i32 } %7

15:                                               ; preds = %2
  %16 = load i8, i8* %4, align 8, !tbaa !3, !noalias !103
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  %19 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %20 = load i64, i64* %19, align 8
  %21 = lshr i8 %16, 1
  %22 = zext i8 %21 to i64
  %23 = select i1 %18, i64 %22, i64 %20
  %24 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %25 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  br label %27

27:                                               ; preds = %89, %15
  %28 = phi i8 [ %16, %15 ], [ %90, %89 ]
  %29 = phi i64 [ %23, %15 ], [ %67, %89 ]
  %30 = and i8 %28, 1
  %31 = icmp eq i8 %30, 0
  %32 = load i8*, i8** %24, align 8
  %33 = select i1 %31, i8* %26, i8* %32
  %34 = add i64 %29, 1
  %35 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* nonnull %33, i64 %34, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i64 0, i64 0), x86_fp80 %1) #20, !noalias !103
  %36 = icmp sgt i32 %35, -1
  br i1 %36, label %37, label %63

37:                                               ; preds = %27
  %38 = zext i32 %35 to i64
  %39 = icmp ult i64 %29, %38
  br i1 %39, label %66, label %40

40:                                               ; preds = %37
  %41 = zext i32 %35 to i64
  %42 = load i8, i8* %4, align 8, !tbaa !3, !noalias !103
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %45, label %49

45:                                               ; preds = %40
  %46 = lshr i8 %42, 1
  %47 = zext i8 %46 to i64
  %48 = icmp ult i64 %47, %41
  br i1 %48, label %52, label %59

49:                                               ; preds = %40
  %50 = load i64, i64* %19, align 8, !tbaa !3, !noalias !103
  %51 = icmp ult i64 %50, %41
  br i1 %51, label %52, label %56

52:                                               ; preds = %49, %45
  %53 = phi i64 [ %50, %49 ], [ %47, %45 ]
  %54 = sub i64 %41, %53
  %55 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %54, i8 signext 0)
          to label %91 unwind label %95

56:                                               ; preds = %49
  %57 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !103
  %58 = getelementptr inbounds i8, i8* %57, i64 %41
  store i8 0, i8* %58, align 1, !tbaa !3, !noalias !103
  store i64 %41, i64* %19, align 8, !tbaa !3, !noalias !103
  br label %91

59:                                               ; preds = %45
  %60 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %41
  store i8 0, i8* %60, align 1, !tbaa !3, !noalias !103
  %61 = trunc i32 %35 to i8
  %62 = shl i8 %61, 1
  store i8 %62, i8* %4, align 8, !tbaa !3, !noalias !103
  br label %91

63:                                               ; preds = %27
  %64 = shl i64 %29, 1
  %65 = or i64 %64, 1
  br label %66

66:                                               ; preds = %63, %37
  %67 = phi i64 [ %65, %63 ], [ %38, %37 ]
  %68 = load i8, i8* %4, align 8, !tbaa !3, !noalias !103
  %69 = and i8 %68, 1
  %70 = icmp eq i8 %69, 0
  br i1 %70, label %71, label %75

71:                                               ; preds = %66
  %72 = lshr i8 %68, 1
  %73 = zext i8 %72 to i64
  %74 = icmp ugt i64 %67, %73
  br i1 %74, label %78, label %85

75:                                               ; preds = %66
  %76 = load i64, i64* %19, align 8, !tbaa !3, !noalias !103
  %77 = icmp ult i64 %76, %67
  br i1 %77, label %78, label %82

78:                                               ; preds = %75, %71
  %79 = phi i64 [ %76, %75 ], [ %73, %71 ]
  %80 = sub i64 %67, %79
  %81 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEmc(%"class.std::__1::basic_string"* nonnull %3, i64 %80, i8 signext 0)
          to label %89 unwind label %93

82:                                               ; preds = %75
  %83 = load i8*, i8** %24, align 8, !tbaa !3, !noalias !103
  %84 = getelementptr inbounds i8, i8* %83, i64 %67
  store i8 0, i8* %84, align 1, !tbaa !3, !noalias !103
  store i64 %67, i64* %19, align 8, !tbaa !3, !noalias !103
  br label %89

85:                                               ; preds = %71
  %86 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 %67
  store i8 0, i8* %86, align 1, !tbaa !3, !noalias !103
  %87 = trunc i64 %67 to i8
  %88 = shl i8 %87, 1
  store i8 %88, i8* %4, align 8, !tbaa !3, !noalias !103
  br label %89

89:                                               ; preds = %78, %85, %82
  %90 = load i8, i8* %4, align 8, !tbaa !3, !noalias !103
  br label %27

91:                                               ; preds = %52, %56, %59
  %92 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %92, i8* nonnull align 8 dereferenceable(24) %4, i64 24, i1 false) #20
  ret void

93:                                               ; preds = %78
  %94 = landingpad { i8*, i32 }
          cleanup
  br label %97

95:                                               ; preds = %52
  %96 = landingpad { i8*, i32 }
          cleanup
  br label %97

97:                                               ; preds = %95, %93
  %98 = phi { i8*, i32 } [ %94, %93 ], [ %96, %95 ]
  %99 = load i8, i8* %4, align 8, !tbaa !3
  %100 = and i8 %99, 1
  %101 = icmp eq i8 %100, 0
  br i1 %101, label %104, label %102

102:                                              ; preds = %97
  %103 = load i8*, i8** %24, align 8, !tbaa !3
  call void @_ZdlPv(i8* %103) #22
  br label %104

104:                                              ; preds = %97, %102
  resume { i8*, i32 } %98
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEf(%"class.std::__1::basic_string.3"* noalias nocapture sret align 8 %0, float %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string.3", align 16
  %4 = tail call noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #21, !noalias !106
  %5 = bitcast i8* %4 to i32*
  %6 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %7 = bitcast i32** %6 to i8**
  store i8* %4, i8** %7, align 16, !tbaa !3, !alias.scope !106
  %8 = bitcast %"class.std::__1::basic_string.3"* %3 to <2 x i64>*
  store <2 x i64> <i64 25, i64 20>, <2 x i64>* %8, align 16, !tbaa !3, !alias.scope !106
  %9 = tail call i32* @wmemset(i32* nonnull %5, i32 signext 0, i64 20) #20, !noalias !106
  %10 = getelementptr inbounds i8, i8* %4, i64 80
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11, align 4, !tbaa !7, !noalias !106
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 23, i32 signext 0)
          to label %21 unwind label %12

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %15 = load i8, i8* %14, align 16, !tbaa !3, !alias.scope !106
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = load i8*, i8** %7, align 16, !tbaa !3, !alias.scope !106
  call void @_ZdlPv(i8* %19) #22
  br label %20

20:                                               ; preds = %18, %12
  resume { i8*, i32 } %13

21:                                               ; preds = %2
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %23 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %24 = load i8, i8* %23, align 16, !tbaa !3, !noalias !109
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  %27 = load i64, i64* %22, align 8
  %28 = lshr i8 %24, 1
  %29 = zext i8 %28 to i64
  %30 = select i1 %26, i64 %29, i64 %27
  %31 = bitcast %"class.std::__1::basic_string.3"* %3 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %32 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %31, i64 0, i32 1, i64 0
  %33 = fpext float %1 to double
  br label %34

34:                                               ; preds = %52, %21
  %35 = phi i8 [ %24, %21 ], [ %53, %52 ]
  %36 = phi i64 [ %30, %21 ], [ %51, %52 ]
  %37 = and i8 %35, 1
  %38 = icmp eq i8 %37, 0
  %39 = load i32*, i32** %6, align 16
  %40 = select i1 %38, i32* %32, i32* %39
  %41 = add i64 %36, 1
  %42 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* nonnull %40, i64 %41, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.11, i64 0, i64 0), double %33), !noalias !109
  %43 = icmp sgt i32 %42, -1
  br i1 %43, label %44, label %47

44:                                               ; preds = %34
  %45 = zext i32 %42 to i64
  %46 = icmp ult i64 %36, %45
  br i1 %46, label %50, label %54

47:                                               ; preds = %34
  %48 = shl i64 %36, 1
  %49 = or i64 %48, 1
  br label %50

50:                                               ; preds = %47, %44
  %51 = phi i64 [ %49, %47 ], [ %45, %44 ]
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %51, i32 signext 0)
          to label %52 unwind label %58

52:                                               ; preds = %50
  %53 = load i8, i8* %23, align 16, !tbaa !3, !noalias !109
  br label %34

54:                                               ; preds = %44
  %55 = zext i32 %42 to i64
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %55, i32 signext 0)
          to label %56 unwind label %60

56:                                               ; preds = %54
  %57 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %57, i8* nonnull align 16 dereferenceable(24) %23, i64 24, i1 false) #20
  ret void

58:                                               ; preds = %50
  %59 = landingpad { i8*, i32 }
          cleanup
  br label %62

60:                                               ; preds = %54
  %61 = landingpad { i8*, i32 }
          cleanup
  br label %62

62:                                               ; preds = %60, %58
  %63 = phi { i8*, i32 } [ %59, %58 ], [ %61, %60 ]
  %64 = load i8, i8* %23, align 16, !tbaa !3
  %65 = and i8 %64, 1
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %69, label %67

67:                                               ; preds = %62
  %68 = load i8*, i8** %7, align 16, !tbaa !3
  call void @_ZdlPv(i8* %68) #22
  br label %69

69:                                               ; preds = %62, %67
  resume { i8*, i32 } %63
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEd(%"class.std::__1::basic_string.3"* noalias nocapture sret align 8 %0, double %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string.3", align 16
  %4 = tail call noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #21, !noalias !112
  %5 = bitcast i8* %4 to i32*
  %6 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %7 = bitcast i32** %6 to i8**
  store i8* %4, i8** %7, align 16, !tbaa !3, !alias.scope !112
  %8 = bitcast %"class.std::__1::basic_string.3"* %3 to <2 x i64>*
  store <2 x i64> <i64 25, i64 20>, <2 x i64>* %8, align 16, !tbaa !3, !alias.scope !112
  %9 = tail call i32* @wmemset(i32* nonnull %5, i32 signext 0, i64 20) #20, !noalias !112
  %10 = getelementptr inbounds i8, i8* %4, i64 80
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11, align 4, !tbaa !7, !noalias !112
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 23, i32 signext 0)
          to label %21 unwind label %12

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %15 = load i8, i8* %14, align 16, !tbaa !3, !alias.scope !112
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = load i8*, i8** %7, align 16, !tbaa !3, !alias.scope !112
  call void @_ZdlPv(i8* %19) #22
  br label %20

20:                                               ; preds = %18, %12
  resume { i8*, i32 } %13

21:                                               ; preds = %2
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %23 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %24 = load i8, i8* %23, align 16, !tbaa !3, !noalias !115
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  %27 = load i64, i64* %22, align 8
  %28 = lshr i8 %24, 1
  %29 = zext i8 %28 to i64
  %30 = select i1 %26, i64 %29, i64 %27
  %31 = bitcast %"class.std::__1::basic_string.3"* %3 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %32 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %31, i64 0, i32 1, i64 0
  br label %33

33:                                               ; preds = %51, %21
  %34 = phi i8 [ %24, %21 ], [ %52, %51 ]
  %35 = phi i64 [ %30, %21 ], [ %50, %51 ]
  %36 = and i8 %34, 1
  %37 = icmp eq i8 %36, 0
  %38 = load i32*, i32** %6, align 16
  %39 = select i1 %37, i32* %32, i32* %38
  %40 = add i64 %35, 1
  %41 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* nonnull %39, i64 %40, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str.11, i64 0, i64 0), double %1), !noalias !115
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %43, label %46

43:                                               ; preds = %33
  %44 = zext i32 %41 to i64
  %45 = icmp ult i64 %35, %44
  br i1 %45, label %49, label %53

46:                                               ; preds = %33
  %47 = shl i64 %35, 1
  %48 = or i64 %47, 1
  br label %49

49:                                               ; preds = %46, %43
  %50 = phi i64 [ %48, %46 ], [ %44, %43 ]
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %50, i32 signext 0)
          to label %51 unwind label %57

51:                                               ; preds = %49
  %52 = load i8, i8* %23, align 16, !tbaa !3, !noalias !115
  br label %33

53:                                               ; preds = %43
  %54 = zext i32 %41 to i64
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %54, i32 signext 0)
          to label %55 unwind label %59

55:                                               ; preds = %53
  %56 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %56, i8* nonnull align 16 dereferenceable(24) %23, i64 24, i1 false) #20
  ret void

57:                                               ; preds = %49
  %58 = landingpad { i8*, i32 }
          cleanup
  br label %61

59:                                               ; preds = %53
  %60 = landingpad { i8*, i32 }
          cleanup
  br label %61

61:                                               ; preds = %59, %57
  %62 = phi { i8*, i32 } [ %58, %57 ], [ %60, %59 ]
  %63 = load i8, i8* %23, align 16, !tbaa !3
  %64 = and i8 %63, 1
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %68, label %66

66:                                               ; preds = %61
  %67 = load i8*, i8** %7, align 16, !tbaa !3
  call void @_ZdlPv(i8* %67) #22
  br label %68

68:                                               ; preds = %61, %66
  resume { i8*, i32 } %62
}

; Function Attrs: uwtable
define void @_ZNSt3__110to_wstringEe(%"class.std::__1::basic_string.3"* noalias nocapture sret align 8 %0, x86_fp80 %1) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string.3", align 16
  %4 = tail call noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #21, !noalias !118
  %5 = bitcast i8* %4 to i32*
  %6 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %7 = bitcast i32** %6 to i8**
  store i8* %4, i8** %7, align 16, !tbaa !3, !alias.scope !118
  %8 = bitcast %"class.std::__1::basic_string.3"* %3 to <2 x i64>*
  store <2 x i64> <i64 25, i64 20>, <2 x i64>* %8, align 16, !tbaa !3, !alias.scope !118
  %9 = tail call i32* @wmemset(i32* nonnull %5, i32 signext 0, i64 20) #20, !noalias !118
  %10 = getelementptr inbounds i8, i8* %4, i64 80
  %11 = bitcast i8* %10 to i32*
  store i32 0, i32* %11, align 4, !tbaa !7, !noalias !118
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 23, i32 signext 0)
          to label %21 unwind label %12

12:                                               ; preds = %2
  %13 = landingpad { i8*, i32 }
          cleanup
  %14 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %15 = load i8, i8* %14, align 16, !tbaa !3, !alias.scope !118
  %16 = and i8 %15, 1
  %17 = icmp eq i8 %16, 0
  br i1 %17, label %20, label %18

18:                                               ; preds = %12
  %19 = load i8*, i8** %7, align 16, !tbaa !3, !alias.scope !118
  call void @_ZdlPv(i8* %19) #22
  br label %20

20:                                               ; preds = %18, %12
  resume { i8*, i32 } %13

21:                                               ; preds = %2
  %22 = getelementptr inbounds %"class.std::__1::basic_string.3", %"class.std::__1::basic_string.3"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %23 = bitcast %"class.std::__1::basic_string.3"* %3 to i8*
  %24 = load i8, i8* %23, align 16, !tbaa !3, !noalias !121
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  %27 = load i64, i64* %22, align 8
  %28 = lshr i8 %24, 1
  %29 = zext i8 %28 to i64
  %30 = select i1 %26, i64 %29, i64 %27
  %31 = bitcast %"class.std::__1::basic_string.3"* %3 to %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"*
  %32 = getelementptr inbounds %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short", %"struct.std::__1::basic_string<wchar_t, std::__1::char_traits<wchar_t>, std::__1::allocator<wchar_t>>::__short"* %31, i64 0, i32 1, i64 0
  br label %33

33:                                               ; preds = %51, %21
  %34 = phi i8 [ %24, %21 ], [ %52, %51 ]
  %35 = phi i64 [ %30, %21 ], [ %50, %51 ]
  %36 = and i8 %34, 1
  %37 = icmp eq i8 %36, 0
  %38 = load i32*, i32** %6, align 16
  %39 = select i1 %37, i32* %32, i32* %38
  %40 = add i64 %35, 1
  %41 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* nonnull %39, i64 %40, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @.str.12, i64 0, i64 0), x86_fp80 %1), !noalias !121
  %42 = icmp sgt i32 %41, -1
  br i1 %42, label %43, label %46

43:                                               ; preds = %33
  %44 = zext i32 %41 to i64
  %45 = icmp ult i64 %35, %44
  br i1 %45, label %49, label %53

46:                                               ; preds = %33
  %47 = shl i64 %35, 1
  %48 = or i64 %47, 1
  br label %49

49:                                               ; preds = %46, %43
  %50 = phi i64 [ %48, %46 ], [ %44, %43 ]
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %50, i32 signext 0)
          to label %51 unwind label %57

51:                                               ; preds = %49
  %52 = load i8, i8* %23, align 16, !tbaa !3, !noalias !121
  br label %33

53:                                               ; preds = %43
  %54 = zext i32 %41 to i64
  invoke void @_ZNSt3__112basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEE6resizeEmw(%"class.std::__1::basic_string.3"* nonnull %3, i64 %54, i32 signext 0)
          to label %55 unwind label %59

55:                                               ; preds = %53
  %56 = bitcast %"class.std::__1::basic_string.3"* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %56, i8* nonnull align 16 dereferenceable(24) %23, i64 24, i1 false) #20
  ret void

57:                                               ; preds = %49
  %58 = landingpad { i8*, i32 }
          cleanup
  br label %61

59:                                               ; preds = %53
  %60 = landingpad { i8*, i32 }
          cleanup
  br label %61

61:                                               ; preds = %59, %57
  %62 = phi { i8*, i32 } [ %58, %57 ], [ %60, %59 ]
  %63 = load i8, i8* %23, align 16, !tbaa !3
  %64 = and i8 %63, 1
  %65 = icmp eq i8 %64, 0
  br i1 %65, label %68, label %66

66:                                               ; preds = %61
  %67 = load i8*, i8** %7, align 16, !tbaa !3
  call void @_ZdlPv(i8* %67) #22
  br label %68

68:                                               ; preds = %61, %66
  resume { i8*, i32 } %62
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %0, i8* %1) unnamed_addr #2 comdat align 2 {
  %3 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !13
  ret void
}

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD1Ev(%"class.std::length_error"*) unnamed_addr #9

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"*, i8*) unnamed_addr #10

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12out_of_rangeC2EPKc(%"class.std::out_of_range"* %0, i8* %1) unnamed_addr #2 comdat align 2 {
  %3 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !13
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt12out_of_rangeD1Ev(%"class.std::out_of_range"*) unnamed_addr #9

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #11

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #12

; Function Attrs: nofree nounwind readonly
declare i8* @memchr(i8*, i32, i64) local_unnamed_addr #13

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #14

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nofree nounwind readonly
declare i32 @memcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #13

; Function Attrs: nounwind
declare i32* @wmemmove(i32*, i32*, i64) local_unnamed_addr #9

; Function Attrs: nounwind
declare i32* @wmemcpy(i32*, i32*, i64) local_unnamed_addr #9

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @wcslen(i32* nocapture) local_unnamed_addr #12

; Function Attrs: nounwind
declare i32* @wmemchr(i32*, i32 signext, i64) local_unnamed_addr #9

; Function Attrs: nounwind
declare i32* @wmemset(i32*, i32 signext, i64) local_unnamed_addr #9

; Function Attrs: nounwind
declare i32 @wmemcmp(i32*, i32*, i64) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare i64 @strtol(i8* readonly, i8** nocapture, i32) local_unnamed_addr #8

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #16

; Function Attrs: inlinehint uwtable
define linkonce_odr hidden void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EERKS9_PKS6_(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, i8* %2) local_unnamed_addr #5 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %4, i8 0, i64 24, i1 false) #20
  %5 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  br i1 %8, label %15, label %9

9:                                                ; preds = %3
  %10 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %11 = load i64, i64* %10, align 8, !tbaa !3
  %12 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %2) #20
  %13 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  br label %21

15:                                               ; preds = %3
  %16 = lshr i8 %6, 1
  %17 = zext i8 %16 to i64
  %18 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %2) #20
  %19 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %20 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %19, i64 0, i32 1, i64 0
  br label %21

21:                                               ; preds = %9, %15
  %22 = phi i64 [ %12, %9 ], [ %18, %15 ]
  %23 = phi i64 [ %11, %9 ], [ %17, %15 ]
  %24 = phi i8* [ %14, %9 ], [ %20, %15 ]
  %25 = add i64 %23, %22
  %26 = icmp ugt i64 %25, -17
  br i1 %26, label %27, label %30

27:                                               ; preds = %21
  %28 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  invoke void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %28) #19
          to label %29 unwind label %53

29:                                               ; preds = %27
  unreachable

30:                                               ; preds = %21
  %31 = icmp ult i64 %25, 23
  br i1 %31, label %32, label %37

32:                                               ; preds = %30
  %33 = trunc i64 %23 to i8
  %34 = shl i8 %33, 1
  store i8 %34, i8* %4, align 8, !tbaa !3
  %35 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %36 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %35, i64 0, i32 1, i64 0
  br label %46

37:                                               ; preds = %30
  %38 = add nuw i64 %25, 16
  %39 = and i64 %38, -16
  %40 = invoke noalias nonnull i8* @_Znwm(i64 %39) #21
          to label %41 unwind label %53

41:                                               ; preds = %37
  %42 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %40, i8** %42, align 8, !tbaa !3
  %43 = or i64 %39, 1
  %44 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %43, i64* %44, align 8, !tbaa !3
  %45 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %23, i64* %45, align 8, !tbaa !3
  br label %46

46:                                               ; preds = %41, %32
  %47 = phi i8* [ %36, %32 ], [ %40, %41 ]
  %48 = icmp eq i64 %23, 0
  br i1 %48, label %50, label %49

49:                                               ; preds = %46
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %47, i8* align 1 %24, i64 %23, i1 false) #20
  br label %50

50:                                               ; preds = %49, %46
  %51 = getelementptr inbounds i8, i8* %47, i64 %23
  store i8 0, i8* %51, align 1, !tbaa !3
  %52 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %0, i8* %2, i64 %22)
          to label %62 unwind label %53

53:                                               ; preds = %37, %27, %50
  %54 = landingpad { i8*, i32 }
          cleanup
  %55 = load i8, i8* %4, align 8, !tbaa !3
  %56 = and i8 %55, 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %61, label %58

58:                                               ; preds = %53
  %59 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !3
  tail call void @_ZdlPv(i8* %60) #22
  br label %61

61:                                               ; preds = %53, %58
  resume { i8*, i32 } %54

62:                                               ; preds = %50
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt16invalid_argumentD1Ev(%"class.std::invalid_argument"*) unnamed_addr #9

declare void @_ZNSt11logic_errorC2ERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE(%"class.std::logic_error"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #10

; Function Attrs: nounwind
declare i64 @wcstol(i32*, i32**, i32) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare i64 @strtoul(i8* readonly, i8** nocapture, i32) local_unnamed_addr #8

; Function Attrs: nounwind
declare i64 @wcstoul(i32*, i32**, i32) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare i64 @strtoll(i8* readonly, i8** nocapture, i32) local_unnamed_addr #8

; Function Attrs: nounwind
declare i64 @wcstoll(i32*, i32**, i32) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare i64 @strtoull(i8* readonly, i8** nocapture, i32) local_unnamed_addr #8

; Function Attrs: nounwind
declare i64 @wcstoull(i32*, i32**, i32) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare float @strtof(i8* readonly, i8** nocapture) local_unnamed_addr #8

; Function Attrs: nounwind
declare float @wcstof(i32*, i32**) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare double @strtod(i8* readonly, i8** nocapture) local_unnamed_addr #8

; Function Attrs: nounwind
declare double @wcstod(i32*, i32**) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare x86_fp80 @strtold(i8* readonly, i8** nocapture) local_unnamed_addr #8

; Function Attrs: nounwind
declare x86_fp80 @wcstold(i32*, i32**) local_unnamed_addr #9

; Function Attrs: nounwind
declare i32 @swprintf(i32*, i64, i32*, ...) local_unnamed_addr #9

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #17

; Function Attrs: nounwind
declare i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32, i8*) local_unnamed_addr #9

; Function Attrs: nounwind readnone speculatable willreturn
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #17

; Function Attrs: nounwind
declare i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64, i8*) local_unnamed_addr #9

; Function Attrs: nofree nounwind readonly
declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #18

attributes #0 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { argmemonly nounwind willreturn writeonly }
attributes #16 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { nounwind readnone speculatable willreturn }
attributes #18 = { nofree nounwind readonly }
attributes #19 = { noreturn }
attributes #20 = { nounwind }
attributes #21 = { builtin allocsize(0) }
attributes #22 = { builtin nounwind }
attributes #23 = { noreturn nounwind }
attributes #24 = { nounwind readnone }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{i64 0, i64 24, !3}
!7 = !{!8, !8, i64 0}
!8 = !{!"wchar_t", !4, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !4, i64 0}
!13 = !{!14, !14, i64 0}
!14 = !{!"vtable pointer", !5, i64 0}
!15 = !{!16, !16, i64 0}
!16 = !{!"long", !4, i64 0}
!17 = !{!18}
!18 = distinct !{!18, !19, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEiEET_T0_: argument 0"}
!19 = distinct !{!19, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEiEET_T0_"}
!20 = !{i32 0, i32 32}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.isvectorized", i32 1}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
!25 = distinct !{!25, !26, !22}
!26 = !{!"llvm.loop.unroll.runtime.disable"}
!27 = !{!28}
!28 = distinct !{!28, !29, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEElEET_T0_: argument 0"}
!29 = distinct !{!29, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEElEET_T0_"}
!30 = !{i64 0, i64 64}
!31 = distinct !{!31, !22}
!32 = distinct !{!32, !24}
!33 = distinct !{!33, !26, !22}
!34 = !{!35}
!35 = distinct !{!35, !36, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEExEET_T0_: argument 0"}
!36 = distinct !{!36, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEExEET_T0_"}
!37 = distinct !{!37, !22}
!38 = distinct !{!38, !24}
!39 = distinct !{!39, !26, !22}
!40 = !{!41}
!41 = distinct !{!41, !42, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEjEET_T0_: argument 0"}
!42 = distinct !{!42, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEjEET_T0_"}
!43 = distinct !{!43, !22}
!44 = distinct !{!44, !24}
!45 = distinct !{!45, !26, !22}
!46 = !{!47}
!47 = distinct !{!47, !48, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEmEET_T0_: argument 0"}
!48 = distinct !{!48, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEmEET_T0_"}
!49 = distinct !{!49, !22}
!50 = distinct !{!50, !24}
!51 = distinct !{!51, !26, !22}
!52 = !{!53}
!53 = distinct !{!53, !54, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEyEET_T0_: argument 0"}
!54 = distinct !{!54, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEyEET_T0_"}
!55 = distinct !{!55, !22}
!56 = distinct !{!56, !24}
!57 = distinct !{!57, !26, !22}
!58 = !{!59}
!59 = distinct !{!59, !60, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEiEET_T0_: argument 0"}
!60 = distinct !{!60, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEiEET_T0_"}
!61 = distinct !{!61, !22}
!62 = distinct !{!62, !26, !22}
!63 = !{!64}
!64 = distinct !{!64, !65, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEElEET_T0_: argument 0"}
!65 = distinct !{!65, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEElEET_T0_"}
!66 = distinct !{!66, !22}
!67 = distinct !{!67, !26, !22}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEExEET_T0_: argument 0"}
!70 = distinct !{!70, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEExEET_T0_"}
!71 = distinct !{!71, !22}
!72 = distinct !{!72, !26, !22}
!73 = !{!74}
!74 = distinct !{!74, !75, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEjEET_T0_: argument 0"}
!75 = distinct !{!75, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEjEET_T0_"}
!76 = distinct !{!76, !22}
!77 = distinct !{!77, !26, !22}
!78 = !{!79}
!79 = distinct !{!79, !80, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEmEET_T0_: argument 0"}
!80 = distinct !{!80, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEmEET_T0_"}
!81 = distinct !{!81, !22}
!82 = distinct !{!82, !26, !22}
!83 = !{!84}
!84 = distinct !{!84, !85, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEyEET_T0_: argument 0"}
!85 = distinct !{!85, !"_ZNSt3__112_GLOBAL__N_111i_to_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEyEET_T0_"}
!86 = distinct !{!86, !22}
!87 = distinct !{!87, !26, !22}
!88 = !{!89}
!89 = distinct !{!89, !90, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv: argument 0"}
!90 = distinct !{!90, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv"}
!91 = !{!92}
!92 = distinct !{!92, !93, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEfEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!93 = distinct !{!93, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEfEET_T0_SD_PKNSD_10value_typeET1_"}
!94 = !{!95}
!95 = distinct !{!95, !96, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv: argument 0"}
!96 = distinct !{!96, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv"}
!97 = !{!98}
!98 = distinct !{!98, !99, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEdEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!99 = distinct !{!99, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEdEET_T0_SD_PKNSD_10value_typeET1_"}
!100 = !{!101}
!101 = distinct !{!101, !102, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv: argument 0"}
!102 = distinct !{!102, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEclEv"}
!103 = !{!104}
!104 = distinct !{!104, !105, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEeEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!105 = distinct !{!105, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEPDoFiPcmPKczEeEET_T0_SD_PKNSD_10value_typeET1_"}
!106 = !{!107}
!107 = distinct !{!107, !108, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv: argument 0"}
!108 = distinct !{!108, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv"}
!109 = !{!110}
!110 = distinct !{!110, !111, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEfEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!111 = distinct !{!111, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEfEET_T0_SD_PKNSD_10value_typeET1_"}
!112 = !{!113}
!113 = distinct !{!113, !114, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv: argument 0"}
!114 = distinct !{!114, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv"}
!115 = !{!116}
!116 = distinct !{!116, !117, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEdEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!117 = distinct !{!117, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEdEET_T0_SD_PKNSD_10value_typeET1_"}
!118 = !{!119}
!119 = distinct !{!119, !120, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv: argument 0"}
!120 = distinct !{!120, !"_ZNKSt3__112_GLOBAL__N_114initial_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEEclEv"}
!121 = !{!122}
!122 = distinct !{!122, !123, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEeEET_T0_SD_PKNSD_10value_typeET1_: argument 0"}
!123 = distinct !{!123, !"_ZNSt3__112_GLOBAL__N_19as_stringINS_12basic_stringIwNS_11char_traitsIwEENS_9allocatorIwEEEEPFiPwmPKwzEeEET_T0_SD_PKNSD_10value_typeET1_"}

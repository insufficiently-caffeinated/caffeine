; ModuleID = 'll/.iostream.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/iostream.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::ios_base::Init" = type { i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.__mbstate_t = type { i32, %union.anon }
%union.anon = type { i32 }
%"class.std::__1::DoIOSInit" = type { i8 }
%"class.std::__1::locale::id" = type <{ %"struct.std::__1::once_flag", i32, [4 x i8] }>
%"struct.std::__1::once_flag" = type { i64 }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"class.std::__1::basic_streambuf" = type { i32 (...)**, %"class.std::__1::locale", i8*, i8*, i8*, i8*, i8*, i8* }
%"class.std::__1::__stdinbuf" = type <{ %"class.std::__1::basic_streambuf", %struct._IO_FILE*, %"class.std::__1::codecvt"*, %struct.__mbstate_t*, i32, i32, i8, i8, [6 x i8] }>
%"class.std::__1::codecvt" = type { %"class.std::__1::locale::facet" }
%"class.std::__1::locale::facet" = type { %"class.std::__1::__shared_count" }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32, [4 x i8] }>
%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::basic_streambuf.7" = type { i32 (...)**, %"class.std::__1::locale", i32*, i32*, i32*, i32*, i32*, i32* }
%"class.std::__1::__stdinbuf.6" = type <{ %"class.std::__1::basic_streambuf.7", %struct._IO_FILE*, %"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32, i32, i8, i8, [6 x i8] }>
%"class.std::__1::codecvt.8" = type { %"class.std::__1::locale::facet", %struct.__locale_struct* }
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::__1::basic_ios.1" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream.2"*, i32, [4 x i8] }>
%"class.std::__1::basic_ostream.2" = type { i32 (...)**, %"class.std::__1::basic_ios.base.3" }
%"class.std::__1::basic_ios.base.3" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream.2"*, i32 }>
%"class.std::__1::__stdoutbuf" = type <{ %"class.std::__1::basic_streambuf", %struct._IO_FILE*, %"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8, [7 x i8] }>
%"class.std::__1::__stdoutbuf.10" = type <{ %"class.std::__1::basic_streambuf.7", %struct._IO_FILE*, %"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8, [7 x i8] }>

$__clang_call_terminate = comdat any

$_ZNSt3__110__stdinbufIcED0Ev = comdat any

$_ZNSt3__110__stdinbufIcE5imbueERKNS_6localeE = comdat any

$_ZNSt3__110__stdinbufIcE9underflowEv = comdat any

$_ZNSt3__110__stdinbufIcE5uflowEv = comdat any

$_ZNSt3__110__stdinbufIcE9pbackfailEi = comdat any

$_ZNSt3__110__stdinbufIcE9__getcharEb = comdat any

$_ZNSt3__110__stdinbufIwED0Ev = comdat any

$_ZNSt3__110__stdinbufIwE5imbueERKNS_6localeE = comdat any

$_ZNSt3__110__stdinbufIwE9underflowEv = comdat any

$_ZNSt3__110__stdinbufIwE5uflowEv = comdat any

$_ZNSt3__110__stdinbufIwE9pbackfailEj = comdat any

$_ZNSt3__110__stdinbufIwE9__getcharEb = comdat any

$_ZNSt3__111__stdoutbufIcED0Ev = comdat any

$_ZNSt3__111__stdoutbufIcE5imbueERKNS_6localeE = comdat any

$_ZNSt3__111__stdoutbufIcE4syncEv = comdat any

$_ZNSt3__111__stdoutbufIcE6xsputnEPKcl = comdat any

$_ZNSt3__111__stdoutbufIcE8overflowEi = comdat any

$_ZNSt3__111__stdoutbufIwED0Ev = comdat any

$_ZNSt3__111__stdoutbufIwE5imbueERKNS_6localeE = comdat any

$_ZNSt3__111__stdoutbufIwE4syncEv = comdat any

$_ZNSt3__111__stdoutbufIwE6xsputnEPKwl = comdat any

$_ZNSt3__111__stdoutbufIwE8overflowEj = comdat any

$_ZTVNSt3__110__stdinbufIcEE = comdat any

$_ZTSNSt3__110__stdinbufIcEE = comdat any

$_ZTINSt3__110__stdinbufIcEE = comdat any

$_ZTVNSt3__110__stdinbufIwEE = comdat any

$_ZTSNSt3__110__stdinbufIwEE = comdat any

$_ZTINSt3__110__stdinbufIwEE = comdat any

$_ZTVNSt3__111__stdoutbufIcEE = comdat any

$_ZTSNSt3__111__stdoutbufIcEE = comdat any

$_ZTINSt3__111__stdoutbufIcEE = comdat any

$_ZTVNSt3__111__stdoutbufIwEE = comdat any

$_ZTSNSt3__111__stdoutbufIwEE = comdat any

$_ZTINSt3__111__stdoutbufIwEE = comdat any

@_ZNSt3__13cinE = global [168 x i8] zeroinitializer, align 8
@_ZNSt3__14wcinE = global [168 x i8] zeroinitializer, align 8
@_ZNSt3__14coutE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__15wcoutE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__14cerrE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__15wcerrE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__14clogE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__15wclogE = global [160 x i8] zeroinitializer, align 8
@_ZNSt3__119__start_std_streamsE = hidden local_unnamed_addr global %"class.std::__1::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
@_ZNSt3__1L5__cinE = internal global [104 x i8] zeroinitializer, align 8
@stdin = external local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZNSt3__1L6mb_cinE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZNSt3__1L6__wcinE = internal global [104 x i8] zeroinitializer, align 8
@_ZNSt3__1L7mb_wcinE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZNSt3__1L6__coutE = internal global [96 x i8] zeroinitializer, align 8
@stdout = external local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZNSt3__1L7mb_coutE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZNSt3__1L7__wcoutE = internal global [96 x i8] zeroinitializer, align 8
@_ZNSt3__1L8mb_wcoutE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZNSt3__1L6__cerrE = internal global [96 x i8] zeroinitializer, align 8
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@_ZNSt3__1L7mb_cerrE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZNSt3__1L7__wcerrE = internal global [96 x i8] zeroinitializer, align 8
@_ZNSt3__1L8mb_wcerrE = internal global %struct.__mbstate_t zeroinitializer, align 4
@_ZZNSt3__18ios_base4InitC1EvE16init_the_streams = internal global %"class.std::__1::DoIOSInit" zeroinitializer, align 1
@_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams = internal global i64 0, align 8
@_ZTVNSt3__110__stdinbufIcEE = linkonce_odr hidden unnamed_addr constant { [16 x i8*] } { [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110__stdinbufIcEE to i8*), i8* bitcast (void (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdinbuf"*)* @_ZNSt3__110__stdinbufIcED0Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)* @_ZNSt3__110__stdinbufIcE5imbueERKNS_6localeE to i8*), i8* bitcast (%"class.std::__1::basic_streambuf"* (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4syncEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf"*)* @_ZNSt3__110__stdinbufIcE9underflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf"*)* @_ZNSt3__110__stdinbufIcE5uflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf"*, i32)* @_ZNSt3__110__stdinbufIcE9pbackfailEi to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*, i32)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE8overflowEi to i8*)] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__110__stdinbufIcEE = linkonce_odr hidden constant [24 x i8] c"NSt3__110__stdinbufIcEE\00", comdat, align 1
@_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE = external constant i8*
@_ZTINSt3__110__stdinbufIcEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @_ZTSNSt3__110__stdinbufIcEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE to i8*) }, comdat, align 8
@.str = private unnamed_addr constant [38 x i8] c"unsupported locale for standard input\00", align 1
@_ZNSt3__17codecvtIcc11__mbstate_tE2idE = external global %"class.std::__1::locale::id", align 8
@_ZTVNSt3__113basic_istreamIcNS_11char_traitsIcEEEE = external unnamed_addr constant { [5 x i8*], [5 x i8*] }, align 8
@_ZTVNSt3__110__stdinbufIwEE = linkonce_odr hidden unnamed_addr constant { [16 x i8*] } { [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110__stdinbufIwEE to i8*), i8* bitcast (void (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdinbuf.6"*)* @_ZNSt3__110__stdinbufIwED0Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)* @_ZNSt3__110__stdinbufIwE5imbueERKNS_6localeE to i8*), i8* bitcast (%"class.std::__1::basic_streambuf.7"* (%"class.std::__1::basic_streambuf.7"*, i32*, i64)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6setbufEPwl to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekoffExNS_8ios_base7seekdirEj to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekposENS_4fposI11__mbstate_tEEj to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE4syncEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9showmanycEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf.7"*, i32*, i64)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6xsgetnEPwl to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf.6"*)* @_ZNSt3__110__stdinbufIwE9underflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf.6"*)* @_ZNSt3__110__stdinbufIwE5uflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::__stdinbuf.6"*, i32)* @_ZNSt3__110__stdinbufIwE9pbackfailEj to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf.7"*, i32*, i64)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6xsputnEPKwl to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf.7"*, i32)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE8overflowEj to i8*)] }, comdat, align 8
@_ZTSNSt3__110__stdinbufIwEE = linkonce_odr hidden constant [24 x i8] c"NSt3__110__stdinbufIwEE\00", comdat, align 1
@_ZTINSt3__115basic_streambufIwNS_11char_traitsIwEEEE = external constant i8*
@_ZTINSt3__110__stdinbufIwEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @_ZTSNSt3__110__stdinbufIwEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__115basic_streambufIwNS_11char_traitsIwEEEE to i8*) }, comdat, align 8
@_ZNSt3__17codecvtIwc11__mbstate_tE2idE = external global %"class.std::__1::locale::id", align 8
@_ZTVNSt3__113basic_istreamIwNS_11char_traitsIwEEEE = external unnamed_addr constant { [5 x i8*], [5 x i8*] }, align 8
@_ZTVNSt3__111__stdoutbufIcEE = linkonce_odr hidden unnamed_addr constant { [16 x i8*] } { [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__111__stdoutbufIcEE to i8*), i8* bitcast (void (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdoutbuf"*)* @_ZNSt3__111__stdoutbufIcED0Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdoutbuf"*, %"class.std::__1::locale"*)* @_ZNSt3__111__stdoutbufIcE5imbueERKNS_6localeE to i8*), i8* bitcast (%"class.std::__1::basic_streambuf"* (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj to i8*), i8* bitcast (i32 (%"class.std::__1::__stdoutbuf"*)* @_ZNSt3__111__stdoutbufIcE4syncEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9underflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*, i32)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9pbackfailEi to i8*), i8* bitcast (i64 (%"class.std::__1::__stdoutbuf"*, i8*, i64)* @_ZNSt3__111__stdoutbufIcE6xsputnEPKcl to i8*), i8* bitcast (i32 (%"class.std::__1::__stdoutbuf"*, i32)* @_ZNSt3__111__stdoutbufIcE8overflowEi to i8*)] }, comdat, align 8
@_ZTSNSt3__111__stdoutbufIcEE = linkonce_odr hidden constant [25 x i8] c"NSt3__111__stdoutbufIcEE\00", comdat, align 1
@_ZTINSt3__111__stdoutbufIcEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSNSt3__111__stdoutbufIcEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE to i8*) }, comdat, align 8
@_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE = external unnamed_addr constant { [5 x i8*], [5 x i8*] }, align 8
@_ZTVNSt3__111__stdoutbufIwEE = linkonce_odr hidden unnamed_addr constant { [16 x i8*] } { [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__111__stdoutbufIwEE to i8*), i8* bitcast (void (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdoutbuf.10"*)* @_ZNSt3__111__stdoutbufIwED0Ev to i8*), i8* bitcast (void (%"class.std::__1::__stdoutbuf.10"*, %"class.std::__1::locale"*)* @_ZNSt3__111__stdoutbufIwE5imbueERKNS_6localeE to i8*), i8* bitcast (%"class.std::__1::basic_streambuf.7"* (%"class.std::__1::basic_streambuf.7"*, i32*, i64)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6setbufEPwl to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekoffExNS_8ios_base7seekdirEj to i8*), i8* bitcast (void ()* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekposENS_4fposI11__mbstate_tEEj to i8*), i8* bitcast (i32 (%"class.std::__1::__stdoutbuf.10"*)* @_ZNSt3__111__stdoutbufIwE4syncEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9showmanycEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf.7"*, i32*, i64)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6xsgetnEPwl to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9underflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf.7"*)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE5uflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf.7"*, i32)* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9pbackfailEj to i8*), i8* bitcast (i64 (%"class.std::__1::__stdoutbuf.10"*, i32*, i64)* @_ZNSt3__111__stdoutbufIwE6xsputnEPKwl to i8*), i8* bitcast (i32 (%"class.std::__1::__stdoutbuf.10"*, i32)* @_ZNSt3__111__stdoutbufIwE8overflowEj to i8*)] }, comdat, align 8
@_ZTSNSt3__111__stdoutbufIwEE = linkonce_odr hidden constant [25 x i8] c"NSt3__111__stdoutbufIwEE\00", comdat, align 1
@_ZTINSt3__111__stdoutbufIwEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSNSt3__111__stdoutbufIwEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__115basic_streambufIwNS_11char_traitsIwEEEE to i8*) }, comdat, align 8
@_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE = external unnamed_addr constant { [5 x i8*], [5 x i8*] }, align 8
@llvm.global_ctors = appending global [2 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 101, void ()* @_GLOBAL__I_000101, i8* null }, { i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_iostream.cpp, i8* null }]

@_ZNSt3__19DoIOSInitC1Ev = hidden unnamed_addr alias void (%"class.std::__1::DoIOSInit"*), void (%"class.std::__1::DoIOSInit"*)* @_ZNSt3__19DoIOSInitC2Ev
@_ZNSt3__19DoIOSInitD1Ev = hidden unnamed_addr alias void (%"class.std::__1::DoIOSInit"*), void (%"class.std::__1::DoIOSInit"*)* @_ZNSt3__19DoIOSInitD2Ev
@_ZNSt3__18ios_base4InitC1Ev = unnamed_addr alias void (%"class.std::__1::ios_base::Init"*), void (%"class.std::__1::ios_base::Init"*)* @_ZNSt3__18ios_base4InitC2Ev
@_ZNSt3__18ios_base4InitD1Ev = unnamed_addr alias void (%"class.std::__1::ios_base::Init"*), void (%"class.std::__1::ios_base::Init"*)* @_ZNSt3__18ios_base4InitD2Ev

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) local_unnamed_addr #0

; Function Attrs: uwtable
define hidden void @_ZNSt3__19DoIOSInitC2Ev(%"class.std::__1::DoIOSInit"* nocapture readnone %0) unnamed_addr #1 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = alloca %"class.std::__1::locale", align 8
  %3 = alloca %"class.std::__1::locale", align 8
  %4 = alloca %"class.std::__1::locale", align 8
  %5 = alloca %"class.std::__1::locale", align 8
  %6 = alloca %"class.std::__1::locale", align 8
  %7 = alloca %"class.std::__1::locale", align 8
  %8 = load i64, i64* bitcast (%struct._IO_FILE** @stdin to i64*), align 8, !tbaa !3
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* bitcast ([104 x i8]* @_ZNSt3__1L5__cinE to %"class.std::__1::basic_streambuf"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__110__stdinbufIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([104 x i8]* @_ZNSt3__1L5__cinE to i32 (...)***), align 8, !tbaa !7
  store i64 %8, i64* bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 64) to i64*), align 8, !tbaa !9
  store %struct.__mbstate_t* @_ZNSt3__1L6mb_cinE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !13
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 92) to i32*), align 4, !tbaa !14
  store i8 0, i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 96), align 8, !tbaa !15
  %9 = bitcast %"class.std::__1::locale"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %7, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %10 = load void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)**, void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)*** bitcast ([104 x i8]* @_ZNSt3__1L5__cinE to void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)***), align 8, !tbaa !7
  %11 = getelementptr inbounds void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)*, void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)** %10, i64 2
  %12 = load void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)*, void (%"class.std::__1::__stdinbuf"*, %"class.std::__1::locale"*)** %11, align 8
  invoke void %12(%"class.std::__1::__stdinbuf"* bitcast ([104 x i8]* @_ZNSt3__1L5__cinE to %"class.std::__1::__stdinbuf"*), %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %7)
          to label %15 unwind label %13

13:                                               ; preds = %1
  %14 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #12
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* bitcast ([104 x i8]* @_ZNSt3__1L5__cinE to %"class.std::__1::basic_streambuf"*)) #12
  resume { i8*, i32 } %14

15:                                               ; preds = %1
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %7) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #12
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_istreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([168 x i8]* @_ZNSt3__13cinE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_istreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 16) to i32 (...)***), align 8, !tbaa !7
  store i64 0, i64* bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 8) to i64*), align 8, !tbaa !16
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 16) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L5__cinE, i64 0, i64 0))
          to label %18 unwind label %16

16:                                               ; preds = %15
  %17 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 16) to %"class.std::__1::basic_ios"*)) #12
  resume { i8*, i32 } %17

18:                                               ; preds = %15
  store %"class.std::__1::basic_ostream"* null, %"class.std::__1::basic_ostream"** bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 152) to %"class.std::__1::basic_ostream"**), align 8, !tbaa !19
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 160) to i32*), align 8, !tbaa !21
  %19 = load i64, i64* bitcast (%struct._IO_FILE** @stdin to i64*), align 8, !tbaa !3
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEEC2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([104 x i8]* @_ZNSt3__1L6__wcinE to %"class.std::__1::basic_streambuf.7"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__110__stdinbufIwEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([104 x i8]* @_ZNSt3__1L6__wcinE to i32 (...)***), align 8, !tbaa !7
  store i64 %19, i64* bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 64) to i64*), align 8, !tbaa !22
  store %struct.__mbstate_t* @_ZNSt3__1L7mb_wcinE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !24
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 92) to i32*), align 4, !tbaa !25
  store i8 0, i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 96), align 8, !tbaa !26
  %20 = bitcast %"class.std::__1::locale"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %6, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %21 = load void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)**, void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)*** bitcast ([104 x i8]* @_ZNSt3__1L6__wcinE to void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)***), align 8, !tbaa !7
  %22 = getelementptr inbounds void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)*, void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)** %21, i64 2
  %23 = load void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)*, void (%"class.std::__1::__stdinbuf.6"*, %"class.std::__1::locale"*)** %22, align 8
  invoke void %23(%"class.std::__1::__stdinbuf.6"* bitcast ([104 x i8]* @_ZNSt3__1L6__wcinE to %"class.std::__1::__stdinbuf.6"*), %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %6)
          to label %26 unwind label %24

24:                                               ; preds = %18
  %25 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %6) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([104 x i8]* @_ZNSt3__1L6__wcinE to %"class.std::__1::basic_streambuf.7"*)) #12
  resume { i8*, i32 } %25

26:                                               ; preds = %18
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %6) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_istreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([168 x i8]* @_ZNSt3__14wcinE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_istreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 16) to i32 (...)***), align 8, !tbaa !7
  store i64 0, i64* bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 8) to i64*), align 8, !tbaa !27
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 16) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([104 x i8], [104 x i8]* @_ZNSt3__1L6__wcinE, i64 0, i64 0))
          to label %29 unwind label %27

27:                                               ; preds = %26
  %28 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_ios.1"* nonnull bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 16) to %"class.std::__1::basic_ios.1"*)) #12
  resume { i8*, i32 } %28

29:                                               ; preds = %26
  store %"class.std::__1::basic_ostream.2"* null, %"class.std::__1::basic_ostream.2"** bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 152) to %"class.std::__1::basic_ostream.2"**), align 8, !tbaa !29
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 160) to i32*), align 8, !tbaa !31
  %30 = load i64, i64* bitcast (%struct._IO_FILE** @stdout to i64*), align 8, !tbaa !3
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* bitcast ([96 x i8]* @_ZNSt3__1L6__coutE to %"class.std::__1::basic_streambuf"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__111__stdoutbufIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([96 x i8]* @_ZNSt3__1L6__coutE to i32 (...)***), align 8, !tbaa !7
  store i64 %30, i64* bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 64) to i64*), align 8, !tbaa !32
  %31 = bitcast %"class.std::__1::locale"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %31) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %5, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %32 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %5, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
          to label %35 unwind label %33

33:                                               ; preds = %29
  %34 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %31) #12
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* bitcast ([96 x i8]* @_ZNSt3__1L6__coutE to %"class.std::__1::basic_streambuf"*)) #12
  resume { i8*, i32 } %34

35:                                               ; preds = %29
  %36 = bitcast %"class.std::__1::locale::facet"* %32 to %"class.std::__1::codecvt"*
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %31) #12
  store %"class.std::__1::locale::facet"* %32, %"class.std::__1::locale::facet"** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 72) to %"class.std::__1::locale::facet"**), align 8, !tbaa !34
  store %struct.__mbstate_t* @_ZNSt3__1L7mb_coutE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !35
  %37 = bitcast %"class.std::__1::locale::facet"* %32 to i1 (%"class.std::__1::codecvt"*)***
  %38 = load i1 (%"class.std::__1::codecvt"*)**, i1 (%"class.std::__1::codecvt"*)*** %37, align 8, !tbaa !7
  %39 = getelementptr inbounds i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %38, i64 7
  %40 = load i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %39, align 8
  %41 = call zeroext i1 %40(%"class.std::__1::codecvt"* %36) #12
  %42 = zext i1 %41 to i8
  store i8 %42, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 88), align 8, !tbaa !36
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__14coutE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14coutE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14coutE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__coutE, i64 0, i64 0))
          to label %45 unwind label %43

43:                                               ; preds = %35
  %44 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14coutE, i64 0, i64 8) to %"class.std::__1::basic_ios"*)) #12
  resume { i8*, i32 } %44

45:                                               ; preds = %35
  store %"class.std::__1::basic_ostream"* null, %"class.std::__1::basic_ostream"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14coutE, i64 0, i64 144) to %"class.std::__1::basic_ostream"**), align 8, !tbaa !19
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14coutE, i64 0, i64 152) to i32*), align 8, !tbaa !21
  %46 = load i64, i64* bitcast (%struct._IO_FILE** @stdout to i64*), align 8, !tbaa !3
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEEC2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([96 x i8]* @_ZNSt3__1L7__wcoutE to %"class.std::__1::basic_streambuf.7"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__111__stdoutbufIwEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([96 x i8]* @_ZNSt3__1L7__wcoutE to i32 (...)***), align 8, !tbaa !7
  store i64 %46, i64* bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 64) to i64*), align 8, !tbaa !37
  %47 = bitcast %"class.std::__1::locale"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %4, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %48 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %4, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIwc11__mbstate_tE2idE)
          to label %51 unwind label %49

49:                                               ; preds = %45
  %50 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %4) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #12
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([96 x i8]* @_ZNSt3__1L7__wcoutE to %"class.std::__1::basic_streambuf.7"*)) #12
  resume { i8*, i32 } %50

51:                                               ; preds = %45
  %52 = bitcast %"class.std::__1::locale::facet"* %48 to %"class.std::__1::codecvt.8"*
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %4) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #12
  store %"class.std::__1::locale::facet"* %48, %"class.std::__1::locale::facet"** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 72) to %"class.std::__1::locale::facet"**), align 8, !tbaa !39
  store %struct.__mbstate_t* @_ZNSt3__1L8mb_wcoutE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !40
  %53 = bitcast %"class.std::__1::locale::facet"* %48 to i1 (%"class.std::__1::codecvt.8"*)***
  %54 = load i1 (%"class.std::__1::codecvt.8"*)**, i1 (%"class.std::__1::codecvt.8"*)*** %53, align 8, !tbaa !7
  %55 = getelementptr inbounds i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %54, i64 7
  %56 = load i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %55, align 8
  %57 = call zeroext i1 %56(%"class.std::__1::codecvt.8"* %52) #12
  %58 = zext i1 %57 to i8
  store i8 %58, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 88), align 8, !tbaa !41
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__15wcoutE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcoutE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcoutE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcoutE, i64 0, i64 0))
          to label %61 unwind label %59

59:                                               ; preds = %51
  %60 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_ios.1"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcoutE, i64 0, i64 8) to %"class.std::__1::basic_ios.1"*)) #12
  resume { i8*, i32 } %60

61:                                               ; preds = %51
  store %"class.std::__1::basic_ostream.2"* null, %"class.std::__1::basic_ostream.2"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcoutE, i64 0, i64 144) to %"class.std::__1::basic_ostream.2"**), align 8, !tbaa !29
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcoutE, i64 0, i64 152) to i32*), align 8, !tbaa !31
  %62 = load i64, i64* bitcast (%struct._IO_FILE** @stderr to i64*), align 8, !tbaa !3
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* bitcast ([96 x i8]* @_ZNSt3__1L6__cerrE to %"class.std::__1::basic_streambuf"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__111__stdoutbufIcEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([96 x i8]* @_ZNSt3__1L6__cerrE to i32 (...)***), align 8, !tbaa !7
  store i64 %62, i64* bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 64) to i64*), align 8, !tbaa !32
  %63 = bitcast %"class.std::__1::locale"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %63) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %3, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %64 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %3, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
          to label %67 unwind label %65

65:                                               ; preds = %61
  %66 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %3) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %63) #12
  call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* bitcast ([96 x i8]* @_ZNSt3__1L6__cerrE to %"class.std::__1::basic_streambuf"*)) #12
  resume { i8*, i32 } %66

67:                                               ; preds = %61
  %68 = bitcast %"class.std::__1::locale::facet"* %64 to %"class.std::__1::codecvt"*
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %3) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %63) #12
  store %"class.std::__1::locale::facet"* %64, %"class.std::__1::locale::facet"** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 72) to %"class.std::__1::locale::facet"**), align 8, !tbaa !34
  store %struct.__mbstate_t* @_ZNSt3__1L7mb_cerrE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !35
  %69 = bitcast %"class.std::__1::locale::facet"* %64 to i1 (%"class.std::__1::codecvt"*)***
  %70 = load i1 (%"class.std::__1::codecvt"*)**, i1 (%"class.std::__1::codecvt"*)*** %69, align 8, !tbaa !7
  %71 = getelementptr inbounds i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %70, i64 7
  %72 = load i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %71, align 8
  %73 = call zeroext i1 %72(%"class.std::__1::codecvt"* %68) #12
  %74 = zext i1 %73 to i8
  store i8 %74, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 88), align 8, !tbaa !36
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__14cerrE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L6__cerrE, i64 0, i64 0))
          to label %77 unwind label %75

75:                                               ; preds = %67
  %76 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 8) to %"class.std::__1::basic_ios"*)) #12
  resume { i8*, i32 } %76

77:                                               ; preds = %67
  store %"class.std::__1::basic_ostream"* null, %"class.std::__1::basic_ostream"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 144) to %"class.std::__1::basic_ostream"**), align 8, !tbaa !19
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 152) to i32*), align 8, !tbaa !21
  %78 = load i8*, i8** bitcast ([160 x i8]* @_ZNSt3__14cerrE to i8**), align 8, !tbaa !7
  %79 = getelementptr i8, i8* %78, i64 -24
  %80 = bitcast i8* %79 to i64*
  %81 = load i64, i64* %80, align 8
  %82 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 %81
  %83 = getelementptr inbounds i8, i8* %82, i64 40
  %84 = bitcast i8* %83 to i8**
  %85 = load i8*, i8** %84, align 8, !tbaa !42
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__14clogE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIcNS_11char_traitsIcEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14clogE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14clogE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* %85)
          to label %88 unwind label %86

86:                                               ; preds = %77
  %87 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14clogE, i64 0, i64 8) to %"class.std::__1::basic_ios"*)) #12
  resume { i8*, i32 } %87

88:                                               ; preds = %77
  store %"class.std::__1::basic_ostream"* null, %"class.std::__1::basic_ostream"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14clogE, i64 0, i64 144) to %"class.std::__1::basic_ostream"**), align 8, !tbaa !19
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__14clogE, i64 0, i64 152) to i32*), align 8, !tbaa !21
  %89 = load i64, i64* bitcast (%struct._IO_FILE** @stderr to i64*), align 8, !tbaa !3
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEEC2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([96 x i8]* @_ZNSt3__1L7__wcerrE to %"class.std::__1::basic_streambuf.7"*))
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__111__stdoutbufIwEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** bitcast ([96 x i8]* @_ZNSt3__1L7__wcerrE to i32 (...)***), align 8, !tbaa !7
  store i64 %89, i64* bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 64) to i64*), align 8, !tbaa !37
  %90 = bitcast %"class.std::__1::locale"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %90) #12
  call void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"* nonnull %2, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 8) to %"class.std::__1::locale"*)) #12
  %91 = invoke %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %2, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIwc11__mbstate_tE2idE)
          to label %94 unwind label %92

92:                                               ; preds = %88
  %93 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %2) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %90) #12
  call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"* bitcast ([96 x i8]* @_ZNSt3__1L7__wcerrE to %"class.std::__1::basic_streambuf.7"*)) #12
  resume { i8*, i32 } %93

94:                                               ; preds = %88
  %95 = bitcast %"class.std::__1::locale::facet"* %91 to %"class.std::__1::codecvt.8"*
  call void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"* nonnull %2) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %90) #12
  store %"class.std::__1::locale::facet"* %91, %"class.std::__1::locale::facet"** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 72) to %"class.std::__1::locale::facet"**), align 8, !tbaa !39
  store %struct.__mbstate_t* @_ZNSt3__1L8mb_wcerrE, %struct.__mbstate_t** bitcast (i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 80) to %struct.__mbstate_t**), align 8, !tbaa !40
  %96 = bitcast %"class.std::__1::locale::facet"* %91 to i1 (%"class.std::__1::codecvt.8"*)***
  %97 = load i1 (%"class.std::__1::codecvt.8"*)**, i1 (%"class.std::__1::codecvt.8"*)*** %96, align 8, !tbaa !7
  %98 = getelementptr inbounds i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %97, i64 7
  %99 = load i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %98, align 8
  %100 = call zeroext i1 %99(%"class.std::__1::codecvt.8"* %95) #12
  %101 = zext i1 %100 to i8
  store i8 %101, i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 88), align 8, !tbaa !41
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__15wcerrE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* getelementptr inbounds ([96 x i8], [96 x i8]* @_ZNSt3__1L7__wcerrE, i64 0, i64 0))
          to label %104 unwind label %102

102:                                              ; preds = %94
  %103 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_ios.1"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 8) to %"class.std::__1::basic_ios.1"*)) #12
  resume { i8*, i32 } %103

104:                                              ; preds = %94
  store %"class.std::__1::basic_ostream.2"* null, %"class.std::__1::basic_ostream.2"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 144) to %"class.std::__1::basic_ostream.2"**), align 8, !tbaa !29
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 152) to i32*), align 8, !tbaa !31
  %105 = load i8*, i8** bitcast ([160 x i8]* @_ZNSt3__15wcerrE to i8**), align 8, !tbaa !7
  %106 = getelementptr i8, i8* %105, i64 -24
  %107 = bitcast i8* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 %108
  %110 = getelementptr inbounds i8, i8* %109, i64 40
  %111 = bitcast i8* %110 to i8**
  %112 = load i8*, i8** %111, align 8, !tbaa !42
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 0, i64 3) to i32 (...)**), i32 (...)*** bitcast ([160 x i8]* @_ZNSt3__15wclogE to i32 (...)***), align 8, !tbaa !7
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__113basic_ostreamIwNS_11char_traitsIwEEEE, i64 0, inrange i32 1, i64 3) to i32 (...)**), i32 (...)*** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wclogE, i64 0, i64 8) to i32 (...)***), align 8, !tbaa !7
  invoke void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wclogE, i64 0, i64 8) to %"class.std::__1::ios_base"*), i8* %112)
          to label %115 unwind label %113

113:                                              ; preds = %104
  %114 = landingpad { i8*, i32 }
          cleanup
  call void @_ZNSt3__19basic_iosIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_ios.1"* nonnull bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wclogE, i64 0, i64 8) to %"class.std::__1::basic_ios.1"*)) #12
  resume { i8*, i32 } %114

115:                                              ; preds = %104
  store %"class.std::__1::basic_ostream.2"* null, %"class.std::__1::basic_ostream.2"** bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wclogE, i64 0, i64 144) to %"class.std::__1::basic_ostream.2"**), align 8, !tbaa !29
  store i32 -1, i32* bitcast (i8* getelementptr inbounds ([160 x i8], [160 x i8]* @_ZNSt3__15wclogE, i64 0, i64 152) to i32*), align 8, !tbaa !31
  %116 = load i8*, i8** bitcast ([168 x i8]* @_ZNSt3__13cinE to i8**), align 8, !tbaa !7
  %117 = getelementptr i8, i8* %116, i64 -24
  %118 = bitcast i8* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [168 x i8], [168 x i8]* @_ZNSt3__13cinE, i64 0, i64 %119
  %121 = getelementptr inbounds i8, i8* %120, i64 136
  %122 = bitcast i8* %121 to %"class.std::__1::basic_ostream"**
  store %"class.std::__1::basic_ostream"* bitcast ([160 x i8]* @_ZNSt3__14coutE to %"class.std::__1::basic_ostream"*), %"class.std::__1::basic_ostream"** %122, align 8, !tbaa !19
  %123 = load i8*, i8** bitcast ([168 x i8]* @_ZNSt3__14wcinE to i8**), align 8, !tbaa !7
  %124 = getelementptr i8, i8* %123, i64 -24
  %125 = bitcast i8* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [168 x i8], [168 x i8]* @_ZNSt3__14wcinE, i64 0, i64 %126
  %128 = getelementptr inbounds i8, i8* %127, i64 136
  %129 = bitcast i8* %128 to %"class.std::__1::basic_ostream.2"**
  store %"class.std::__1::basic_ostream.2"* bitcast ([160 x i8]* @_ZNSt3__15wcoutE to %"class.std::__1::basic_ostream.2"*), %"class.std::__1::basic_ostream.2"** %129, align 8, !tbaa !29
  %130 = load i8*, i8** bitcast ([160 x i8]* @_ZNSt3__14cerrE to i8**), align 8, !tbaa !7
  %131 = getelementptr i8, i8* %130, i64 -24
  %132 = bitcast i8* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 %133
  %135 = getelementptr inbounds i8, i8* %134, i64 8
  %136 = bitcast i8* %135 to i32*
  %137 = load i32, i32* %136, align 8, !tbaa !44
  %138 = or i32 %137, 8192
  store i32 %138, i32* %136, align 8, !tbaa !44
  %139 = load i8*, i8** bitcast ([160 x i8]* @_ZNSt3__15wcerrE to i8**), align 8, !tbaa !7
  %140 = getelementptr i8, i8* %139, i64 -24
  %141 = bitcast i8* %140 to i64*
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 %142
  %144 = getelementptr inbounds i8, i8* %143, i64 8
  %145 = bitcast i8* %144 to i32*
  %146 = load i32, i32* %145, align 8, !tbaa !44
  %147 = or i32 %146, 8192
  store i32 %147, i32* %145, align 8, !tbaa !44
  %148 = load i64, i64* %132, align 8
  %149 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__14cerrE, i64 0, i64 %148
  %150 = getelementptr inbounds i8, i8* %149, i64 136
  %151 = bitcast i8* %150 to %"class.std::__1::basic_ostream"**
  store %"class.std::__1::basic_ostream"* bitcast ([160 x i8]* @_ZNSt3__14coutE to %"class.std::__1::basic_ostream"*), %"class.std::__1::basic_ostream"** %151, align 8, !tbaa !19
  %152 = load i64, i64* %141, align 8
  %153 = getelementptr inbounds [160 x i8], [160 x i8]* @_ZNSt3__15wcerrE, i64 0, i64 %152
  %154 = getelementptr inbounds i8, i8* %153, i64 136
  %155 = bitcast i8* %154 to %"class.std::__1::basic_ostream.2"**
  store %"class.std::__1::basic_ostream.2"* bitcast ([160 x i8]* @_ZNSt3__15wcoutE to %"class.std::__1::basic_ostream.2"*), %"class.std::__1::basic_ostream.2"** %155, align 8, !tbaa !29
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define hidden void @_ZNSt3__19DoIOSInitD2Ev(%"class.std::__1::DoIOSInit"* nocapture readnone %0) unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = invoke nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* bitcast ([160 x i8]* @_ZNSt3__14coutE to %"class.std::__1::basic_ostream"*))
          to label %3 unwind label %10

3:                                                ; preds = %1
  %4 = invoke nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream.2"* @_ZNSt3__113basic_ostreamIwNS_11char_traitsIwEEE5flushEv(%"class.std::__1::basic_ostream.2"* bitcast ([160 x i8]* @_ZNSt3__15wcoutE to %"class.std::__1::basic_ostream.2"*))
          to label %5 unwind label %10

5:                                                ; preds = %3
  %6 = invoke nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"* bitcast ([160 x i8]* @_ZNSt3__14clogE to %"class.std::__1::basic_ostream"*))
          to label %7 unwind label %12

7:                                                ; preds = %5
  %8 = invoke nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream.2"* @_ZNSt3__113basic_ostreamIwNS_11char_traitsIwEEE5flushEv(%"class.std::__1::basic_ostream.2"* bitcast ([160 x i8]* @_ZNSt3__15wclogE to %"class.std::__1::basic_ostream.2"*))
          to label %9 unwind label %12

9:                                                ; preds = %7
  ret void

10:                                               ; preds = %3, %1
  %11 = landingpad { i8*, i32 }
          catch i8* null
  br label %14

12:                                               ; preds = %7, %5
  %13 = landingpad { i8*, i32 }
          catch i8* null
  br label %14

14:                                               ; preds = %12, %10
  %15 = phi { i8*, i32 } [ %13, %12 ], [ %11, %10 ]
  %16 = extractvalue { i8*, i32 } %15, 0
  tail call void @__clang_call_terminate(i8* %16) #13
  unreachable
}

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream"* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEE5flushEv(%"class.std::__1::basic_ostream"*) local_unnamed_addr #4

declare i32 @__gxx_personality_v0(...)

declare nonnull align 8 dereferenceable(8) %"class.std::__1::basic_ostream.2"* @_ZNSt3__113basic_ostreamIwNS_11char_traitsIwEEE5flushEv(%"class.std::__1::basic_ostream.2"*) local_unnamed_addr #4

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #5 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #12
  tail call void @_ZSt9terminatev() #13
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: uwtable
define void @_ZNSt3__18ios_base4InitC2Ev(%"class.std::__1::ios_base::Init"* nocapture readnone %0) unnamed_addr #1 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %10, !prof !45

4:                                                ; preds = %1
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %10, label %7

7:                                                ; preds = %4
  invoke void @_ZNSt3__19DoIOSInitC2Ev(%"class.std::__1::DoIOSInit"* undef)
          to label %8 unwind label %11

8:                                                ; preds = %7
  %9 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::DoIOSInit"*)* @_ZNSt3__19DoIOSInitD2Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::__1::DoIOSInit", %"class.std::__1::DoIOSInit"* @_ZZNSt3__18ios_base4InitC1EvE16init_the_streams, i64 0, i32 0), i8* nonnull @__dso_handle) #12
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  br label %10

10:                                               ; preds = %4, %8, %1
  ret void

11:                                               ; preds = %7
  %12 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_guard_abort(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  resume { i8*, i32 } %12
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare void @__cxa_guard_abort(i64*) local_unnamed_addr #0

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #0

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt3__18ios_base4InitD2Ev(%"class.std::__1::ios_base::Init"* nocapture %0) unnamed_addr #6 align 2 {
  ret void
}

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__16localeD1Ev(%"class.std::__1::locale"*) unnamed_addr #7

; Function Attrs: nounwind
declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"*) unnamed_addr #7

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__110__stdinbufIcED0Ev(%"class.std::__1::__stdinbuf"* %0) unnamed_addr #8 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* %2) #12
  %3 = bitcast %"class.std::__1::__stdinbuf"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #14
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__110__stdinbufIcE5imbueERKNS_6localeE(%"class.std::__1::__stdinbuf"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %1) unnamed_addr #1 comdat align 2 {
  %3 = tail call %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %1, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
  %4 = bitcast %"class.std::__1::locale::facet"* %3 to %"class.std::__1::codecvt"*
  %5 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 2
  %6 = bitcast %"class.std::__1::codecvt"** %5 to %"class.std::__1::locale::facet"**
  store %"class.std::__1::locale::facet"* %3, %"class.std::__1::locale::facet"** %6, align 8, !tbaa !46
  %7 = bitcast %"class.std::__1::locale::facet"* %3 to i32 (%"class.std::__1::codecvt"*)***
  %8 = load i32 (%"class.std::__1::codecvt"*)**, i32 (%"class.std::__1::codecvt"*)*** %7, align 8, !tbaa !7
  %9 = getelementptr inbounds i32 (%"class.std::__1::codecvt"*)*, i32 (%"class.std::__1::codecvt"*)** %8, i64 6
  %10 = load i32 (%"class.std::__1::codecvt"*)*, i32 (%"class.std::__1::codecvt"*)** %9, align 8
  %11 = tail call i32 %10(%"class.std::__1::codecvt"* %4) #12
  %12 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 4
  store i32 %11, i32* %12, align 8, !tbaa !47
  %13 = load %"class.std::__1::codecvt"*, %"class.std::__1::codecvt"** %5, align 8, !tbaa !46
  %14 = bitcast %"class.std::__1::codecvt"* %13 to i1 (%"class.std::__1::codecvt"*)***
  %15 = load i1 (%"class.std::__1::codecvt"*)**, i1 (%"class.std::__1::codecvt"*)*** %14, align 8, !tbaa !7
  %16 = getelementptr inbounds i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %15, i64 7
  %17 = load i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %16, align 8
  %18 = tail call zeroext i1 %17(%"class.std::__1::codecvt"* %13) #12
  %19 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 7
  %20 = zext i1 %18 to i8
  store i8 %20, i8* %19, align 1, !tbaa !48
  %21 = load i32, i32* %12, align 8, !tbaa !47
  %22 = icmp sgt i32 %21, 8
  br i1 %22, label %23, label %24

23:                                               ; preds = %2
  tail call void @_ZNSt3__121__throw_runtime_errorEPKc(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0)) #15
  unreachable

24:                                               ; preds = %2
  ret void
}

declare %"class.std::__1::basic_streambuf"* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #4

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekoffExNS_8ios_base7seekdirEj() unnamed_addr

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE7seekposENS_4fposI11__mbstate_tEEj() unnamed_addr

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4syncEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIcE9underflowEv(%"class.std::__1::__stdinbuf"* %0) unnamed_addr #1 comdat align 2 {
  %2 = tail call i32 @_ZNSt3__110__stdinbufIcE9__getcharEb(%"class.std::__1::__stdinbuf"* %0, i1 zeroext false)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIcE5uflowEv(%"class.std::__1::__stdinbuf"* %0) unnamed_addr #1 comdat align 2 {
  %2 = tail call i32 @_ZNSt3__110__stdinbufIcE9__getcharEb(%"class.std::__1::__stdinbuf"* %0, i1 zeroext true)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIcE9pbackfailEi(%"class.std::__1::__stdinbuf"* %0, i32 %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i8*, align 8
  %5 = alloca i8, align 1
  %6 = alloca i8*, align 8
  %7 = icmp eq i32 %1, -1
  %8 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 6
  %9 = load i8, i8* %8, align 8, !tbaa !15, !range !49
  %10 = icmp eq i8 %9, 0
  br i1 %7, label %11, label %17

11:                                               ; preds = %2
  br i1 %10, label %12, label %56

12:                                               ; preds = %11
  %13 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !14
  %15 = icmp ne i32 %14, -1
  %16 = zext i1 %15 to i8
  store i8 %16, i8* %8, align 8, !tbaa !15
  br label %56

17:                                               ; preds = %2
  br i1 %10, label %54, label %18

18:                                               ; preds = %17
  %19 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #12
  %20 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #12
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %5) #12
  %21 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 5
  %22 = load i32, i32* %21, align 4, !tbaa !14
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %5, align 1, !tbaa !50
  %24 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24) #12
  %25 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 2
  %26 = load %"class.std::__1::codecvt"*, %"class.std::__1::codecvt"** %25, align 8, !tbaa !46
  %27 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 3
  %28 = load %struct.__mbstate_t*, %struct.__mbstate_t** %27, align 8, !tbaa !13
  %29 = getelementptr inbounds i8, i8* %5, i64 1
  %30 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 8
  %31 = bitcast %"class.std::__1::codecvt"* %26 to i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)***
  %32 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*** %31, align 8, !tbaa !7
  %33 = getelementptr inbounds i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %32, i64 3
  %34 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %33, align 8
  %35 = call i32 %34(%"class.std::__1::codecvt"* %26, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %28, i8* nonnull %5, i8* nonnull %29, i8** nonnull align 8 dereferenceable(8) %6, i8* nonnull %19, i8* nonnull %30, i8** nonnull align 8 dereferenceable(8) %4)
  switch i32 %35, label %40 [
    i32 2, label %52
    i32 3, label %36
    i32 1, label %52
  ]

36:                                               ; preds = %18
  %37 = load i32, i32* %21, align 4, !tbaa !14
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %19, align 1, !tbaa !50
  %39 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 1
  store i8* %39, i8** %4, align 8, !tbaa !3
  br label %40

40:                                               ; preds = %18, %36
  %41 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 1
  br label %42

42:                                               ; preds = %45, %40
  %43 = load i8*, i8** %4, align 8, !tbaa !3
  %44 = icmp ugt i8* %43, %19
  br i1 %44, label %45, label %53

45:                                               ; preds = %42
  %46 = getelementptr inbounds i8, i8* %43, i64 -1
  store i8* %46, i8** %4, align 8, !tbaa !3
  %47 = load i8, i8* %46, align 1, !tbaa !50
  %48 = sext i8 %47 to i32
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %41, align 8, !tbaa !9
  %50 = call i32 @ungetc(i32 %48, %struct._IO_FILE* %49)
  %51 = icmp eq i32 %50, -1
  br i1 %51, label %52, label %42

52:                                               ; preds = %45, %18, %18
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24) #12
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #12
  br label %56

53:                                               ; preds = %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24) #12
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %5) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #12
  br label %54

54:                                               ; preds = %53, %17
  %55 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 5
  store i32 %1, i32* %55, align 4, !tbaa !14
  store i8 1, i8* %8, align 8, !tbaa !15
  br label %56

56:                                               ; preds = %52, %12, %11, %54
  %57 = phi i32 [ %1, %54 ], [ -1, %52 ], [ -1, %11 ], [ %14, %12 ]
  ret i32 %57
}

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE8overflowEi(%"class.std::__1::basic_streambuf"*, i32) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__16localeC1ERKS0_(%"class.std::__1::locale"*, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8)) unnamed_addr #7

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #9

; Function Attrs: noreturn
declare void @_ZNSt3__121__throw_runtime_errorEPKc(i8*) local_unnamed_addr #10

declare %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"*, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12)) local_unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIcE9__getcharEb(%"class.std::__1::__stdinbuf"* %0, i1 zeroext %1) local_unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 6
  %8 = load i8, i8* %7, align 8, !tbaa !15, !range !49
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %2
  %11 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 5
  %12 = load i32, i32* %11, align 4, !tbaa !14
  br i1 %1, label %13, label %99

13:                                               ; preds = %10
  store i32 -1, i32* %11, align 4, !tbaa !14
  store i8 0, i8* %7, align 8, !tbaa !15
  br label %99

14:                                               ; preds = %2
  %15 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15) #12
  %16 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 4
  %17 = load i32, i32* %16, align 4, !tbaa !51
  %18 = icmp sgt i32 %17, 1
  %19 = select i1 %18, i32 %17, i32 1
  %20 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 1
  %21 = zext i32 %19 to i64
  br label %22

22:                                               ; preds = %27, %14
  %23 = phi i64 [ 0, %14 ], [ %30, %27 ]
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !9
  %25 = tail call i32 @getc(%struct._IO_FILE* %24)
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %97, label %27

27:                                               ; preds = %22
  %28 = trunc i32 %25 to i8
  %29 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %23
  store i8 %28, i8* %29, align 1, !tbaa !50
  %30 = add nuw nsw i64 %23, 1
  %31 = icmp eq i64 %30, %21
  br i1 %31, label %32, label %22

32:                                               ; preds = %27
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4) #12
  %33 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 7
  %34 = load i8, i8* %33, align 1, !tbaa !48, !range !49
  %35 = icmp eq i8 %34, 0
  br i1 %35, label %38, label %36

36:                                               ; preds = %32
  %37 = load i8, i8* %15, align 1, !tbaa !50
  store i8 %37, i8* %4, align 1, !tbaa !50
  br label %71

38:                                               ; preds = %32
  %39 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %39) #12
  %40 = bitcast i8** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %40) #12
  %41 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 3
  %42 = bitcast %struct.__mbstate_t** %41 to i64**
  %43 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 2
  %44 = getelementptr inbounds i8, i8* %4, i64 1
  br label %45

45:                                               ; preds = %66, %38
  %46 = phi i64 [ %68, %66 ], [ %21, %38 ]
  %47 = load i64*, i64** %42, align 8, !tbaa !13
  %48 = load i64, i64* %47, align 4
  %49 = load %"class.std::__1::codecvt"*, %"class.std::__1::codecvt"** %43, align 8, !tbaa !46
  %50 = bitcast i64* %47 to %struct.__mbstate_t*
  %51 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %46
  %52 = bitcast %"class.std::__1::codecvt"* %49 to i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)***
  %53 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*** %52, align 8, !tbaa !7
  %54 = getelementptr inbounds i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %53, i64 4
  %55 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %54, align 8
  %56 = call i32 %55(%"class.std::__1::codecvt"* %49, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %50, i8* nonnull %15, i8* nonnull %51, i8** nonnull align 8 dereferenceable(8) %5, i8* nonnull %4, i8* nonnull %44, i8** nonnull align 8 dereferenceable(8) %6)
  switch i32 %56, label %69 [
    i32 3, label %64
    i32 1, label %57
    i32 2, label %94
  ]

57:                                               ; preds = %45
  %58 = load i64*, i64** %42, align 8, !tbaa !13
  store i64 %48, i64* %58, align 4
  %59 = icmp eq i64 %46, 8
  br i1 %59, label %94, label %60

60:                                               ; preds = %57
  %61 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !9
  %62 = call i32 @getc(%struct._IO_FILE* %61)
  %63 = icmp eq i32 %62, -1
  br i1 %63, label %94, label %66

64:                                               ; preds = %45
  %65 = load i8, i8* %15, align 1, !tbaa !50
  store i8 %65, i8* %4, align 1, !tbaa !50
  br label %69

66:                                               ; preds = %60
  %67 = trunc i32 %62 to i8
  store i8 %67, i8* %51, align 1, !tbaa !50
  %68 = add nuw nsw i64 %46, 1
  br label %45

69:                                               ; preds = %45, %64
  %70 = trunc i64 %46 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %40) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %39) #12
  br label %71

71:                                               ; preds = %69, %36
  %72 = phi i32 [ %19, %36 ], [ %70, %69 ]
  br i1 %1, label %87, label %73

73:                                               ; preds = %71
  %74 = zext i32 %72 to i64
  br label %75

75:                                               ; preds = %73, %78
  %76 = phi i64 [ %74, %73 ], [ %79, %78 ]
  %77 = icmp sgt i64 %76, 0
  br i1 %77, label %78, label %91

78:                                               ; preds = %75
  %79 = add nsw i64 %76, -1
  %80 = and i64 %79, 4294967295
  %81 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %80
  %82 = load i8, i8* %81, align 1, !tbaa !50
  %83 = zext i8 %82 to i32
  %84 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !9
  %85 = call i32 @ungetc(i32 %83, %struct._IO_FILE* %84)
  %86 = icmp eq i32 %85, -1
  br i1 %86, label %95, label %75

87:                                               ; preds = %71
  %88 = load i8, i8* %4, align 1, !tbaa !50
  %89 = zext i8 %88 to i32
  %90 = getelementptr inbounds %"class.std::__1::__stdinbuf", %"class.std::__1::__stdinbuf"* %0, i64 0, i32 5
  store i32 %89, i32* %90, align 4, !tbaa !14
  br label %95

91:                                               ; preds = %75
  %92 = load i8, i8* %4, align 1, !tbaa !50
  %93 = zext i8 %92 to i32
  br label %95

94:                                               ; preds = %60, %45, %57
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %40) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %39) #12
  br label %95

95:                                               ; preds = %78, %87, %91, %94
  %96 = phi i32 [ -1, %94 ], [ %93, %91 ], [ %89, %87 ], [ -1, %78 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #12
  br label %97

97:                                               ; preds = %22, %95
  %98 = phi i32 [ %96, %95 ], [ -1, %22 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #12
  br label %99

99:                                               ; preds = %10, %13, %97
  %100 = phi i32 [ %98, %97 ], [ %12, %13 ], [ %12, %10 ]
  ret i32 %100
}

; Function Attrs: nofree nounwind
declare i32 @getc(%struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare i32 @ungetc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nounwind
declare void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"*) unnamed_addr #7

declare void @_ZNSt3__18ios_base4initEPv(%"class.std::__1::ios_base"*, i8*) local_unnamed_addr #4

declare void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEEC2Ev(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #4

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__110__stdinbufIwED0Ev(%"class.std::__1::__stdinbuf.6"* %0) unnamed_addr #8 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"* %2) #12
  %3 = bitcast %"class.std::__1::__stdinbuf.6"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #14
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__110__stdinbufIwE5imbueERKNS_6localeE(%"class.std::__1::__stdinbuf.6"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %1) unnamed_addr #1 comdat align 2 {
  %3 = tail call %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %1, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIwc11__mbstate_tE2idE)
  %4 = bitcast %"class.std::__1::locale::facet"* %3 to %"class.std::__1::codecvt.8"*
  %5 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 2
  %6 = bitcast %"class.std::__1::codecvt.8"** %5 to %"class.std::__1::locale::facet"**
  store %"class.std::__1::locale::facet"* %3, %"class.std::__1::locale::facet"** %6, align 8, !tbaa !52
  %7 = bitcast %"class.std::__1::locale::facet"* %3 to i32 (%"class.std::__1::codecvt.8"*)***
  %8 = load i32 (%"class.std::__1::codecvt.8"*)**, i32 (%"class.std::__1::codecvt.8"*)*** %7, align 8, !tbaa !7
  %9 = getelementptr inbounds i32 (%"class.std::__1::codecvt.8"*)*, i32 (%"class.std::__1::codecvt.8"*)** %8, i64 6
  %10 = load i32 (%"class.std::__1::codecvt.8"*)*, i32 (%"class.std::__1::codecvt.8"*)** %9, align 8
  %11 = tail call i32 %10(%"class.std::__1::codecvt.8"* %4) #12
  %12 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 4
  store i32 %11, i32* %12, align 8, !tbaa !53
  %13 = load %"class.std::__1::codecvt.8"*, %"class.std::__1::codecvt.8"** %5, align 8, !tbaa !52
  %14 = bitcast %"class.std::__1::codecvt.8"* %13 to i1 (%"class.std::__1::codecvt.8"*)***
  %15 = load i1 (%"class.std::__1::codecvt.8"*)**, i1 (%"class.std::__1::codecvt.8"*)*** %14, align 8, !tbaa !7
  %16 = getelementptr inbounds i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %15, i64 7
  %17 = load i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %16, align 8
  %18 = tail call zeroext i1 %17(%"class.std::__1::codecvt.8"* %13) #12
  %19 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 7
  %20 = zext i1 %18 to i8
  store i8 %20, i8* %19, align 1, !tbaa !54
  %21 = load i32, i32* %12, align 8, !tbaa !53
  %22 = icmp sgt i32 %21, 8
  br i1 %22, label %23, label %24

23:                                               ; preds = %2
  tail call void @_ZNSt3__121__throw_runtime_errorEPKc(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i64 0, i64 0)) #15
  unreachable

24:                                               ; preds = %2
  ret void
}

declare %"class.std::__1::basic_streambuf.7"* @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6setbufEPwl(%"class.std::__1::basic_streambuf.7"*, i32*, i64) unnamed_addr #4

declare void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekoffExNS_8ios_base7seekdirEj() unnamed_addr

declare void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE7seekposENS_4fposI11__mbstate_tEEj() unnamed_addr

declare i32 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE4syncEv(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #4

declare i64 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9showmanycEv(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #4

declare i64 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6xsgetnEPwl(%"class.std::__1::basic_streambuf.7"*, i32*, i64) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIwE9underflowEv(%"class.std::__1::__stdinbuf.6"* %0) unnamed_addr #1 comdat align 2 {
  %2 = tail call i32 @_ZNSt3__110__stdinbufIwE9__getcharEb(%"class.std::__1::__stdinbuf.6"* %0, i1 zeroext false)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIwE5uflowEv(%"class.std::__1::__stdinbuf.6"* %0) unnamed_addr #1 comdat align 2 {
  %2 = tail call i32 @_ZNSt3__110__stdinbufIwE9__getcharEb(%"class.std::__1::__stdinbuf.6"* %0, i1 zeroext true)
  ret i32 %2
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIwE9pbackfailEj(%"class.std::__1::__stdinbuf.6"* %0, i32 %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = icmp eq i32 %1, -1
  %8 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 6
  %9 = load i8, i8* %8, align 8, !tbaa !26, !range !49
  %10 = icmp eq i8 %9, 0
  br i1 %7, label %11, label %17

11:                                               ; preds = %2
  br i1 %10, label %12, label %56

12:                                               ; preds = %11
  %13 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 5
  %14 = load i32, i32* %13, align 4, !tbaa !25
  %15 = icmp ne i32 %14, -1
  %16 = zext i1 %15 to i8
  store i8 %16, i8* %8, align 8, !tbaa !26
  br label %56

17:                                               ; preds = %2
  br i1 %10, label %54, label %18

18:                                               ; preds = %17
  %19 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %19) #12
  %20 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #12
  %21 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %21) #12
  %22 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 5
  %23 = load i32, i32* %22, align 4, !tbaa !25
  store i32 %23, i32* %5, align 4, !tbaa !55
  %24 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %24) #12
  %25 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 2
  %26 = load %"class.std::__1::codecvt.8"*, %"class.std::__1::codecvt.8"** %25, align 8, !tbaa !52
  %27 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 3
  %28 = load %struct.__mbstate_t*, %struct.__mbstate_t** %27, align 8, !tbaa !24
  %29 = getelementptr inbounds i32, i32* %5, i64 1
  %30 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 8
  %31 = bitcast %"class.std::__1::codecvt.8"* %26 to i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)***
  %32 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*** %31, align 8, !tbaa !7
  %33 = getelementptr inbounds i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)** %32, i64 3
  %34 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)** %33, align 8
  %35 = call i32 %34(%"class.std::__1::codecvt.8"* %26, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %28, i32* nonnull %5, i32* nonnull %29, i32** nonnull align 8 dereferenceable(8) %6, i8* nonnull %19, i8* nonnull %30, i8** nonnull align 8 dereferenceable(8) %4)
  switch i32 %35, label %40 [
    i32 2, label %52
    i32 3, label %36
    i32 1, label %52
  ]

36:                                               ; preds = %18
  %37 = load i32, i32* %22, align 4, !tbaa !25
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %19, align 1, !tbaa !50
  %39 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 1
  store i8* %39, i8** %4, align 8, !tbaa !3
  br label %40

40:                                               ; preds = %18, %36
  %41 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 1
  br label %42

42:                                               ; preds = %45, %40
  %43 = load i8*, i8** %4, align 8, !tbaa !3
  %44 = icmp ugt i8* %43, %19
  br i1 %44, label %45, label %53

45:                                               ; preds = %42
  %46 = getelementptr inbounds i8, i8* %43, i64 -1
  store i8* %46, i8** %4, align 8, !tbaa !3
  %47 = load i8, i8* %46, align 1, !tbaa !50
  %48 = sext i8 %47 to i32
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** %41, align 8, !tbaa !22
  %50 = call i32 @ungetc(i32 %48, %struct._IO_FILE* %49)
  %51 = icmp eq i32 %50, -1
  br i1 %51, label %52, label %42

52:                                               ; preds = %45, %18, %18
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %21) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #12
  br label %56

53:                                               ; preds = %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %24) #12
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %21) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %19) #12
  br label %54

54:                                               ; preds = %53, %17
  %55 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 5
  store i32 %1, i32* %55, align 4, !tbaa !25
  store i8 1, i8* %8, align 8, !tbaa !26
  br label %56

56:                                               ; preds = %52, %12, %11, %54
  %57 = phi i32 [ %1, %54 ], [ -1, %52 ], [ -1, %11 ], [ %14, %12 ]
  ret i32 %57
}

declare i64 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE6xsputnEPKwl(%"class.std::__1::basic_streambuf.7"*, i32*, i64) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE8overflowEj(%"class.std::__1::basic_streambuf.7"*, i32) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__110__stdinbufIwE9__getcharEb(%"class.std::__1::__stdinbuf.6"* %0, i1 zeroext %1) local_unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  %7 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 6
  %8 = load i8, i8* %7, align 8, !tbaa !26, !range !49
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %14, label %10

10:                                               ; preds = %2
  %11 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 5
  %12 = load i32, i32* %11, align 4, !tbaa !25
  br i1 %1, label %13, label %100

13:                                               ; preds = %10
  store i32 -1, i32* %11, align 4, !tbaa !25
  store i8 0, i8* %7, align 8, !tbaa !26
  br label %100

14:                                               ; preds = %2
  %15 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15) #12
  %16 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 4
  %17 = load i32, i32* %16, align 4, !tbaa !51
  %18 = icmp sgt i32 %17, 1
  %19 = select i1 %18, i32 %17, i32 1
  %20 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 1
  %21 = zext i32 %19 to i64
  br label %22

22:                                               ; preds = %27, %14
  %23 = phi i64 [ 0, %14 ], [ %30, %27 ]
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !22
  %25 = tail call i32 @getc(%struct._IO_FILE* %24)
  %26 = icmp eq i32 %25, -1
  br i1 %26, label %98, label %27

27:                                               ; preds = %22
  %28 = trunc i32 %25 to i8
  %29 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %23
  store i8 %28, i8* %29, align 1, !tbaa !50
  %30 = add nuw nsw i64 %23, 1
  %31 = icmp eq i64 %30, %21
  br i1 %31, label %32, label %22

32:                                               ; preds = %27
  %33 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %33) #12
  %34 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 7
  %35 = load i8, i8* %34, align 1, !tbaa !54, !range !49
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %40, label %37

37:                                               ; preds = %32
  %38 = load i8, i8* %15, align 1, !tbaa !50
  %39 = sext i8 %38 to i32
  store i32 %39, i32* %4, align 4, !tbaa !55
  br label %74

40:                                               ; preds = %32
  %41 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %41) #12
  %42 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %42) #12
  %43 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 3
  %44 = bitcast %struct.__mbstate_t** %43 to i64**
  %45 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 2
  %46 = getelementptr inbounds i32, i32* %4, i64 1
  br label %47

47:                                               ; preds = %69, %40
  %48 = phi i64 [ %71, %69 ], [ %21, %40 ]
  %49 = load i64*, i64** %44, align 8, !tbaa !24
  %50 = load i64, i64* %49, align 4
  %51 = load %"class.std::__1::codecvt.8"*, %"class.std::__1::codecvt.8"** %45, align 8, !tbaa !52
  %52 = bitcast i64* %49 to %struct.__mbstate_t*
  %53 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %48
  %54 = bitcast %"class.std::__1::codecvt.8"* %51 to i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)***
  %55 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)**, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)*** %54, align 8, !tbaa !7
  %56 = getelementptr inbounds i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)** %55, i64 4
  %57 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**, i32*, i32*, i32**)** %56, align 8
  %58 = call i32 %57(%"class.std::__1::codecvt.8"* %51, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %52, i8* nonnull %15, i8* nonnull %53, i8** nonnull align 8 dereferenceable(8) %5, i32* nonnull %4, i32* nonnull %46, i32** nonnull align 8 dereferenceable(8) %6)
  switch i32 %58, label %72 [
    i32 3, label %66
    i32 1, label %59
    i32 2, label %95
  ]

59:                                               ; preds = %47
  %60 = load i64*, i64** %44, align 8, !tbaa !24
  store i64 %50, i64* %60, align 4
  %61 = icmp eq i64 %48, 8
  br i1 %61, label %95, label %62

62:                                               ; preds = %59
  %63 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !22
  %64 = call i32 @getc(%struct._IO_FILE* %63)
  %65 = icmp eq i32 %64, -1
  br i1 %65, label %95, label %69

66:                                               ; preds = %47
  %67 = load i8, i8* %15, align 1, !tbaa !50
  %68 = sext i8 %67 to i32
  store i32 %68, i32* %4, align 4, !tbaa !55
  br label %72

69:                                               ; preds = %62
  %70 = trunc i32 %64 to i8
  store i8 %70, i8* %53, align 1, !tbaa !50
  %71 = add nuw nsw i64 %48, 1
  br label %47

72:                                               ; preds = %47, %66
  %73 = trunc i64 %48 to i32
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %42) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %41) #12
  br label %74

74:                                               ; preds = %72, %37
  %75 = phi i32 [ %19, %37 ], [ %73, %72 ]
  br i1 %1, label %90, label %76

76:                                               ; preds = %74
  %77 = zext i32 %75 to i64
  br label %78

78:                                               ; preds = %76, %81
  %79 = phi i64 [ %77, %76 ], [ %82, %81 ]
  %80 = icmp sgt i64 %79, 0
  br i1 %80, label %81, label %93

81:                                               ; preds = %78
  %82 = add nsw i64 %79, -1
  %83 = and i64 %82, 4294967295
  %84 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 %83
  %85 = load i8, i8* %84, align 1, !tbaa !50
  %86 = sext i8 %85 to i32
  %87 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8, !tbaa !22
  %88 = call i32 @ungetc(i32 %86, %struct._IO_FILE* %87)
  %89 = icmp eq i32 %88, -1
  br i1 %89, label %96, label %78

90:                                               ; preds = %74
  %91 = load i32, i32* %4, align 4, !tbaa !55
  %92 = getelementptr inbounds %"class.std::__1::__stdinbuf.6", %"class.std::__1::__stdinbuf.6"* %0, i64 0, i32 5
  store i32 %91, i32* %92, align 4, !tbaa !25
  br label %96

93:                                               ; preds = %78
  %94 = load i32, i32* %4, align 4, !tbaa !55
  br label %96

95:                                               ; preds = %62, %47, %59
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %42) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %41) #12
  br label %96

96:                                               ; preds = %81, %90, %93, %95
  %97 = phi i32 [ -1, %95 ], [ %94, %93 ], [ %91, %90 ], [ -1, %81 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %33) #12
  br label %98

98:                                               ; preds = %22, %96
  %99 = phi i32 [ %97, %96 ], [ -1, %22 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #12
  br label %100

100:                                              ; preds = %10, %13, %98
  %101 = phi i32 [ %99, %98 ], [ %12, %13 ], [ %12, %10 ]
  ret i32 %101
}

; Function Attrs: nounwind
declare void @_ZNSt3__19basic_iosIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_ios.1"*) unnamed_addr #7

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__111__stdoutbufIcED0Ev(%"class.std::__1::__stdoutbuf"* %0) unnamed_addr #8 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* %2) #12
  %3 = bitcast %"class.std::__1::__stdoutbuf"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #14
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__111__stdoutbufIcE5imbueERKNS_6localeE(%"class.std::__1::__stdoutbuf"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %1) unnamed_addr #1 comdat align 2 {
  %3 = bitcast %"class.std::__1::__stdoutbuf"* %0 to i32 (%"class.std::__1::__stdoutbuf"*)***
  %4 = load i32 (%"class.std::__1::__stdoutbuf"*)**, i32 (%"class.std::__1::__stdoutbuf"*)*** %3, align 8, !tbaa !7
  %5 = getelementptr inbounds i32 (%"class.std::__1::__stdoutbuf"*)*, i32 (%"class.std::__1::__stdoutbuf"*)** %4, i64 6
  %6 = load i32 (%"class.std::__1::__stdoutbuf"*)*, i32 (%"class.std::__1::__stdoutbuf"*)** %5, align 8
  %7 = tail call i32 %6(%"class.std::__1::__stdoutbuf"* %0)
  %8 = tail call %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %1, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIcc11__mbstate_tE2idE)
  %9 = bitcast %"class.std::__1::locale::facet"* %8 to %"class.std::__1::codecvt"*
  %10 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 2
  %11 = bitcast %"class.std::__1::codecvt"** %10 to %"class.std::__1::locale::facet"**
  store %"class.std::__1::locale::facet"* %8, %"class.std::__1::locale::facet"** %11, align 8, !tbaa !34
  %12 = bitcast %"class.std::__1::locale::facet"* %8 to i1 (%"class.std::__1::codecvt"*)***
  %13 = load i1 (%"class.std::__1::codecvt"*)**, i1 (%"class.std::__1::codecvt"*)*** %12, align 8, !tbaa !7
  %14 = getelementptr inbounds i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %13, i64 7
  %15 = load i1 (%"class.std::__1::codecvt"*)*, i1 (%"class.std::__1::codecvt"*)** %14, align 8
  %16 = tail call zeroext i1 %15(%"class.std::__1::codecvt"* %9) #12
  %17 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 4
  %18 = zext i1 %16 to i8
  store i8 %18, i8* %17, align 8, !tbaa !36
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__111__stdoutbufIcE4syncEv(%"class.std::__1::__stdoutbuf"* %0) unnamed_addr #1 comdat align 2 {
  %2 = alloca [8 x i8], align 1
  %3 = alloca i8*, align 8
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #12
  %5 = bitcast i8** %3 to i8*
  %6 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 2
  %7 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 3
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 8
  %9 = bitcast i8** %3 to i64*
  %10 = ptrtoint [8 x i8]* %2 to i64
  %11 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 1
  br label %12

12:                                               ; preds = %25, %1
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #12
  %13 = load %"class.std::__1::codecvt"*, %"class.std::__1::codecvt"** %6, align 8, !tbaa !34
  %14 = load %struct.__mbstate_t*, %struct.__mbstate_t** %7, align 8, !tbaa !35
  %15 = bitcast %"class.std::__1::codecvt"* %13 to i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)***
  %16 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)*** %15, align 8, !tbaa !7
  %17 = getelementptr inbounds i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)** %16, i64 5
  %18 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**)** %17, align 8
  %19 = call i32 %18(%"class.std::__1::codecvt"* %13, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %14, i8* nonnull %4, i8* nonnull %8, i8** nonnull align 8 dereferenceable(8) %3)
  %20 = load i64, i64* %9, align 8, !tbaa !3
  %21 = sub i64 %20, %10
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8, !tbaa !32
  %23 = call i64 @fwrite(i8* nonnull %4, i64 1, i64 %21, %struct._IO_FILE* %22)
  %24 = icmp eq i64 %23, %21
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #12
  br i1 %24, label %25, label %31

25:                                               ; preds = %12
  switch i32 %19, label %26 [
    i32 1, label %12
    i32 2, label %31
  ]

26:                                               ; preds = %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8, !tbaa !32
  %28 = call i32 @fflush(%struct._IO_FILE* %27)
  %29 = icmp ne i32 %28, 0
  %30 = sext i1 %29 to i32
  br label %31

31:                                               ; preds = %25, %12, %26
  %32 = phi i32 [ %30, %26 ], [ -1, %12 ], [ -1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #12
  ret i32 %32
}

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9underflowEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9pbackfailEi(%"class.std::__1::basic_streambuf"*, i32) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i64 @_ZNSt3__111__stdoutbufIcE6xsputnEPKcl(%"class.std::__1::__stdoutbuf"* %0, i8* %1, i64 %2) unnamed_addr #1 comdat align 2 {
  %4 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 4
  %5 = load i8, i8* %4, align 8, !tbaa !36, !range !49
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %3
  %8 = icmp sgt i64 %2, 0
  br i1 %8, label %9, label %29

9:                                                ; preds = %7
  %10 = bitcast %"class.std::__1::__stdoutbuf"* %0 to i32 (%"class.std::__1::__stdoutbuf"*, i32)***
  br label %15

11:                                               ; preds = %3
  %12 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** %12, align 8, !tbaa !32
  %14 = tail call i64 @fwrite(i8* %1, i64 1, i64 %2, %struct._IO_FILE* %13)
  br label %29

15:                                               ; preds = %25, %9
  %16 = phi i64 [ 0, %9 ], [ %26, %25 ]
  %17 = phi i8* [ %1, %9 ], [ %27, %25 ]
  %18 = load i8, i8* %17, align 1, !tbaa !50
  %19 = zext i8 %18 to i32
  %20 = load i32 (%"class.std::__1::__stdoutbuf"*, i32)**, i32 (%"class.std::__1::__stdoutbuf"*, i32)*** %10, align 8, !tbaa !7
  %21 = getelementptr inbounds i32 (%"class.std::__1::__stdoutbuf"*, i32)*, i32 (%"class.std::__1::__stdoutbuf"*, i32)** %20, i64 13
  %22 = load i32 (%"class.std::__1::__stdoutbuf"*, i32)*, i32 (%"class.std::__1::__stdoutbuf"*, i32)** %21, align 8
  %23 = tail call i32 %22(%"class.std::__1::__stdoutbuf"* nonnull %0, i32 %19)
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %29, label %25

25:                                               ; preds = %15
  %26 = add nuw nsw i64 %16, 1
  %27 = getelementptr inbounds i8, i8* %17, i64 1
  %28 = icmp eq i64 %26, %2
  br i1 %28, label %29, label %15

29:                                               ; preds = %15, %25, %7, %11
  %30 = phi i64 [ %14, %11 ], [ 0, %7 ], [ %16, %15 ], [ %2, %25 ]
  ret i64 %30
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__111__stdoutbufIcE8overflowEi(%"class.std::__1::__stdoutbuf"* %0, i32 %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i8, align 1
  %5 = alloca i8*, align 8
  %6 = alloca i8*, align 8
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #12
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4) #12
  %8 = icmp eq i32 %1, -1
  br i1 %8, label %59, label %9

9:                                                ; preds = %2
  %10 = trunc i32 %1 to i8
  store i8 %10, i8* %4, align 1, !tbaa !50
  %11 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 4
  %12 = load i8, i8* %11, align 8, !tbaa !36, !range !49
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %9
  %15 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8, !tbaa !32
  %17 = call i64 @fwrite(i8* nonnull %4, i64 1, i64 1, %struct._IO_FILE* %16)
  %18 = icmp eq i64 %17, 1
  br i1 %18, label %59, label %62

19:                                               ; preds = %9
  %20 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #12
  store i8* %7, i8** %5, align 8, !tbaa !3
  %21 = getelementptr inbounds i8, i8* %4, i64 1
  %22 = bitcast i8** %6 to i8*
  %23 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 2
  %24 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 3
  %25 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 8
  %26 = bitcast i8** %5 to i64*
  %27 = ptrtoint [8 x i8]* %3 to i64
  %28 = getelementptr inbounds %"class.std::__1::__stdoutbuf", %"class.std::__1::__stdoutbuf"* %0, i64 0, i32 1
  br label %29

29:                                               ; preds = %56, %19
  %30 = phi i8* [ %4, %19 ], [ %57, %56 ]
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #12
  %31 = load %"class.std::__1::codecvt"*, %"class.std::__1::codecvt"** %23, align 8, !tbaa !34
  %32 = load %struct.__mbstate_t*, %struct.__mbstate_t** %24, align 8, !tbaa !35
  %33 = bitcast %"class.std::__1::codecvt"* %31 to i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)***
  %34 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*** %33, align 8, !tbaa !7
  %35 = getelementptr inbounds i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %34, i64 3
  %36 = load i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt"*, %struct.__mbstate_t*, i8*, i8*, i8**, i8*, i8*, i8**)** %35, align 8
  %37 = call i32 %36(%"class.std::__1::codecvt"* %31, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %32, i8* %30, i8* nonnull %21, i8** nonnull align 8 dereferenceable(8) %6, i8* nonnull %7, i8* nonnull %25, i8** nonnull align 8 dereferenceable(8) %5)
  %38 = load i8*, i8** %6, align 8, !tbaa !3
  %39 = icmp eq i8* %38, %30
  br i1 %39, label %61, label %40

40:                                               ; preds = %29
  %41 = icmp eq i32 %37, 3
  br i1 %41, label %42, label %47

42:                                               ; preds = %40
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8, !tbaa !32
  %44 = call i64 @fwrite(i8* %30, i64 1, i64 1, %struct._IO_FILE* %43)
  %45 = icmp eq i64 %44, 1
  br i1 %45, label %46, label %61

46:                                               ; preds = %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  br label %58

47:                                               ; preds = %40
  %48 = icmp eq i32 %37, 1
  %49 = icmp ult i32 %37, 2
  br i1 %49, label %50, label %61

50:                                               ; preds = %47
  %51 = load i64, i64* %26, align 8, !tbaa !3
  %52 = sub i64 %51, %27
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8, !tbaa !32
  %54 = call i64 @fwrite(i8* nonnull %7, i64 1, i64 %52, %struct._IO_FILE* %53)
  %55 = icmp eq i64 %54, %52
  br i1 %55, label %56, label %61

56:                                               ; preds = %50
  %57 = load i8*, i8** %6, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  br i1 %48, label %29, label %58

58:                                               ; preds = %56, %46
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  br label %59

59:                                               ; preds = %58, %14, %2
  %60 = phi i32 [ %1, %58 ], [ %1, %14 ], [ 0, %2 ]
  br label %62

61:                                               ; preds = %29, %50, %47, %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  br label %62

62:                                               ; preds = %14, %61, %59
  %63 = phi i32 [ %60, %59 ], [ -1, %61 ], [ -1, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #12
  ret i32 %63
}

; Function Attrs: nofree nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare i32 @fflush(%struct._IO_FILE* nocapture) local_unnamed_addr #11

; Function Attrs: nounwind
declare void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #7

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__111__stdoutbufIwED0Ev(%"class.std::__1::__stdoutbuf.10"* %0) unnamed_addr #8 comdat align 2 {
  %2 = getelementptr %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEED2Ev(%"class.std::__1::basic_streambuf.7"* %2) #12
  %3 = bitcast %"class.std::__1::__stdoutbuf.10"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #14
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__111__stdoutbufIwE5imbueERKNS_6localeE(%"class.std::__1::__stdoutbuf.10"* %0, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8) %1) unnamed_addr #1 comdat align 2 {
  %3 = bitcast %"class.std::__1::__stdoutbuf.10"* %0 to i32 (%"class.std::__1::__stdoutbuf.10"*)***
  %4 = load i32 (%"class.std::__1::__stdoutbuf.10"*)**, i32 (%"class.std::__1::__stdoutbuf.10"*)*** %3, align 8, !tbaa !7
  %5 = getelementptr inbounds i32 (%"class.std::__1::__stdoutbuf.10"*)*, i32 (%"class.std::__1::__stdoutbuf.10"*)** %4, i64 6
  %6 = load i32 (%"class.std::__1::__stdoutbuf.10"*)*, i32 (%"class.std::__1::__stdoutbuf.10"*)** %5, align 8
  %7 = tail call i32 %6(%"class.std::__1::__stdoutbuf.10"* %0)
  %8 = tail call %"class.std::__1::locale::facet"* @_ZNKSt3__16locale9use_facetERNS0_2idE(%"class.std::__1::locale"* nonnull %1, %"class.std::__1::locale::id"* nonnull align 8 dereferenceable(12) @_ZNSt3__17codecvtIwc11__mbstate_tE2idE)
  %9 = bitcast %"class.std::__1::locale::facet"* %8 to %"class.std::__1::codecvt.8"*
  %10 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 2
  %11 = bitcast %"class.std::__1::codecvt.8"** %10 to %"class.std::__1::locale::facet"**
  store %"class.std::__1::locale::facet"* %8, %"class.std::__1::locale::facet"** %11, align 8, !tbaa !39
  %12 = bitcast %"class.std::__1::locale::facet"* %8 to i1 (%"class.std::__1::codecvt.8"*)***
  %13 = load i1 (%"class.std::__1::codecvt.8"*)**, i1 (%"class.std::__1::codecvt.8"*)*** %12, align 8, !tbaa !7
  %14 = getelementptr inbounds i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %13, i64 7
  %15 = load i1 (%"class.std::__1::codecvt.8"*)*, i1 (%"class.std::__1::codecvt.8"*)** %14, align 8
  %16 = tail call zeroext i1 %15(%"class.std::__1::codecvt.8"* %9) #12
  %17 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 4
  %18 = zext i1 %16 to i8
  store i8 %18, i8* %17, align 8, !tbaa !41
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__111__stdoutbufIwE4syncEv(%"class.std::__1::__stdoutbuf.10"* %0) unnamed_addr #1 comdat align 2 {
  %2 = alloca [8 x i8], align 1
  %3 = alloca i8*, align 8
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #12
  %5 = bitcast i8** %3 to i8*
  %6 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 2
  %7 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 3
  %8 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 8
  %9 = bitcast i8** %3 to i64*
  %10 = ptrtoint [8 x i8]* %2 to i64
  %11 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 1
  br label %12

12:                                               ; preds = %25, %1
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #12
  %13 = load %"class.std::__1::codecvt.8"*, %"class.std::__1::codecvt.8"** %6, align 8, !tbaa !39
  %14 = load %struct.__mbstate_t*, %struct.__mbstate_t** %7, align 8, !tbaa !40
  %15 = bitcast %"class.std::__1::codecvt.8"* %13 to i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)***
  %16 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)*** %15, align 8, !tbaa !7
  %17 = getelementptr inbounds i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)** %16, i64 5
  %18 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i8*, i8*, i8**)** %17, align 8
  %19 = call i32 %18(%"class.std::__1::codecvt.8"* %13, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %14, i8* nonnull %4, i8* nonnull %8, i8** nonnull align 8 dereferenceable(8) %3)
  %20 = load i64, i64* %9, align 8, !tbaa !3
  %21 = sub i64 %20, %10
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8, !tbaa !37
  %23 = call i64 @fwrite(i8* nonnull %4, i64 1, i64 %21, %struct._IO_FILE* %22)
  %24 = icmp eq i64 %23, %21
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #12
  br i1 %24, label %25, label %31

25:                                               ; preds = %12
  switch i32 %19, label %26 [
    i32 1, label %12
    i32 2, label %31
  ]

26:                                               ; preds = %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8, !tbaa !37
  %28 = call i32 @fflush(%struct._IO_FILE* %27)
  %29 = icmp ne i32 %28, 0
  %30 = sext i1 %29 to i32
  br label %31

31:                                               ; preds = %25, %12, %26
  %32 = phi i32 [ %30, %26 ], [ -1, %12 ], [ -1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #12
  ret i32 %32
}

declare i32 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9underflowEv(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE5uflowEv(%"class.std::__1::basic_streambuf.7"*) unnamed_addr #4

declare i32 @_ZNSt3__115basic_streambufIwNS_11char_traitsIwEEE9pbackfailEj(%"class.std::__1::basic_streambuf.7"*, i32) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden i64 @_ZNSt3__111__stdoutbufIwE6xsputnEPKwl(%"class.std::__1::__stdoutbuf.10"* %0, i32* %1, i64 %2) unnamed_addr #1 comdat align 2 {
  %4 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 4
  %5 = load i8, i8* %4, align 8, !tbaa !41, !range !49
  %6 = icmp eq i8 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %3
  %8 = icmp sgt i64 %2, 0
  br i1 %8, label %9, label %29

9:                                                ; preds = %7
  %10 = bitcast %"class.std::__1::__stdoutbuf.10"* %0 to i32 (%"class.std::__1::__stdoutbuf.10"*, i32)***
  br label %16

11:                                               ; preds = %3
  %12 = bitcast i32* %1 to i8*
  %13 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %13, align 8, !tbaa !37
  %15 = tail call i64 @fwrite(i8* %12, i64 4, i64 %2, %struct._IO_FILE* %14)
  br label %29

16:                                               ; preds = %25, %9
  %17 = phi i64 [ 0, %9 ], [ %26, %25 ]
  %18 = phi i32* [ %1, %9 ], [ %27, %25 ]
  %19 = load i32, i32* %18, align 4, !tbaa !55
  %20 = load i32 (%"class.std::__1::__stdoutbuf.10"*, i32)**, i32 (%"class.std::__1::__stdoutbuf.10"*, i32)*** %10, align 8, !tbaa !7
  %21 = getelementptr inbounds i32 (%"class.std::__1::__stdoutbuf.10"*, i32)*, i32 (%"class.std::__1::__stdoutbuf.10"*, i32)** %20, i64 13
  %22 = load i32 (%"class.std::__1::__stdoutbuf.10"*, i32)*, i32 (%"class.std::__1::__stdoutbuf.10"*, i32)** %21, align 8
  %23 = tail call i32 %22(%"class.std::__1::__stdoutbuf.10"* nonnull %0, i32 %19)
  %24 = icmp eq i32 %23, -1
  br i1 %24, label %29, label %25

25:                                               ; preds = %16
  %26 = add nuw nsw i64 %17, 1
  %27 = getelementptr inbounds i32, i32* %18, i64 1
  %28 = icmp eq i64 %26, %2
  br i1 %28, label %29, label %16

29:                                               ; preds = %16, %25, %7, %11
  %30 = phi i64 [ %15, %11 ], [ 0, %7 ], [ %17, %16 ], [ %2, %25 ]
  ret i64 %30
}

; Function Attrs: uwtable
define linkonce_odr hidden i32 @_ZNSt3__111__stdoutbufIwE8overflowEj(%"class.std::__1::__stdoutbuf.10"* %0, i32 %1) unnamed_addr #1 comdat align 2 {
  %3 = alloca [8 x i8], align 1
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca i32*, align 8
  %7 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %7) #12
  %8 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %8) #12
  %9 = icmp eq i32 %1, -1
  br i1 %9, label %60, label %10

10:                                               ; preds = %2
  store i32 %1, i32* %4, align 4, !tbaa !55
  %11 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 4
  %12 = load i8, i8* %11, align 8, !tbaa !41, !range !49
  %13 = icmp eq i8 %12, 0
  br i1 %13, label %19, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 1
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %15, align 8, !tbaa !37
  %17 = call i64 @fwrite(i8* nonnull %8, i64 4, i64 1, %struct._IO_FILE* %16)
  %18 = icmp eq i64 %17, 1
  br i1 %18, label %60, label %63

19:                                               ; preds = %10
  %20 = bitcast i8** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %20) #12
  store i8* %7, i8** %5, align 8, !tbaa !3
  %21 = getelementptr inbounds i32, i32* %4, i64 1
  %22 = bitcast i32** %6 to i8*
  %23 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 2
  %24 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 3
  %25 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 8
  %26 = bitcast i8** %5 to i64*
  %27 = ptrtoint [8 x i8]* %3 to i64
  %28 = getelementptr inbounds %"class.std::__1::__stdoutbuf.10", %"class.std::__1::__stdoutbuf.10"* %0, i64 0, i32 1
  br label %29

29:                                               ; preds = %57, %19
  %30 = phi i32* [ %4, %19 ], [ %58, %57 ]
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %22) #12
  %31 = load %"class.std::__1::codecvt.8"*, %"class.std::__1::codecvt.8"** %23, align 8, !tbaa !39
  %32 = load %struct.__mbstate_t*, %struct.__mbstate_t** %24, align 8, !tbaa !40
  %33 = bitcast %"class.std::__1::codecvt.8"* %31 to i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)***
  %34 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)**, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*** %33, align 8, !tbaa !7
  %35 = getelementptr inbounds i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)** %34, i64 3
  %36 = load i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)*, i32 (%"class.std::__1::codecvt.8"*, %struct.__mbstate_t*, i32*, i32*, i32**, i8*, i8*, i8**)** %35, align 8
  %37 = call i32 %36(%"class.std::__1::codecvt.8"* %31, %struct.__mbstate_t* nonnull align 4 dereferenceable(8) %32, i32* %30, i32* nonnull %21, i32** nonnull align 8 dereferenceable(8) %6, i8* nonnull %7, i8* nonnull %25, i8** nonnull align 8 dereferenceable(8) %5)
  %38 = load i32*, i32** %6, align 8, !tbaa !3
  %39 = icmp eq i32* %38, %30
  br i1 %39, label %62, label %40

40:                                               ; preds = %29
  %41 = icmp eq i32 %37, 3
  br i1 %41, label %42, label %48

42:                                               ; preds = %40
  %43 = bitcast i32* %30 to i8*
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8, !tbaa !37
  %45 = call i64 @fwrite(i8* %43, i64 1, i64 1, %struct._IO_FILE* %44)
  %46 = icmp eq i64 %45, 1
  br i1 %46, label %47, label %62

47:                                               ; preds = %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  br label %59

48:                                               ; preds = %40
  %49 = icmp eq i32 %37, 1
  %50 = icmp ult i32 %37, 2
  br i1 %50, label %51, label %62

51:                                               ; preds = %48
  %52 = load i64, i64* %26, align 8, !tbaa !3
  %53 = sub i64 %52, %27
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8, !tbaa !37
  %55 = call i64 @fwrite(i8* nonnull %7, i64 1, i64 %53, %struct._IO_FILE* %54)
  %56 = icmp eq i64 %55, %53
  br i1 %56, label %57, label %62

57:                                               ; preds = %51
  %58 = load i32*, i32** %6, align 8
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  br i1 %49, label %29, label %59

59:                                               ; preds = %57, %47
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  br label %60

60:                                               ; preds = %59, %14, %2
  %61 = phi i32 [ %1, %59 ], [ %1, %14 ], [ 0, %2 ]
  br label %63

62:                                               ; preds = %29, %51, %48, %42
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %22) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %20) #12
  br label %63

63:                                               ; preds = %14, %62, %60
  %64 = phi i32 [ %61, %60 ], [ -1, %62 ], [ -1, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %8) #12
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %7) #12
  ret i32 %64
}

; Function Attrs: uwtable
define internal void @_GLOBAL__I_000101() #1 section ".text.startup" personality i32 (...)* @__gxx_personality_v0 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %11, !prof !45

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %11, label %6

6:                                                ; preds = %3
  invoke void @_ZNSt3__19DoIOSInitC2Ev(%"class.std::__1::DoIOSInit"* undef)
          to label %7 unwind label %9

7:                                                ; preds = %6
  %8 = tail call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::__1::DoIOSInit"*)* @_ZNSt3__19DoIOSInitD2Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::__1::DoIOSInit", %"class.std::__1::DoIOSInit"* @_ZZNSt3__18ios_base4InitC1EvE16init_the_streams, i64 0, i32 0), i8* nonnull @__dso_handle) #12
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  br label %11

9:                                                ; preds = %6
  %10 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_guard_abort(i64* nonnull @_ZGVZNSt3__18ios_base4InitC1EvE16init_the_streams) #12
  resume { i8*, i32 } %10

11:                                               ; preds = %0, %3, %7
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define internal void @_GLOBAL__sub_I_iostream.cpp() #6 section ".text.startup" {
  ret void
}

attributes #0 = { nofree nounwind }
attributes #1 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind }
attributes #6 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { nounwind }
attributes #13 = { noreturn nounwind }
attributes #14 = { builtin nounwind }
attributes #15 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"vtable pointer", !6, i64 0}
!9 = !{!10, !4, i64 64}
!10 = !{!"_ZTSNSt3__110__stdinbufIcEE", !4, i64 64, !4, i64 72, !4, i64 80, !11, i64 88, !11, i64 92, !12, i64 96, !12, i64 97}
!11 = !{!"int", !5, i64 0}
!12 = !{!"bool", !5, i64 0}
!13 = !{!10, !4, i64 80}
!14 = !{!10, !11, i64 92}
!15 = !{!10, !12, i64 96}
!16 = !{!17, !18, i64 8}
!17 = !{!"_ZTSNSt3__113basic_istreamIcNS_11char_traitsIcEEEE", !18, i64 8}
!18 = !{!"long", !5, i64 0}
!19 = !{!20, !4, i64 136}
!20 = !{!"_ZTSNSt3__19basic_iosIcNS_11char_traitsIcEEEE", !4, i64 136, !11, i64 144}
!21 = !{!20, !11, i64 144}
!22 = !{!23, !4, i64 64}
!23 = !{!"_ZTSNSt3__110__stdinbufIwEE", !4, i64 64, !4, i64 72, !4, i64 80, !11, i64 88, !11, i64 92, !12, i64 96, !12, i64 97}
!24 = !{!23, !4, i64 80}
!25 = !{!23, !11, i64 92}
!26 = !{!23, !12, i64 96}
!27 = !{!28, !18, i64 8}
!28 = !{!"_ZTSNSt3__113basic_istreamIwNS_11char_traitsIwEEEE", !18, i64 8}
!29 = !{!30, !4, i64 136}
!30 = !{!"_ZTSNSt3__19basic_iosIwNS_11char_traitsIwEEEE", !4, i64 136, !11, i64 144}
!31 = !{!30, !11, i64 144}
!32 = !{!33, !4, i64 64}
!33 = !{!"_ZTSNSt3__111__stdoutbufIcEE", !4, i64 64, !4, i64 72, !4, i64 80, !12, i64 88}
!34 = !{!33, !4, i64 72}
!35 = !{!33, !4, i64 80}
!36 = !{!33, !12, i64 88}
!37 = !{!38, !4, i64 64}
!38 = !{!"_ZTSNSt3__111__stdoutbufIwEE", !4, i64 64, !4, i64 72, !4, i64 80, !12, i64 88}
!39 = !{!38, !4, i64 72}
!40 = !{!38, !4, i64 80}
!41 = !{!38, !12, i64 88}
!42 = !{!43, !4, i64 40}
!43 = !{!"_ZTSNSt3__18ios_baseE", !11, i64 8, !18, i64 16, !18, i64 24, !11, i64 32, !11, i64 36, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !18, i64 72, !18, i64 80, !4, i64 88, !18, i64 96, !18, i64 104, !4, i64 112, !18, i64 120, !18, i64 128}
!44 = !{!43, !11, i64 8}
!45 = !{!"branch_weights", i32 1, i32 1048575}
!46 = !{!10, !4, i64 72}
!47 = !{!10, !11, i64 88}
!48 = !{!10, !12, i64 97}
!49 = !{i8 0, i8 2}
!50 = !{!5, !5, i64 0}
!51 = !{!11, !11, i64 0}
!52 = !{!23, !4, i64 72}
!53 = !{!23, !11, i64 88}
!54 = !{!23, !12, i64 97}
!55 = !{!56, !56, i64 0}
!56 = !{!"wchar_t", !5, i64 0}

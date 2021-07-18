; ModuleID = 'll/.strstream.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/strstream.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::strstreambuf" = type { %"class.std::__1::basic_streambuf", i32, i64, i8* (i64)*, void (i8*)* }
%"class.std::__1::basic_streambuf" = type { i32 (...)**, %"class.std::__1::locale", i8*, i8*, i8*, i8*, i8*, i8* }
%"class.std::__1::locale" = type { %"class.std::__1::locale::__imp"* }
%"class.std::__1::locale::__imp" = type opaque
%"class.std::__1::istrstream" = type { %"class.std::__1::basic_istream.base", %"class.std::__1::strstreambuf", %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_istream.base" = type { i32 (...)**, i64 }
%"class.std::__1::basic_ios.base" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32 }>
%"class.std::__1::ios_base" = type { i32 (...)**, i32, i64, i64, i32, i32, i8*, i8*, void (i32, %"class.std::__1::ios_base"*, i32)**, i32*, i64, i64, i64*, i64, i64, i8**, i64, i64 }
%"class.std::__1::basic_ostream" = type { i32 (...)**, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_istream" = type { i32 (...)**, i64, %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ios" = type <{ %"class.std::__1::ios_base", %"class.std::__1::basic_ostream"*, i32, [4 x i8] }>
%"class.std::__1::ostrstream" = type { %"class.std::__1::basic_ostream.base", %"class.std::__1::strstreambuf", %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_ostream.base" = type { i32 (...)** }
%"class.std::__1::strstream" = type { %"class.std::__1::basic_iostream.base", %"class.std::__1::strstreambuf", %"class.std::__1::basic_ios.base" }
%"class.std::__1::basic_iostream.base" = type { %"class.std::__1::basic_istream.base", %"class.std::__1::basic_ostream.base" }
%"class.std::__1::basic_iostream" = type { %"class.std::__1::basic_istream.base", %"class.std::__1::basic_ostream.base", %"class.std::__1::basic_ios.base" }

$__clang_call_terminate = comdat any

@_ZTVNSt3__112strstreambufE = unnamed_addr constant { [16 x i8*] } { [16 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__112strstreambufE to i8*), i8* bitcast (void (%"class.std::__1::strstreambuf"*)* @_ZNSt3__112strstreambufD2Ev to i8*), i8* bitcast (void (%"class.std::__1::strstreambuf"*)* @_ZNSt3__112strstreambufD0Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_streambuf"*, %"class.std::__1::locale"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE to i8*), i8* bitcast (%"class.std::__1::basic_streambuf"* (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl to i8*), i8* bitcast ({ i64, i64 } (%"class.std::__1::strstreambuf"*, i64, i32, i32)* @_ZNSt3__112strstreambuf7seekoffExNS_8ios_base7seekdirEj to i8*), i8* bitcast ({ i64, i64 } (%"class.std::__1::strstreambuf"*, i64, i64, i32)* @_ZNSt3__112strstreambuf7seekposENS_4fposI11__mbstate_tEEj to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4syncEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl to i8*), i8* bitcast (i32 (%"class.std::__1::strstreambuf"*)* @_ZNSt3__112strstreambuf9underflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::basic_streambuf"*)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv to i8*), i8* bitcast (i32 (%"class.std::__1::strstreambuf"*, i32)* @_ZNSt3__112strstreambuf9pbackfailEi to i8*), i8* bitcast (i64 (%"class.std::__1::basic_streambuf"*, i8*, i64)* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl to i8*), i8* bitcast (i32 (%"class.std::__1::strstreambuf"*, i32)* @_ZNSt3__112strstreambuf8overflowEi to i8*)] }, align 8
@_ZTVNSt3__110istrstreamE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 112 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110istrstreamE to i8*), i8* bitcast (void (%"class.std::__1::istrstream"*)* @_ZNSt3__110istrstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::istrstream"*)* @_ZNSt3__110istrstreamD0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -112 to i8*), i8* inttoptr (i64 -112 to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110istrstreamE to i8*), i8* bitcast (void (%"class.std::__1::istrstream"*)* @_ZTv0_n24_NSt3__110istrstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::istrstream"*)* @_ZTv0_n24_NSt3__110istrstreamD0Ev to i8*)] }, align 8
@_ZTTNSt3__110istrstreamE = unnamed_addr constant [4 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110istrstreamE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__110istrstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__110istrstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110istrstreamE, i32 0, inrange i32 1, i32 3) to i8*)], align 8
@_ZTVNSt3__110ostrstreamE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 104 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110ostrstreamE to i8*), i8* bitcast (void (%"class.std::__1::ostrstream"*)* @_ZNSt3__110ostrstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::ostrstream"*)* @_ZNSt3__110ostrstreamD0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -104 to i8*), i8* inttoptr (i64 -104 to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__110ostrstreamE to i8*), i8* bitcast (void (%"class.std::__1::ostrstream"*)* @_ZTv0_n24_NSt3__110ostrstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::ostrstream"*)* @_ZTv0_n24_NSt3__110ostrstreamD0Ev to i8*)] }, align 8
@_ZTTNSt3__110ostrstreamE = unnamed_addr constant [4 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110ostrstreamE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__110ostrstreamE0_NS_13basic_ostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__110ostrstreamE0_NS_13basic_ostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110ostrstreamE, i32 0, inrange i32 1, i32 3) to i8*)], align 8
@_ZTVNSt3__19strstreamE = unnamed_addr constant { [5 x i8*], [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 120 to i8*), i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__19strstreamE to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZNSt3__19strstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZNSt3__19strstreamD0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 104 to i8*), i8* inttoptr (i64 -16 to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__19strstreamE to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZThn16_NSt3__19strstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZThn16_NSt3__19strstreamD0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -120 to i8*), i8* inttoptr (i64 -120 to i8*), i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__19strstreamE to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZTv0_n24_NSt3__19strstreamD1Ev to i8*), i8* bitcast (void (%"class.std::__1::strstream"*)* @_ZTv0_n24_NSt3__19strstreamD0Ev to i8*)] }, align 8
@_ZTTNSt3__19strstreamE = unnamed_addr constant [10 x i8*] [i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTVNSt3__19strstreamE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE0_NS_14basic_iostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE16_NS_13basic_ostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 0, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE16_NS_13basic_ostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE0_NS_14basic_iostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 2, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTCNSt3__19strstreamE0_NS_14basic_iostreamIcNS_11char_traitsIcEEEE, i32 0, inrange i32 1, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTVNSt3__19strstreamE, i32 0, inrange i32 2, i32 3) to i8*), i8* bitcast (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*], [5 x i8*] }* @_ZTVNSt3__19strstreamE, i32 0, inrange i32 1, i32 3) to i8*)], align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__112strstreambufE = constant [23 x i8] c"NSt3__112strstreambufE\00", align 1
@_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE = external constant i8*
@_ZTINSt3__112strstreambufE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([23 x i8], [23 x i8]* @_ZTSNSt3__112strstreambufE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__115basic_streambufIcNS_11char_traitsIcEEEE to i8*) }, align 8
@_ZTCNSt3__110istrstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 112 to i8*), i8* null, i8* bitcast (i8** @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -112 to i8*), i8* inttoptr (i64 -112 to i8*), i8* bitcast (i8** @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev to i8*)] }, align 8
@_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE = external constant i8*
@_ZTSNSt3__110istrstreamE = constant [21 x i8] c"NSt3__110istrstreamE\00", align 1
@_ZTINSt3__110istrstreamE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @_ZTSNSt3__110istrstreamE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE to i8*) }, align 8
@_ZTCNSt3__110ostrstreamE0_NS_13basic_ostreamIcNS_11char_traitsIcEEEE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 104 to i8*), i8* null, i8* bitcast (i8** @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -104 to i8*), i8* inttoptr (i64 -104 to i8*), i8* bitcast (i8** @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev to i8*)] }, align 8
@_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE = external constant i8*
@_ZTSNSt3__110ostrstreamE = constant [21 x i8] c"NSt3__110ostrstreamE\00", align 1
@_ZTINSt3__110ostrstreamE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @_ZTSNSt3__110ostrstreamE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE to i8*) }, align 8
@_ZTCNSt3__19strstreamE0_NS_14basic_iostreamIcNS_11char_traitsIcEEEE = unnamed_addr constant { [5 x i8*], [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 120 to i8*), i8* null, i8* bitcast (i8** @_ZTINSt3__114basic_iostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 104 to i8*), i8* inttoptr (i64 -16 to i8*), i8* bitcast (i8** @_ZTINSt3__114basic_iostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZThn16_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZThn16_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -120 to i8*), i8* inttoptr (i64 -120 to i8*), i8* bitcast (i8** @_ZTINSt3__114basic_iostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZTv0_n24_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_iostream"*)* @_ZTv0_n24_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev to i8*)] }, align 8
@_ZTINSt3__114basic_iostreamIcNS_11char_traitsIcEEEE = external constant i8*
@_ZTCNSt3__19strstreamE0_NS_13basic_istreamIcNS_11char_traitsIcEEEE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 120 to i8*), i8* null, i8* bitcast (i8** @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -120 to i8*), i8* inttoptr (i64 -120 to i8*), i8* bitcast (i8** @_ZTINSt3__113basic_istreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_istream"*)* @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev to i8*)] }, align 8
@_ZTCNSt3__19strstreamE16_NS_13basic_ostreamIcNS_11char_traitsIcEEEE = unnamed_addr constant { [5 x i8*], [5 x i8*] } { [5 x i8*] [i8* inttoptr (i64 104 to i8*), i8* null, i8* bitcast (i8** @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev to i8*)], [5 x i8*] [i8* inttoptr (i64 -104 to i8*), i8* inttoptr (i64 -104 to i8*), i8* bitcast (i8** @_ZTINSt3__113basic_ostreamIcNS_11char_traitsIcEEEE to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev to i8*), i8* bitcast (void (%"class.std::__1::basic_ostream"*)* @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev to i8*)] }, align 8
@_ZTSNSt3__19strstreamE = constant [19 x i8] c"NSt3__19strstreamE\00", align 1
@_ZTINSt3__19strstreamE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @_ZTSNSt3__19strstreamE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__114basic_iostreamIcNS_11char_traitsIcEEEE to i8*) }, align 8

@_ZNSt3__112strstreambufC1El = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i64), void (%"class.std::__1::strstreambuf"*, i64)* @_ZNSt3__112strstreambufC2El
@_ZNSt3__112strstreambufC1EPFPvmEPFvS1_E = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8* (i64)*, void (i8*)*), void (%"class.std::__1::strstreambuf"*, i8* (i64)*, void (i8*)*)* @_ZNSt3__112strstreambufC2EPFPvmEPFvS1_E
@_ZNSt3__112strstreambufC1EPclS1_ = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*), void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*)* @_ZNSt3__112strstreambufC2EPclS1_
@_ZNSt3__112strstreambufC1EPKcl = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64), void (%"class.std::__1::strstreambuf"*, i8*, i64)* @_ZNSt3__112strstreambufC2EPKcl
@_ZNSt3__112strstreambufC1EPalS1_ = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*), void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*)* @_ZNSt3__112strstreambufC2EPalS1_
@_ZNSt3__112strstreambufC1EPKal = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64), void (%"class.std::__1::strstreambuf"*, i8*, i64)* @_ZNSt3__112strstreambufC2EPKal
@_ZNSt3__112strstreambufC1EPhlS1_ = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*), void (%"class.std::__1::strstreambuf"*, i8*, i64, i8*)* @_ZNSt3__112strstreambufC2EPhlS1_
@_ZNSt3__112strstreambufC1EPKhl = unnamed_addr alias void (%"class.std::__1::strstreambuf"*, i8*, i64), void (%"class.std::__1::strstreambuf"*, i8*, i64)* @_ZNSt3__112strstreambufC2EPKhl
@_ZNSt3__112strstreambufD1Ev = unnamed_addr alias void (%"class.std::__1::strstreambuf"*), void (%"class.std::__1::strstreambuf"*)* @_ZNSt3__112strstreambufD2Ev

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2El(%"class.std::__1::strstreambuf"* %0, i64 %1) unnamed_addr #0 align 2 {
  %3 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %3)
  %4 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !3
  %5 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 4, i32* %5, align 8, !tbaa !6
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 %1, i64* %6, align 8, !tbaa !12
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %8 = bitcast i8* (i64)** %7 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %8, i8 0, i64 16, i1 false)
  ret void
}

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"*) unnamed_addr #1

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPFPvmEPFvS1_E(%"class.std::__1::strstreambuf"* %0, i8* (i64)* %1, void (i8*)* %2) unnamed_addr #0 align 2 {
  %4 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %4)
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 4, i32* %6, align 8, !tbaa !6
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  store i8* (i64)* %1, i8* (i64)** %8, align 8, !tbaa !13
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 4
  store void (i8*)* %2, void (i8*)** %9, align 8, !tbaa !14
  ret void
}

; Function Attrs: nofree nounwind uwtable
define void @_ZNSt3__112strstreambuf6__initEPclS1_(%"class.std::__1::strstreambuf"* nocapture %0, i8* %1, i64 %2, i8* %3) local_unnamed_addr #2 align 2 {
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %6, label %8

6:                                                ; preds = %4
  %7 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %11

8:                                                ; preds = %4
  %9 = icmp slt i64 %2, 0
  %10 = select i1 %9, i64 2147483647, i64 %2
  br label %11

11:                                               ; preds = %8, %6
  %12 = phi i64 [ %7, %6 ], [ %10, %8 ]
  %13 = icmp eq i8* %3, null
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = getelementptr inbounds i8, i8* %1, i64 %12
  br label %21

16:                                               ; preds = %11
  %17 = getelementptr inbounds i8, i8* %3, i64 %12
  %18 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %3, i8** %18, align 8, !tbaa !15
  %19 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  store i8* %3, i8** %19, align 8, !tbaa !18
  %20 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  store i8* %17, i8** %20, align 8, !tbaa !19
  br label %21

21:                                               ; preds = %16, %14
  %22 = phi i8* [ %15, %14 ], [ %3, %16 ]
  %23 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %23, align 8
  %24 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %24, align 8
  %25 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %22, i8** %25, align 8
  ret void
}

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #3

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPclS1_(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2, i8* %3) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %5)
  %6 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 0, i32* %7, align 8, !tbaa !6
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %8, align 8, !tbaa !12
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %10 = icmp eq i64 %2, 0
  %11 = bitcast i8* (i64)** %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  br i1 %10, label %12, label %14

12:                                               ; preds = %4
  %13 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %17

14:                                               ; preds = %4
  %15 = icmp slt i64 %2, 0
  %16 = select i1 %15, i64 2147483647, i64 %2
  br label %17

17:                                               ; preds = %14, %12
  %18 = phi i64 [ %13, %12 ], [ %16, %14 ]
  %19 = icmp eq i8* %3, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = getelementptr inbounds i8, i8* %1, i64 %18
  br label %27

22:                                               ; preds = %17
  %23 = getelementptr inbounds i8, i8* %3, i64 %18
  %24 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %3, i8** %24, align 8, !tbaa !15
  %25 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  store i8* %3, i8** %25, align 8, !tbaa !18
  %26 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  store i8* %23, i8** %26, align 8, !tbaa !19
  br label %27

27:                                               ; preds = %22, %20
  %28 = phi i8* [ %21, %20 ], [ %3, %22 ]
  %29 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %29, align 8
  %30 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %30, align 8
  %31 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %28, i8** %31, align 8
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"*) unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPKcl(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %4)
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 2, i32* %6, align 8, !tbaa !6
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %9 = icmp eq i64 %2, 0
  %10 = bitcast i8* (i64)** %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %10, i8 0, i64 16, i1 false)
  br i1 %9, label %11, label %13

11:                                               ; preds = %3
  %12 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %16

13:                                               ; preds = %3
  %14 = icmp slt i64 %2, 0
  %15 = select i1 %14, i64 2147483647, i64 %2
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i64 [ %12, %11 ], [ %15, %13 ]
  %18 = getelementptr inbounds i8, i8* %1, i64 %17
  %19 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %19, align 8
  %20 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %20, align 8
  %21 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %18, i8** %21, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPalS1_(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2, i8* %3) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %5)
  %6 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 0, i32* %7, align 8, !tbaa !6
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %8, align 8, !tbaa !12
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %10 = icmp eq i64 %2, 0
  %11 = bitcast i8* (i64)** %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  br i1 %10, label %12, label %14

12:                                               ; preds = %4
  %13 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %17

14:                                               ; preds = %4
  %15 = icmp slt i64 %2, 0
  %16 = select i1 %15, i64 2147483647, i64 %2
  br label %17

17:                                               ; preds = %14, %12
  %18 = phi i64 [ %13, %12 ], [ %16, %14 ]
  %19 = icmp eq i8* %3, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = getelementptr inbounds i8, i8* %1, i64 %18
  br label %27

22:                                               ; preds = %17
  %23 = getelementptr inbounds i8, i8* %3, i64 %18
  %24 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %3, i8** %24, align 8, !tbaa !15
  %25 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  store i8* %3, i8** %25, align 8, !tbaa !18
  %26 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  store i8* %23, i8** %26, align 8, !tbaa !19
  br label %27

27:                                               ; preds = %22, %20
  %28 = phi i8* [ %21, %20 ], [ %3, %22 ]
  %29 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %29, align 8
  %30 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %30, align 8
  %31 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %28, i8** %31, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPKal(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %4)
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 2, i32* %6, align 8, !tbaa !6
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %9 = icmp eq i64 %2, 0
  %10 = bitcast i8* (i64)** %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %10, i8 0, i64 16, i1 false)
  br i1 %9, label %11, label %13

11:                                               ; preds = %3
  %12 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %16

13:                                               ; preds = %3
  %14 = icmp slt i64 %2, 0
  %15 = select i1 %14, i64 2147483647, i64 %2
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i64 [ %12, %11 ], [ %15, %13 ]
  %18 = getelementptr inbounds i8, i8* %1, i64 %17
  %19 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %19, align 8
  %20 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %20, align 8
  %21 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %18, i8** %21, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPhlS1_(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2, i8* %3) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %5)
  %6 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !3
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 0, i32* %7, align 8, !tbaa !6
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %8, align 8, !tbaa !12
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %10 = icmp eq i64 %2, 0
  %11 = bitcast i8* (i64)** %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  br i1 %10, label %12, label %14

12:                                               ; preds = %4
  %13 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %17

14:                                               ; preds = %4
  %15 = icmp slt i64 %2, 0
  %16 = select i1 %15, i64 2147483647, i64 %2
  br label %17

17:                                               ; preds = %14, %12
  %18 = phi i64 [ %13, %12 ], [ %16, %14 ]
  %19 = icmp eq i8* %3, null
  br i1 %19, label %20, label %22

20:                                               ; preds = %17
  %21 = getelementptr inbounds i8, i8* %1, i64 %18
  br label %27

22:                                               ; preds = %17
  %23 = getelementptr inbounds i8, i8* %3, i64 %18
  %24 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %3, i8** %24, align 8, !tbaa !15
  %25 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  store i8* %3, i8** %25, align 8, !tbaa !18
  %26 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  store i8* %23, i8** %26, align 8, !tbaa !19
  br label %27

27:                                               ; preds = %22, %20
  %28 = phi i8* [ %21, %20 ], [ %3, %22 ]
  %29 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %29, align 8
  %30 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %30, align 8
  %31 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %28, i8** %31, align 8
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambufC2EPKhl(%"class.std::__1::strstreambuf"* %0, i8* %1, i64 %2) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEEC2Ev(%"class.std::__1::basic_streambuf"* %4)
  %5 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %5, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  store i32 2, i32* %6, align 8, !tbaa !6
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  store i64 4096, i64* %7, align 8, !tbaa !12
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %9 = icmp eq i64 %2, 0
  %10 = bitcast i8* (i64)** %8 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %10, i8 0, i64 16, i1 false)
  br i1 %9, label %11, label %13

11:                                               ; preds = %3
  %12 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %1) #13
  br label %16

13:                                               ; preds = %3
  %14 = icmp slt i64 %2, 0
  %15 = select i1 %14, i64 2147483647, i64 %2
  br label %16

16:                                               ; preds = %13, %11
  %17 = phi i64 [ %12, %11 ], [ %15, %13 ]
  %18 = getelementptr inbounds i8, i8* %1, i64 %17
  %19 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  store i8* %1, i8** %19, align 8
  %20 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %1, i8** %20, align 8
  %21 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  store i8* %18, i8** %21, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112strstreambufD2Ev(%"class.std::__1::strstreambuf"* %0) unnamed_addr #5 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  %4 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %5 = load i8*, i8** %4, align 8, !tbaa !20
  %6 = icmp eq i8* %5, null
  br i1 %6, label %21, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %9 = load i32, i32* %8, align 8, !tbaa !6
  %10 = and i32 %9, 9
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %21

12:                                               ; preds = %7
  %13 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 4
  %14 = load void (i8*)*, void (i8*)** %13, align 8, !tbaa !14
  %15 = icmp eq void (i8*)* %14, null
  br i1 %15, label %20, label %16

16:                                               ; preds = %12
  invoke void %14(i8* nonnull %5)
          to label %21 unwind label %17

17:                                               ; preds = %16
  %18 = landingpad { i8*, i32 }
          catch i8* null
  %19 = extractvalue { i8*, i32 } %18, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %3) #14
  tail call void @__clang_call_terminate(i8* %19) #15
  unreachable

20:                                               ; preds = %12
  tail call void @_ZdaPv(i8* nonnull %5) #16
  br label %21

21:                                               ; preds = %7, %1, %16, %20
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* %3) #14
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(i8*) local_unnamed_addr #6

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #7 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #14
  tail call void @_ZSt9terminatev() #15
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112strstreambufD0Ev(%"class.std::__1::strstreambuf"* %0) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  %3 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  %4 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %5 = load i8*, i8** %4, align 8, !tbaa !20
  %6 = icmp eq i8* %5, null
  br i1 %6, label %21, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %9 = load i32, i32* %8, align 8, !tbaa !6
  %10 = and i32 %9, 9
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %21

12:                                               ; preds = %7
  %13 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 4
  %14 = load void (i8*)*, void (i8*)** %13, align 8, !tbaa !14
  %15 = icmp eq void (i8*)* %14, null
  br i1 %15, label %20, label %16

16:                                               ; preds = %12
  invoke void %14(i8* nonnull %5)
          to label %21 unwind label %17

17:                                               ; preds = %16
  %18 = landingpad { i8*, i32 }
          catch i8* null
  %19 = extractvalue { i8*, i32 } %18, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %3) #14
  tail call void @__clang_call_terminate(i8* %19) #15
  unreachable

20:                                               ; preds = %12
  tail call void @_ZdaPv(i8* nonnull %5) #16
  br label %21

21:                                               ; preds = %1, %7, %16, %20
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* %3) #14
  %22 = bitcast %"class.std::__1::strstreambuf"* %0 to i8*
  tail call void @_ZdlPv(i8* %22) #16
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #6

; Function Attrs: uwtable
define void @_ZNSt3__112strstreambuf4swapERS0_(%"class.std::__1::strstreambuf"* %0, %"class.std::__1::strstreambuf"* nonnull align 8 dereferenceable(96) %1) local_unnamed_addr #0 align 2 {
  %3 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0
  %4 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %1, i64 0, i32 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4swapERS3_(%"class.std::__1::basic_streambuf"* %3, %"class.std::__1::basic_streambuf"* nonnull align 8 dereferenceable(64) %4)
  %5 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %6 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %1, i64 0, i32 1
  %7 = load i32, i32* %5, align 4, !tbaa !21
  %8 = load i32, i32* %6, align 8, !tbaa !21
  store i32 %8, i32* %5, align 4, !tbaa !21
  store i32 %7, i32* %6, align 8, !tbaa !21
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  %10 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %1, i64 0, i32 2
  %11 = bitcast i64* %9 to <2 x i64>*
  %12 = load <2 x i64>, <2 x i64>* %11, align 8, !tbaa !22
  %13 = bitcast i64* %10 to <2 x i64>*
  %14 = load <2 x i64>, <2 x i64>* %13, align 8, !tbaa !22
  %15 = bitcast i64* %9 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %15, align 8, !tbaa !22
  %16 = bitcast i64* %10 to <2 x i64>*
  store <2 x i64> %12, <2 x i64>* %16, align 8, !tbaa !22
  %17 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 4
  %18 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %1, i64 0, i32 4
  %19 = bitcast void (i8*)** %17 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !23
  %21 = bitcast void (i8*)** %18 to i64*
  %22 = load i64, i64* %21, align 8, !tbaa !23
  store i64 %22, i64* %19, align 8, !tbaa !23
  store i64 %20, i64* %21, align 8, !tbaa !23
  ret void
}

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4swapERS3_(%"class.std::__1::basic_streambuf"*, %"class.std::__1::basic_streambuf"* nonnull align 8 dereferenceable(64)) local_unnamed_addr #1

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt3__112strstreambuf6freezeEb(%"class.std::__1::strstreambuf"* nocapture %0, i1 zeroext %1) local_unnamed_addr #8 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %4 = load i32, i32* %3, align 8, !tbaa !6
  %5 = and i32 %4, 4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %11, label %7

7:                                                ; preds = %2
  %8 = and i32 %4, -9
  %9 = select i1 %1, i32 8, i32 0
  %10 = or i32 %8, %9
  store i32 %10, i32* %3, align 8, !tbaa !6
  br label %11

11:                                               ; preds = %7, %2
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define i8* @_ZNSt3__112strstreambuf3strEv(%"class.std::__1::strstreambuf"* nocapture %0) local_unnamed_addr #8 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %3 = load i32, i32* %2, align 8, !tbaa !6
  %4 = and i32 %3, 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %1
  %7 = or i32 %3, 8
  store i32 %7, i32* %2, align 8, !tbaa !6
  br label %8

8:                                                ; preds = %1, %6
  %9 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8, !tbaa !20
  ret i8* %10
}

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @_ZNKSt3__112strstreambuf6pcountEv(%"class.std::__1::strstreambuf"* nocapture readonly %0) local_unnamed_addr #9 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %3 = bitcast i8** %2 to i64*
  %4 = load i64, i64* %3, align 8, !tbaa !15
  %5 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  %6 = bitcast i8** %5 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !18
  %8 = sub i64 %4, %7
  %9 = trunc i64 %8 to i32
  ret i32 %9
}

; Function Attrs: uwtable
define i32 @_ZNSt3__112strstreambuf8overflowEi(%"class.std::__1::strstreambuf"* %0, i32 %1) unnamed_addr #0 align 2 {
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %88, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %6 = load i8*, i8** %5, align 8, !tbaa !15
  %7 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  %8 = load i8*, i8** %7, align 8, !tbaa !19
  %9 = icmp eq i8* %6, %8
  br i1 %9, label %10, label %82

10:                                               ; preds = %4
  %11 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %12 = load i32, i32* %11, align 8, !tbaa !6
  %13 = and i32 %12, 12
  %14 = icmp eq i32 %13, 4
  br i1 %14, label %15, label %88

15:                                               ; preds = %10
  %16 = icmp eq i8* %6, null
  br i1 %16, label %17, label %20

17:                                               ; preds = %15
  %18 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %19 = load i8*, i8** %18, align 8, !tbaa !24
  br label %20

20:                                               ; preds = %15, %17
  %21 = phi i8* [ %19, %17 ], [ %6, %15 ]
  %22 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %23 = bitcast i8** %22 to i64*
  %24 = load i64, i64* %23, align 8, !tbaa !20
  %25 = ptrtoint i8* %21 to i64
  %26 = sub i64 %25, %24
  %27 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 2
  %28 = load i64, i64* %27, align 8, !tbaa !12
  %29 = shl i64 %26, 1
  %30 = icmp ult i64 %28, %29
  %31 = select i1 %30, i64 %29, i64 %28
  %32 = icmp eq i64 %31, 0
  %33 = select i1 %32, i64 4096, i64 %31
  %34 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 3
  %35 = load i8* (i64)*, i8* (i64)** %34, align 8, !tbaa !13
  %36 = icmp eq i8* (i64)* %35, null
  br i1 %36, label %37, label %39

37:                                               ; preds = %20
  %38 = tail call noalias nonnull i8* @_Znam(i64 %33) #17
  br label %42

39:                                               ; preds = %20
  %40 = tail call i8* %35(i64 %33)
  %41 = icmp eq i8* %40, null
  br i1 %41, label %88, label %42

42:                                               ; preds = %37, %39
  %43 = phi i8* [ %38, %37 ], [ %40, %39 ]
  %44 = icmp eq i64 %26, 0
  br i1 %44, label %47, label %45

45:                                               ; preds = %42
  %46 = load i8*, i8** %22, align 8, !tbaa !20
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %43, i8* align 1 %46, i64 %26, i1 false)
  br label %47

47:                                               ; preds = %42, %45
  %48 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %49 = bitcast i8** %48 to i64*
  %50 = load i64, i64* %49, align 8, !tbaa !25
  %51 = load i8*, i8** %22, align 8, !tbaa !20
  %52 = ptrtoint i8* %51 to i64
  %53 = sub i64 %50, %52
  %54 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %55 = bitcast i8** %54 to i64*
  %56 = load i64, i64* %55, align 8, !tbaa !24
  %57 = sub i64 %56, %52
  %58 = bitcast i8** %5 to i64*
  %59 = load i64, i64* %58, align 8, !tbaa !15
  %60 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  %61 = bitcast i8** %60 to i64*
  %62 = load i64, i64* %61, align 8, !tbaa !18
  %63 = sub i64 %59, %62
  %64 = load i32, i32* %11, align 8, !tbaa !6
  %65 = and i32 %64, 1
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %75, label %67

67:                                               ; preds = %47
  %68 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 4
  %69 = load void (i8*)*, void (i8*)** %68, align 8, !tbaa !14
  %70 = icmp eq void (i8*)* %69, null
  br i1 %70, label %72, label %71

71:                                               ; preds = %67
  tail call void %69(i8* %51)
  br label %75

72:                                               ; preds = %67
  %73 = icmp eq i8* %51, null
  br i1 %73, label %75, label %74

74:                                               ; preds = %72
  tail call void @_ZdaPv(i8* nonnull %51) #16
  br label %75

75:                                               ; preds = %47, %71, %74, %72
  %76 = getelementptr inbounds i8, i8* %43, i64 %53
  %77 = getelementptr inbounds i8, i8* %43, i64 %57
  store i8* %43, i8** %22, align 8, !tbaa !20
  store i8* %76, i8** %48, align 8, !tbaa !25
  store i8* %77, i8** %54, align 8, !tbaa !24
  %78 = getelementptr inbounds i8, i8* %43, i64 %33
  store i8* %77, i8** %60, align 8, !tbaa !18
  store i8* %78, i8** %7, align 8, !tbaa !19
  %79 = getelementptr inbounds i8, i8* %77, i64 %63
  store i8* %79, i8** %5, align 8, !tbaa !15
  %80 = load i32, i32* %11, align 8, !tbaa !6
  %81 = or i32 %80, 1
  store i32 %81, i32* %11, align 8, !tbaa !6
  br label %82

82:                                               ; preds = %75, %4
  %83 = phi i8* [ %79, %75 ], [ %6, %4 ]
  %84 = trunc i32 %1 to i8
  store i8 %84, i8* %83, align 1, !tbaa !22
  %85 = load i8*, i8** %5, align 8, !tbaa !15
  %86 = getelementptr inbounds i8, i8* %85, i64 1
  store i8* %86, i8** %5, align 8, !tbaa !15
  %87 = and i32 %1, 255
  br label %88

88:                                               ; preds = %39, %10, %2, %82
  %89 = phi i32 [ %87, %82 ], [ 0, %2 ], [ -1, %10 ], [ -1, %39 ]
  ret i32 %89
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znam(i64) local_unnamed_addr #10

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #11

; Function Attrs: nofree norecurse nounwind uwtable
define i32 @_ZNSt3__112strstreambuf9pbackfailEi(%"class.std::__1::strstreambuf"* nocapture %0, i32 %1) unnamed_addr #8 align 2 {
  %3 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %4 = load i8*, i8** %3, align 8, !tbaa !20
  %5 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %6 = load i8*, i8** %5, align 8, !tbaa !25
  %7 = icmp eq i8* %4, %6
  br i1 %7, label %27, label %8

8:                                                ; preds = %2
  %9 = icmp eq i32 %1, -1
  br i1 %9, label %10, label %12

10:                                               ; preds = %8
  %11 = getelementptr inbounds i8, i8* %6, i64 -1
  store i8* %11, i8** %5, align 8, !tbaa !25
  br label %27

12:                                               ; preds = %8
  %13 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 1
  %14 = load i32, i32* %13, align 8, !tbaa !6
  %15 = and i32 %14, 2
  %16 = icmp eq i32 %15, 0
  %17 = getelementptr inbounds i8, i8* %6, i64 -1
  br i1 %16, label %25, label %18

18:                                               ; preds = %12
  %19 = load i8, i8* %17, align 1, !tbaa !22
  %20 = sext i8 %19 to i32
  %21 = shl i32 %1, 24
  %22 = ashr exact i32 %21, 24
  %23 = icmp eq i32 %22, %20
  br i1 %23, label %24, label %27

24:                                               ; preds = %18
  store i8* %17, i8** %5, align 8, !tbaa !25
  br label %27

25:                                               ; preds = %12
  store i8* %17, i8** %5, align 8, !tbaa !25
  %26 = trunc i32 %1 to i8
  store i8 %26, i8* %17, align 1, !tbaa !22
  br label %27

27:                                               ; preds = %18, %2, %25, %24, %10
  %28 = phi i32 [ 0, %10 ], [ %1, %24 ], [ %1, %25 ], [ -1, %2 ], [ -1, %18 ]
  ret i32 %28
}

; Function Attrs: nofree norecurse nounwind uwtable
define i32 @_ZNSt3__112strstreambuf9underflowEv(%"class.std::__1::strstreambuf"* nocapture %0) unnamed_addr #8 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %3 = load i8*, i8** %2, align 8, !tbaa !25
  %4 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %5 = load i8*, i8** %4, align 8, !tbaa !24
  %6 = icmp eq i8* %3, %5
  br i1 %6, label %7, label %12

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %9 = load i8*, i8** %8, align 8, !tbaa !15
  %10 = icmp ult i8* %3, %9
  br i1 %10, label %11, label %15

11:                                               ; preds = %7
  store i8* %9, i8** %4, align 8, !tbaa !24
  br label %12

12:                                               ; preds = %11, %1
  %13 = load i8, i8* %3, align 1, !tbaa !22
  %14 = zext i8 %13 to i32
  br label %15

15:                                               ; preds = %7, %12
  %16 = phi i32 [ %14, %12 ], [ -1, %7 ]
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define { i64, i64 } @_ZNSt3__112strstreambuf7seekoffExNS_8ios_base7seekdirEj(%"class.std::__1::strstreambuf"* %0, i64 %1, i32 %2, i32 %3) unnamed_addr #5 align 2 {
  %5 = and i32 %3, 8
  %6 = icmp eq i32 %5, 0
  %7 = and i32 %3, 16
  %8 = icmp eq i32 %7, 0
  switch i32 %2, label %16 [
    i32 0, label %9
    i32 2, label %9
    i32 1, label %12
  ]

9:                                                ; preds = %4, %4
  %10 = and i32 %3, 24
  %11 = icmp ne i32 %10, 0
  br label %16

12:                                               ; preds = %4
  %13 = lshr exact i32 %5, 3
  %14 = lshr exact i32 %7, 4
  %15 = icmp ne i32 %13, %14
  br label %16

16:                                               ; preds = %9, %12, %4
  %17 = phi i1 [ false, %4 ], [ %15, %12 ], [ %11, %9 ]
  %18 = zext i1 %17 to i8
  br i1 %6, label %24, label %19

19:                                               ; preds = %16
  %20 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %21 = load i8*, i8** %20, align 8, !tbaa !25
  %22 = icmp eq i8* %21, null
  %23 = select i1 %22, i8 0, i8 %18
  br label %24

24:                                               ; preds = %19, %16
  %25 = phi i8 [ %18, %16 ], [ %23, %19 ]
  br i1 %8, label %32, label %26

26:                                               ; preds = %24
  %27 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %28 = load i8*, i8** %27, align 8, !tbaa !15
  %29 = icmp eq i8* %28, null
  %30 = icmp eq i8 %25, 0
  %31 = or i1 %29, %30
  br i1 %31, label %86, label %34

32:                                               ; preds = %24
  %33 = icmp eq i8 %25, 0
  br i1 %33, label %86, label %34

34:                                               ; preds = %26, %32
  %35 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  %36 = load i8*, i8** %35, align 8, !tbaa !19
  %37 = icmp eq i8* %36, null
  br i1 %37, label %38, label %41

38:                                               ; preds = %34
  %39 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %40 = load i8*, i8** %39, align 8, !tbaa !24
  br label %41

41:                                               ; preds = %34, %38
  %42 = phi i8* [ %40, %38 ], [ %36, %34 ]
  switch i32 %2, label %59 [
    i32 0, label %60
    i32 1, label %43
    i32 2, label %53
  ]

43:                                               ; preds = %41
  %44 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %45 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %46 = select i1 %6, i8** %45, i8** %44
  %47 = bitcast i8** %46 to i64*
  %48 = load i64, i64* %47, align 8, !tbaa !23
  %49 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %50 = bitcast i8** %49 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !20
  %52 = sub i64 %48, %51
  br label %60

53:                                               ; preds = %41
  %54 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %55 = bitcast i8** %54 to i64*
  %56 = load i64, i64* %55, align 8, !tbaa !20
  %57 = ptrtoint i8* %42 to i64
  %58 = sub i64 %57, %56
  br label %60

59:                                               ; preds = %41
  unreachable

60:                                               ; preds = %41, %53, %43
  %61 = phi i64 [ %58, %53 ], [ %52, %43 ], [ 0, %41 ]
  %62 = add nsw i64 %61, %1
  %63 = icmp sgt i64 %62, -1
  br i1 %63, label %64, label %86

64:                                               ; preds = %60
  %65 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %66 = load i8*, i8** %65, align 8, !tbaa !20
  %67 = ptrtoint i8* %42 to i64
  %68 = ptrtoint i8* %66 to i64
  %69 = sub i64 %67, %68
  %70 = icmp sgt i64 %62, %69
  br i1 %70, label %86, label %71

71:                                               ; preds = %64
  %72 = getelementptr inbounds i8, i8* %66, i64 %62
  br i1 %6, label %79, label %73

73:                                               ; preds = %71
  %74 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %75 = load i8*, i8** %74, align 8, !tbaa !24
  %76 = icmp ult i8* %72, %75
  %77 = select i1 %76, i8* %75, i8* %72
  %78 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %72, i8** %78, align 8, !tbaa !25
  store i8* %77, i8** %74, align 8, !tbaa !24
  br label %79

79:                                               ; preds = %71, %73
  br i1 %8, label %86, label %80

80:                                               ; preds = %79
  %81 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  %82 = load i8*, i8** %81, align 8, !tbaa !18
  %83 = icmp ult i8* %72, %82
  %84 = select i1 %83, i8* %72, i8* %82
  %85 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %84, i8** %81, align 8, !tbaa !18
  store i8* %72, i8** %85, align 8, !tbaa !15
  br label %86

86:                                               ; preds = %26, %80, %79, %60, %64, %32
  %87 = phi i64 [ -1, %32 ], [ -1, %64 ], [ -1, %60 ], [ %62, %79 ], [ %62, %80 ], [ -1, %26 ]
  %88 = insertvalue { i64, i64 } { i64 0, i64 undef }, i64 %87, 1
  ret { i64, i64 } %88
}

; Function Attrs: nounwind uwtable
define { i64, i64 } @_ZNSt3__112strstreambuf7seekposENS_4fposI11__mbstate_tEEj(%"class.std::__1::strstreambuf"* nocapture %0, i64 %1, i64 %2, i32 %3) unnamed_addr #5 align 2 {
  %5 = and i32 %3, 8
  %6 = icmp eq i32 %5, 0
  %7 = and i32 %3, 16
  %8 = icmp eq i32 %7, 0
  %9 = and i32 %3, 24
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %53, label %11

11:                                               ; preds = %4
  br i1 %6, label %16, label %12

12:                                               ; preds = %11
  %13 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  %14 = load i8*, i8** %13, align 8, !tbaa !25
  %15 = icmp eq i8* %14, null
  br i1 %15, label %53, label %16

16:                                               ; preds = %11, %12
  br i1 %8, label %21, label %17

17:                                               ; preds = %16
  %18 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  %19 = load i8*, i8** %18, align 8, !tbaa !15
  %20 = icmp eq i8* %19, null
  br i1 %20, label %53, label %21

21:                                               ; preds = %16, %17
  %22 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 7
  %23 = load i8*, i8** %22, align 8, !tbaa !19
  %24 = icmp eq i8* %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %21
  %26 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %27 = load i8*, i8** %26, align 8, !tbaa !24
  br label %28

28:                                               ; preds = %21, %25
  %29 = phi i8* [ %27, %25 ], [ %23, %21 ]
  %30 = icmp sgt i64 %2, -1
  br i1 %30, label %31, label %53

31:                                               ; preds = %28
  %32 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 2
  %33 = load i8*, i8** %32, align 8, !tbaa !20
  %34 = ptrtoint i8* %29 to i64
  %35 = ptrtoint i8* %33 to i64
  %36 = sub i64 %34, %35
  %37 = icmp slt i64 %36, %2
  br i1 %37, label %53, label %38

38:                                               ; preds = %31
  %39 = getelementptr inbounds i8, i8* %33, i64 %2
  br i1 %6, label %46, label %40

40:                                               ; preds = %38
  %41 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 4
  %42 = load i8*, i8** %41, align 8, !tbaa !24
  %43 = icmp ult i8* %39, %42
  %44 = select i1 %43, i8* %42, i8* %39
  %45 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 3
  store i8* %39, i8** %45, align 8, !tbaa !25
  store i8* %44, i8** %41, align 8, !tbaa !24
  br label %46

46:                                               ; preds = %38, %40
  br i1 %8, label %53, label %47

47:                                               ; preds = %46
  %48 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 5
  %49 = load i8*, i8** %48, align 8, !tbaa !18
  %50 = icmp ult i8* %39, %49
  %51 = select i1 %50, i8* %39, i8* %49
  %52 = getelementptr inbounds %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %0, i64 0, i32 0, i32 6
  store i8* %51, i8** %48, align 8, !tbaa !18
  store i8* %39, i8** %52, align 8, !tbaa !15
  br label %53

53:                                               ; preds = %4, %47, %46, %28, %31, %12, %17
  %54 = phi i64 [ -1, %12 ], [ -1, %17 ], [ -1, %4 ], [ -1, %31 ], [ -1, %28 ], [ %2, %46 ], [ %2, %47 ]
  %55 = insertvalue { i64, i64 } { i64 0, i64 undef }, i64 %54, 1
  ret { i64, i64 } %55
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110istrstreamD2Ev(%"class.std::__1::istrstream"* %0, i8** %1) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = bitcast i8** %1 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %"class.std::__1::istrstream"* %0 to i64*
  store i64 %4, i64* %5, align 8, !tbaa !3
  %6 = getelementptr inbounds i8*, i8** %1, i64 3
  %7 = bitcast i8** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = inttoptr i64 %4 to i8*
  %10 = getelementptr i8, i8* %9, i64 -24
  %11 = bitcast i8* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = bitcast %"class.std::__1::istrstream"* %0 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 %12
  %15 = bitcast i8* %14 to i64*
  store i64 %8, i64* %15, align 8, !tbaa !3
  %16 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1
  %17 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %16, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %17, align 8, !tbaa !3
  %18 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %16, i64 0, i32 0
  %19 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !20
  %21 = icmp eq i8* %20, null
  br i1 %21, label %36, label %22

22:                                               ; preds = %2
  %23 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 1
  %24 = load i32, i32* %23, align 8, !tbaa !6
  %25 = and i32 %24, 9
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %36

27:                                               ; preds = %22
  %28 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 4
  %29 = load void (i8*)*, void (i8*)** %28, align 8, !tbaa !14
  %30 = icmp eq void (i8*)* %29, null
  br i1 %30, label %35, label %31

31:                                               ; preds = %27
  invoke void %29(i8* nonnull %20)
          to label %36 unwind label %32

32:                                               ; preds = %31
  %33 = landingpad { i8*, i32 }
          catch i8* null
  %34 = extractvalue { i8*, i32 } %33, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %18) #14
  tail call void @__clang_call_terminate(i8* %34) #15
  unreachable

35:                                               ; preds = %27
  tail call void @_ZdaPv(i8* nonnull %20) #16
  br label %36

36:                                               ; preds = %2, %22, %31, %35
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %18) #14
  %37 = bitcast %"class.std::__1::istrstream"* %0 to %"class.std::__1::basic_istream"*
  %38 = getelementptr inbounds i8*, i8** %1, i64 1
  tail call void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_istream"* %37, i8** nonnull %38) #14
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_istream"*, i8**) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110istrstreamD1Ev(%"class.std::__1::istrstream"* %0) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"class.std::__1::istrstream"* %0 to i64*
  store i64 ptrtoint (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110istrstreamE, i64 0, inrange i32 0, i64 3) to i64), i64* %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 2
  %4 = bitcast %"class.std::__1::basic_ios.base"* %3 to i64*
  store i64 ptrtoint (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110istrstreamE, i64 0, inrange i32 1, i64 3) to i64), i64* %4, align 8, !tbaa !3
  %5 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1
  %6 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %5, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !3
  %7 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %5, i64 0, i32 0
  %8 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8, !tbaa !20
  %10 = icmp eq i8* %9, null
  br i1 %10, label %25, label %11

11:                                               ; preds = %1
  %12 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 1
  %13 = load i32, i32* %12, align 8, !tbaa !6
  %14 = and i32 %13, 9
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %25

16:                                               ; preds = %11
  %17 = getelementptr inbounds %"class.std::__1::istrstream", %"class.std::__1::istrstream"* %0, i64 0, i32 1, i32 4
  %18 = load void (i8*)*, void (i8*)** %17, align 8, !tbaa !14
  %19 = icmp eq void (i8*)* %18, null
  br i1 %19, label %24, label %20

20:                                               ; preds = %16
  invoke void %18(i8* nonnull %9)
          to label %25 unwind label %21

21:                                               ; preds = %20
  %22 = landingpad { i8*, i32 }
          catch i8* null
  %23 = extractvalue { i8*, i32 } %22, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %7) #14
  tail call void @__clang_call_terminate(i8* %23) #15
  unreachable

24:                                               ; preds = %16
  tail call void @_ZdaPv(i8* nonnull %9) #16
  br label %25

25:                                               ; preds = %1, %11, %20, %24
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %7) #14
  %26 = bitcast %"class.std::__1::istrstream"* %0 to %"class.std::__1::basic_istream"*
  tail call void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_istream"* %26, i8** nonnull getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTTNSt3__110istrstreamE, i64 0, i64 1)) #14
  %27 = bitcast %"class.std::__1::basic_ios.base"* %3 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %27) #14
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__110istrstreamD1Ev(%"class.std::__1::istrstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::istrstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::istrstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::istrstream"*
  tail call void @_ZNSt3__110istrstreamD1Ev(%"class.std::__1::istrstream"* %9) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110istrstreamD0Ev(%"class.std::__1::istrstream"* %0) unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__110istrstreamD1Ev(%"class.std::__1::istrstream"* %0) #14
  %2 = bitcast %"class.std::__1::istrstream"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__110istrstreamD0Ev(%"class.std::__1::istrstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::istrstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::istrstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::istrstream"*
  tail call void @_ZNSt3__110istrstreamD1Ev(%"class.std::__1::istrstream"* %9) #14
  tail call void @_ZdlPv(i8* %8) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110ostrstreamD2Ev(%"class.std::__1::ostrstream"* %0, i8** %1) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = bitcast i8** %1 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %"class.std::__1::ostrstream"* %0 to i64*
  store i64 %4, i64* %5, align 8, !tbaa !3
  %6 = getelementptr inbounds i8*, i8** %1, i64 3
  %7 = bitcast i8** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = inttoptr i64 %4 to i8*
  %10 = getelementptr i8, i8* %9, i64 -24
  %11 = bitcast i8* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = bitcast %"class.std::__1::ostrstream"* %0 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 %12
  %15 = bitcast i8* %14 to i64*
  store i64 %8, i64* %15, align 8, !tbaa !3
  %16 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1
  %17 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %16, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %17, align 8, !tbaa !3
  %18 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %16, i64 0, i32 0
  %19 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 0, i32 2
  %20 = load i8*, i8** %19, align 8, !tbaa !20
  %21 = icmp eq i8* %20, null
  br i1 %21, label %36, label %22

22:                                               ; preds = %2
  %23 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 1
  %24 = load i32, i32* %23, align 8, !tbaa !6
  %25 = and i32 %24, 9
  %26 = icmp eq i32 %25, 1
  br i1 %26, label %27, label %36

27:                                               ; preds = %22
  %28 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 4
  %29 = load void (i8*)*, void (i8*)** %28, align 8, !tbaa !14
  %30 = icmp eq void (i8*)* %29, null
  br i1 %30, label %35, label %31

31:                                               ; preds = %27
  invoke void %29(i8* nonnull %20)
          to label %36 unwind label %32

32:                                               ; preds = %31
  %33 = landingpad { i8*, i32 }
          catch i8* null
  %34 = extractvalue { i8*, i32 } %33, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %18) #14
  tail call void @__clang_call_terminate(i8* %34) #15
  unreachable

35:                                               ; preds = %27
  tail call void @_ZdaPv(i8* nonnull %20) #16
  br label %36

36:                                               ; preds = %2, %22, %31, %35
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %18) #14
  %37 = bitcast %"class.std::__1::ostrstream"* %0 to %"class.std::__1::basic_ostream"*
  %38 = getelementptr inbounds i8*, i8** %1, i64 1
  tail call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ostream"* %37, i8** nonnull %38) #14
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ostream"*, i8**) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110ostrstreamD1Ev(%"class.std::__1::ostrstream"* %0) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"class.std::__1::ostrstream"* %0 to i64*
  store i64 ptrtoint (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110ostrstreamE, i64 0, inrange i32 0, i64 3) to i64), i64* %2, align 8, !tbaa !3
  %3 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 2
  %4 = bitcast %"class.std::__1::basic_ios.base"* %3 to i64*
  store i64 ptrtoint (i8** getelementptr inbounds ({ [5 x i8*], [5 x i8*] }, { [5 x i8*], [5 x i8*] }* @_ZTVNSt3__110ostrstreamE, i64 0, inrange i32 1, i64 3) to i64), i64* %4, align 8, !tbaa !3
  %5 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1
  %6 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %5, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %6, align 8, !tbaa !3
  %7 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %5, i64 0, i32 0
  %8 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8, !tbaa !20
  %10 = icmp eq i8* %9, null
  br i1 %10, label %25, label %11

11:                                               ; preds = %1
  %12 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 1
  %13 = load i32, i32* %12, align 8, !tbaa !6
  %14 = and i32 %13, 9
  %15 = icmp eq i32 %14, 1
  br i1 %15, label %16, label %25

16:                                               ; preds = %11
  %17 = getelementptr inbounds %"class.std::__1::ostrstream", %"class.std::__1::ostrstream"* %0, i64 0, i32 1, i32 4
  %18 = load void (i8*)*, void (i8*)** %17, align 8, !tbaa !14
  %19 = icmp eq void (i8*)* %18, null
  br i1 %19, label %24, label %20

20:                                               ; preds = %16
  invoke void %18(i8* nonnull %9)
          to label %25 unwind label %21

21:                                               ; preds = %20
  %22 = landingpad { i8*, i32 }
          catch i8* null
  %23 = extractvalue { i8*, i32 } %22, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %7) #14
  tail call void @__clang_call_terminate(i8* %23) #15
  unreachable

24:                                               ; preds = %16
  tail call void @_ZdaPv(i8* nonnull %9) #16
  br label %25

25:                                               ; preds = %1, %11, %20, %24
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %7) #14
  %26 = bitcast %"class.std::__1::ostrstream"* %0 to %"class.std::__1::basic_ostream"*
  tail call void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ostream"* %26, i8** nonnull getelementptr inbounds ([4 x i8*], [4 x i8*]* @_ZTTNSt3__110ostrstreamE, i64 0, i64 1)) #14
  %27 = bitcast %"class.std::__1::basic_ios.base"* %3 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %27) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__110ostrstreamD1Ev(%"class.std::__1::ostrstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::ostrstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::ostrstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::ostrstream"*
  tail call void @_ZNSt3__110ostrstreamD1Ev(%"class.std::__1::ostrstream"* %9) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__110ostrstreamD0Ev(%"class.std::__1::ostrstream"* %0) unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__110ostrstreamD1Ev(%"class.std::__1::ostrstream"* %0) #14
  %2 = bitcast %"class.std::__1::ostrstream"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__110ostrstreamD0Ev(%"class.std::__1::ostrstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::ostrstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::ostrstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::ostrstream"*
  tail call void @_ZNSt3__110ostrstreamD1Ev(%"class.std::__1::ostrstream"* %9) #14
  tail call void @_ZdlPv(i8* %8) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* %0, i8** %1) unnamed_addr #5 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = bitcast i8** %1 to i64*
  %4 = load i64, i64* %3, align 8
  %5 = bitcast %"class.std::__1::strstream"* %0 to i64*
  store i64 %4, i64* %5, align 8, !tbaa !3
  %6 = getelementptr inbounds i8*, i8** %1, i64 8
  %7 = bitcast i8** %6 to i64*
  %8 = load i64, i64* %7, align 8
  %9 = inttoptr i64 %4 to i8*
  %10 = getelementptr i8, i8* %9, i64 -24
  %11 = bitcast i8* %10 to i64*
  %12 = load i64, i64* %11, align 8
  %13 = bitcast %"class.std::__1::strstream"* %0 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 %12
  %15 = bitcast i8* %14 to i64*
  store i64 %8, i64* %15, align 8, !tbaa !3
  %16 = getelementptr inbounds i8*, i8** %1, i64 9
  %17 = bitcast i8** %16 to i64*
  %18 = load i64, i64* %17, align 8
  %19 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 0, i32 1
  %20 = bitcast %"class.std::__1::basic_ostream.base"* %19 to i64*
  store i64 %18, i64* %20, align 8, !tbaa !3
  %21 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 1
  %22 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %21, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [16 x i8*] }, { [16 x i8*] }* @_ZTVNSt3__112strstreambufE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %22, align 8, !tbaa !3
  %23 = getelementptr %"class.std::__1::strstreambuf", %"class.std::__1::strstreambuf"* %21, i64 0, i32 0
  %24 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 1, i32 0, i32 2
  %25 = load i8*, i8** %24, align 8, !tbaa !20
  %26 = icmp eq i8* %25, null
  br i1 %26, label %41, label %27

27:                                               ; preds = %2
  %28 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 1, i32 1
  %29 = load i32, i32* %28, align 8, !tbaa !6
  %30 = and i32 %29, 9
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %41

32:                                               ; preds = %27
  %33 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 1, i32 4
  %34 = load void (i8*)*, void (i8*)** %33, align 8, !tbaa !14
  %35 = icmp eq void (i8*)* %34, null
  br i1 %35, label %40, label %36

36:                                               ; preds = %32
  invoke void %34(i8* nonnull %25)
          to label %41 unwind label %37

37:                                               ; preds = %36
  %38 = landingpad { i8*, i32 }
          catch i8* null
  %39 = extractvalue { i8*, i32 } %38, 0
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %23) #14
  tail call void @__clang_call_terminate(i8* %39) #15
  unreachable

40:                                               ; preds = %32
  tail call void @_ZdaPv(i8* nonnull %25) #16
  br label %41

41:                                               ; preds = %2, %27, %36, %40
  tail call void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_streambuf"* nonnull %23) #14
  %42 = bitcast %"class.std::__1::strstream"* %0 to %"class.std::__1::basic_iostream"*
  %43 = getelementptr inbounds i8*, i8** %1, i64 1
  tail call void @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_iostream"* %42, i8** nonnull %43) #14
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_iostream"*, i8**) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZNSt3__19strstreamD1Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* %0, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %2 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 2
  %3 = bitcast %"class.std::__1::basic_ios.base"* %2 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %3) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZThn16_NSt3__19strstreamD1Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 -1, i32 2, i32 1
  %3 = bitcast %"class.std::__1::basic_ostream"** %2 to %"class.std::__1::strstream"*
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* nonnull %3, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %4 = getelementptr inbounds %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %2, i64 15
  %5 = bitcast %"class.std::__1::basic_ostream"** %4 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %5) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__19strstreamD1Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::strstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::strstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::strstream"*
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* %9, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %10 = getelementptr inbounds i8, i8* %8, i64 120
  %11 = bitcast i8* %10 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %11) #14
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__19strstreamD0Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* %0, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %2 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 0, i32 2
  %3 = bitcast %"class.std::__1::basic_ios.base"* %2 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %3) #14
  %4 = bitcast %"class.std::__1::strstream"* %0 to i8*
  tail call void @_ZdlPv(i8* %4) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZThn16_NSt3__19strstreamD0Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::strstream", %"class.std::__1::strstream"* %0, i64 -1, i32 2, i32 1
  %3 = bitcast %"class.std::__1::basic_ostream"** %2 to %"class.std::__1::strstream"*
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* nonnull %3, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %4 = getelementptr inbounds %"class.std::__1::basic_ostream"*, %"class.std::__1::basic_ostream"** %2, i64 15
  %5 = bitcast %"class.std::__1::basic_ostream"** %4 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %5) #14
  %6 = bitcast %"class.std::__1::basic_ostream"** %2 to i8*
  tail call void @_ZdlPv(i8* nonnull %6) #16
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZTv0_n24_NSt3__19strstreamD0Ev(%"class.std::__1::strstream"* %0) unnamed_addr #5 align 2 {
  %2 = bitcast %"class.std::__1::strstream"* %0 to i8*
  %3 = bitcast %"class.std::__1::strstream"* %0 to i8**
  %4 = load i8*, i8** %3, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 -24
  %6 = bitcast i8* %5 to i64*
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds i8, i8* %2, i64 %7
  %9 = bitcast i8* %8 to %"class.std::__1::strstream"*
  tail call void @_ZNSt3__19strstreamD2Ev(%"class.std::__1::strstream"* %9, i8** getelementptr inbounds ([10 x i8*], [10 x i8*]* @_ZTTNSt3__19strstreamE, i64 0, i64 0)) #14
  %10 = getelementptr inbounds i8, i8* %8, i64 120
  %11 = bitcast i8* %10 to %"class.std::__1::basic_ios"*
  tail call void @_ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev(%"class.std::__1::basic_ios"* nonnull %11) #14
  tail call void @_ZdlPv(i8* %8) #16
  ret void
}

declare void @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5imbueERKNS_6localeE(%"class.std::__1::basic_streambuf"*, %"class.std::__1::locale"* nonnull align 8 dereferenceable(8)) unnamed_addr #1

declare %"class.std::__1::basic_streambuf"* @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6setbufEPcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #1

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE4syncEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #1

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE9showmanycEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #1

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsgetnEPcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #1

declare i32 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE5uflowEv(%"class.std::__1::basic_streambuf"*) unnamed_addr #1

declare i64 @_ZNSt3__115basic_streambufIcNS_11char_traitsIcEEE6xsputnEPKcl(%"class.std::__1::basic_streambuf"*, i8*, i64) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_istream"*) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_istream"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_istream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__113basic_istreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_istream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_ostream"*) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_ostream"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_ostream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__113basic_ostreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_ostream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind
declare void @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #4

; Function Attrs: nounwind
declare void @_ZNSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
declare void @_ZThn16_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
declare void @_ZThn16_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED1Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #5 align 2

; Function Attrs: nounwind uwtable
declare void @_ZTv0_n24_NSt3__114basic_iostreamIcNS_11char_traitsIcEEED0Ev(%"class.std::__1::basic_iostream"*) unnamed_addr #5 align 2

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #12

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { argmemonly nounwind willreturn }
attributes #12 = { argmemonly nounwind willreturn writeonly }
attributes #13 = { nounwind readonly }
attributes #14 = { nounwind }
attributes #15 = { noreturn nounwind }
attributes #16 = { builtin nounwind }
attributes #17 = { builtin allocsize(0) }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 64}
!7 = !{!"_ZTSNSt3__112strstreambufE", !8, i64 64, !10, i64 72, !11, i64 80, !11, i64 88}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !5, i64 0}
!10 = !{!"long", !9, i64 0}
!11 = !{!"any pointer", !9, i64 0}
!12 = !{!7, !10, i64 72}
!13 = !{!7, !11, i64 80}
!14 = !{!7, !11, i64 88}
!15 = !{!16, !11, i64 48}
!16 = !{!"_ZTSNSt3__115basic_streambufIcNS_11char_traitsIcEEEE", !17, i64 8, !11, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !11, i64 56}
!17 = !{!"_ZTSNSt3__16localeE", !11, i64 0}
!18 = !{!16, !11, i64 40}
!19 = !{!16, !11, i64 56}
!20 = !{!16, !11, i64 16}
!21 = !{!8, !8, i64 0}
!22 = !{!9, !9, i64 0}
!23 = !{!11, !11, i64 0}
!24 = !{!16, !11, i64 32}
!25 = !{!16, !11, i64 24}

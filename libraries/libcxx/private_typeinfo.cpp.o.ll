; ModuleID = 'll/.private_typeinfo.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/private_typeinfo.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.__cxxabiv1::__shim_type_info" = type { %"class.std::type_info" }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"class.__cxxabiv1::__fundamental_type_info" = type { %"class.__cxxabiv1::__shim_type_info" }
%"class.__cxxabiv1::__array_type_info" = type { %"class.__cxxabiv1::__shim_type_info" }
%"class.__cxxabiv1::__function_type_info" = type { %"class.__cxxabiv1::__shim_type_info" }
%"class.__cxxabiv1::__enum_type_info" = type { %"class.__cxxabiv1::__shim_type_info" }
%"class.__cxxabiv1::__class_type_info" = type { %"class.__cxxabiv1::__shim_type_info" }
%"class.__cxxabiv1::__si_class_type_info" = type { %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* }
%"class.__cxxabiv1::__vmi_class_type_info" = type { %"class.__cxxabiv1::__class_type_info", i32, i32, [1 x %"struct.__cxxabiv1::__base_class_type_info"] }
%"struct.__cxxabiv1::__base_class_type_info" = type { %"class.__cxxabiv1::__class_type_info"*, i64 }
%"class.__cxxabiv1::__pbase_type_info" = type { %"class.__cxxabiv1::__shim_type_info", i32, %"class.__cxxabiv1::__shim_type_info"* }
%"class.__cxxabiv1::__pointer_type_info" = type { %"class.__cxxabiv1::__pbase_type_info" }
%"class.__cxxabiv1::__pointer_to_member_type_info" = type { %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__class_type_info"* }
%"struct.__cxxabiv1::__dynamic_cast_info" = type { %"class.__cxxabiv1::__class_type_info"*, i8*, %"class.__cxxabiv1::__class_type_info"*, i64, i8*, i8*, i32, i32, i32, i32, i32, i32, i32, i8, i8, i8 }

@_ZTSN10__cxxabiv116__shim_type_infoE = constant [33 x i8] c"N10__cxxabiv116__shim_type_infoE\00", align 1
@_ZTISt9type_info = external constant i8*
@_ZTIN10__cxxabiv116__shim_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @_ZTSN10__cxxabiv116__shim_type_infoE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9type_info to i8*) }, align 8
@_ZTSN10__cxxabiv117__class_type_infoE = constant [34 x i8] c"N10__cxxabiv117__class_type_infoE\00", align 1
@_ZTIN10__cxxabiv117__class_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSN10__cxxabiv117__class_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTSN10__cxxabiv117__pbase_type_infoE = constant [34 x i8] c"N10__cxxabiv117__pbase_type_infoE\00", align 1
@_ZTIN10__cxxabiv117__pbase_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSN10__cxxabiv117__pbase_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTSN10__cxxabiv119__pointer_type_infoE = constant [36 x i8] c"N10__cxxabiv119__pointer_type_infoE\00", align 1
@_ZTIN10__cxxabiv119__pointer_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @_ZTSN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to i8*) }, align 8
@_ZTSN10__cxxabiv120__function_type_infoE = constant [37 x i8] c"N10__cxxabiv120__function_type_infoE\00", align 1
@_ZTIN10__cxxabiv120__function_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @_ZTSN10__cxxabiv120__function_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTSN10__cxxabiv129__pointer_to_member_type_infoE = constant [46 x i8] c"N10__cxxabiv129__pointer_to_member_type_infoE\00", align 1
@_ZTIN10__cxxabiv129__pointer_to_member_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([46 x i8], [46 x i8]* @_ZTSN10__cxxabiv129__pointer_to_member_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to i8*) }, align 8
@_ZZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPvE12null_ptr_rep = internal constant { i64, i64 } zeroinitializer, align 8
@_ZZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPvE12null_ptr_rep_0 = internal constant i64 -1, align 8
@_ZTVN10__cxxabiv116__shim_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)] }, align 8
@_ZTVN10__cxxabiv123__fundamental_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv123__fundamental_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__fundamental_type_info"*)* @_ZN10__cxxabiv123__fundamental_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__fundamental_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv123__fundamental_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTSN10__cxxabiv123__fundamental_type_infoE = constant [40 x i8] c"N10__cxxabiv123__fundamental_type_infoE\00", align 1
@_ZTIN10__cxxabiv123__fundamental_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @_ZTSN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTSv = constant [2 x i8] c"v\00", align 1
@_ZTIv = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSv, i32 0, i32 0) }, align 8
@_ZTSPv = constant [3 x i8] c"Pv\00", align 1
@_ZTIPv = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPv, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIv to i8*) }, align 8
@_ZTSPKv = constant [4 x i8] c"PKv\00", align 1
@_ZTIPKv = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKv, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIv to i8*) }, align 8
@_ZTSDn = constant [3 x i8] c"Dn\00", align 1
@_ZTIDn = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDn, i32 0, i32 0) }, align 8
@_ZTSPDn = constant [4 x i8] c"PDn\00", align 1
@_ZTIPDn = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPDn, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIDn to i8*) }, align 8
@_ZTSPKDn = constant [5 x i8] c"PKDn\00", align 1
@_ZTIPKDn = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTSPKDn, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIDn to i8*) }, align 8
@_ZTSb = constant [2 x i8] c"b\00", align 1
@_ZTIb = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSb, i32 0, i32 0) }, align 8
@_ZTSPb = constant [3 x i8] c"Pb\00", align 1
@_ZTIPb = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPb, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIb to i8*) }, align 8
@_ZTSPKb = constant [4 x i8] c"PKb\00", align 1
@_ZTIPKb = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKb, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIb to i8*) }, align 8
@_ZTSw = constant [2 x i8] c"w\00", align 1
@_ZTIw = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSw, i32 0, i32 0) }, align 8
@_ZTSPw = constant [3 x i8] c"Pw\00", align 1
@_ZTIPw = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPw, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIw to i8*) }, align 8
@_ZTSPKw = constant [4 x i8] c"PKw\00", align 1
@_ZTIPKw = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKw, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIw to i8*) }, align 8
@_ZTSc = constant [2 x i8] c"c\00", align 1
@_ZTIc = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSc, i32 0, i32 0) }, align 8
@_ZTSPc = constant [3 x i8] c"Pc\00", align 1
@_ZTIPc = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPc, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIc to i8*) }, align 8
@_ZTSPKc = constant [4 x i8] c"PKc\00", align 1
@_ZTIPKc = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKc, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIc to i8*) }, align 8
@_ZTSh = constant [2 x i8] c"h\00", align 1
@_ZTIh = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSh, i32 0, i32 0) }, align 8
@_ZTSPh = constant [3 x i8] c"Ph\00", align 1
@_ZTIPh = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPh, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIh to i8*) }, align 8
@_ZTSPKh = constant [4 x i8] c"PKh\00", align 1
@_ZTIPKh = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKh, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIh to i8*) }, align 8
@_ZTSa = constant [2 x i8] c"a\00", align 1
@_ZTIa = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSa, i32 0, i32 0) }, align 8
@_ZTSPa = constant [3 x i8] c"Pa\00", align 1
@_ZTIPa = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPa, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIa to i8*) }, align 8
@_ZTSPKa = constant [4 x i8] c"PKa\00", align 1
@_ZTIPKa = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKa, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIa to i8*) }, align 8
@_ZTSs = constant [2 x i8] c"s\00", align 1
@_ZTIs = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSs, i32 0, i32 0) }, align 8
@_ZTSPs = constant [3 x i8] c"Ps\00", align 1
@_ZTIPs = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPs, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIs to i8*) }, align 8
@_ZTSPKs = constant [4 x i8] c"PKs\00", align 1
@_ZTIPKs = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKs, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIs to i8*) }, align 8
@_ZTSt = constant [2 x i8] c"t\00", align 1
@_ZTIt = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSt, i32 0, i32 0) }, align 8
@_ZTSPt = constant [3 x i8] c"Pt\00", align 1
@_ZTIPt = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPt, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIt to i8*) }, align 8
@_ZTSPKt = constant [4 x i8] c"PKt\00", align 1
@_ZTIPKt = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKt, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIt to i8*) }, align 8
@_ZTSi = constant [2 x i8] c"i\00", align 1
@_ZTIi = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSi, i32 0, i32 0) }, align 8
@_ZTSPi = constant [3 x i8] c"Pi\00", align 1
@_ZTIPi = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPi, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIi to i8*) }, align 8
@_ZTSPKi = constant [4 x i8] c"PKi\00", align 1
@_ZTIPKi = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKi, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIi to i8*) }, align 8
@_ZTSj = constant [2 x i8] c"j\00", align 1
@_ZTIj = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSj, i32 0, i32 0) }, align 8
@_ZTSPj = constant [3 x i8] c"Pj\00", align 1
@_ZTIPj = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPj, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIj to i8*) }, align 8
@_ZTSPKj = constant [4 x i8] c"PKj\00", align 1
@_ZTIPKj = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKj, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIj to i8*) }, align 8
@_ZTSl = constant [2 x i8] c"l\00", align 1
@_ZTIl = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSl, i32 0, i32 0) }, align 8
@_ZTSPl = constant [3 x i8] c"Pl\00", align 1
@_ZTIPl = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPl, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIl to i8*) }, align 8
@_ZTSPKl = constant [4 x i8] c"PKl\00", align 1
@_ZTIPKl = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKl, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIl to i8*) }, align 8
@_ZTSm = constant [2 x i8] c"m\00", align 1
@_ZTIm = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSm, i32 0, i32 0) }, align 8
@_ZTSPm = constant [3 x i8] c"Pm\00", align 1
@_ZTIPm = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPm, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIm to i8*) }, align 8
@_ZTSPKm = constant [4 x i8] c"PKm\00", align 1
@_ZTIPKm = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKm, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIm to i8*) }, align 8
@_ZTSx = constant [2 x i8] c"x\00", align 1
@_ZTIx = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSx, i32 0, i32 0) }, align 8
@_ZTSPx = constant [3 x i8] c"Px\00", align 1
@_ZTIPx = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPx, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIx to i8*) }, align 8
@_ZTSPKx = constant [4 x i8] c"PKx\00", align 1
@_ZTIPKx = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKx, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIx to i8*) }, align 8
@_ZTSy = constant [2 x i8] c"y\00", align 1
@_ZTIy = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSy, i32 0, i32 0) }, align 8
@_ZTSPy = constant [3 x i8] c"Py\00", align 1
@_ZTIPy = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPy, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIy to i8*) }, align 8
@_ZTSPKy = constant [4 x i8] c"PKy\00", align 1
@_ZTIPKy = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKy, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIy to i8*) }, align 8
@_ZTSn = constant [2 x i8] c"n\00", align 1
@_ZTIn = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSn, i32 0, i32 0) }, align 8
@_ZTSPn = constant [3 x i8] c"Pn\00", align 1
@_ZTIPn = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPn, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIn to i8*) }, align 8
@_ZTSPKn = constant [4 x i8] c"PKn\00", align 1
@_ZTIPKn = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKn, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIn to i8*) }, align 8
@_ZTSo = constant [2 x i8] c"o\00", align 1
@_ZTIo = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSo, i32 0, i32 0) }, align 8
@_ZTSPo = constant [3 x i8] c"Po\00", align 1
@_ZTIPo = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPo, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIo to i8*) }, align 8
@_ZTSPKo = constant [4 x i8] c"PKo\00", align 1
@_ZTIPKo = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKo, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIo to i8*) }, align 8
@_ZTSDh = constant [3 x i8] c"Dh\00", align 1
@_ZTIDh = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDh, i32 0, i32 0) }, align 8
@_ZTSPDh = constant [4 x i8] c"PDh\00", align 1
@_ZTIPDh = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPDh, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIDh to i8*) }, align 8
@_ZTSPKDh = constant [5 x i8] c"PKDh\00", align 1
@_ZTIPKDh = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTSPKDh, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIDh to i8*) }, align 8
@_ZTSf = constant [2 x i8] c"f\00", align 1
@_ZTIf = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSf, i32 0, i32 0) }, align 8
@_ZTSPf = constant [3 x i8] c"Pf\00", align 1
@_ZTIPf = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPf, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIf to i8*) }, align 8
@_ZTSPKf = constant [4 x i8] c"PKf\00", align 1
@_ZTIPKf = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKf, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIf to i8*) }, align 8
@_ZTSd = constant [2 x i8] c"d\00", align 1
@_ZTId = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSd, i32 0, i32 0) }, align 8
@_ZTSPd = constant [3 x i8] c"Pd\00", align 1
@_ZTIPd = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPd, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTId to i8*) }, align 8
@_ZTSPKd = constant [4 x i8] c"PKd\00", align 1
@_ZTIPKd = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKd, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTId to i8*) }, align 8
@_ZTSe = constant [2 x i8] c"e\00", align 1
@_ZTIe = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSe, i32 0, i32 0) }, align 8
@_ZTSPe = constant [3 x i8] c"Pe\00", align 1
@_ZTIPe = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPe, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIe to i8*) }, align 8
@_ZTSPKe = constant [4 x i8] c"PKe\00", align 1
@_ZTIPKe = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKe, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIe to i8*) }, align 8
@_ZTSg = constant [2 x i8] c"g\00", align 1
@_ZTIg = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSg, i32 0, i32 0) }, align 8
@_ZTSPg = constant [3 x i8] c"Pg\00", align 1
@_ZTIPg = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSPg, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIg to i8*) }, align 8
@_ZTSPKg = constant [4 x i8] c"PKg\00", align 1
@_ZTIPKg = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPKg, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIg to i8*) }, align 8
@_ZTSDu = constant [3 x i8] c"Du\00", align 1
@_ZTIDu = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDu, i32 0, i32 0) }, align 8
@_ZTSPDu = constant [4 x i8] c"PDu\00", align 1
@_ZTIPDu = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPDu, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIDu to i8*) }, align 8
@_ZTSPKDu = constant [5 x i8] c"PKDu\00", align 1
@_ZTIPKDu = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTSPKDu, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIDu to i8*) }, align 8
@_ZTSDs = constant [3 x i8] c"Ds\00", align 1
@_ZTIDs = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDs, i32 0, i32 0) }, align 8
@_ZTSPDs = constant [4 x i8] c"PDs\00", align 1
@_ZTIPDs = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPDs, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIDs to i8*) }, align 8
@_ZTSPKDs = constant [5 x i8] c"PKDs\00", align 1
@_ZTIPKDs = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTSPKDs, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIDs to i8*) }, align 8
@_ZTSDi = constant [3 x i8] c"Di\00", align 1
@_ZTIDi = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv123__fundamental_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDi, i32 0, i32 0) }, align 8
@_ZTSPDi = constant [4 x i8] c"PDi\00", align 1
@_ZTIPDi = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @_ZTSPDi, i32 0, i32 0), i32 0, i8* bitcast ({ i8*, i8* }* @_ZTIDi to i8*) }, align 8
@_ZTSPKDi = constant [5 x i8] c"PKDi\00", align 1
@_ZTIPKDi = local_unnamed_addr constant { i8*, i8*, i32, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVN10__cxxabiv119__pointer_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @_ZTSPKDi, i32 0, i32 0), i32 1, i8* bitcast ({ i8*, i8* }* @_ZTIDi to i8*) }, align 8
@_ZTVN10__cxxabiv117__array_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__array_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__array_type_info"*)* @_ZN10__cxxabiv117__array_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__array_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv117__array_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTSN10__cxxabiv117__array_type_infoE = constant [34 x i8] c"N10__cxxabiv117__array_type_infoE\00", align 1
@_ZTIN10__cxxabiv117__array_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @_ZTSN10__cxxabiv117__array_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTVN10__cxxabiv120__function_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv120__function_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__function_type_info"*)* @_ZN10__cxxabiv120__function_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__function_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv120__function_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTVN10__cxxabiv116__enum_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__enum_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__enum_type_info"*)* @_ZN10__cxxabiv116__enum_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__enum_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv116__enum_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTSN10__cxxabiv116__enum_type_infoE = constant [33 x i8] c"N10__cxxabiv116__enum_type_infoE\00", align 1
@_ZTIN10__cxxabiv116__enum_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @_ZTSN10__cxxabiv116__enum_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to i8*) }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = unnamed_addr constant { [10 x i8*] } { [10 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__class_type_info"*)* @_ZN10__cxxabiv117__class_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*), i8* bitcast (void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)* @_ZNK10__cxxabiv117__class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)* @_ZNK10__cxxabiv117__class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)* @_ZNK10__cxxabiv117__class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = unnamed_addr constant { [10 x i8*] } { [10 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv120__si_class_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__si_class_type_info"*)* @_ZN10__cxxabiv120__si_class_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*), i8* bitcast (void (%"class.__cxxabiv1::__si_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)* @_ZNK10__cxxabiv120__si_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__si_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)* @_ZNK10__cxxabiv120__si_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__si_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)* @_ZNK10__cxxabiv120__si_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi to i8*)] }, align 8
@_ZTSN10__cxxabiv120__si_class_type_infoE = constant [37 x i8] c"N10__cxxabiv120__si_class_type_infoE\00", align 1
@_ZTIN10__cxxabiv120__si_class_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([37 x i8], [37 x i8]* @_ZTSN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to i8*) }, align 8
@_ZTVN10__cxxabiv121__vmi_class_type_infoE = unnamed_addr constant { [10 x i8*] } { [10 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv121__vmi_class_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__vmi_class_type_info"*)* @_ZN10__cxxabiv121__vmi_class_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*), i8* bitcast (void (%"class.__cxxabiv1::__vmi_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)* @_ZNK10__cxxabiv121__vmi_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__vmi_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)* @_ZNK10__cxxabiv121__vmi_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib to i8*), i8* bitcast (void (%"class.__cxxabiv1::__vmi_class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)* @_ZNK10__cxxabiv121__vmi_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi to i8*)] }, align 8
@_ZTSN10__cxxabiv121__vmi_class_type_infoE = constant [38 x i8] c"N10__cxxabiv121__vmi_class_type_infoE\00", align 1
@_ZTIN10__cxxabiv121__vmi_class_type_infoE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds ({ [10 x i8*] }, { [10 x i8*] }* @_ZTVN10__cxxabiv120__si_class_type_infoE, i32 0, i32 0, i64 2) to i8*), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @_ZTSN10__cxxabiv121__vmi_class_type_infoE, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to i8*) }, align 8
@_ZTVN10__cxxabiv117__pbase_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__pbase_type_info"*)* @_ZN10__cxxabiv117__pbase_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__pbase_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv117__pbase_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTVN10__cxxabiv119__pointer_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv119__pointer_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__pointer_type_info"*)* @_ZN10__cxxabiv119__pointer_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__pointer_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv119__pointer_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8
@_ZTVN10__cxxabiv129__pointer_to_member_type_infoE = unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__pointer_to_member_type_info"*)* @_ZN10__cxxabiv129__pointer_to_member_type_infoD0Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop1Ev to i8*), i8* bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZNK10__cxxabiv116__shim_type_info5noop2Ev to i8*), i8* bitcast (i1 (%"class.__cxxabiv1::__pointer_to_member_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)* @_ZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPv to i8*)] }, align 8

@_ZN10__cxxabiv116__shim_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__shim_type_info"*), void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev
@_ZN10__cxxabiv123__fundamental_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__fundamental_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__fundamental_type_info"*)*)
@_ZN10__cxxabiv123__fundamental_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__fundamental_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__fundamental_type_info"*)*)
@_ZN10__cxxabiv117__array_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__array_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__array_type_info"*)*)
@_ZN10__cxxabiv117__array_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__array_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__array_type_info"*)*)
@_ZN10__cxxabiv120__function_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__function_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__function_type_info"*)*)
@_ZN10__cxxabiv120__function_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__function_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__function_type_info"*)*)
@_ZN10__cxxabiv116__enum_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__enum_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__enum_type_info"*)*)
@_ZN10__cxxabiv116__enum_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__enum_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__enum_type_info"*)*)
@_ZN10__cxxabiv117__class_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__class_type_info"*)*)
@_ZN10__cxxabiv117__class_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__class_type_info"*)*)
@_ZN10__cxxabiv120__si_class_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__si_class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__si_class_type_info"*)*)
@_ZN10__cxxabiv120__si_class_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__si_class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__si_class_type_info"*)*)
@_ZN10__cxxabiv121__vmi_class_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__vmi_class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__vmi_class_type_info"*)*)
@_ZN10__cxxabiv121__vmi_class_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__vmi_class_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__vmi_class_type_info"*)*)
@_ZN10__cxxabiv117__pbase_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pbase_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pbase_type_info"*)*)
@_ZN10__cxxabiv117__pbase_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pbase_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pbase_type_info"*)*)
@_ZN10__cxxabiv119__pointer_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pointer_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pointer_type_info"*)*)
@_ZN10__cxxabiv119__pointer_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pointer_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pointer_type_info"*)*)
@_ZN10__cxxabiv129__pointer_to_member_type_infoD2Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pointer_to_member_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pointer_to_member_type_info"*)*)
@_ZN10__cxxabiv129__pointer_to_member_type_infoD1Ev = hidden unnamed_addr alias void (%"class.__cxxabiv1::__pointer_to_member_type_info"*), bitcast (void (%"class.__cxxabiv1::__shim_type_info"*)* @_ZN10__cxxabiv116__shim_type_infoD2Ev to void (%"class.__cxxabiv1::__pointer_to_member_type_info"*)*)

; Function Attrs: nounwind
declare void @_ZNSt9type_infoD2Ev(%"class.std::type_info"*) unnamed_addr #0

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv116__shim_type_infoD2Ev(%"class.__cxxabiv1::__shim_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %0, i64 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define hidden void @_ZN10__cxxabiv116__shim_type_infoD0Ev(%"class.__cxxabiv1::__shim_type_info"* nocapture readnone %0) unnamed_addr #2 align 2 {
  tail call void @llvm.trap() #14
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #3

; Function Attrs: norecurse nounwind readnone uwtable
define hidden void @_ZNK10__cxxabiv116__shim_type_info5noop1Ev(%"class.__cxxabiv1::__shim_type_info"* nocapture %0) unnamed_addr #4 align 2 {
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define hidden void @_ZNK10__cxxabiv116__shim_type_info5noop2Ev(%"class.__cxxabiv1::__shim_type_info"* nocapture %0) unnamed_addr #4 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv123__fundamental_type_infoD0Ev(%"class.__cxxabiv1::__fundamental_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__fundamental_type_info", %"class.__cxxabiv1::__fundamental_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__fundamental_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #5

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv117__array_type_infoD0Ev(%"class.__cxxabiv1::__array_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__array_type_info", %"class.__cxxabiv1::__array_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__array_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv120__function_type_infoD0Ev(%"class.__cxxabiv1::__function_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__function_type_info", %"class.__cxxabiv1::__function_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__function_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv116__enum_type_infoD0Ev(%"class.__cxxabiv1::__enum_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__enum_type_info", %"class.__cxxabiv1::__enum_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__enum_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv117__class_type_infoD0Ev(%"class.__cxxabiv1::__class_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__class_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv120__si_class_type_infoD0Ev(%"class.__cxxabiv1::__si_class_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__si_class_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv121__vmi_class_type_infoD0Ev(%"class.__cxxabiv1::__vmi_class_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__vmi_class_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv117__pbase_type_infoD0Ev(%"class.__cxxabiv1::__pbase_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__pbase_type_info"* %0, i64 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__pbase_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv119__pointer_type_infoD0Ev(%"class.__cxxabiv1::__pointer_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__pointer_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZN10__cxxabiv129__pointer_to_member_type_infoD0Ev(%"class.__cxxabiv1::__pointer_to_member_type_info"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  tail call void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* %2) #13
  %3 = bitcast %"class.__cxxabiv1::__pointer_to_member_type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #15
  ret void
}

; Function Attrs: norecurse nounwind readonly uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv123__fundamental_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__fundamental_type_info"* nocapture readonly %0, %"class.__cxxabiv1::__shim_type_info"* nocapture readonly %1, i8** nocapture nonnull readnone align 8 dereferenceable(8) %2) unnamed_addr #6 align 2 {
  %4 = getelementptr inbounds %"class.__cxxabiv1::__fundamental_type_info", %"class.__cxxabiv1::__fundamental_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %5 = load i8*, i8** %4, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !3
  %8 = icmp eq i8* %5, %7
  ret i1 %8
}

; Function Attrs: norecurse nounwind readnone uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv117__array_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__array_type_info"* nocapture readnone %0, %"class.__cxxabiv1::__shim_type_info"* nocapture readnone %1, i8** nocapture nonnull readnone align 8 dereferenceable(8) %2) unnamed_addr #4 align 2 {
  ret i1 false
}

; Function Attrs: norecurse nounwind readnone uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv120__function_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__function_type_info"* nocapture readnone %0, %"class.__cxxabiv1::__shim_type_info"* nocapture readnone %1, i8** nocapture nonnull readnone align 8 dereferenceable(8) %2) unnamed_addr #4 align 2 {
  ret i1 false
}

; Function Attrs: norecurse nounwind readonly uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv116__enum_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__enum_type_info"* nocapture readonly %0, %"class.__cxxabiv1::__shim_type_info"* nocapture readonly %1, i8** nocapture nonnull readnone align 8 dereferenceable(8) %2) unnamed_addr #6 align 2 {
  %4 = getelementptr inbounds %"class.__cxxabiv1::__enum_type_info", %"class.__cxxabiv1::__enum_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %5 = load i8*, i8** %4, align 8, !tbaa !3
  %6 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !3
  %8 = icmp eq i8* %5, %7
  ret i1 %8
}

; Function Attrs: uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv117__class_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__class_type_info"* %0, %"class.__cxxabiv1::__shim_type_info"* %1, i8** nocapture nonnull align 8 dereferenceable(8) %2) unnamed_addr #7 align 2 {
  %4 = alloca %"struct.__cxxabiv1::__dynamic_cast_info", align 8
  %5 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %8 = load i8*, i8** %7, align 8, !tbaa !3
  %9 = icmp eq i8* %6, %8
  br i1 %9, label %38, label %10

10:                                               ; preds = %3
  %11 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  %12 = tail call i8* @__dynamic_cast(i8* nonnull %11, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %13 = icmp eq i8* %12, null
  br i1 %13, label %38, label %14

14:                                               ; preds = %10
  %15 = bitcast i8* %12 to %"class.__cxxabiv1::__class_type_info"*
  %16 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %16) #13
  %17 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %4 to i8**
  store i8* %12, i8** %17, align 8, !tbaa !8
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 1
  store i8* null, i8** %18, align 8, !tbaa !13
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 2
  store %"class.__cxxabiv1::__class_type_info"* %0, %"class.__cxxabiv1::__class_type_info"** %19, align 8, !tbaa !14
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 3
  store i64 -1, i64* %20, align 8, !tbaa !15
  %21 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 4
  %22 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 6
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 12
  %24 = bitcast i8** %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(47) %24, i8 0, i64 47, i1 false)
  store i32 1, i32* %23, align 8, !tbaa !16
  %25 = load i8*, i8** %2, align 8, !tbaa !17
  %26 = bitcast i8* %12 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %27 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %26, align 8, !tbaa !18
  %28 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %27, i64 7
  %29 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %28, align 8
  call void %29(%"class.__cxxabiv1::__class_type_info"* nonnull %15, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %4, i8* %25, i32 1)
  %30 = load i32, i32* %22, align 8, !tbaa !20
  %31 = icmp eq i32 %30, 1
  br i1 %31, label %32, label %36

32:                                               ; preds = %14
  %33 = bitcast i8** %21 to i64*
  %34 = load i64, i64* %33, align 8, !tbaa !21
  %35 = bitcast i8** %2 to i64*
  store i64 %34, i64* %35, align 8, !tbaa !17
  br label %36

36:                                               ; preds = %14, %32
  %37 = phi i1 [ true, %32 ], [ false, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %16) #13
  br label %38

38:                                               ; preds = %36, %10, %3
  %39 = phi i1 [ true, %3 ], [ %37, %36 ], [ false, %10 ]
  ret i1 %39
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #8

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #8

; Function Attrs: nofree norecurse nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info24process_found_base_classEPNS_19__dynamic_cast_infoEPvi(%"class.__cxxabiv1::__class_type_info"* nocapture readnone %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* %2, i32 %3) local_unnamed_addr #9 align 2 {
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %6 = load i8*, i8** %5, align 8, !tbaa !21
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %11

8:                                                ; preds = %4
  store i8* %2, i8** %5, align 8, !tbaa !21
  %9 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %3, i32* %9, align 8, !tbaa !20
  %10 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %10, align 4, !tbaa !22
  br label %24

11:                                               ; preds = %4
  %12 = icmp eq i8* %6, %2
  br i1 %12, label %13, label %18

13:                                               ; preds = %11
  %14 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %15 = load i32, i32* %14, align 8, !tbaa !20
  %16 = icmp eq i32 %15, 2
  br i1 %16, label %17, label %24

17:                                               ; preds = %13
  store i32 %3, i32* %14, align 8, !tbaa !20
  br label %24

18:                                               ; preds = %11
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %20 = load i32, i32* %19, align 4, !tbaa !22
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %19, align 4, !tbaa !22
  %22 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 2, i32* %22, align 8, !tbaa !20
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %23, align 2, !tbaa !23
  br label %24

24:                                               ; preds = %18, %17, %13, %8
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi(%"class.__cxxabiv1::__class_type_info"* nocapture readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* %2, i32 %3) unnamed_addr #9 align 2 {
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %6 = bitcast %"class.__cxxabiv1::__class_type_info"** %5 to %"class.std::type_info"**
  %7 = load %"class.std::type_info"*, %"class.std::type_info"** %6, align 8, !tbaa !14
  %8 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = icmp eq i8* %9, %11
  br i1 %12, label %13, label %33

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %15 = load i8*, i8** %14, align 8, !tbaa !21
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  store i8* %2, i8** %14, align 8, !tbaa !21
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %3, i32* %18, align 8, !tbaa !20
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %19, align 4, !tbaa !22
  br label %33

20:                                               ; preds = %13
  %21 = icmp eq i8* %15, %2
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %24 = load i32, i32* %23, align 8, !tbaa !20
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %33

26:                                               ; preds = %22
  store i32 %3, i32* %23, align 8, !tbaa !20
  br label %33

27:                                               ; preds = %20
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %29 = load i32, i32* %28, align 4, !tbaa !22
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4, !tbaa !22
  %31 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 2, i32* %31, align 8, !tbaa !20
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %32, align 2, !tbaa !23
  br label %33

33:                                               ; preds = %27, %26, %22, %17, %4
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv120__si_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi(%"class.__cxxabiv1::__si_class_type_info"* nocapture readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3) unnamed_addr #7 align 2 {
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %6 = bitcast %"class.__cxxabiv1::__class_type_info"** %5 to %"class.std::type_info"**
  %7 = load %"class.std::type_info"*, %"class.std::type_info"** %6, align 8, !tbaa !14
  %8 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = icmp eq i8* %9, %11
  br i1 %12, label %13, label %33

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %15 = load i8*, i8** %14, align 8, !tbaa !21
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  store i8* %2, i8** %14, align 8, !tbaa !21
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %3, i32* %18, align 8, !tbaa !20
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %19, align 4, !tbaa !22
  br label %40

20:                                               ; preds = %13
  %21 = icmp eq i8* %15, %2
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %24 = load i32, i32* %23, align 8, !tbaa !20
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %40

26:                                               ; preds = %22
  store i32 %3, i32* %23, align 8, !tbaa !20
  br label %40

27:                                               ; preds = %20
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %29 = load i32, i32* %28, align 4, !tbaa !22
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4, !tbaa !22
  %31 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 2, i32* %31, align 8, !tbaa !20
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %32, align 2, !tbaa !23
  br label %40

33:                                               ; preds = %4
  %34 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 1
  %35 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %34, align 8, !tbaa !24
  %36 = bitcast %"class.__cxxabiv1::__class_type_info"* %35 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %37 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %36, align 8, !tbaa !18
  %38 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %37, i64 7
  %39 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %38, align 8
  tail call void %39(%"class.__cxxabiv1::__class_type_info"* %35, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i32 %3)
  br label %40

40:                                               ; preds = %27, %26, %22, %17, %33
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv122__base_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi(%"struct.__cxxabiv1::__base_class_type_info"* nocapture readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3) local_unnamed_addr #7 align 2 {
  %5 = icmp eq i8* %2, null
  %6 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !26
  br i1 %5, label %18, label %8

8:                                                ; preds = %4
  %9 = ashr i64 %7, 8
  %10 = and i64 %7, 1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %18, label %12

12:                                               ; preds = %8
  %13 = bitcast i8* %2 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !17
  %15 = getelementptr inbounds i8, i8* %14, i64 %9
  %16 = bitcast i8* %15 to i64*
  %17 = load i64, i64* %16, align 8, !tbaa !28
  br label %18

18:                                               ; preds = %4, %8, %12
  %19 = phi i64 [ %17, %12 ], [ %9, %8 ], [ 0, %4 ]
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 0
  %21 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %20, align 8, !tbaa !29
  %22 = getelementptr inbounds i8, i8* %2, i64 %19
  %23 = and i64 %7, 2
  %24 = icmp eq i64 %23, 0
  %25 = select i1 %24, i32 2, i32 %3
  %26 = bitcast %"class.__cxxabiv1::__class_type_info"* %21 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %27 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %26, align 8, !tbaa !18
  %28 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %27, i64 7
  %29 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %28, align 8
  tail call void %29(%"class.__cxxabiv1::__class_type_info"* %21, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %22, i32 %25)
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv121__vmi_class_type_info27has_unambiguous_public_baseEPNS_19__dynamic_cast_infoEPvi(%"class.__cxxabiv1::__vmi_class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3) unnamed_addr #7 align 2 {
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %6 = bitcast %"class.__cxxabiv1::__class_type_info"** %5 to %"class.std::type_info"**
  %7 = load %"class.std::type_info"*, %"class.std::type_info"** %6, align 8, !tbaa !14
  %8 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %9 = load i8*, i8** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8, !tbaa !3
  %12 = icmp eq i8* %9, %11
  br i1 %12, label %13, label %33

13:                                               ; preds = %4
  %14 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %15 = load i8*, i8** %14, align 8, !tbaa !21
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %20

17:                                               ; preds = %13
  store i8* %2, i8** %14, align 8, !tbaa !21
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %3, i32* %18, align 8, !tbaa !20
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %19, align 4, !tbaa !22
  br label %115

20:                                               ; preds = %13
  %21 = icmp eq i8* %15, %2
  br i1 %21, label %22, label %27

22:                                               ; preds = %20
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %24 = load i32, i32* %23, align 8, !tbaa !20
  %25 = icmp eq i32 %24, 2
  br i1 %25, label %26, label %115

26:                                               ; preds = %22
  store i32 %3, i32* %23, align 8, !tbaa !20
  br label %115

27:                                               ; preds = %20
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %29 = load i32, i32* %28, align 4, !tbaa !22
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %28, align 4, !tbaa !22
  %31 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 2, i32* %31, align 8, !tbaa !20
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %32, align 2, !tbaa !23
  br label %115

33:                                               ; preds = %4
  %34 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 2
  %35 = load i32, i32* %34, align 4, !tbaa !30
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 %36
  %38 = icmp eq i8* %2, null
  %39 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 1
  %40 = load i64, i64* %39, align 8, !tbaa !26
  br i1 %38, label %51, label %41

41:                                               ; preds = %33
  %42 = ashr i64 %40, 8
  %43 = and i64 %40, 1
  %44 = icmp eq i64 %43, 0
  br i1 %44, label %51, label %45

45:                                               ; preds = %41
  %46 = bitcast i8* %2 to i8**
  %47 = load i8*, i8** %46, align 8, !tbaa !17
  %48 = getelementptr inbounds i8, i8* %47, i64 %42
  %49 = bitcast i8* %48 to i64*
  %50 = load i64, i64* %49, align 8, !tbaa !28
  br label %51

51:                                               ; preds = %33, %41, %45
  %52 = phi i64 [ %50, %45 ], [ %42, %41 ], [ 0, %33 ]
  %53 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 0
  %54 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %53, align 8, !tbaa !29
  %55 = getelementptr inbounds i8, i8* %2, i64 %52
  %56 = and i64 %40, 2
  %57 = icmp eq i64 %56, 0
  %58 = select i1 %57, i32 2, i32 %3
  %59 = bitcast %"class.__cxxabiv1::__class_type_info"* %54 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %60 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %59, align 8, !tbaa !18
  %61 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %60, i64 7
  %62 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %61, align 8
  tail call void %62(%"class.__cxxabiv1::__class_type_info"* %54, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %55, i32 %58)
  %63 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 1
  %64 = icmp ugt i32 %35, 1
  br i1 %64, label %65, label %115

65:                                               ; preds = %51
  %66 = bitcast i8* %2 to i8**
  %67 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  br i1 %38, label %68, label %86

68:                                               ; preds = %65, %83
  %69 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %84, %83 ], [ %63, %65 ]
  %70 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %69, i64 0, i32 1
  %71 = load i64, i64* %70, align 8, !tbaa !26
  %72 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %69, i64 0, i32 0
  %73 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %72, align 8, !tbaa !29
  %74 = and i64 %71, 2
  %75 = icmp eq i64 %74, 0
  %76 = select i1 %75, i32 2, i32 %3
  %77 = bitcast %"class.__cxxabiv1::__class_type_info"* %73 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %78 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %77, align 8, !tbaa !18
  %79 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %78, i64 7
  %80 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %79, align 8
  tail call void %80(%"class.__cxxabiv1::__class_type_info"* %73, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* null, i32 %76)
  %81 = load i8, i8* %67, align 2, !tbaa !23, !range !32
  %82 = icmp eq i8 %81, 0
  br i1 %82, label %83, label %115

83:                                               ; preds = %68
  %84 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %69, i64 1
  %85 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %84, %37
  br i1 %85, label %68, label %115

86:                                               ; preds = %65, %112
  %87 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %113, %112 ], [ %63, %65 ]
  %88 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %87, i64 0, i32 1
  %89 = load i64, i64* %88, align 8, !tbaa !26
  %90 = ashr i64 %89, 8
  %91 = and i64 %89, 1
  %92 = icmp eq i64 %91, 0
  br i1 %92, label %98, label %93

93:                                               ; preds = %86
  %94 = load i8*, i8** %66, align 8, !tbaa !17
  %95 = getelementptr inbounds i8, i8* %94, i64 %90
  %96 = bitcast i8* %95 to i64*
  %97 = load i64, i64* %96, align 8, !tbaa !28
  br label %98

98:                                               ; preds = %86, %93
  %99 = phi i64 [ %97, %93 ], [ %90, %86 ]
  %100 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %87, i64 0, i32 0
  %101 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %100, align 8, !tbaa !29
  %102 = getelementptr inbounds i8, i8* %2, i64 %99
  %103 = and i64 %89, 2
  %104 = icmp eq i64 %103, 0
  %105 = select i1 %104, i32 2, i32 %3
  %106 = bitcast %"class.__cxxabiv1::__class_type_info"* %101 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %107 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %106, align 8, !tbaa !18
  %108 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %107, i64 7
  %109 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %108, align 8
  tail call void %109(%"class.__cxxabiv1::__class_type_info"* %101, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* nonnull %102, i32 %105)
  %110 = load i8, i8* %67, align 2, !tbaa !23, !range !32
  %111 = icmp eq i8 %110, 0
  br i1 %111, label %112, label %115

112:                                              ; preds = %98
  %113 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %87, i64 1
  %114 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %113, %37
  br i1 %114, label %86, label %115

115:                                              ; preds = %112, %98, %83, %68, %27, %26, %22, %17, %51
  ret void
}

; Function Attrs: nounwind uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv117__pbase_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__pbase_type_info"* readonly %0, %"class.__cxxabiv1::__shim_type_info"* %1, i8** nocapture nonnull readnone align 8 dereferenceable(8) %2) unnamed_addr #1 align 2 {
  %4 = getelementptr inbounds %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__pbase_type_info"* %0, i64 0, i32 1
  %5 = load i32, i32* %4, align 8, !tbaa !33
  %6 = and i32 %5, 24
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %26

8:                                                ; preds = %3
  %9 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %1, null
  br i1 %9, label %37, label %10

10:                                               ; preds = %8
  %11 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  %12 = tail call i8* @__dynamic_cast(i8* nonnull %11, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %13 = icmp eq i8* %12, null
  br i1 %13, label %37, label %14

14:                                               ; preds = %10
  %15 = getelementptr inbounds i8, i8* %12, i64 16
  %16 = bitcast i8* %15 to i32*
  %17 = load i32, i32* %16, align 8, !tbaa !33
  %18 = and i32 %17, 24
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %26

20:                                               ; preds = %14
  %21 = getelementptr inbounds %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__pbase_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  %23 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %24 = load i8*, i8** %23, align 8, !tbaa !3
  %25 = icmp eq i8* %22, %24
  br label %37

26:                                               ; preds = %3, %14
  %27 = getelementptr %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__pbase_type_info"* %0, i64 0, i32 0, i32 0
  %28 = getelementptr %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0
  %29 = icmp eq %"class.std::type_info"* %27, %28
  br i1 %29, label %37, label %30

30:                                               ; preds = %26
  %31 = getelementptr inbounds %"class.__cxxabiv1::__pbase_type_info", %"class.__cxxabiv1::__pbase_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %32 = load i8*, i8** %31, align 8, !tbaa !3
  %33 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %34 = load i8*, i8** %33, align 8, !tbaa !3
  %35 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %32, i8* nonnull dereferenceable(1) %34) #16
  %36 = icmp eq i32 %35, 0
  br label %37

37:                                               ; preds = %8, %10, %30, %26, %20
  %38 = phi i1 [ %25, %20 ], [ true, %26 ], [ %36, %30 ], [ false, %10 ], [ false, %8 ]
  ret i1 %38
}

; Function Attrs: uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv119__pointer_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__pointer_type_info"* readonly %0, %"class.__cxxabiv1::__shim_type_info"* %1, i8** nocapture nonnull align 8 dereferenceable(8) %2) unnamed_addr #7 align 2 {
  %4 = alloca %"struct.__cxxabiv1::__dynamic_cast_info", align 8
  %5 = getelementptr %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0
  %6 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %7 = load i8*, i8** %6, align 8, !tbaa !3
  %8 = icmp eq i8* %7, getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDn, i64 0, i64 0)
  br i1 %8, label %9, label %10

9:                                                ; preds = %3
  store i8* null, i8** %2, align 8, !tbaa !17
  br label %202

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 1
  %12 = load i32, i32* %11, align 8, !tbaa !33
  %13 = and i32 %12, 24
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %30

15:                                               ; preds = %10
  %16 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  %17 = tail call i8* @__dynamic_cast(i8* nonnull %16, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %18 = icmp eq i8* %17, null
  br i1 %18, label %48, label %19

19:                                               ; preds = %15
  %20 = getelementptr inbounds i8, i8* %17, i64 16
  %21 = bitcast i8* %20 to i32*
  %22 = load i32, i32* %21, align 8, !tbaa !33
  %23 = and i32 %22, 24
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %30

25:                                               ; preds = %19
  %26 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !3
  %28 = load i8*, i8** %6, align 8, !tbaa !3
  %29 = icmp eq i8* %27, %28
  br i1 %29, label %41, label %48

30:                                               ; preds = %19, %10
  %31 = getelementptr %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %32 = icmp eq %"class.std::type_info"* %31, %5
  br i1 %32, label %41, label %33

33:                                               ; preds = %30
  %34 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %35 = load i8*, i8** %34, align 8, !tbaa !3
  %36 = load i8*, i8** %6, align 8, !tbaa !3
  %37 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %35, i8* nonnull dereferenceable(1) %36) #16
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %41, label %39

39:                                               ; preds = %33
  %40 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  br label %48

41:                                               ; preds = %30, %25, %33
  %42 = load i8*, i8** %2, align 8, !tbaa !17
  %43 = icmp eq i8* %42, null
  br i1 %43, label %202, label %44

44:                                               ; preds = %41
  %45 = bitcast i8* %42 to i64*
  %46 = load i64, i64* %45, align 8, !tbaa !17
  %47 = bitcast i8** %2 to i64*
  store i64 %46, i64* %47, align 8, !tbaa !17
  br label %202

48:                                               ; preds = %39, %15, %25
  %49 = phi i8* [ %40, %39 ], [ %16, %15 ], [ %16, %25 ]
  %50 = tail call i8* @__dynamic_cast(i8* nonnull %49, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv119__pointer_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %51 = icmp eq i8* %50, null
  br i1 %51, label %202, label %52

52:                                               ; preds = %48
  %53 = load i8*, i8** %2, align 8, !tbaa !17
  %54 = icmp eq i8* %53, null
  br i1 %54, label %59, label %55

55:                                               ; preds = %52
  %56 = bitcast i8* %53 to i64*
  %57 = load i64, i64* %56, align 8, !tbaa !17
  %58 = bitcast i8** %2 to i64*
  store i64 %57, i64* %58, align 8, !tbaa !17
  br label %59

59:                                               ; preds = %52, %55
  %60 = getelementptr inbounds i8, i8* %50, i64 16
  %61 = bitcast i8* %60 to i32*
  %62 = load i32, i32* %61, align 8, !tbaa !33
  %63 = load i32, i32* %11, align 8, !tbaa !33
  %64 = xor i32 %63, 7
  %65 = and i32 %62, 7
  %66 = and i32 %65, %64
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %202

68:                                               ; preds = %59
  %69 = and i32 %62, 96
  %70 = xor i32 %69, 96
  %71 = and i32 %70, %63
  %72 = icmp eq i32 %71, 0
  br i1 %72, label %73, label %202

73:                                               ; preds = %68
  %74 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %0, i64 0, i32 0, i32 2
  %75 = bitcast %"class.__cxxabiv1::__shim_type_info"** %74 to %"class.std::type_info"**
  %76 = load %"class.std::type_info"*, %"class.std::type_info"** %75, align 8, !tbaa !35
  %77 = getelementptr inbounds i8, i8* %50, i64 24
  %78 = bitcast i8* %77 to %"class.__cxxabiv1::__shim_type_info"**
  %79 = bitcast i8* %77 to %"class.std::type_info"**
  %80 = load %"class.std::type_info"*, %"class.std::type_info"** %79, align 8, !tbaa !35
  %81 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %76, i64 0, i32 1
  %82 = load i8*, i8** %81, align 8, !tbaa !3
  %83 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %80, i64 0, i32 1
  %84 = load i8*, i8** %83, align 8, !tbaa !3
  %85 = icmp eq i8* %82, %84
  br i1 %85, label %202, label %86

86:                                               ; preds = %73
  %87 = icmp eq i8* %82, getelementptr inbounds ([2 x i8], [2 x i8]* @_ZTSv, i64 0, i64 0)
  br i1 %87, label %88, label %94

88:                                               ; preds = %86
  %89 = icmp eq %"class.std::type_info"* %80, null
  br i1 %89, label %202, label %90

90:                                               ; preds = %88
  %91 = bitcast %"class.std::type_info"* %80 to i8*
  %92 = tail call i8* @__dynamic_cast(i8* nonnull %91, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv120__function_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %93 = icmp eq i8* %92, null
  br label %202

94:                                               ; preds = %86
  %95 = icmp eq %"class.std::type_info"* %76, null
  br i1 %95, label %202, label %96

96:                                               ; preds = %94
  %97 = bitcast %"class.std::type_info"* %76 to i8*
  %98 = tail call i8* @__dynamic_cast(i8* nonnull %97, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv119__pointer_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %99 = bitcast i8* %98 to %"class.__cxxabiv1::__pointer_type_info"*
  %100 = icmp eq i8* %98, null
  br i1 %100, label %108, label %101

101:                                              ; preds = %96
  %102 = load i32, i32* %11, align 8, !tbaa !33
  %103 = and i32 %102, 1
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %202, label %105

105:                                              ; preds = %101
  %106 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %78, align 8, !tbaa !35
  %107 = tail call zeroext i1 @_ZNK10__cxxabiv119__pointer_type_info16can_catch_nestedEPKNS_16__shim_type_infoE(%"class.__cxxabiv1::__pointer_type_info"* nonnull %99, %"class.__cxxabiv1::__shim_type_info"* %106)
  br label %202

108:                                              ; preds = %96
  %109 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %74, align 8, !tbaa !35
  %110 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %109, null
  br i1 %110, label %202, label %111

111:                                              ; preds = %108
  %112 = bitcast %"class.__cxxabiv1::__shim_type_info"* %109 to i8*
  %113 = tail call i8* @__dynamic_cast(i8* nonnull %112, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %114 = icmp eq i8* %113, null
  br i1 %114, label %160, label %115

115:                                              ; preds = %111
  %116 = load i32, i32* %11, align 8, !tbaa !33
  %117 = and i32 %116, 1
  %118 = icmp eq i32 %117, 0
  br i1 %118, label %202, label %119

119:                                              ; preds = %115
  %120 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %78, align 8, !tbaa !35
  %121 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %120, null
  br i1 %121, label %202, label %122

122:                                              ; preds = %119
  %123 = bitcast %"class.__cxxabiv1::__shim_type_info"* %120 to i8*
  %124 = tail call i8* @__dynamic_cast(i8* nonnull %123, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %125 = icmp eq i8* %124, null
  br i1 %125, label %202, label %126

126:                                              ; preds = %122
  %127 = getelementptr inbounds i8, i8* %113, i64 16
  %128 = bitcast i8* %127 to i32*
  %129 = load i32, i32* %128, align 8, !tbaa !33
  %130 = xor i32 %129, -1
  %131 = getelementptr inbounds i8, i8* %124, i64 16
  %132 = bitcast i8* %131 to i32*
  %133 = load i32, i32* %132, align 8, !tbaa !33
  %134 = and i32 %133, %130
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %202

136:                                              ; preds = %126
  %137 = getelementptr inbounds i8, i8* %113, i64 24
  %138 = bitcast i8* %137 to %"class.std::type_info"**
  %139 = load %"class.std::type_info"*, %"class.std::type_info"** %138, align 8, !tbaa !35
  %140 = getelementptr inbounds i8, i8* %124, i64 24
  %141 = bitcast i8* %140 to %"class.std::type_info"**
  %142 = load %"class.std::type_info"*, %"class.std::type_info"** %141, align 8, !tbaa !35
  %143 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %139, i64 0, i32 1
  %144 = load i8*, i8** %143, align 8, !tbaa !3
  %145 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %142, i64 0, i32 1
  %146 = load i8*, i8** %145, align 8, !tbaa !3
  %147 = icmp eq i8* %144, %146
  br i1 %147, label %148, label %202

148:                                              ; preds = %136
  %149 = getelementptr inbounds i8, i8* %113, i64 32
  %150 = bitcast i8* %149 to %"class.std::type_info"**
  %151 = load %"class.std::type_info"*, %"class.std::type_info"** %150, align 8, !tbaa !36
  %152 = getelementptr inbounds i8, i8* %124, i64 32
  %153 = bitcast i8* %152 to %"class.std::type_info"**
  %154 = load %"class.std::type_info"*, %"class.std::type_info"** %153, align 8, !tbaa !36
  %155 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %151, i64 0, i32 1
  %156 = load i8*, i8** %155, align 8, !tbaa !3
  %157 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %154, i64 0, i32 1
  %158 = load i8*, i8** %157, align 8, !tbaa !3
  %159 = icmp eq i8* %156, %158
  br label %202

160:                                              ; preds = %111
  %161 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %74, align 8, !tbaa !35
  %162 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %161, null
  br i1 %162, label %202, label %163

163:                                              ; preds = %160
  %164 = bitcast %"class.__cxxabiv1::__shim_type_info"* %161 to i8*
  %165 = tail call i8* @__dynamic_cast(i8* nonnull %164, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %166 = icmp eq i8* %165, null
  br i1 %166, label %202, label %167

167:                                              ; preds = %163
  %168 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %78, align 8, !tbaa !35
  %169 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %168, null
  br i1 %169, label %202, label %170

170:                                              ; preds = %167
  %171 = bitcast %"class.__cxxabiv1::__shim_type_info"* %168 to i8*
  %172 = tail call i8* @__dynamic_cast(i8* nonnull %171, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__class_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %173 = icmp eq i8* %172, null
  br i1 %173, label %202, label %174

174:                                              ; preds = %170
  %175 = bitcast i8* %172 to %"class.__cxxabiv1::__class_type_info"*
  %176 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %176) #13
  %177 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %4 to i8**
  store i8* %172, i8** %177, align 8, !tbaa !8
  %178 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 1
  store i8* null, i8** %178, align 8, !tbaa !13
  %179 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 2
  %180 = bitcast %"class.__cxxabiv1::__class_type_info"** %179 to i8**
  store i8* %165, i8** %180, align 8, !tbaa !14
  %181 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 3
  store i64 -1, i64* %181, align 8, !tbaa !15
  %182 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 4
  %183 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 6
  %184 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %4, i64 0, i32 12
  %185 = bitcast i8** %182 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(47) %185, i8 0, i64 47, i1 false)
  store i32 1, i32* %184, align 8, !tbaa !16
  %186 = load i8*, i8** %2, align 8, !tbaa !17
  %187 = bitcast i8* %172 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)***
  %188 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*** %187, align 8, !tbaa !18
  %189 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %188, i64 7
  %190 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32)** %189, align 8
  call void %190(%"class.__cxxabiv1::__class_type_info"* nonnull %175, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %4, i8* %186, i32 1)
  %191 = load i32, i32* %183, align 8, !tbaa !20
  %192 = icmp eq i32 %191, 1
  br i1 %192, label %193, label %200

193:                                              ; preds = %174
  %194 = load i8*, i8** %2, align 8, !tbaa !17
  %195 = icmp eq i8* %194, null
  br i1 %195, label %200, label %196

196:                                              ; preds = %193
  %197 = bitcast i8** %182 to i64*
  %198 = load i64, i64* %197, align 8, !tbaa !21
  %199 = bitcast i8** %2 to i64*
  store i64 %198, i64* %199, align 8, !tbaa !17
  br label %200

200:                                              ; preds = %174, %196, %193
  %201 = phi i1 [ true, %193 ], [ true, %196 ], [ false, %174 ]
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %176) #13
  br label %202

202:                                              ; preds = %108, %94, %167, %160, %148, %136, %126, %122, %119, %48, %59, %68, %73, %88, %90, %115, %200, %170, %163, %101, %105, %44, %41, %9
  %203 = phi i1 [ true, %9 ], [ true, %41 ], [ true, %44 ], [ false, %48 ], [ false, %59 ], [ false, %68 ], [ true, %73 ], [ %93, %90 ], [ true, %88 ], [ %107, %105 ], [ false, %101 ], [ false, %115 ], [ false, %163 ], [ %201, %200 ], [ false, %170 ], [ false, %122 ], [ false, %126 ], [ false, %136 ], [ %159, %148 ], [ false, %119 ], [ false, %160 ], [ false, %167 ], [ false, %94 ], [ false, %108 ]
  ret i1 %203
}

; Function Attrs: nounwind uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv119__pointer_type_info16can_catch_nestedEPKNS_16__shim_type_infoE(%"class.__cxxabiv1::__pointer_type_info"* nocapture readonly %0, %"class.__cxxabiv1::__shim_type_info"* %1) local_unnamed_addr #1 align 2 {
  %3 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %1, null
  br i1 %3, label %94, label %4

4:                                                ; preds = %2, %41
  %5 = phi %"class.__cxxabiv1::__shim_type_info"* [ %43, %41 ], [ %1, %2 ]
  %6 = phi %"class.__cxxabiv1::__pointer_type_info"* [ %42, %41 ], [ %0, %2 ]
  %7 = bitcast %"class.__cxxabiv1::__shim_type_info"* %5 to i8*
  %8 = tail call i8* @__dynamic_cast(i8* nonnull %7, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv119__pointer_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %9 = icmp eq i8* %8, null
  br i1 %9, label %94, label %10

10:                                               ; preds = %4
  %11 = getelementptr inbounds i8, i8* %8, i64 16
  %12 = bitcast i8* %11 to i32*
  %13 = load i32, i32* %12, align 8, !tbaa !33
  %14 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %6, i64 0, i32 0, i32 1
  %15 = load i32, i32* %14, align 8, !tbaa !33
  %16 = xor i32 %15, -1
  %17 = and i32 %13, %16
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %94

19:                                               ; preds = %10
  %20 = getelementptr inbounds %"class.__cxxabiv1::__pointer_type_info", %"class.__cxxabiv1::__pointer_type_info"* %6, i64 0, i32 0, i32 2
  %21 = bitcast %"class.__cxxabiv1::__shim_type_info"** %20 to %"class.std::type_info"**
  %22 = load %"class.std::type_info"*, %"class.std::type_info"** %21, align 8, !tbaa !35
  %23 = getelementptr inbounds i8, i8* %8, i64 24
  %24 = bitcast i8* %23 to %"class.__cxxabiv1::__shim_type_info"**
  %25 = bitcast i8* %23 to %"class.std::type_info"**
  %26 = load %"class.std::type_info"*, %"class.std::type_info"** %25, align 8, !tbaa !35
  %27 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %22, i64 0, i32 1
  %28 = load i8*, i8** %27, align 8, !tbaa !3
  %29 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %26, i64 0, i32 1
  %30 = load i8*, i8** %29, align 8, !tbaa !3
  %31 = icmp eq i8* %28, %30
  br i1 %31, label %94, label %32

32:                                               ; preds = %19
  %33 = and i32 %15, 1
  %34 = icmp eq i32 %33, 0
  %35 = icmp eq %"class.std::type_info"* %22, null
  %36 = or i1 %34, %35
  br i1 %36, label %94, label %37

37:                                               ; preds = %32
  %38 = bitcast %"class.std::type_info"* %22 to i8*
  %39 = tail call i8* @__dynamic_cast(i8* nonnull %38, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv119__pointer_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %40 = icmp eq i8* %39, null
  br i1 %40, label %45, label %41

41:                                               ; preds = %37
  %42 = bitcast i8* %39 to %"class.__cxxabiv1::__pointer_type_info"*
  %43 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %24, align 8, !tbaa !35
  %44 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %43, null
  br i1 %44, label %94, label %4

45:                                               ; preds = %37
  %46 = bitcast i8* %23 to %"class.__cxxabiv1::__shim_type_info"**
  %47 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %20, align 8, !tbaa !35
  %48 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %47, null
  br i1 %48, label %94, label %49

49:                                               ; preds = %45
  %50 = bitcast %"class.__cxxabiv1::__shim_type_info"* %47 to i8*
  %51 = tail call i8* @__dynamic_cast(i8* nonnull %50, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %52 = icmp eq i8* %51, null
  br i1 %52, label %94, label %53

53:                                               ; preds = %49
  %54 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %46, align 8, !tbaa !35
  %55 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %54, null
  br i1 %55, label %94, label %56

56:                                               ; preds = %53
  %57 = bitcast %"class.__cxxabiv1::__shim_type_info"* %54 to i8*
  %58 = tail call i8* @__dynamic_cast(i8* nonnull %57, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %59 = icmp eq i8* %58, null
  br i1 %59, label %94, label %60

60:                                               ; preds = %56
  %61 = getelementptr inbounds i8, i8* %51, i64 16
  %62 = bitcast i8* %61 to i32*
  %63 = load i32, i32* %62, align 8, !tbaa !33
  %64 = xor i32 %63, -1
  %65 = getelementptr inbounds i8, i8* %58, i64 16
  %66 = bitcast i8* %65 to i32*
  %67 = load i32, i32* %66, align 8, !tbaa !33
  %68 = and i32 %67, %64
  %69 = icmp eq i32 %68, 0
  br i1 %69, label %70, label %94

70:                                               ; preds = %60
  %71 = getelementptr inbounds i8, i8* %51, i64 24
  %72 = bitcast i8* %71 to %"class.std::type_info"**
  %73 = load %"class.std::type_info"*, %"class.std::type_info"** %72, align 8, !tbaa !35
  %74 = getelementptr inbounds i8, i8* %58, i64 24
  %75 = bitcast i8* %74 to %"class.std::type_info"**
  %76 = load %"class.std::type_info"*, %"class.std::type_info"** %75, align 8, !tbaa !35
  %77 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %73, i64 0, i32 1
  %78 = load i8*, i8** %77, align 8, !tbaa !3
  %79 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %76, i64 0, i32 1
  %80 = load i8*, i8** %79, align 8, !tbaa !3
  %81 = icmp eq i8* %78, %80
  br i1 %81, label %82, label %94

82:                                               ; preds = %70
  %83 = getelementptr inbounds i8, i8* %51, i64 32
  %84 = bitcast i8* %83 to %"class.std::type_info"**
  %85 = load %"class.std::type_info"*, %"class.std::type_info"** %84, align 8, !tbaa !36
  %86 = getelementptr inbounds i8, i8* %58, i64 32
  %87 = bitcast i8* %86 to %"class.std::type_info"**
  %88 = load %"class.std::type_info"*, %"class.std::type_info"** %87, align 8, !tbaa !36
  %89 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %85, i64 0, i32 1
  %90 = load i8*, i8** %89, align 8, !tbaa !3
  %91 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %88, i64 0, i32 1
  %92 = load i8*, i8** %91, align 8, !tbaa !3
  %93 = icmp eq i8* %90, %92
  br label %94

94:                                               ; preds = %4, %10, %19, %32, %41, %2, %45, %82, %70, %60, %56, %53, %49
  %95 = phi i1 [ false, %49 ], [ false, %56 ], [ false, %60 ], [ false, %70 ], [ %93, %82 ], [ false, %53 ], [ false, %45 ], [ false, %2 ], [ false, %4 ], [ false, %10 ], [ true, %19 ], [ false, %32 ], [ false, %41 ]
  ret i1 %95
}

; Function Attrs: nounwind uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv129__pointer_to_member_type_info16can_catch_nestedEPKNS_16__shim_type_infoE(%"class.__cxxabiv1::__pointer_to_member_type_info"* nocapture readonly %0, %"class.__cxxabiv1::__shim_type_info"* %1) local_unnamed_addr #1 align 2 {
  %3 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %1, null
  br i1 %3, label %41, label %4

4:                                                ; preds = %2
  %5 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  %6 = tail call i8* @__dynamic_cast(i8* nonnull %5, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %7 = icmp eq i8* %6, null
  br i1 %7, label %41, label %8

8:                                                ; preds = %4
  %9 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 1
  %10 = load i32, i32* %9, align 8, !tbaa !33
  %11 = xor i32 %10, -1
  %12 = getelementptr inbounds i8, i8* %6, i64 16
  %13 = bitcast i8* %12 to i32*
  %14 = load i32, i32* %13, align 8, !tbaa !33
  %15 = and i32 %14, %11
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %41

17:                                               ; preds = %8
  %18 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 2
  %19 = bitcast %"class.__cxxabiv1::__shim_type_info"** %18 to %"class.std::type_info"**
  %20 = load %"class.std::type_info"*, %"class.std::type_info"** %19, align 8, !tbaa !35
  %21 = getelementptr inbounds i8, i8* %6, i64 24
  %22 = bitcast i8* %21 to %"class.std::type_info"**
  %23 = load %"class.std::type_info"*, %"class.std::type_info"** %22, align 8, !tbaa !35
  %24 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %20, i64 0, i32 1
  %25 = load i8*, i8** %24, align 8, !tbaa !3
  %26 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %23, i64 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !3
  %28 = icmp eq i8* %25, %27
  br i1 %28, label %29, label %41

29:                                               ; preds = %17
  %30 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 1
  %31 = bitcast %"class.__cxxabiv1::__class_type_info"** %30 to %"class.std::type_info"**
  %32 = load %"class.std::type_info"*, %"class.std::type_info"** %31, align 8, !tbaa !36
  %33 = getelementptr inbounds i8, i8* %6, i64 32
  %34 = bitcast i8* %33 to %"class.std::type_info"**
  %35 = load %"class.std::type_info"*, %"class.std::type_info"** %34, align 8, !tbaa !36
  %36 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %32, i64 0, i32 1
  %37 = load i8*, i8** %36, align 8, !tbaa !3
  %38 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %35, i64 0, i32 1
  %39 = load i8*, i8** %38, align 8, !tbaa !3
  %40 = icmp eq i8* %37, %39
  br label %41

41:                                               ; preds = %2, %29, %17, %8, %4
  %42 = phi i1 [ false, %4 ], [ false, %8 ], [ false, %17 ], [ %40, %29 ], [ false, %2 ]
  ret i1 %42
}

; Function Attrs: nounwind uwtable
define hidden zeroext i1 @_ZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPv(%"class.__cxxabiv1::__pointer_to_member_type_info"* readonly %0, %"class.__cxxabiv1::__shim_type_info"* %1, i8** nocapture nonnull align 8 dereferenceable(8) %2) unnamed_addr #1 align 2 {
  %4 = getelementptr %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0
  %5 = getelementptr inbounds %"class.__cxxabiv1::__shim_type_info", %"class.__cxxabiv1::__shim_type_info"* %1, i64 0, i32 0, i32 1
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = icmp eq i8* %6, getelementptr inbounds ([3 x i8], [3 x i8]* @_ZTSDn, i64 0, i64 0)
  br i1 %7, label %8, label %19

8:                                                ; preds = %3
  %9 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 2
  %10 = load %"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"** %9, align 8, !tbaa !35
  %11 = icmp eq %"class.__cxxabiv1::__shim_type_info"* %10, null
  br i1 %11, label %16, label %12

12:                                               ; preds = %8
  %13 = bitcast %"class.__cxxabiv1::__shim_type_info"* %10 to i8*
  %14 = tail call i8* @__dynamic_cast(i8* nonnull %13, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv120__function_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %15 = icmp eq i8* %14, null
  br i1 %15, label %16, label %17

16:                                               ; preds = %8, %12
  br label %17

17:                                               ; preds = %12, %16
  %18 = phi i8* [ bitcast (i64* @_ZZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPvE12null_ptr_rep_0 to i8*), %16 ], [ bitcast ({ i64, i64 }* @_ZZNK10__cxxabiv129__pointer_to_member_type_info9can_catchEPKNS_16__shim_type_infoERPvE12null_ptr_rep to i8*), %12 ]
  store i8* %18, i8** %2, align 8, !tbaa !17
  br label %92

19:                                               ; preds = %3
  %20 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 1
  %21 = load i32, i32* %20, align 8, !tbaa !33
  %22 = and i32 %21, 24
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %39

24:                                               ; preds = %19
  %25 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  %26 = tail call i8* @__dynamic_cast(i8* nonnull %25, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv117__pbase_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %27 = icmp eq i8* %26, null
  br i1 %27, label %50, label %28

28:                                               ; preds = %24
  %29 = getelementptr inbounds i8, i8* %26, i64 16
  %30 = bitcast i8* %29 to i32*
  %31 = load i32, i32* %30, align 8, !tbaa !33
  %32 = and i32 %31, 24
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %28
  %35 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %36 = load i8*, i8** %35, align 8, !tbaa !3
  %37 = load i8*, i8** %5, align 8, !tbaa !3
  %38 = icmp eq i8* %36, %37
  br i1 %38, label %92, label %50

39:                                               ; preds = %28, %19
  %40 = getelementptr %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %41 = icmp eq %"class.std::type_info"* %40, %4
  br i1 %41, label %92, label %42

42:                                               ; preds = %39
  %43 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %44 = load i8*, i8** %43, align 8, !tbaa !3
  %45 = load i8*, i8** %5, align 8, !tbaa !3
  %46 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %44, i8* nonnull dereferenceable(1) %45) #16
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %92, label %48

48:                                               ; preds = %42
  %49 = bitcast %"class.__cxxabiv1::__shim_type_info"* %1 to i8*
  br label %50

50:                                               ; preds = %48, %24, %34
  %51 = phi i8* [ %49, %48 ], [ %25, %24 ], [ %25, %34 ]
  %52 = tail call i8* @__dynamic_cast(i8* nonnull %51, %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv116__shim_type_infoE to %"class.__cxxabiv1::__class_type_info"*), %"class.__cxxabiv1::__class_type_info"* bitcast ({ i8*, i8*, i8* }* @_ZTIN10__cxxabiv129__pointer_to_member_type_infoE to %"class.__cxxabiv1::__class_type_info"*), i64 0) #13
  %53 = icmp eq i8* %52, null
  br i1 %53, label %92, label %54

54:                                               ; preds = %50
  %55 = getelementptr inbounds i8, i8* %52, i64 16
  %56 = bitcast i8* %55 to i32*
  %57 = load i32, i32* %56, align 8, !tbaa !33
  %58 = load i32, i32* %20, align 8, !tbaa !33
  %59 = xor i32 %58, 7
  %60 = and i32 %57, 7
  %61 = and i32 %60, %59
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %92

63:                                               ; preds = %54
  %64 = and i32 %57, 96
  %65 = xor i32 %64, 96
  %66 = and i32 %65, %58
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %68, label %92

68:                                               ; preds = %63
  %69 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 0, i32 2
  %70 = bitcast %"class.__cxxabiv1::__shim_type_info"** %69 to %"class.std::type_info"**
  %71 = load %"class.std::type_info"*, %"class.std::type_info"** %70, align 8, !tbaa !35
  %72 = getelementptr inbounds i8, i8* %52, i64 24
  %73 = bitcast i8* %72 to %"class.std::type_info"**
  %74 = load %"class.std::type_info"*, %"class.std::type_info"** %73, align 8, !tbaa !35
  %75 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %71, i64 0, i32 1
  %76 = load i8*, i8** %75, align 8, !tbaa !3
  %77 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %74, i64 0, i32 1
  %78 = load i8*, i8** %77, align 8, !tbaa !3
  %79 = icmp eq i8* %76, %78
  br i1 %79, label %80, label %92

80:                                               ; preds = %68
  %81 = getelementptr inbounds %"class.__cxxabiv1::__pointer_to_member_type_info", %"class.__cxxabiv1::__pointer_to_member_type_info"* %0, i64 0, i32 1
  %82 = bitcast %"class.__cxxabiv1::__class_type_info"** %81 to %"class.std::type_info"**
  %83 = load %"class.std::type_info"*, %"class.std::type_info"** %82, align 8, !tbaa !36
  %84 = getelementptr inbounds i8, i8* %52, i64 32
  %85 = bitcast i8* %84 to %"class.std::type_info"**
  %86 = load %"class.std::type_info"*, %"class.std::type_info"** %85, align 8, !tbaa !36
  %87 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %83, i64 0, i32 1
  %88 = load i8*, i8** %87, align 8, !tbaa !3
  %89 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %86, i64 0, i32 1
  %90 = load i8*, i8** %89, align 8, !tbaa !3
  %91 = icmp eq i8* %88, %90
  br label %92

92:                                               ; preds = %39, %34, %50, %54, %63, %68, %80, %42, %17
  %93 = phi i1 [ true, %17 ], [ true, %42 ], [ false, %50 ], [ false, %54 ], [ false, %63 ], [ false, %68 ], [ %91, %80 ], [ true, %34 ], [ true, %39 ]
  ret i1 %93
}

; Function Attrs: uwtable
define i8* @__dynamic_cast(i8* %0, %"class.__cxxabiv1::__class_type_info"* %1, %"class.__cxxabiv1::__class_type_info"* %2, i64 %3) local_unnamed_addr #7 {
  %5 = alloca %"struct.__cxxabiv1::__dynamic_cast_info", align 8
  %6 = bitcast i8* %0 to i8***
  %7 = load i8**, i8*** %6, align 8, !tbaa !17
  %8 = getelementptr inbounds i8*, i8** %7, i64 -2
  %9 = bitcast i8** %8 to i64*
  %10 = load i64, i64* %9, align 8, !tbaa !17
  %11 = getelementptr inbounds i8, i8* %0, i64 %10
  %12 = getelementptr inbounds i8*, i8** %7, i64 -1
  %13 = bitcast i8** %12 to %"class.__cxxabiv1::__class_type_info"**
  %14 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %13, align 8, !tbaa !17
  %15 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 80, i8* nonnull %15) #13
  %16 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 0
  store %"class.__cxxabiv1::__class_type_info"* %2, %"class.__cxxabiv1::__class_type_info"** %16, align 8, !tbaa !8
  %17 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 1
  store i8* %0, i8** %17, align 8, !tbaa !13
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 2
  store %"class.__cxxabiv1::__class_type_info"* %1, %"class.__cxxabiv1::__class_type_info"** %18, align 8, !tbaa !14
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 3
  store i64 %3, i64* %19, align 8, !tbaa !15
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 4
  %21 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 5
  %22 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 6
  %23 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 7
  %24 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 8
  %25 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 10
  %26 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %14, i64 0, i32 0, i32 0, i32 1
  %27 = bitcast i8** %20 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(47) %27, i8 0, i64 47, i1 false)
  %28 = load i8*, i8** %26, align 8, !tbaa !3
  %29 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %2, i64 0, i32 0, i32 0, i32 1
  %30 = load i8*, i8** %29, align 8, !tbaa !3
  %31 = icmp eq i8* %28, %30
  br i1 %31, label %32, label %41

32:                                               ; preds = %4
  %33 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 12
  store i32 1, i32* %33, align 8, !tbaa !16
  %34 = bitcast %"class.__cxxabiv1::__class_type_info"* %14 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %35 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %34, align 8, !tbaa !18
  %36 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %35, i64 5
  %37 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %36, align 8
  call void %37(%"class.__cxxabiv1::__class_type_info"* %14, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %5, i8* %11, i8* %11, i32 1, i1 zeroext false)
  %38 = load i32, i32* %22, align 8, !tbaa !20
  %39 = icmp eq i32 %38, 1
  %40 = select i1 %39, i8* %11, i8* null
  br label %73

41:                                               ; preds = %4
  %42 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %5, i64 0, i32 9
  %43 = bitcast %"class.__cxxabiv1::__class_type_info"* %14 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %44 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %43, align 8, !tbaa !18
  %45 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %44, i64 6
  %46 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %45, align 8
  call void %46(%"class.__cxxabiv1::__class_type_info"* %14, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %5, i8* %11, i32 1, i1 zeroext false)
  %47 = load i32, i32* %42, align 4, !tbaa !22
  switch i32 %47, label %73 [
    i32 0, label %48
    i32 1, label %59
  ]

48:                                               ; preds = %41
  %49 = load i32, i32* %25, align 8, !tbaa !38
  %50 = icmp eq i32 %49, 1
  %51 = load i32, i32* %23, align 4
  %52 = icmp eq i32 %51, 1
  %53 = and i1 %50, %52
  %54 = load i32, i32* %24, align 8
  %55 = icmp eq i32 %54, 1
  %56 = and i1 %53, %55
  %57 = load i8*, i8** %21, align 8
  %58 = select i1 %56, i8* %57, i8* null
  br label %73

59:                                               ; preds = %41
  %60 = load i32, i32* %22, align 8, !tbaa !20
  %61 = icmp eq i32 %60, 1
  br i1 %61, label %71, label %62

62:                                               ; preds = %59
  %63 = load i32, i32* %25, align 8, !tbaa !38
  %64 = icmp eq i32 %63, 0
  %65 = load i32, i32* %23, align 4
  %66 = icmp eq i32 %65, 1
  %67 = and i1 %64, %66
  %68 = load i32, i32* %24, align 8
  %69 = icmp eq i32 %68, 1
  %70 = and i1 %67, %69
  br i1 %70, label %71, label %73

71:                                               ; preds = %62, %59
  %72 = load i8*, i8** %20, align 8, !tbaa !21
  br label %73

73:                                               ; preds = %48, %32, %41, %71, %62
  %74 = phi i8* [ null, %41 ], [ %72, %71 ], [ null, %62 ], [ %40, %32 ], [ %58, %48 ]
  call void @llvm.lifetime.end.p0i8(i64 80, i8* nonnull %15) #13
  ret i8* %74
}

; Function Attrs: nofree norecurse nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info29process_static_type_above_dstEPNS_19__dynamic_cast_infoEPKvS4_i(%"class.__cxxabiv1::__class_type_info"* nocapture readnone %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* %2, i8* readnone %3, i32 %4) local_unnamed_addr #9 align 2 {
  %6 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  store i8 1, i8* %6, align 1, !tbaa !39
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %8 = load i8*, i8** %7, align 8, !tbaa !13
  %9 = icmp eq i8* %8, %3
  br i1 %9, label %10, label %46

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  store i8 1, i8* %11, align 4, !tbaa !40
  %12 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %13 = load i8*, i8** %12, align 8, !tbaa !21
  %14 = icmp eq i8* %13, null
  br i1 %14, label %15, label %25

15:                                               ; preds = %10
  store i8* %2, i8** %12, align 8, !tbaa !21
  %16 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %4, i32* %16, align 8, !tbaa !20
  %17 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %17, align 4, !tbaa !22
  %18 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %19 = load i32, i32* %18, align 8, !tbaa !16
  %20 = icmp eq i32 %19, 1
  %21 = icmp eq i32 %4, 1
  %22 = and i1 %21, %20
  br i1 %22, label %23, label %46

23:                                               ; preds = %15
  %24 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %24, align 2, !tbaa !23
  br label %46

25:                                               ; preds = %10
  %26 = icmp eq i8* %13, %2
  br i1 %26, label %27, label %41

27:                                               ; preds = %25
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %29 = load i32, i32* %28, align 8, !tbaa !20
  %30 = icmp eq i32 %29, 2
  br i1 %30, label %31, label %32

31:                                               ; preds = %27
  store i32 %4, i32* %28, align 8, !tbaa !20
  br label %32

32:                                               ; preds = %31, %27
  %33 = phi i32 [ %4, %31 ], [ %29, %27 ]
  %34 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %35 = load i32, i32* %34, align 8, !tbaa !16
  %36 = icmp eq i32 %35, 1
  %37 = icmp eq i32 %33, 1
  %38 = and i1 %36, %37
  br i1 %38, label %39, label %46

39:                                               ; preds = %32
  %40 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %40, align 2, !tbaa !23
  br label %46

41:                                               ; preds = %25
  %42 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %43 = load i32, i32* %42, align 4, !tbaa !22
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %42, align 4, !tbaa !22
  %45 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %45, align 2, !tbaa !23
  br label %46

46:                                               ; preds = %23, %15, %32, %39, %41, %5
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info29process_static_type_below_dstEPNS_19__dynamic_cast_infoEPKvi(%"class.__cxxabiv1::__class_type_info"* nocapture readnone %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* readnone %2, i32 %3) local_unnamed_addr #9 align 2 {
  %5 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %6 = load i8*, i8** %5, align 8, !tbaa !13
  %7 = icmp eq i8* %6, %2
  br i1 %7, label %8, label %13

8:                                                ; preds = %4
  %9 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 7
  %10 = load i32, i32* %9, align 4, !tbaa !41
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %13, label %12

12:                                               ; preds = %8
  store i32 %3, i32* %9, align 4, !tbaa !41
  br label %13

13:                                               ; preds = %8, %12, %4
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv121__vmi_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib(%"class.__cxxabiv1::__vmi_class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3, i1 zeroext %4) unnamed_addr #7 align 2 {
  %6 = getelementptr %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %4, label %16, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %25, label %34

16:                                               ; preds = %5
  %17 = icmp eq %"class.std::type_info"* %6, %9
  br i1 %17, label %25, label %18

18:                                               ; preds = %16
  %19 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !3
  %21 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  %23 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %22) #16
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %40

25:                                               ; preds = %16, %10, %18
  %26 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !13
  %28 = icmp eq i8* %27, %2
  br i1 %28, label %29, label %301

29:                                               ; preds = %25
  %30 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 7
  %31 = load i32, i32* %30, align 4, !tbaa !41
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %301, label %33

33:                                               ; preds = %29
  store i32 %3, i32* %30, align 4, !tbaa !41
  br label %301

34:                                               ; preds = %10
  %35 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %36 = load %"class.std::type_info"*, %"class.std::type_info"** %35, align 8, !tbaa !8
  %37 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %36, i64 0, i32 1
  %38 = load i8*, i8** %37, align 8, !tbaa !3
  %39 = icmp eq i8* %12, %38
  br i1 %39, label %49, label %153

40:                                               ; preds = %18
  %41 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %42 = load %"class.std::type_info"*, %"class.std::type_info"** %41, align 8, !tbaa !8
  %43 = icmp eq %"class.std::type_info"* %6, %42
  br i1 %43, label %49, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %42, i64 0, i32 1
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  %47 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %46) #16
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %153

49:                                               ; preds = %40, %34, %44
  %50 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %51 = load i8*, i8** %50, align 8, !tbaa !21
  %52 = icmp eq i8* %51, %2
  br i1 %52, label %57, label %53

53:                                               ; preds = %49
  %54 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 5
  %55 = load i8*, i8** %54, align 8, !tbaa !42
  %56 = icmp eq i8* %55, %2
  br i1 %56, label %57, label %61

57:                                               ; preds = %53, %49
  %58 = icmp eq i32 %3, 1
  br i1 %58, label %59, label %301

59:                                               ; preds = %57
  %60 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 1, i32* %60, align 8, !tbaa !43
  br label %301

61:                                               ; preds = %53
  %62 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 %3, i32* %62, align 8, !tbaa !43
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 11
  %64 = load i32, i32* %63, align 4, !tbaa !44
  %65 = icmp eq i32 %64, 4
  br i1 %65, label %140, label %66

66:                                               ; preds = %61
  %67 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 2
  %68 = load i32, i32* %67, align 4, !tbaa !30
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 %69
  %71 = icmp eq i32 %68, 0
  br i1 %71, label %72, label %73

72:                                               ; preds = %66
  store i32 4, i32* %63, align 4, !tbaa !44
  br label %140

73:                                               ; preds = %66
  %74 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0
  %75 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  %76 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  %77 = bitcast i8* %2 to i8**
  %78 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  %79 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %80 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 1
  br label %81

81:                                               ; preds = %73, %126
  %82 = phi i8 [ 0, %73 ], [ %128, %126 ]
  %83 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %74, %73 ], [ %129, %126 ]
  %84 = phi i8 [ 0, %73 ], [ %127, %126 ]
  store i8 0, i8* %75, align 4, !tbaa !40
  store i8 0, i8* %76, align 1, !tbaa !39
  %85 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %83, i64 0, i32 1
  %86 = load i64, i64* %85, align 8, !tbaa !26
  %87 = ashr i64 %86, 8
  %88 = and i64 %86, 1
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %95, label %90

90:                                               ; preds = %81
  %91 = load i8*, i8** %77, align 8, !tbaa !17
  %92 = getelementptr inbounds i8, i8* %91, i64 %87
  %93 = bitcast i8* %92 to i64*
  %94 = load i64, i64* %93, align 8, !tbaa !28
  br label %95

95:                                               ; preds = %81, %90
  %96 = phi i64 [ %94, %90 ], [ %87, %81 ]
  %97 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %83, i64 0, i32 0
  %98 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %97, align 8, !tbaa !29
  %99 = getelementptr inbounds i8, i8* %2, i64 %96
  %100 = and i64 %86, 2
  %101 = icmp eq i64 %100, 0
  %102 = select i1 %101, i32 2, i32 1
  %103 = bitcast %"class.__cxxabiv1::__class_type_info"* %98 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %104 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %103, align 8, !tbaa !18
  %105 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %104, i64 5
  %106 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %105, align 8
  tail call void %106(%"class.__cxxabiv1::__class_type_info"* %98, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i8* %99, i32 %102, i1 zeroext %4)
  %107 = load i8, i8* %78, align 2, !tbaa !23, !range !32
  %108 = icmp eq i8 %107, 0
  br i1 %108, label %109, label %132

109:                                              ; preds = %95
  %110 = load i8, i8* %76, align 1, !tbaa !39, !range !32
  %111 = icmp eq i8 %110, 0
  br i1 %111, label %126, label %112

112:                                              ; preds = %109
  %113 = load i8, i8* %75, align 4, !tbaa !40, !range !32
  %114 = icmp eq i8 %113, 0
  br i1 %114, label %122, label %115

115:                                              ; preds = %112
  %116 = load i32, i32* %79, align 8, !tbaa !20
  %117 = icmp eq i32 %116, 1
  br i1 %117, label %131, label %118

118:                                              ; preds = %115
  %119 = load i32, i32* %80, align 8, !tbaa !45
  %120 = and i32 %119, 2
  %121 = icmp eq i32 %120, 0
  br i1 %121, label %131, label %126

122:                                              ; preds = %112
  %123 = load i32, i32* %80, align 8, !tbaa !45
  %124 = and i32 %123, 1
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %132, label %126

126:                                              ; preds = %118, %122, %109
  %127 = phi i8 [ 1, %118 ], [ 1, %122 ], [ %84, %109 ]
  %128 = phi i8 [ 1, %118 ], [ %82, %122 ], [ %82, %109 ]
  %129 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %83, i64 1
  %130 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %129, %70
  br i1 %130, label %81, label %132

131:                                              ; preds = %115, %118
  store i32 3, i32* %63, align 4, !tbaa !44
  br label %301

132:                                              ; preds = %122, %95, %126
  %133 = phi i8 [ %82, %122 ], [ %82, %95 ], [ %128, %126 ]
  %134 = phi i8 [ 1, %122 ], [ %84, %95 ], [ %127, %126 ]
  %135 = and i8 %134, 1
  %136 = icmp eq i8 %135, 0
  %137 = select i1 %136, i32 4, i32 3
  store i32 %137, i32* %63, align 4, !tbaa !44
  %138 = and i8 %133, 1
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %140, label %301

140:                                              ; preds = %72, %61, %132
  store i8* %2, i8** %54, align 8, !tbaa !42
  %141 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 10
  %142 = load i32, i32* %141, align 8, !tbaa !38
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %141, align 8, !tbaa !38
  %144 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %145 = load i32, i32* %144, align 4, !tbaa !22
  %146 = icmp eq i32 %145, 1
  br i1 %146, label %147, label %301

147:                                              ; preds = %140
  %148 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %149 = load i32, i32* %148, align 8, !tbaa !20
  %150 = icmp eq i32 %149, 2
  br i1 %150, label %151, label %301

151:                                              ; preds = %147
  %152 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %152, align 2, !tbaa !23
  br label %301

153:                                              ; preds = %34, %44
  %154 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 2
  %155 = load i32, i32* %154, align 4, !tbaa !30
  %156 = zext i32 %155 to i64
  %157 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 %156
  %158 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 1
  %159 = load i64, i64* %158, align 8, !tbaa !26
  %160 = ashr i64 %159, 8
  %161 = and i64 %159, 1
  %162 = icmp eq i64 %161, 0
  br i1 %162, label %169, label %163

163:                                              ; preds = %153
  %164 = bitcast i8* %2 to i8**
  %165 = load i8*, i8** %164, align 8, !tbaa !17
  %166 = getelementptr inbounds i8, i8* %165, i64 %160
  %167 = bitcast i8* %166 to i64*
  %168 = load i64, i64* %167, align 8, !tbaa !28
  br label %169

169:                                              ; preds = %153, %163
  %170 = phi i64 [ %168, %163 ], [ %160, %153 ]
  %171 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 0
  %172 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %171, align 8, !tbaa !29
  %173 = getelementptr inbounds i8, i8* %2, i64 %170
  %174 = and i64 %159, 2
  %175 = icmp eq i64 %174, 0
  %176 = select i1 %175, i32 2, i32 %3
  %177 = bitcast %"class.__cxxabiv1::__class_type_info"* %172 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %178 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %177, align 8, !tbaa !18
  %179 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %178, i64 6
  %180 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %179, align 8
  tail call void %180(%"class.__cxxabiv1::__class_type_info"* %172, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %173, i32 %176, i1 zeroext %4)
  %181 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 1
  %182 = icmp ugt i32 %155, 1
  br i1 %182, label %183, label %301

183:                                              ; preds = %169
  %184 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 1
  %185 = load i32, i32* %184, align 8, !tbaa !45
  %186 = and i32 %185, 2
  %187 = icmp eq i32 %186, 0
  br i1 %187, label %188, label %192

188:                                              ; preds = %183
  %189 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %190 = load i32, i32* %189, align 4, !tbaa !22
  %191 = icmp eq i32 %190, 1
  br i1 %191, label %192, label %224

192:                                              ; preds = %183, %188
  %193 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  %194 = bitcast i8* %2 to i8**
  br label %195

195:                                              ; preds = %210, %192
  %196 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %181, %192 ], [ %222, %210 ]
  %197 = load i8, i8* %193, align 2, !tbaa !23, !range !32
  %198 = icmp eq i8 %197, 0
  br i1 %198, label %199, label %301

199:                                              ; preds = %195
  %200 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %196, i64 0, i32 1
  %201 = load i64, i64* %200, align 8, !tbaa !26
  %202 = ashr i64 %201, 8
  %203 = and i64 %201, 1
  %204 = icmp eq i64 %203, 0
  br i1 %204, label %210, label %205

205:                                              ; preds = %199
  %206 = load i8*, i8** %194, align 8, !tbaa !17
  %207 = getelementptr inbounds i8, i8* %206, i64 %202
  %208 = bitcast i8* %207 to i64*
  %209 = load i64, i64* %208, align 8, !tbaa !28
  br label %210

210:                                              ; preds = %199, %205
  %211 = phi i64 [ %209, %205 ], [ %202, %199 ]
  %212 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %196, i64 0, i32 0
  %213 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %212, align 8, !tbaa !29
  %214 = getelementptr inbounds i8, i8* %2, i64 %211
  %215 = and i64 %201, 2
  %216 = icmp eq i64 %215, 0
  %217 = select i1 %216, i32 2, i32 %3
  %218 = bitcast %"class.__cxxabiv1::__class_type_info"* %213 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %219 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %218, align 8, !tbaa !18
  %220 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %219, i64 6
  %221 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %220, align 8
  tail call void %221(%"class.__cxxabiv1::__class_type_info"* %213, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %214, i32 %217, i1 zeroext %4)
  %222 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %196, i64 1
  %223 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %222, %157
  br i1 %223, label %195, label %301

224:                                              ; preds = %188
  %225 = and i32 %185, 1
  %226 = icmp eq i32 %225, 0
  br i1 %226, label %231, label %227

227:                                              ; preds = %224
  %228 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %229 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  %230 = bitcast i8* %2 to i8**
  br label %234

231:                                              ; preds = %224
  %232 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  %233 = bitcast i8* %2 to i8**
  br label %269

234:                                              ; preds = %227, %255
  %235 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %267, %255 ], [ %181, %227 ]
  %236 = load i8, i8* %229, align 2, !tbaa !23, !range !32
  %237 = icmp eq i8 %236, 0
  br i1 %237, label %238, label %301

238:                                              ; preds = %234
  %239 = load i32, i32* %189, align 4, !tbaa !22
  %240 = icmp eq i32 %239, 1
  br i1 %240, label %241, label %244

241:                                              ; preds = %238
  %242 = load i32, i32* %228, align 8, !tbaa !20
  %243 = icmp eq i32 %242, 1
  br i1 %243, label %301, label %244

244:                                              ; preds = %241, %238
  %245 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %235, i64 0, i32 1
  %246 = load i64, i64* %245, align 8, !tbaa !26
  %247 = ashr i64 %246, 8
  %248 = and i64 %246, 1
  %249 = icmp eq i64 %248, 0
  br i1 %249, label %255, label %250

250:                                              ; preds = %244
  %251 = load i8*, i8** %230, align 8, !tbaa !17
  %252 = getelementptr inbounds i8, i8* %251, i64 %247
  %253 = bitcast i8* %252 to i64*
  %254 = load i64, i64* %253, align 8, !tbaa !28
  br label %255

255:                                              ; preds = %244, %250
  %256 = phi i64 [ %254, %250 ], [ %247, %244 ]
  %257 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %235, i64 0, i32 0
  %258 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %257, align 8, !tbaa !29
  %259 = getelementptr inbounds i8, i8* %2, i64 %256
  %260 = and i64 %246, 2
  %261 = icmp eq i64 %260, 0
  %262 = select i1 %261, i32 2, i32 %3
  %263 = bitcast %"class.__cxxabiv1::__class_type_info"* %258 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %264 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %263, align 8, !tbaa !18
  %265 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %264, i64 6
  %266 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %265, align 8
  tail call void %266(%"class.__cxxabiv1::__class_type_info"* %258, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %259, i32 %262, i1 zeroext %4)
  %267 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %235, i64 1
  %268 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %267, %157
  br i1 %268, label %234, label %301

269:                                              ; preds = %231, %287
  %270 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %299, %287 ], [ %181, %231 ]
  %271 = load i8, i8* %232, align 2, !tbaa !23, !range !32
  %272 = icmp eq i8 %271, 0
  br i1 %272, label %273, label %301

273:                                              ; preds = %269
  %274 = load i32, i32* %189, align 4, !tbaa !22
  %275 = icmp eq i32 %274, 1
  br i1 %275, label %301, label %276

276:                                              ; preds = %273
  %277 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %270, i64 0, i32 1
  %278 = load i64, i64* %277, align 8, !tbaa !26
  %279 = ashr i64 %278, 8
  %280 = and i64 %278, 1
  %281 = icmp eq i64 %280, 0
  br i1 %281, label %287, label %282

282:                                              ; preds = %276
  %283 = load i8*, i8** %233, align 8, !tbaa !17
  %284 = getelementptr inbounds i8, i8* %283, i64 %279
  %285 = bitcast i8* %284 to i64*
  %286 = load i64, i64* %285, align 8, !tbaa !28
  br label %287

287:                                              ; preds = %276, %282
  %288 = phi i64 [ %286, %282 ], [ %279, %276 ]
  %289 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %270, i64 0, i32 0
  %290 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %289, align 8, !tbaa !29
  %291 = getelementptr inbounds i8, i8* %2, i64 %288
  %292 = and i64 %278, 2
  %293 = icmp eq i64 %292, 0
  %294 = select i1 %293, i32 2, i32 %3
  %295 = bitcast %"class.__cxxabiv1::__class_type_info"* %290 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %296 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %295, align 8, !tbaa !18
  %297 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %296, i64 6
  %298 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %297, align 8
  tail call void %298(%"class.__cxxabiv1::__class_type_info"* %290, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %291, i32 %294, i1 zeroext %4)
  %299 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %270, i64 1
  %300 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %299, %157
  br i1 %300, label %269, label %301

301:                                              ; preds = %241, %255, %234, %273, %287, %269, %210, %195, %131, %33, %29, %25, %169, %151, %147, %140, %132, %57, %59
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv122__base_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib(%"struct.__cxxabiv1::__base_class_type_info"* nocapture readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i8* %3, i32 %4, i1 zeroext %5) local_unnamed_addr #7 align 2 {
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 1
  %8 = load i64, i64* %7, align 8, !tbaa !26
  %9 = ashr i64 %8, 8
  %10 = and i64 %8, 1
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %18, label %12

12:                                               ; preds = %6
  %13 = bitcast i8* %3 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !17
  %15 = getelementptr inbounds i8, i8* %14, i64 %9
  %16 = bitcast i8* %15 to i64*
  %17 = load i64, i64* %16, align 8, !tbaa !28
  br label %18

18:                                               ; preds = %6, %12
  %19 = phi i64 [ %17, %12 ], [ %9, %6 ]
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 0
  %21 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %20, align 8, !tbaa !29
  %22 = getelementptr inbounds i8, i8* %3, i64 %19
  %23 = and i64 %8, 2
  %24 = icmp eq i64 %23, 0
  %25 = select i1 %24, i32 2, i32 %4
  %26 = bitcast %"class.__cxxabiv1::__class_type_info"* %21 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %27 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %26, align 8, !tbaa !18
  %28 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %27, i64 5
  %29 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %28, align 8
  tail call void %29(%"class.__cxxabiv1::__class_type_info"* %21, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i8* %22, i32 %25, i1 zeroext %5)
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv122__base_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib(%"struct.__cxxabiv1::__base_class_type_info"* nocapture readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3, i1 zeroext %4) local_unnamed_addr #7 align 2 {
  %6 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !26
  %8 = ashr i64 %7, 8
  %9 = and i64 %7, 1
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %17, label %11

11:                                               ; preds = %5
  %12 = bitcast i8* %2 to i8**
  %13 = load i8*, i8** %12, align 8, !tbaa !17
  %14 = getelementptr inbounds i8, i8* %13, i64 %8
  %15 = bitcast i8* %14 to i64*
  %16 = load i64, i64* %15, align 8, !tbaa !28
  br label %17

17:                                               ; preds = %5, %11
  %18 = phi i64 [ %16, %11 ], [ %8, %5 ]
  %19 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %0, i64 0, i32 0
  %20 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %19, align 8, !tbaa !29
  %21 = getelementptr inbounds i8, i8* %2, i64 %18
  %22 = and i64 %7, 2
  %23 = icmp eq i64 %22, 0
  %24 = select i1 %23, i32 2, i32 %3
  %25 = bitcast %"class.__cxxabiv1::__class_type_info"* %20 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %26 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %25, align 8, !tbaa !18
  %27 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %26, i64 6
  %28 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %27, align 8
  tail call void %28(%"class.__cxxabiv1::__class_type_info"* %20, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %21, i32 %24, i1 zeroext %4)
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv120__si_class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib(%"class.__cxxabiv1::__si_class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i32 %3, i1 zeroext %4) unnamed_addr #7 align 2 {
  %6 = getelementptr %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %4, label %16, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %25, label %34

16:                                               ; preds = %5
  %17 = icmp eq %"class.std::type_info"* %6, %9
  br i1 %17, label %25, label %18

18:                                               ; preds = %16
  %19 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !3
  %21 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  %23 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %22) #16
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %40

25:                                               ; preds = %16, %10, %18
  %26 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !13
  %28 = icmp eq i8* %27, %2
  br i1 %28, label %29, label %101

29:                                               ; preds = %25
  %30 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 7
  %31 = load i32, i32* %30, align 4, !tbaa !41
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %101, label %33

33:                                               ; preds = %29
  store i32 %3, i32* %30, align 4, !tbaa !41
  br label %101

34:                                               ; preds = %10
  %35 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %36 = load %"class.std::type_info"*, %"class.std::type_info"** %35, align 8, !tbaa !8
  %37 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %36, i64 0, i32 1
  %38 = load i8*, i8** %37, align 8, !tbaa !3
  %39 = icmp eq i8* %12, %38
  br i1 %39, label %49, label %94

40:                                               ; preds = %18
  %41 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %42 = load %"class.std::type_info"*, %"class.std::type_info"** %41, align 8, !tbaa !8
  %43 = icmp eq %"class.std::type_info"* %6, %42
  br i1 %43, label %49, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %42, i64 0, i32 1
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  %47 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %46) #16
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %94

49:                                               ; preds = %40, %34, %44
  %50 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %51 = load i8*, i8** %50, align 8, !tbaa !21
  %52 = icmp eq i8* %51, %2
  br i1 %52, label %57, label %53

53:                                               ; preds = %49
  %54 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 5
  %55 = load i8*, i8** %54, align 8, !tbaa !42
  %56 = icmp eq i8* %55, %2
  br i1 %56, label %57, label %61

57:                                               ; preds = %53, %49
  %58 = icmp eq i32 %3, 1
  br i1 %58, label %59, label %101

59:                                               ; preds = %57
  %60 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 1, i32* %60, align 8, !tbaa !43
  br label %101

61:                                               ; preds = %53
  %62 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 %3, i32* %62, align 8, !tbaa !43
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 11
  %64 = load i32, i32* %63, align 4, !tbaa !44
  %65 = icmp eq i32 %64, 4
  br i1 %65, label %81, label %66

66:                                               ; preds = %61
  %67 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  store i8 0, i8* %67, align 4, !tbaa !40
  %68 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  store i8 0, i8* %68, align 1, !tbaa !39
  %69 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 1
  %70 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %69, align 8, !tbaa !24
  %71 = bitcast %"class.__cxxabiv1::__class_type_info"* %70 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %72 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %71, align 8, !tbaa !18
  %73 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %72, i64 5
  %74 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %73, align 8
  tail call void %74(%"class.__cxxabiv1::__class_type_info"* %70, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i8* %2, i32 1, i1 zeroext %4)
  %75 = load i8, i8* %68, align 1, !tbaa !39, !range !32
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %80, label %77

77:                                               ; preds = %66
  %78 = load i8, i8* %67, align 4, !tbaa !40, !range !32
  %79 = icmp eq i8 %78, 0
  store i32 3, i32* %63, align 4, !tbaa !44
  br i1 %79, label %81, label %101

80:                                               ; preds = %66
  store i32 4, i32* %63, align 4, !tbaa !44
  br label %81

81:                                               ; preds = %77, %61, %80
  store i8* %2, i8** %54, align 8, !tbaa !42
  %82 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 10
  %83 = load i32, i32* %82, align 8, !tbaa !38
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %82, align 8, !tbaa !38
  %85 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %86 = load i32, i32* %85, align 4, !tbaa !22
  %87 = icmp eq i32 %86, 1
  br i1 %87, label %88, label %101

88:                                               ; preds = %81
  %89 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %90 = load i32, i32* %89, align 8, !tbaa !20
  %91 = icmp eq i32 %90, 2
  br i1 %91, label %92, label %101

92:                                               ; preds = %88
  %93 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %93, align 2, !tbaa !23
  br label %101

94:                                               ; preds = %34, %44
  %95 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 1
  %96 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %95, align 8, !tbaa !24
  %97 = bitcast %"class.__cxxabiv1::__class_type_info"* %96 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)***
  %98 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*** %97, align 8, !tbaa !18
  %99 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %98, i64 6
  %100 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i32, i1)** %99, align 8
  tail call void %100(%"class.__cxxabiv1::__class_type_info"* %96, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i32 %3, i1 zeroext %4)
  br label %101

101:                                              ; preds = %77, %33, %29, %25, %92, %88, %81, %94, %57, %59
  ret void
}

; Function Attrs: nofree nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info16search_below_dstEPNS_19__dynamic_cast_infoEPKvib(%"class.__cxxabiv1::__class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* %2, i32 %3, i1 zeroext %4) unnamed_addr #10 align 2 {
  %6 = getelementptr %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %4, label %16, label %10

10:                                               ; preds = %5
  %11 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %25, label %34

16:                                               ; preds = %5
  %17 = icmp eq %"class.std::type_info"* %6, %9
  br i1 %17, label %25, label %18

18:                                               ; preds = %16
  %19 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !3
  %21 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %22 = load i8*, i8** %21, align 8, !tbaa !3
  %23 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %22) #16
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %40

25:                                               ; preds = %16, %10, %18
  %26 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %27 = load i8*, i8** %26, align 8, !tbaa !13
  %28 = icmp eq i8* %27, %2
  br i1 %28, label %29, label %77

29:                                               ; preds = %25
  %30 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 7
  %31 = load i32, i32* %30, align 4, !tbaa !41
  %32 = icmp eq i32 %31, 1
  br i1 %32, label %77, label %33

33:                                               ; preds = %29
  store i32 %3, i32* %30, align 4, !tbaa !41
  br label %77

34:                                               ; preds = %10
  %35 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %36 = load %"class.std::type_info"*, %"class.std::type_info"** %35, align 8, !tbaa !8
  %37 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %36, i64 0, i32 1
  %38 = load i8*, i8** %37, align 8, !tbaa !3
  %39 = icmp eq i8* %12, %38
  br i1 %39, label %49, label %77

40:                                               ; preds = %18
  %41 = bitcast %"struct.__cxxabiv1::__dynamic_cast_info"* %1 to %"class.std::type_info"**
  %42 = load %"class.std::type_info"*, %"class.std::type_info"** %41, align 8, !tbaa !8
  %43 = icmp eq %"class.std::type_info"* %6, %42
  br i1 %43, label %49, label %44

44:                                               ; preds = %40
  %45 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %42, i64 0, i32 1
  %46 = load i8*, i8** %45, align 8, !tbaa !3
  %47 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %20, i8* nonnull dereferenceable(1) %46) #16
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %77

49:                                               ; preds = %40, %34, %44
  %50 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %51 = load i8*, i8** %50, align 8, !tbaa !21
  %52 = icmp eq i8* %51, %2
  br i1 %52, label %57, label %53

53:                                               ; preds = %49
  %54 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 5
  %55 = load i8*, i8** %54, align 8, !tbaa !42
  %56 = icmp eq i8* %55, %2
  br i1 %56, label %57, label %61

57:                                               ; preds = %53, %49
  %58 = icmp eq i32 %3, 1
  br i1 %58, label %59, label %77

59:                                               ; preds = %57
  %60 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 1, i32* %60, align 8, !tbaa !43
  br label %77

61:                                               ; preds = %53
  %62 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 8
  store i32 %3, i32* %62, align 8, !tbaa !43
  store i8* %2, i8** %54, align 8, !tbaa !42
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 10
  %64 = load i32, i32* %63, align 8, !tbaa !38
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %63, align 8, !tbaa !38
  %66 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %67 = load i32, i32* %66, align 4, !tbaa !22
  %68 = icmp eq i32 %67, 1
  br i1 %68, label %69, label %75

69:                                               ; preds = %61
  %70 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %71 = load i32, i32* %70, align 8, !tbaa !20
  %72 = icmp eq i32 %71, 2
  br i1 %72, label %73, label %75

73:                                               ; preds = %69
  %74 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %74, align 2, !tbaa !23
  br label %75

75:                                               ; preds = %73, %69, %61
  %76 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 11
  store i32 4, i32* %76, align 4, !tbaa !44
  br label %77

77:                                               ; preds = %34, %33, %29, %25, %44, %57, %59, %75
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv121__vmi_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib(%"class.__cxxabiv1::__vmi_class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i8* %3, i32 %4, i1 zeroext %5) unnamed_addr #7 align 2 {
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %5, label %16, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %26, label %67

16:                                               ; preds = %6
  %17 = getelementptr %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %18 = icmp eq %"class.std::type_info"* %17, %9
  br i1 %18, label %26, label %19

19:                                               ; preds = %16
  %20 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  %22 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  %24 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %21, i8* nonnull dereferenceable(1) %23) #16
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %67

26:                                               ; preds = %16, %10, %19
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  store i8 1, i8* %27, align 1, !tbaa !39
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %29 = load i8*, i8** %28, align 8, !tbaa !13
  %30 = icmp eq i8* %29, %3
  br i1 %30, label %31, label %167

31:                                               ; preds = %26
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  store i8 1, i8* %32, align 4, !tbaa !40
  %33 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %34 = load i8*, i8** %33, align 8, !tbaa !21
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %46

36:                                               ; preds = %31
  store i8* %2, i8** %33, align 8, !tbaa !21
  %37 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %4, i32* %37, align 8, !tbaa !20
  %38 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %38, align 4, !tbaa !22
  %39 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %40 = load i32, i32* %39, align 8, !tbaa !16
  %41 = icmp eq i32 %40, 1
  %42 = icmp eq i32 %4, 1
  %43 = and i1 %42, %41
  br i1 %43, label %44, label %167

44:                                               ; preds = %36
  %45 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %45, align 2, !tbaa !23
  br label %167

46:                                               ; preds = %31
  %47 = icmp eq i8* %34, %2
  br i1 %47, label %48, label %62

48:                                               ; preds = %46
  %49 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %50 = load i32, i32* %49, align 8, !tbaa !20
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  store i32 %4, i32* %49, align 8, !tbaa !20
  br label %53

53:                                               ; preds = %52, %48
  %54 = phi i32 [ %4, %52 ], [ %50, %48 ]
  %55 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %56 = load i32, i32* %55, align 8, !tbaa !16
  %57 = icmp eq i32 %56, 1
  %58 = icmp eq i32 %54, 1
  %59 = and i1 %58, %57
  br i1 %59, label %60, label %167

60:                                               ; preds = %53
  %61 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %61, align 2, !tbaa !23
  br label %167

62:                                               ; preds = %46
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %64 = load i32, i32* %63, align 4, !tbaa !22
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %63, align 4, !tbaa !22
  %66 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %66, align 2, !tbaa !23
  br label %167

67:                                               ; preds = %10, %19
  %68 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  %69 = load i8, i8* %68, align 4, !tbaa !40, !range !32
  %70 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  %71 = load i8, i8* %70, align 1, !tbaa !39, !range !32
  %72 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 2
  %73 = load i32, i32* %72, align 4, !tbaa !30
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 %74
  store i8 0, i8* %68, align 4, !tbaa !40
  store i8 0, i8* %70, align 1, !tbaa !39
  %76 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 1
  %77 = load i64, i64* %76, align 8, !tbaa !26
  %78 = ashr i64 %77, 8
  %79 = and i64 %77, 1
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %87, label %81

81:                                               ; preds = %67
  %82 = bitcast i8* %3 to i8**
  %83 = load i8*, i8** %82, align 8, !tbaa !17
  %84 = getelementptr inbounds i8, i8* %83, i64 %78
  %85 = bitcast i8* %84 to i64*
  %86 = load i64, i64* %85, align 8, !tbaa !28
  br label %87

87:                                               ; preds = %67, %81
  %88 = phi i64 [ %86, %81 ], [ %78, %67 ]
  %89 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 0, i32 0
  %90 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %89, align 8, !tbaa !29
  %91 = getelementptr inbounds i8, i8* %3, i64 %88
  %92 = and i64 %77, 2
  %93 = icmp eq i64 %92, 0
  %94 = select i1 %93, i32 2, i32 %4
  %95 = bitcast %"class.__cxxabiv1::__class_type_info"* %90 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %96 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %95, align 8, !tbaa !18
  %97 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %96, i64 5
  %98 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %97, align 8
  tail call void %98(%"class.__cxxabiv1::__class_type_info"* %90, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i8* %91, i32 %94, i1 zeroext %5)
  %99 = load i8, i8* %68, align 4, !tbaa !40, !range !32
  %100 = or i8 %99, %69
  %101 = load i8, i8* %70, align 1, !tbaa !39, !range !32
  %102 = or i8 %101, %71
  %103 = icmp ugt i32 %73, 1
  br i1 %103, label %104, label %162

104:                                              ; preds = %87
  %105 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 3, i64 1
  %106 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %107 = getelementptr inbounds %"class.__cxxabiv1::__vmi_class_type_info", %"class.__cxxabiv1::__vmi_class_type_info"* %0, i64 0, i32 1
  %108 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  %109 = bitcast i8* %3 to i8**
  br label %110

110:                                              ; preds = %104, %144
  %111 = phi i8 [ %158, %144 ], [ %101, %104 ]
  %112 = phi i8 [ %156, %144 ], [ %99, %104 ]
  %113 = phi i8 [ %159, %144 ], [ %102, %104 ]
  %114 = phi i8 [ %157, %144 ], [ %100, %104 ]
  %115 = phi %"struct.__cxxabiv1::__base_class_type_info"* [ %160, %144 ], [ %105, %104 ]
  %116 = load i8, i8* %108, align 2, !tbaa !23, !range !32
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %118, label %162

118:                                              ; preds = %110
  %119 = icmp eq i8 %112, 0
  br i1 %119, label %127, label %120

120:                                              ; preds = %118
  %121 = load i32, i32* %106, align 8, !tbaa !20
  %122 = icmp eq i32 %121, 1
  br i1 %122, label %162, label %123

123:                                              ; preds = %120
  %124 = load i32, i32* %107, align 8, !tbaa !45
  %125 = and i32 %124, 2
  %126 = icmp eq i32 %125, 0
  br i1 %126, label %162, label %133

127:                                              ; preds = %118
  %128 = icmp eq i8 %111, 0
  br i1 %128, label %133, label %129

129:                                              ; preds = %127
  %130 = load i32, i32* %107, align 8, !tbaa !45
  %131 = and i32 %130, 1
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %162, label %133

133:                                              ; preds = %123, %129, %127
  store i8 0, i8* %68, align 4, !tbaa !40
  store i8 0, i8* %70, align 1, !tbaa !39
  %134 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %115, i64 0, i32 1
  %135 = load i64, i64* %134, align 8, !tbaa !26
  %136 = ashr i64 %135, 8
  %137 = and i64 %135, 1
  %138 = icmp eq i64 %137, 0
  br i1 %138, label %144, label %139

139:                                              ; preds = %133
  %140 = load i8*, i8** %109, align 8, !tbaa !17
  %141 = getelementptr inbounds i8, i8* %140, i64 %136
  %142 = bitcast i8* %141 to i64*
  %143 = load i64, i64* %142, align 8, !tbaa !28
  br label %144

144:                                              ; preds = %133, %139
  %145 = phi i64 [ %143, %139 ], [ %136, %133 ]
  %146 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %115, i64 0, i32 0
  %147 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %146, align 8, !tbaa !29
  %148 = getelementptr inbounds i8, i8* %3, i64 %145
  %149 = and i64 %135, 2
  %150 = icmp eq i64 %149, 0
  %151 = select i1 %150, i32 2, i32 %4
  %152 = bitcast %"class.__cxxabiv1::__class_type_info"* %147 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %153 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %152, align 8, !tbaa !18
  %154 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %153, i64 5
  %155 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %154, align 8
  tail call void %155(%"class.__cxxabiv1::__class_type_info"* %147, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i8* %148, i32 %151, i1 zeroext %5)
  %156 = load i8, i8* %68, align 4, !tbaa !40, !range !32
  %157 = or i8 %156, %114
  %158 = load i8, i8* %70, align 1, !tbaa !39, !range !32
  %159 = or i8 %158, %113
  %160 = getelementptr inbounds %"struct.__cxxabiv1::__base_class_type_info", %"struct.__cxxabiv1::__base_class_type_info"* %115, i64 1
  %161 = icmp ult %"struct.__cxxabiv1::__base_class_type_info"* %160, %75
  br i1 %161, label %110, label %162

162:                                              ; preds = %123, %129, %110, %144, %120, %87
  %163 = phi i8 [ %102, %87 ], [ %113, %129 ], [ %113, %123 ], [ %159, %144 ], [ %113, %120 ], [ %113, %110 ]
  %164 = phi i8 [ %100, %87 ], [ %114, %129 ], [ %114, %123 ], [ %157, %144 ], [ %114, %120 ], [ %114, %110 ]
  %165 = and i8 %164, 1
  store i8 %165, i8* %68, align 4, !tbaa !40
  %166 = and i8 %163, 1
  store i8 %166, i8* %70, align 1, !tbaa !39
  br label %167

167:                                              ; preds = %62, %60, %53, %44, %36, %26, %162
  ret void
}

; Function Attrs: uwtable
define hidden void @_ZNK10__cxxabiv120__si_class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib(%"class.__cxxabiv1::__si_class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i8* %2, i8* %3, i32 %4, i1 zeroext %5) unnamed_addr #7 align 2 {
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %5, label %16, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %26, label %67

16:                                               ; preds = %6
  %17 = getelementptr %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0
  %18 = icmp eq %"class.std::type_info"* %17, %9
  br i1 %18, label %26, label %19

19:                                               ; preds = %16
  %20 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 0, i32 0, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  %22 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  %24 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %21, i8* nonnull dereferenceable(1) %23) #16
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %67

26:                                               ; preds = %16, %10, %19
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  store i8 1, i8* %27, align 1, !tbaa !39
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %29 = load i8*, i8** %28, align 8, !tbaa !13
  %30 = icmp eq i8* %29, %3
  br i1 %30, label %31, label %74

31:                                               ; preds = %26
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  store i8 1, i8* %32, align 4, !tbaa !40
  %33 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %34 = load i8*, i8** %33, align 8, !tbaa !21
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %46

36:                                               ; preds = %31
  store i8* %2, i8** %33, align 8, !tbaa !21
  %37 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %4, i32* %37, align 8, !tbaa !20
  %38 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %38, align 4, !tbaa !22
  %39 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %40 = load i32, i32* %39, align 8, !tbaa !16
  %41 = icmp eq i32 %40, 1
  %42 = icmp eq i32 %4, 1
  %43 = and i1 %42, %41
  br i1 %43, label %44, label %74

44:                                               ; preds = %36
  %45 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %45, align 2, !tbaa !23
  br label %74

46:                                               ; preds = %31
  %47 = icmp eq i8* %34, %2
  br i1 %47, label %48, label %62

48:                                               ; preds = %46
  %49 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %50 = load i32, i32* %49, align 8, !tbaa !20
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  store i32 %4, i32* %49, align 8, !tbaa !20
  br label %53

53:                                               ; preds = %52, %48
  %54 = phi i32 [ %4, %52 ], [ %50, %48 ]
  %55 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %56 = load i32, i32* %55, align 8, !tbaa !16
  %57 = icmp eq i32 %56, 1
  %58 = icmp eq i32 %54, 1
  %59 = and i1 %58, %57
  br i1 %59, label %60, label %74

60:                                               ; preds = %53
  %61 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %61, align 2, !tbaa !23
  br label %74

62:                                               ; preds = %46
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %64 = load i32, i32* %63, align 4, !tbaa !22
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %63, align 4, !tbaa !22
  %66 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %66, align 2, !tbaa !23
  br label %74

67:                                               ; preds = %10, %19
  %68 = getelementptr inbounds %"class.__cxxabiv1::__si_class_type_info", %"class.__cxxabiv1::__si_class_type_info"* %0, i64 0, i32 1
  %69 = load %"class.__cxxabiv1::__class_type_info"*, %"class.__cxxabiv1::__class_type_info"** %68, align 8, !tbaa !24
  %70 = bitcast %"class.__cxxabiv1::__class_type_info"* %69 to void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)***
  %71 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)**, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*** %70, align 8, !tbaa !18
  %72 = getelementptr inbounds void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %71, i64 5
  %73 = load void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)*, void (%"class.__cxxabiv1::__class_type_info"*, %"struct.__cxxabiv1::__dynamic_cast_info"*, i8*, i8*, i32, i1)** %72, align 8
  tail call void %73(%"class.__cxxabiv1::__class_type_info"* %69, %"struct.__cxxabiv1::__dynamic_cast_info"* nonnull %1, i8* %2, i8* %3, i32 %4, i1 zeroext %5)
  br label %74

74:                                               ; preds = %62, %60, %53, %44, %36, %26, %67
  ret void
}

; Function Attrs: nofree nounwind uwtable
define hidden void @_ZNK10__cxxabiv117__class_type_info16search_above_dstEPNS_19__dynamic_cast_infoEPKvS4_ib(%"class.__cxxabiv1::__class_type_info"* readonly %0, %"struct.__cxxabiv1::__dynamic_cast_info"* nocapture %1, i8* %2, i8* readnone %3, i32 %4, i1 zeroext %5) unnamed_addr #10 align 2 {
  %7 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 2
  %8 = bitcast %"class.__cxxabiv1::__class_type_info"** %7 to %"class.std::type_info"**
  %9 = load %"class.std::type_info"*, %"class.std::type_info"** %8, align 8, !tbaa !14
  br i1 %5, label %16, label %10

10:                                               ; preds = %6
  %11 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %12 = load i8*, i8** %11, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %14 = load i8*, i8** %13, align 8, !tbaa !3
  %15 = icmp eq i8* %12, %14
  br i1 %15, label %26, label %67

16:                                               ; preds = %6
  %17 = getelementptr %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0
  %18 = icmp eq %"class.std::type_info"* %17, %9
  br i1 %18, label %26, label %19

19:                                               ; preds = %16
  %20 = getelementptr inbounds %"class.__cxxabiv1::__class_type_info", %"class.__cxxabiv1::__class_type_info"* %0, i64 0, i32 0, i32 0, i32 1
  %21 = load i8*, i8** %20, align 8, !tbaa !3
  %22 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %9, i64 0, i32 1
  %23 = load i8*, i8** %22, align 8, !tbaa !3
  %24 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %21, i8* nonnull dereferenceable(1) %23) #16
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %67

26:                                               ; preds = %16, %10, %19
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 14
  store i8 1, i8* %27, align 1, !tbaa !39
  %28 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 1
  %29 = load i8*, i8** %28, align 8, !tbaa !13
  %30 = icmp eq i8* %29, %3
  br i1 %30, label %31, label %67

31:                                               ; preds = %26
  %32 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 13
  store i8 1, i8* %32, align 4, !tbaa !40
  %33 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 4
  %34 = load i8*, i8** %33, align 8, !tbaa !21
  %35 = icmp eq i8* %34, null
  br i1 %35, label %36, label %46

36:                                               ; preds = %31
  store i8* %2, i8** %33, align 8, !tbaa !21
  %37 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  store i32 %4, i32* %37, align 8, !tbaa !20
  %38 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  store i32 1, i32* %38, align 4, !tbaa !22
  %39 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %40 = load i32, i32* %39, align 8, !tbaa !16
  %41 = icmp eq i32 %40, 1
  %42 = icmp eq i32 %4, 1
  %43 = and i1 %42, %41
  br i1 %43, label %44, label %67

44:                                               ; preds = %36
  %45 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %45, align 2, !tbaa !23
  br label %67

46:                                               ; preds = %31
  %47 = icmp eq i8* %34, %2
  br i1 %47, label %48, label %62

48:                                               ; preds = %46
  %49 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 6
  %50 = load i32, i32* %49, align 8, !tbaa !20
  %51 = icmp eq i32 %50, 2
  br i1 %51, label %52, label %53

52:                                               ; preds = %48
  store i32 %4, i32* %49, align 8, !tbaa !20
  br label %53

53:                                               ; preds = %52, %48
  %54 = phi i32 [ %4, %52 ], [ %50, %48 ]
  %55 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 12
  %56 = load i32, i32* %55, align 8, !tbaa !16
  %57 = icmp eq i32 %56, 1
  %58 = icmp eq i32 %54, 1
  %59 = and i1 %58, %57
  br i1 %59, label %60, label %67

60:                                               ; preds = %53
  %61 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %61, align 2, !tbaa !23
  br label %67

62:                                               ; preds = %46
  %63 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 9
  %64 = load i32, i32* %63, align 4, !tbaa !22
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %63, align 4, !tbaa !22
  %66 = getelementptr inbounds %"struct.__cxxabiv1::__dynamic_cast_info", %"struct.__cxxabiv1::__dynamic_cast_info"* %1, i64 0, i32 15
  store i8 1, i8* %66, align 2, !tbaa !23
  br label %67

67:                                               ; preds = %62, %60, %53, %44, %36, %26, %10, %19
  ret void
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nofree nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #11

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #12

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold noreturn nounwind }
attributes #4 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind willreturn }
attributes #9 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nofree nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { argmemonly nounwind willreturn writeonly }
attributes #13 = { nounwind }
attributes #14 = { noreturn nounwind }
attributes #15 = { builtin nounwind }
attributes #16 = { nounwind readonly }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 8}
!4 = !{!"_ZTSSt9type_info", !5, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !5, i64 0}
!9 = !{!"_ZTSN10__cxxabiv119__dynamic_cast_infoE", !5, i64 0, !5, i64 8, !5, i64 16, !10, i64 24, !5, i64 32, !5, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !11, i64 64, !11, i64 68, !11, i64 72, !12, i64 76, !12, i64 77, !12, i64 78}
!10 = !{!"long", !6, i64 0}
!11 = !{!"int", !6, i64 0}
!12 = !{!"bool", !6, i64 0}
!13 = !{!9, !5, i64 8}
!14 = !{!9, !5, i64 16}
!15 = !{!9, !10, i64 24}
!16 = !{!9, !11, i64 72}
!17 = !{!5, !5, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"vtable pointer", !7, i64 0}
!20 = !{!9, !11, i64 48}
!21 = !{!9, !5, i64 32}
!22 = !{!9, !11, i64 60}
!23 = !{!9, !12, i64 78}
!24 = !{!25, !5, i64 16}
!25 = !{!"_ZTSN10__cxxabiv120__si_class_type_infoE", !5, i64 16}
!26 = !{!27, !10, i64 8}
!27 = !{!"_ZTSN10__cxxabiv122__base_class_type_infoE", !5, i64 0, !10, i64 8}
!28 = !{!10, !10, i64 0}
!29 = !{!27, !5, i64 0}
!30 = !{!31, !11, i64 20}
!31 = !{!"_ZTSN10__cxxabiv121__vmi_class_type_infoE", !11, i64 16, !11, i64 20, !6, i64 24}
!32 = !{i8 0, i8 2}
!33 = !{!34, !11, i64 16}
!34 = !{!"_ZTSN10__cxxabiv117__pbase_type_infoE", !11, i64 16, !5, i64 24}
!35 = !{!34, !5, i64 24}
!36 = !{!37, !5, i64 32}
!37 = !{!"_ZTSN10__cxxabiv129__pointer_to_member_type_infoE", !5, i64 32}
!38 = !{!9, !11, i64 64}
!39 = !{!9, !12, i64 77}
!40 = !{!9, !12, i64 76}
!41 = !{!9, !11, i64 52}
!42 = !{!9, !5, i64 40}
!43 = !{!9, !11, i64 56}
!44 = !{!9, !11, i64 68}
!45 = !{!31, !11, i64 16}

; ModuleID = 'll/.debug.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/debug.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%"struct.std::__1::__libcpp_debug_info" = type { i8*, i32, i8*, i8* }
%"class.std::__1::__libcpp_db" = type { %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"**, i64, %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"**, i64 }
%"struct.std::__1::__c_node" = type { i32 (...)**, i8*, %"struct.std::__1::__c_node"*, %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"** }
%"struct.std::__1::__i_node" = type { i8*, %"struct.std::__1::__i_node"*, %"struct.std::__1::__c_node"* }
%"class.std::__1::mutex" = type { %union.pthread_mutex_t }
%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::__basic_string_common" = type { i8 }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }

@.str = private unnamed_addr constant [2 x i8] c":\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c": _LIBCPP_ASSERT '\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"' failed. \00", align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@_ZNSt3__123__libcpp_debug_functionE = local_unnamed_addr global void (%"struct.std::__1::__libcpp_debug_info"*)* @_ZNSt3__129__libcpp_abort_debug_functionERKNS_19__libcpp_debug_infoE, align 8
@_ZZNSt3__18__get_dbEvE2db = internal global %"class.std::__1::__libcpp_db" zeroinitializer, align 8
@_ZGVZNSt3__18__get_dbEvE2db = internal global i64 0, align 8
@_ZTVNSt3__18__c_nodeE = unnamed_addr constant { [8 x i8*] } { [8 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTINSt3__18__c_nodeE to i8*), i8* bitcast (void (%"struct.std::__1::__c_node"*)* @_ZNSt3__18__c_nodeD2Ev to i8*), i8* bitcast (void (%"struct.std::__1::__c_node"*)* @_ZNSt3__18__c_nodeD0Ev to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*), i8* bitcast (void ()* @__cxa_pure_virtual to i8*)] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSNSt3__18__c_nodeE = constant [18 x i8] c"NSt3__18__c_nodeE\00", align 1
@_ZTINSt3__18__c_nodeE = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @_ZTSNSt3__18__c_nodeE, i32 0, i32 0) }, align 8
@_ZZNSt3__112_GLOBAL__N_13mutEvE1m = internal global %"class.std::__1::mutex" zeroinitializer, align 8

@_ZNSt3__18__i_nodeD1Ev = unnamed_addr alias void (%"struct.std::__1::__i_node"*), void (%"struct.std::__1::__i_node"*)* @_ZNSt3__18__i_nodeD2Ev
@_ZNSt3__18__c_nodeD1Ev = unnamed_addr alias void (%"struct.std::__1::__c_node"*), void (%"struct.std::__1::__c_node"*)* @_ZNSt3__18__c_nodeD2Ev
@_ZNSt3__111__libcpp_dbC1Ev = unnamed_addr alias void (%"class.std::__1::__libcpp_db"*), void (%"class.std::__1::__libcpp_db"*)* @_ZNSt3__111__libcpp_dbC2Ev
@_ZNSt3__111__libcpp_dbD1Ev = unnamed_addr alias void (%"class.std::__1::__libcpp_db"*), void (%"class.std::__1::__libcpp_db"*)* @_ZNSt3__111__libcpp_dbD2Ev

; Function Attrs: uwtable
define void @_ZNKSt3__119__libcpp_debug_info4whatEv(%"class.std::__1::basic_string"* noalias sret align 8 %0, %"struct.std::__1::__libcpp_debug_info"* nocapture readonly %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = getelementptr inbounds %"struct.std::__1::__libcpp_debug_info", %"struct.std::__1::__libcpp_debug_info"* %1, i64 0, i32 0
  %7 = load i8*, i8** %6, align 8, !tbaa !4
  %8 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %7) #19
  %9 = icmp ugt i64 %8, -17
  br i1 %9, label %10, label %12

10:                                               ; preds = %2
  %11 = bitcast %"class.std::__1::basic_string"* %0 to %"class.std::__1::__basic_string_common"*
  tail call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* %11) #20
  unreachable

12:                                               ; preds = %2
  %13 = icmp ult i64 %8, 23
  br i1 %13, label %22, label %14

14:                                               ; preds = %12
  %15 = add nuw i64 %8, 16
  %16 = and i64 %15, -16
  %17 = tail call noalias nonnull i8* @_Znwm(i64 %16) #21
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %17, i8** %18, align 8, !tbaa !10
  %19 = or i64 %16, 1
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %19, i64* %20, align 8, !tbaa !10
  %21 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %8, i64* %21, align 8, !tbaa !10
  br label %29

22:                                               ; preds = %12
  %23 = trunc i64 %8 to i8
  %24 = shl nuw nsw i8 %23, 1
  %25 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  store i8 %24, i8* %25, align 8, !tbaa !10
  %26 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %27 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %26, i64 0, i32 1, i64 0
  %28 = icmp eq i64 %8, 0
  br i1 %28, label %31, label %29

29:                                               ; preds = %22, %14
  %30 = phi i8* [ %17, %14 ], [ %27, %22 ]
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 %30, i8* align 1 %7, i64 %8, i1 false) #19
  br label %31

31:                                               ; preds = %22, %29
  %32 = phi i8* [ %27, %22 ], [ %30, %29 ]
  %33 = getelementptr inbounds i8, i8* %32, i64 %8
  store i8 0, i8* %33, align 1, !tbaa !10
  %34 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %34) #19
  %35 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %35) #19
  %36 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %36) #19
  %37 = getelementptr inbounds %"struct.std::__1::__libcpp_debug_info", %"struct.std::__1::__libcpp_debug_info"* %1, i64 0, i32 1
  %38 = load i32, i32* %37, align 8, !tbaa !11
  invoke void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* nonnull sret align 8 %5, i32 %38)
          to label %39 unwind label %90

39:                                               ; preds = %31
  %40 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc(%"class.std::__1::basic_string"* nonnull %5, i64 0, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0))
          to label %41 unwind label %94

41:                                               ; preds = %39
  %42 = bitcast %"class.std::__1::basic_string"* %40 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %35, i8* nonnull align 8 dereferenceable(24) %42, i64 24, i1 false) #19
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %42, i8 0, i64 24, i1 false) #19, !noalias !12
  %43 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %4, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0))
          to label %44 unwind label %98

44:                                               ; preds = %41
  %45 = bitcast %"class.std::__1::basic_string"* %43 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %34, i8* nonnull align 8 dereferenceable(24) %45, i64 24, i1 false) #19
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %45, i8 0, i64 24, i1 false) #19, !noalias !15
  %46 = load i8, i8* %34, align 8, !tbaa !10
  %47 = and i8 %46, 1
  %48 = icmp eq i8 %47, 0
  %49 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %52 = load i64, i64* %51, align 8
  %53 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %54 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %53, i64 0, i32 1, i64 0
  %55 = lshr i8 %46, 1
  %56 = zext i8 %55 to i64
  %57 = select i1 %48, i8* %54, i8* %50
  %58 = select i1 %48, i64 %56, i64 %52
  %59 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %0, i8* %57, i64 %58)
          to label %60 unwind label %102

60:                                               ; preds = %44
  %61 = load i8, i8* %34, align 8, !tbaa !10
  %62 = and i8 %61, 1
  %63 = icmp eq i8 %62, 0
  br i1 %63, label %66, label %64

64:                                               ; preds = %60
  %65 = load i8*, i8** %49, align 8, !tbaa !10
  call void @_ZdlPv(i8* %65) #22
  br label %66

66:                                               ; preds = %60, %64
  %67 = load i8, i8* %35, align 8, !tbaa !10
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %66
  %71 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !10
  call void @_ZdlPv(i8* %72) #22
  br label %73

73:                                               ; preds = %66, %70
  %74 = load i8, i8* %36, align 8, !tbaa !10
  %75 = and i8 %74, 1
  %76 = icmp eq i8 %75, 0
  br i1 %76, label %80, label %77

77:                                               ; preds = %73
  %78 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %79 = load i8*, i8** %78, align 8, !tbaa !10
  call void @_ZdlPv(i8* %79) #22
  br label %80

80:                                               ; preds = %73, %77
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %36) #19
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %35) #19
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %34) #19
  %81 = getelementptr inbounds %"struct.std::__1::__libcpp_debug_info", %"struct.std::__1::__libcpp_debug_info"* %1, i64 0, i32 2
  %82 = load i8*, i8** %81, align 8, !tbaa !18
  %83 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %0, i8* %82)
          to label %84 unwind label %132

84:                                               ; preds = %80
  %85 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i64 0, i64 0))
          to label %86 unwind label %132

86:                                               ; preds = %84
  %87 = getelementptr inbounds %"struct.std::__1::__libcpp_debug_info", %"struct.std::__1::__libcpp_debug_info"* %1, i64 0, i32 3
  %88 = load i8*, i8** %87, align 8, !tbaa !19
  %89 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %0, i8* %88)
          to label %136 unwind label %132

90:                                               ; preds = %31
  %91 = landingpad { i8*, i32 }
          cleanup
  %92 = extractvalue { i8*, i32 } %91, 0
  %93 = extractvalue { i8*, i32 } %91, 1
  br label %129

94:                                               ; preds = %39
  %95 = landingpad { i8*, i32 }
          cleanup
  %96 = extractvalue { i8*, i32 } %95, 0
  %97 = extractvalue { i8*, i32 } %95, 1
  br label %120

98:                                               ; preds = %41
  %99 = landingpad { i8*, i32 }
          cleanup
  %100 = extractvalue { i8*, i32 } %99, 0
  %101 = extractvalue { i8*, i32 } %99, 1
  br label %111

102:                                              ; preds = %44
  %103 = landingpad { i8*, i32 }
          cleanup
  %104 = extractvalue { i8*, i32 } %103, 0
  %105 = extractvalue { i8*, i32 } %103, 1
  %106 = load i8, i8* %34, align 8, !tbaa !10
  %107 = and i8 %106, 1
  %108 = icmp eq i8 %107, 0
  br i1 %108, label %111, label %109

109:                                              ; preds = %102
  %110 = load i8*, i8** %49, align 8, !tbaa !10
  call void @_ZdlPv(i8* %110) #22
  br label %111

111:                                              ; preds = %109, %102, %98
  %112 = phi i8* [ %100, %98 ], [ %104, %102 ], [ %104, %109 ]
  %113 = phi i32 [ %101, %98 ], [ %105, %102 ], [ %105, %109 ]
  %114 = load i8, i8* %35, align 8, !tbaa !10
  %115 = and i8 %114, 1
  %116 = icmp eq i8 %115, 0
  br i1 %116, label %120, label %117

117:                                              ; preds = %111
  %118 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %119 = load i8*, i8** %118, align 8, !tbaa !10
  call void @_ZdlPv(i8* %119) #22
  br label %120

120:                                              ; preds = %117, %111, %94
  %121 = phi i8* [ %96, %94 ], [ %112, %111 ], [ %112, %117 ]
  %122 = phi i32 [ %97, %94 ], [ %113, %111 ], [ %113, %117 ]
  %123 = load i8, i8* %36, align 8, !tbaa !10
  %124 = and i8 %123, 1
  %125 = icmp eq i8 %124, 0
  br i1 %125, label %129, label %126

126:                                              ; preds = %120
  %127 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %128 = load i8*, i8** %127, align 8, !tbaa !10
  call void @_ZdlPv(i8* %128) #22
  br label %129

129:                                              ; preds = %126, %120, %90
  %130 = phi i8* [ %92, %90 ], [ %121, %120 ], [ %121, %126 ]
  %131 = phi i32 [ %93, %90 ], [ %122, %120 ], [ %122, %126 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %36) #19
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %35) #19
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %34) #19
  br label %137

132:                                              ; preds = %86, %84, %80
  %133 = landingpad { i8*, i32 }
          cleanup
  %134 = extractvalue { i8*, i32 } %133, 0
  %135 = extractvalue { i8*, i32 } %133, 1
  br label %137

136:                                              ; preds = %86
  ret void

137:                                              ; preds = %132, %129
  %138 = phi i8* [ %134, %132 ], [ %130, %129 ]
  %139 = phi i32 [ %135, %132 ], [ %131, %129 ]
  %140 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %141 = load i8, i8* %140, align 8, !tbaa !10
  %142 = and i8 %141, 1
  %143 = icmp eq i8 %142, 0
  br i1 %143, label %147, label %144

144:                                              ; preds = %137
  %145 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %146 = load i8*, i8** %145, align 8, !tbaa !10
  call void @_ZdlPv(i8* %146) #22
  br label %147

147:                                              ; preds = %137, %144
  %148 = insertvalue { i8*, i32 } undef, i8* %138, 0
  %149 = insertvalue { i8*, i32 } %148, i32 %139, 1
  resume { i8*, i32 } %149
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare void @_ZNSt3__19to_stringEi(%"class.std::__1::basic_string"* sret align 8, i32) local_unnamed_addr #2

declare i32 @__gxx_personality_v0(...)

; Function Attrs: inlinehint nounwind uwtable
declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED2Ev(%"class.std::__1::basic_string"*) unnamed_addr #3 align 2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: noreturn uwtable
define void @_ZNSt3__129__libcpp_abort_debug_functionERKNS_19__libcpp_debug_infoE(%"struct.std::__1::__libcpp_debug_info"* nocapture nonnull readonly align 8 dereferenceable(32) %0) #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::basic_string", align 8
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !20
  %4 = bitcast %"class.std::__1::basic_string"* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #19
  call void @_ZNKSt3__119__libcpp_debug_info4whatEv(%"class.std::__1::basic_string"* nonnull sret align 8 %2, %"struct.std::__1::__libcpp_debug_info"* nonnull %0)
  %5 = load i8, i8* %4, align 8, !tbaa !10
  %6 = and i8 %5, 1
  %7 = icmp eq i8 %6, 0
  %8 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %2, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %9 = load i8*, i8** %8, align 8
  %10 = bitcast %"class.std::__1::basic_string"* %2 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %11 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %10, i64 0, i32 1, i64 0
  %12 = select i1 %7, i8* %11, i8* %9
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i8* %12) #23
  call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEED2Ev(%"class.std::__1::basic_string"* nonnull %2) #19
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #19
  call void @abort() #24
  unreachable
}

; Function Attrs: nofree nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @abort() local_unnamed_addr #6

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define zeroext i1 @_ZNSt3__127__libcpp_set_debug_functionEPFvRKNS_19__libcpp_debug_infoEE(void (%"struct.std::__1::__libcpp_debug_info"*)* %0) local_unnamed_addr #7 {
  store void (%"struct.std::__1::__libcpp_debug_info"*)* %0, void (%"struct.std::__1::__libcpp_debug_info"*)** @_ZNSt3__123__libcpp_debug_functionE, align 8, !tbaa !20
  ret i1 true
}

; Function Attrs: nounwind uwtable
define nonnull %"class.std::__1::__libcpp_db"* @_ZNSt3__18__get_dbEv() local_unnamed_addr #8 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__18__get_dbEvE2db to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %7, !prof !21

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__18__get_dbEvE2db) #19
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) bitcast (%"class.std::__1::__libcpp_db"* @_ZZNSt3__18__get_dbEvE2db to i8*), i8 0, i64 48, i1 false) #19
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__18__get_dbEvE2db) #19
  br label %7

7:                                                ; preds = %3, %6, %0
  ret %"class.std::__1::__libcpp_db"* @_ZZNSt3__18__get_dbEvE2db
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define nonnull %"class.std::__1::__libcpp_db"* @_ZNSt3__114__get_const_dbEv() local_unnamed_addr #8 personality i32 (...)* @__gxx_personality_v0 {
  %1 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__18__get_dbEvE2db to i8*) acquire, align 8
  %2 = icmp eq i8 %1, 0
  br i1 %2, label %3, label %7, !prof !21

3:                                                ; preds = %0
  %4 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__18__get_dbEvE2db) #19
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %7, label %6

6:                                                ; preds = %3
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) bitcast (%"class.std::__1::__libcpp_db"* @_ZZNSt3__18__get_dbEvE2db to i8*), i8 0, i64 48, i1 false) #19
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__18__get_dbEvE2db) #19
  br label %7

7:                                                ; preds = %0, %3, %6
  ret %"class.std::__1::__libcpp_db"* @_ZZNSt3__18__get_dbEvE2db
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18__i_nodeD2Ev(%"struct.std::__1::__i_node"* nocapture readonly %0) unnamed_addr #8 align 2 {
  %2 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %0, i64 0, i32 1
  %3 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %2, align 8, !tbaa !22
  %4 = icmp eq %"struct.std::__1::__i_node"* %3, null
  br i1 %4, label %8, label %5

5:                                                ; preds = %1
  tail call void @_ZNSt3__18__i_nodeD2Ev(%"struct.std::__1::__i_node"* nonnull %3) #19
  %6 = bitcast %"struct.std::__1::__i_node"** %2 to i8**
  %7 = load i8*, i8** %6, align 8, !tbaa !22
  tail call void @free(i8* %7) #19
  ret void

8:                                                ; preds = %1
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #10

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18__c_nodeD2Ev(%"struct.std::__1::__c_node"* nocapture %0) unnamed_addr #8 align 2 {
  %2 = getelementptr %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [8 x i8*] }, { [8 x i8*] }* @_ZTVNSt3__18__c_nodeE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !24
  %3 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 3
  %4 = bitcast %"struct.std::__1::__i_node"*** %3 to i8**
  %5 = load i8*, i8** %4, align 8, !tbaa !26
  tail call void @free(i8* %5) #19
  %6 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 2
  %7 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %6, align 8, !tbaa !28
  %8 = icmp eq %"struct.std::__1::__c_node"* %7, null
  br i1 %8, label %15, label %9

9:                                                ; preds = %1
  %10 = bitcast %"struct.std::__1::__c_node"* %7 to void (%"struct.std::__1::__c_node"*)***
  %11 = load void (%"struct.std::__1::__c_node"*)**, void (%"struct.std::__1::__c_node"*)*** %10, align 8, !tbaa !24
  %12 = load void (%"struct.std::__1::__c_node"*)*, void (%"struct.std::__1::__c_node"*)** %11, align 8
  tail call void %12(%"struct.std::__1::__c_node"* nonnull %7) #19
  %13 = bitcast %"struct.std::__1::__c_node"** %6 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !28
  tail call void @free(i8* %14) #19
  br label %15

15:                                               ; preds = %1, %9
  ret void
}

; Function Attrs: noreturn nounwind uwtable
define void @_ZNSt3__18__c_nodeD0Ev(%"struct.std::__1::__c_node"* nocapture readnone %0) unnamed_addr #11 align 2 {
  tail call void @llvm.trap() #24
  unreachable
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #12

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt3__111__libcpp_dbC2Ev(%"class.std::__1::__libcpp_db"* nocapture %0) unnamed_addr #7 align 2 {
  %2 = bitcast %"class.std::__1::__libcpp_db"* %0 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(48) %2, i8 0, i64 48, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__111__libcpp_dbD2Ev(%"class.std::__1::__libcpp_db"* nocapture readonly %0) unnamed_addr #8 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %3 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %2, align 8, !tbaa !29
  %4 = icmp eq %"struct.std::__1::__c_node"** %3, null
  br i1 %4, label %31, label %5

5:                                                ; preds = %1
  %6 = bitcast %"struct.std::__1::__c_node"** %3 to i8*
  %7 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %8 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %7, align 8, !tbaa !32
  %9 = icmp eq %"struct.std::__1::__c_node"** %3, %8
  br i1 %9, label %13, label %15

10:                                               ; preds = %27
  %11 = bitcast %"class.std::__1::__libcpp_db"* %0 to i8**
  %12 = load i8*, i8** %11, align 8, !tbaa !29
  br label %13

13:                                               ; preds = %5, %10
  %14 = phi i8* [ %12, %10 ], [ %6, %5 ]
  tail call void @free(i8* %14) #19
  br label %31

15:                                               ; preds = %5, %27
  %16 = phi %"struct.std::__1::__c_node"** [ %28, %27 ], [ %8, %5 ]
  %17 = phi %"struct.std::__1::__c_node"** [ %29, %27 ], [ %3, %5 ]
  %18 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %17, align 8, !tbaa !20
  %19 = icmp eq %"struct.std::__1::__c_node"* %18, null
  br i1 %19, label %27, label %20

20:                                               ; preds = %15
  %21 = bitcast %"struct.std::__1::__c_node"* %18 to void (%"struct.std::__1::__c_node"*)***
  %22 = load void (%"struct.std::__1::__c_node"*)**, void (%"struct.std::__1::__c_node"*)*** %21, align 8, !tbaa !24
  %23 = load void (%"struct.std::__1::__c_node"*)*, void (%"struct.std::__1::__c_node"*)** %22, align 8
  tail call void %23(%"struct.std::__1::__c_node"* nonnull %18) #19
  %24 = bitcast %"struct.std::__1::__c_node"** %17 to i8**
  %25 = load i8*, i8** %24, align 8, !tbaa !20
  tail call void @free(i8* %25) #19
  %26 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %7, align 8, !tbaa !32
  br label %27

27:                                               ; preds = %15, %20
  %28 = phi %"struct.std::__1::__c_node"** [ %16, %15 ], [ %26, %20 ]
  %29 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %17, i64 1
  %30 = icmp eq %"struct.std::__1::__c_node"** %29, %28
  br i1 %30, label %10, label %15

31:                                               ; preds = %1, %13
  %32 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %33 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %32, align 8, !tbaa !33
  %34 = icmp eq %"struct.std::__1::__i_node"** %33, null
  br i1 %34, label %58, label %35

35:                                               ; preds = %31
  %36 = bitcast %"struct.std::__1::__i_node"** %33 to i8*
  %37 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %38 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %37, align 8, !tbaa !34
  %39 = icmp eq %"struct.std::__1::__i_node"** %33, %38
  br i1 %39, label %43, label %45

40:                                               ; preds = %54
  %41 = bitcast %"struct.std::__1::__i_node"*** %32 to i8**
  %42 = load i8*, i8** %41, align 8, !tbaa !33
  br label %43

43:                                               ; preds = %35, %40
  %44 = phi i8* [ %42, %40 ], [ %36, %35 ]
  tail call void @free(i8* %44) #19
  br label %58

45:                                               ; preds = %35, %54
  %46 = phi %"struct.std::__1::__i_node"** [ %55, %54 ], [ %38, %35 ]
  %47 = phi %"struct.std::__1::__i_node"** [ %56, %54 ], [ %33, %35 ]
  %48 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %47, align 8, !tbaa !20
  %49 = icmp eq %"struct.std::__1::__i_node"* %48, null
  br i1 %49, label %54, label %50

50:                                               ; preds = %45
  tail call void @_ZNSt3__18__i_nodeD2Ev(%"struct.std::__1::__i_node"* nonnull %48) #19
  %51 = bitcast %"struct.std::__1::__i_node"** %47 to i8**
  %52 = load i8*, i8** %51, align 8, !tbaa !20
  tail call void @free(i8* %52) #19
  %53 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %37, align 8, !tbaa !34
  br label %54

54:                                               ; preds = %45, %50
  %55 = phi %"struct.std::__1::__i_node"** [ %46, %45 ], [ %53, %50 ]
  %56 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %47, i64 1
  %57 = icmp eq %"struct.std::__1::__i_node"** %56, %55
  br i1 %57, label %40, label %45

58:                                               ; preds = %31, %43
  ret void
}

; Function Attrs: uwtable
define i8* @_ZNKSt3__111__libcpp_db15__find_c_from_iEPv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !33
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %6 = bitcast %"struct.std::__1::__i_node"*** %5 to i64*
  %7 = load i64, i64* %6, align 8, !tbaa !34
  %8 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %9 = ptrtoint i8* %1 to i64
  %10 = lshr i64 %9, 32
  %11 = shl i64 %9, 3
  %12 = and i64 %11, 4294967288
  %13 = add nuw nsw i64 %12, 8
  %14 = xor i64 %13, %10
  %15 = mul i64 %14, -7070675565921424023
  %16 = lshr i64 %15, 47
  %17 = xor i64 %15, %10
  %18 = xor i64 %17, %16
  %19 = mul i64 %18, -7070675565921424023
  %20 = lshr i64 %19, 47
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = sub i64 %7, %8
  %24 = ashr exact i64 %23, 3
  %25 = urem i64 %22, %24
  %26 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %4, i64 %25
  br label %27

27:                                               ; preds = %27, %2
  %28 = phi %"struct.std::__1::__i_node"** [ %33, %27 ], [ %26, %2 ]
  %29 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %28, align 8, !tbaa !20
  %30 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %29, i64 0, i32 0
  %31 = load i8*, i8** %30, align 8, !tbaa !35
  %32 = icmp eq i8* %31, %1
  %33 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %29, i64 0, i32 1
  br i1 %32, label %34, label %27

34:                                               ; preds = %27
  %35 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %29, i64 0, i32 2
  %36 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %35, align 8, !tbaa !36
  %37 = icmp eq %"struct.std::__1::__c_node"* %36, null
  br i1 %37, label %41, label %38

38:                                               ; preds = %34
  %39 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %36, i64 0, i32 1
  %40 = load i8*, i8** %39, align 8, !tbaa !37
  br label %41

41:                                               ; preds = %34, %38
  %42 = phi i8* [ %40, %38 ], [ null, %34 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i8* %42
}

; Function Attrs: nounwind readonly uwtable
define hidden %"struct.std::__1::__i_node"* @_ZNKSt3__111__libcpp_db15__find_iteratorEPKv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #13 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !33
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !34
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %40, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %10 = ptrtoint %"struct.std::__1::__i_node"** %6 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %4, i64 %27
  %29 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__i_node"* %29, null
  br i1 %30, label %40, label %31

31:                                               ; preds = %8, %36
  %32 = phi %"struct.std::__1::__i_node"* [ %38, %36 ], [ %29, %8 ]
  %33 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8, !tbaa !35
  %35 = icmp eq i8* %34, %1
  br i1 %35, label %40, label %36

36:                                               ; preds = %31
  %37 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 1
  %38 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %37, align 8, !tbaa !20
  %39 = icmp eq %"struct.std::__1::__i_node"* %38, null
  br i1 %39, label %40, label %31

40:                                               ; preds = %31, %36, %8, %2
  %41 = phi %"struct.std::__1::__i_node"* [ null, %2 ], [ null, %8 ], [ %32, %31 ], [ null, %36 ]
  ret %"struct.std::__1::__i_node"* %41
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db11__insert_icEPvPKv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1, i8* %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %5 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %4, align 8, !tbaa !29
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %7 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %6, align 8, !tbaa !32
  %8 = icmp eq %"struct.std::__1::__c_node"** %5, %7
  br i1 %8, label %79, label %9

9:                                                ; preds = %3
  %10 = ptrtoint %"struct.std::__1::__c_node"** %5 to i64
  %11 = ptrtoint %"struct.std::__1::__c_node"** %7 to i64
  %12 = ptrtoint i8* %2 to i64
  %13 = lshr i64 %12, 32
  %14 = shl i64 %12, 3
  %15 = and i64 %14, 4294967288
  %16 = add nuw nsw i64 %15, 8
  %17 = xor i64 %16, %13
  %18 = mul i64 %17, -7070675565921424023
  %19 = lshr i64 %18, 47
  %20 = xor i64 %18, %13
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = lshr i64 %22, 47
  %24 = xor i64 %23, %22
  %25 = mul i64 %24, -7070675565921424023
  %26 = sub i64 %11, %10
  %27 = ashr exact i64 %26, 3
  %28 = urem i64 %25, %27
  %29 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %5, i64 %28
  %30 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %29, align 8, !tbaa !20
  %31 = icmp eq %"struct.std::__1::__c_node"* %30, null
  br i1 %31, label %79, label %32

32:                                               ; preds = %9, %37
  %33 = phi %"struct.std::__1::__c_node"* [ %39, %37 ], [ %30, %9 ]
  %34 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %33, i64 0, i32 1
  %35 = load i8*, i8** %34, align 8, !tbaa !37
  %36 = icmp eq i8* %35, %2
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %33, i64 0, i32 2
  %39 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %38, align 8, !tbaa !28
  %40 = icmp eq %"struct.std::__1::__c_node"* %39, null
  br i1 %40, label %79, label %32

41:                                               ; preds = %32
  %42 = invoke %"struct.std::__1::__i_node"* @_ZNSt3__111__libcpp_db17__insert_iteratorEPv(%"class.std::__1::__libcpp_db"* %0, i8* %1)
          to label %43 unwind label %80

43:                                               ; preds = %41
  %44 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %33, i64 0, i32 4
  %45 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %44, align 8, !tbaa !38
  %46 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %33, i64 0, i32 5
  %47 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %46, align 8, !tbaa !39
  %48 = icmp eq %"struct.std::__1::__i_node"** %45, %47
  br i1 %48, label %49, label %75

49:                                               ; preds = %43
  %50 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %33, i64 0, i32 3
  %51 = bitcast %"struct.std::__1::__i_node"*** %50 to i64*
  %52 = load i64, i64* %51, align 8, !tbaa !26
  %53 = ptrtoint %"struct.std::__1::__i_node"** %45 to i64
  %54 = sub i64 %53, %52
  %55 = ashr exact i64 %54, 2
  %56 = icmp eq i64 %54, 0
  %57 = select i1 %56, i64 1, i64 %55
  %58 = shl i64 %57, 3
  %59 = tail call noalias i8* @malloc(i64 %58) #19
  %60 = bitcast i8* %59 to %"struct.std::__1::__i_node"**
  %61 = icmp eq i8* %59, null
  %62 = inttoptr i64 %52 to i8*
  br i1 %61, label %63, label %65

63:                                               ; preds = %49
  invoke void @_ZSt17__throw_bad_allocv() #20
          to label %64 unwind label %80

64:                                               ; preds = %63
  unreachable

65:                                               ; preds = %49
  %66 = icmp ugt i64 %57, 1
  br i1 %66, label %67, label %70

67:                                               ; preds = %65
  %68 = lshr i64 %57, 1
  %69 = shl i64 %68, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %59, i8* align 8 %62, i64 %69, i1 false)
  br label %70

70:                                               ; preds = %67, %65
  %71 = phi i64 [ %68, %67 ], [ 0, %65 ]
  %72 = bitcast %"struct.std::__1::__i_node"*** %50 to i8**
  tail call void @free(i8* %62) #19
  store i8* %59, i8** %72, align 8, !tbaa !26
  %73 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %60, i64 %71
  store %"struct.std::__1::__i_node"** %73, %"struct.std::__1::__i_node"*** %44, align 8, !tbaa !38
  %74 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %60, i64 %57
  store %"struct.std::__1::__i_node"** %74, %"struct.std::__1::__i_node"*** %46, align 8, !tbaa !39
  br label %75

75:                                               ; preds = %70, %43
  %76 = phi %"struct.std::__1::__i_node"** [ %73, %70 ], [ %45, %43 ]
  %77 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %76, i64 1
  store %"struct.std::__1::__i_node"** %77, %"struct.std::__1::__i_node"*** %44, align 8, !tbaa !38
  store %"struct.std::__1::__i_node"* %42, %"struct.std::__1::__i_node"** %76, align 8, !tbaa !20
  %78 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %42, i64 0, i32 2
  store %"struct.std::__1::__c_node"* %33, %"struct.std::__1::__c_node"** %78, align 8, !tbaa !36
  br label %79

79:                                               ; preds = %37, %75, %9, %3
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void

80:                                               ; preds = %63, %41
  %81 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %81
}

; Function Attrs: uwtable
define hidden %"struct.std::__1::__i_node"* @_ZNSt3__111__libcpp_db17__insert_iteratorEPv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 5
  %4 = load i64, i64* %3, align 8, !tbaa !40
  %5 = add i64 %4, 1
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %7 = bitcast %"struct.std::__1::__i_node"*** %6 to i64*
  %8 = load i64, i64* %7, align 8, !tbaa !34
  %9 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %10 = bitcast %"struct.std::__1::__i_node"*** %9 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !33
  %12 = sub i64 %8, %11
  %13 = ashr exact i64 %12, 3
  %14 = icmp ugt i64 %5, %13
  %15 = inttoptr i64 %11 to %"struct.std::__1::__i_node"**
  br i1 %14, label %16, label %69

16:                                               ; preds = %2
  %17 = ashr exact i64 %12, 2
  %18 = add nsw i64 %17, 1
  %19 = tail call i64 @_ZNSt3__112__next_primeEm(i64 %18)
  %20 = tail call noalias i8* @calloc(i64 %19, i64 8) #19
  %21 = bitcast i8* %20 to %"struct.std::__1::__i_node"**
  %22 = icmp eq i8* %20, null
  br i1 %22, label %23, label %24

23:                                               ; preds = %16
  tail call void @_ZSt17__throw_bad_allocv() #20
  unreachable

24:                                               ; preds = %16
  %25 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %9, align 8, !tbaa !33
  %26 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %27 = icmp eq %"struct.std::__1::__i_node"** %25, %26
  %28 = bitcast %"struct.std::__1::__i_node"** %25 to i8*
  br i1 %27, label %29, label %37

29:                                               ; preds = %66, %24
  %30 = bitcast %"struct.std::__1::__i_node"*** %9 to i8**
  tail call void @free(i8* %28) #19
  store i8* %20, i8** %30, align 8, !tbaa !33
  %31 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %21, i64 %19
  store %"struct.std::__1::__i_node"** %31, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %32 = ptrtoint %"struct.std::__1::__i_node"** %31 to i64
  %33 = ptrtoint i8* %20 to i64
  %34 = sub i64 %32, %33
  %35 = ashr exact i64 %34, 3
  %36 = bitcast i8* %20 to %"struct.std::__1::__i_node"**
  br label %69

37:                                               ; preds = %24, %66
  %38 = phi %"struct.std::__1::__i_node"** [ %67, %66 ], [ %25, %24 ]
  %39 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, align 8, !tbaa !20
  %40 = icmp eq %"struct.std::__1::__i_node"* %39, null
  br i1 %40, label %66, label %41

41:                                               ; preds = %37, %41
  %42 = phi %"struct.std::__1::__i_node"* [ %60, %41 ], [ %39, %37 ]
  %43 = bitcast %"struct.std::__1::__i_node"* %42 to i64*
  %44 = load i64, i64* %43, align 8, !tbaa !35
  %45 = lshr i64 %44, 32
  %46 = shl i64 %44, 3
  %47 = and i64 %46, 4294967288
  %48 = add nuw nsw i64 %47, 8
  %49 = xor i64 %48, %45
  %50 = mul i64 %49, -7070675565921424023
  %51 = lshr i64 %50, 47
  %52 = xor i64 %50, %45
  %53 = xor i64 %52, %51
  %54 = mul i64 %53, -7070675565921424023
  %55 = lshr i64 %54, 47
  %56 = xor i64 %55, %54
  %57 = mul i64 %56, -7070675565921424023
  %58 = urem i64 %57, %19
  %59 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %42, i64 0, i32 1
  %60 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %59, align 8, !tbaa !22
  %61 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %21, i64 %58
  %62 = bitcast %"struct.std::__1::__i_node"** %61 to i64*
  %63 = load i64, i64* %62, align 8, !tbaa !20
  %64 = bitcast %"struct.std::__1::__i_node"** %59 to i64*
  store i64 %63, i64* %64, align 8, !tbaa !22
  store %"struct.std::__1::__i_node"* %42, %"struct.std::__1::__i_node"** %61, align 8, !tbaa !20
  %65 = icmp eq %"struct.std::__1::__i_node"* %60, null
  br i1 %65, label %66, label %41

66:                                               ; preds = %41, %37
  %67 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, i64 1
  %68 = icmp eq %"struct.std::__1::__i_node"** %67, %26
  br i1 %68, label %29, label %37

69:                                               ; preds = %29, %2
  %70 = phi %"struct.std::__1::__i_node"** [ %36, %29 ], [ %15, %2 ]
  %71 = phi i64 [ %35, %29 ], [ %13, %2 ]
  %72 = phi %"struct.std::__1::__i_node"** [ %21, %29 ], [ %15, %2 ]
  %73 = ptrtoint i8* %1 to i64
  %74 = lshr i64 %73, 32
  %75 = shl i64 %73, 3
  %76 = and i64 %75, 4294967288
  %77 = add nuw nsw i64 %76, 8
  %78 = xor i64 %77, %74
  %79 = mul i64 %78, -7070675565921424023
  %80 = lshr i64 %79, 47
  %81 = xor i64 %79, %74
  %82 = xor i64 %81, %80
  %83 = mul i64 %82, -7070675565921424023
  %84 = lshr i64 %83, 47
  %85 = xor i64 %84, %83
  %86 = mul i64 %85, -7070675565921424023
  %87 = urem i64 %86, %71
  %88 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %70, i64 %87
  %89 = bitcast %"struct.std::__1::__i_node"** %88 to i64*
  %90 = load i64, i64* %89, align 8, !tbaa !20
  %91 = tail call noalias dereferenceable_or_null(24) i8* @malloc(i64 24) #19
  %92 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %72, i64 %87
  %93 = bitcast %"struct.std::__1::__i_node"** %92 to i8**
  store i8* %91, i8** %93, align 8, !tbaa !20
  %94 = icmp eq i8* %91, null
  br i1 %94, label %95, label %96

95:                                               ; preds = %69
  tail call void @_ZSt17__throw_bad_allocv() #20
  unreachable

96:                                               ; preds = %69
  %97 = bitcast i8* %91 to %"struct.std::__1::__i_node"*
  %98 = bitcast i8* %91 to i8**
  store i8* %1, i8** %98, align 8, !tbaa !35
  %99 = getelementptr inbounds i8, i8* %91, i64 8
  %100 = bitcast i8* %99 to i64*
  store i64 %90, i64* %100, align 8, !tbaa !22
  %101 = getelementptr inbounds i8, i8* %91, i64 16
  %102 = bitcast i8* %101 to %"struct.std::__1::__c_node"**
  store %"struct.std::__1::__c_node"* null, %"struct.std::__1::__c_node"** %102, align 8, !tbaa !36
  %103 = load i64, i64* %3, align 8, !tbaa !40
  %104 = add i64 %103, 1
  store i64 %104, i64* %3, align 8, !tbaa !40
  ret %"struct.std::__1::__i_node"* %97
}

; Function Attrs: uwtable
define void @_ZNSt3__18__c_node5__addEPNS_8__i_nodeE(%"struct.std::__1::__c_node"* nocapture %0, %"struct.std::__1::__i_node"* %1) local_unnamed_addr #0 align 2 {
  %3 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 4
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !38
  %5 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 5
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !39
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %8, label %33

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 3
  %10 = bitcast %"struct.std::__1::__i_node"*** %9 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !26
  %12 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %13 = sub i64 %12, %11
  %14 = ashr exact i64 %13, 2
  %15 = icmp eq i64 %13, 0
  %16 = select i1 %15, i64 1, i64 %14
  %17 = shl i64 %16, 3
  %18 = tail call noalias i8* @malloc(i64 %17) #19
  %19 = bitcast i8* %18 to %"struct.std::__1::__i_node"**
  %20 = icmp eq i8* %18, null
  %21 = inttoptr i64 %11 to i8*
  br i1 %20, label %22, label %23

22:                                               ; preds = %8
  tail call void @_ZSt17__throw_bad_allocv() #20
  unreachable

23:                                               ; preds = %8
  %24 = icmp ugt i64 %16, 1
  br i1 %24, label %25, label %28

25:                                               ; preds = %23
  %26 = lshr i64 %16, 1
  %27 = shl i64 %26, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %18, i8* align 8 %21, i64 %27, i1 false)
  br label %28

28:                                               ; preds = %23, %25
  %29 = phi i64 [ %26, %25 ], [ 0, %23 ]
  %30 = bitcast %"struct.std::__1::__i_node"*** %9 to i8**
  tail call void @free(i8* %21) #19
  store i8* %18, i8** %30, align 8, !tbaa !26
  %31 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %19, i64 %29
  store %"struct.std::__1::__i_node"** %31, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !38
  %32 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %19, i64 %16
  store %"struct.std::__1::__i_node"** %32, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !39
  br label %33

33:                                               ; preds = %28, %2
  %34 = phi %"struct.std::__1::__i_node"** [ %31, %28 ], [ %4, %2 ]
  %35 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %34, i64 1
  store %"struct.std::__1::__i_node"** %35, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !38
  store %"struct.std::__1::__i_node"* %1, %"struct.std::__1::__i_node"** %34, align 8, !tbaa !20
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db10__insert_cEPvPFPNS_8__c_nodeES1_S1_S3_E(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1, %"struct.std::__1::__c_node"* (i8*, i8*, %"struct.std::__1::__c_node"*)* nocapture %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 2
  %5 = load i64, i64* %4, align 8, !tbaa !41
  %6 = add i64 %5, 1
  %7 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %8 = bitcast %"struct.std::__1::__c_node"*** %7 to i64*
  %9 = load i64, i64* %8, align 8, !tbaa !32
  %10 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %11 = bitcast %"class.std::__1::__libcpp_db"* %0 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !29
  %13 = sub i64 %9, %12
  %14 = ashr exact i64 %13, 3
  %15 = icmp ugt i64 %6, %14
  br i1 %15, label %16, label %75

16:                                               ; preds = %3
  %17 = ashr exact i64 %13, 2
  %18 = add nsw i64 %17, 1
  %19 = invoke i64 @_ZNSt3__112__next_primeEm(i64 %18)
          to label %20 unwind label %26

20:                                               ; preds = %16
  %21 = tail call noalias i8* @calloc(i64 %19, i64 8) #19
  %22 = bitcast i8* %21 to %"struct.std::__1::__c_node"**
  %23 = icmp eq i8* %21, null
  br i1 %23, label %24, label %30

24:                                               ; preds = %20
  invoke void @_ZSt17__throw_bad_allocv() #20
          to label %25 unwind label %28

25:                                               ; preds = %24
  unreachable

26:                                               ; preds = %16
  %27 = landingpad { i8*, i32 }
          cleanup
  br label %109

28:                                               ; preds = %24
  %29 = landingpad { i8*, i32 }
          cleanup
  br label %109

30:                                               ; preds = %20
  %31 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %10, align 8, !tbaa !29
  %32 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %7, align 8, !tbaa !32
  %33 = icmp eq %"struct.std::__1::__c_node"** %31, %32
  %34 = bitcast %"struct.std::__1::__c_node"** %31 to i8*
  br i1 %33, label %35, label %42

35:                                               ; preds = %72, %30
  %36 = bitcast %"class.std::__1::__libcpp_db"* %0 to i8**
  tail call void @free(i8* %34) #19
  store i8* %21, i8** %36, align 8, !tbaa !29
  %37 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %22, i64 %19
  store %"struct.std::__1::__c_node"** %37, %"struct.std::__1::__c_node"*** %7, align 8, !tbaa !32
  %38 = ptrtoint %"struct.std::__1::__c_node"** %37 to i64
  %39 = ptrtoint i8* %21 to i64
  %40 = sub i64 %38, %39
  %41 = ashr exact i64 %40, 3
  br label %75

42:                                               ; preds = %30, %72
  %43 = phi %"struct.std::__1::__c_node"** [ %73, %72 ], [ %31, %30 ]
  %44 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %43, align 8, !tbaa !20
  %45 = icmp eq %"struct.std::__1::__c_node"* %44, null
  br i1 %45, label %72, label %46

46:                                               ; preds = %42, %46
  %47 = phi %"struct.std::__1::__c_node"* [ %66, %46 ], [ %44, %42 ]
  %48 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %47, i64 0, i32 1
  %49 = bitcast i8** %48 to i64*
  %50 = load i64, i64* %49, align 8, !tbaa !37
  %51 = lshr i64 %50, 32
  %52 = shl i64 %50, 3
  %53 = and i64 %52, 4294967288
  %54 = add nuw nsw i64 %53, 8
  %55 = xor i64 %54, %51
  %56 = mul i64 %55, -7070675565921424023
  %57 = lshr i64 %56, 47
  %58 = xor i64 %56, %51
  %59 = xor i64 %58, %57
  %60 = mul i64 %59, -7070675565921424023
  %61 = lshr i64 %60, 47
  %62 = xor i64 %61, %60
  %63 = mul i64 %62, -7070675565921424023
  %64 = urem i64 %63, %19
  %65 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %47, i64 0, i32 2
  %66 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %65, align 8, !tbaa !28
  %67 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %22, i64 %64
  %68 = bitcast %"struct.std::__1::__c_node"** %67 to i64*
  %69 = load i64, i64* %68, align 8, !tbaa !20
  %70 = bitcast %"struct.std::__1::__c_node"** %65 to i64*
  store i64 %69, i64* %70, align 8, !tbaa !28
  store %"struct.std::__1::__c_node"* %47, %"struct.std::__1::__c_node"** %67, align 8, !tbaa !20
  %71 = icmp eq %"struct.std::__1::__c_node"* %66, null
  br i1 %71, label %72, label %46

72:                                               ; preds = %46, %42
  %73 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %43, i64 1
  %74 = icmp eq %"struct.std::__1::__c_node"** %73, %32
  br i1 %74, label %35, label %42

75:                                               ; preds = %35, %3
  %76 = phi i64 [ %41, %35 ], [ %14, %3 ]
  %77 = phi i64 [ %39, %35 ], [ %12, %3 ]
  %78 = ptrtoint i8* %1 to i64
  %79 = lshr i64 %78, 32
  %80 = shl i64 %78, 3
  %81 = and i64 %80, 4294967288
  %82 = add nuw nsw i64 %81, 8
  %83 = xor i64 %82, %79
  %84 = mul i64 %83, -7070675565921424023
  %85 = lshr i64 %84, 47
  %86 = xor i64 %84, %79
  %87 = xor i64 %86, %85
  %88 = mul i64 %87, -7070675565921424023
  %89 = lshr i64 %88, 47
  %90 = xor i64 %89, %88
  %91 = mul i64 %90, -7070675565921424023
  %92 = urem i64 %91, %76
  %93 = inttoptr i64 %77 to %"struct.std::__1::__c_node"**
  %94 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %93, i64 %92
  %95 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %94, align 8, !tbaa !20
  %96 = tail call noalias dereferenceable_or_null(48) i8* @malloc(i64 48) #19
  %97 = icmp eq i8* %96, null
  br i1 %97, label %98, label %102

98:                                               ; preds = %75
  invoke void @_ZSt17__throw_bad_allocv() #20
          to label %99 unwind label %100

99:                                               ; preds = %98
  unreachable

100:                                              ; preds = %102, %98
  %101 = landingpad { i8*, i32 }
          cleanup
  br label %109

102:                                              ; preds = %75
  %103 = invoke %"struct.std::__1::__c_node"* %2(i8* nonnull %96, i8* %1, %"struct.std::__1::__c_node"* %95)
          to label %104 unwind label %100

104:                                              ; preds = %102
  %105 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %10, align 8, !tbaa !29
  %106 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %105, i64 %92
  store %"struct.std::__1::__c_node"* %103, %"struct.std::__1::__c_node"** %106, align 8, !tbaa !20
  %107 = load i64, i64* %4, align 8, !tbaa !41
  %108 = add i64 %107, 1
  store i64 %108, i64* %4, align 8, !tbaa !41
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void

109:                                              ; preds = %26, %28, %100
  %110 = phi { i8*, i32 } [ %27, %26 ], [ %29, %28 ], [ %101, %100 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %110
}

declare i64 @_ZNSt3__112__next_primeEm(i64) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noalias i8* @calloc(i64, i64) local_unnamed_addr #5

; Function Attrs: noreturn
declare void @_ZSt17__throw_bad_allocv() local_unnamed_addr #14

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #5

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db9__erase_iEPv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !33
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !34
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %89, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %10 = ptrtoint %"struct.std::__1::__i_node"** %6 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %4, i64 %27
  %29 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__i_node"* %29, null
  br i1 %30, label %89, label %31

31:                                               ; preds = %8
  %32 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %29, i64 0, i32 0
  %33 = load i8*, i8** %32, align 8, !tbaa !35
  %34 = icmp eq i8* %33, %1
  br i1 %34, label %46, label %39

35:                                               ; preds = %39
  %36 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %42, i64 0, i32 0
  %37 = load i8*, i8** %36, align 8, !tbaa !35
  %38 = icmp eq i8* %37, %1
  br i1 %38, label %44, label %39

39:                                               ; preds = %31, %35
  %40 = phi %"struct.std::__1::__i_node"* [ %42, %35 ], [ %29, %31 ]
  %41 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %40, i64 0, i32 1
  %42 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %41, align 8, !tbaa !22
  %43 = icmp eq %"struct.std::__1::__i_node"* %42, null
  br i1 %43, label %89, label %35

44:                                               ; preds = %35
  %45 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %40, i64 0, i32 1
  br label %46

46:                                               ; preds = %31, %44
  %47 = phi %"struct.std::__1::__i_node"** [ %45, %44 ], [ %28, %31 ]
  %48 = phi %"struct.std::__1::__i_node"* [ %42, %44 ], [ %29, %31 ]
  %49 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %48, i64 0, i32 1
  %50 = bitcast %"struct.std::__1::__i_node"** %49 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !22
  %52 = bitcast %"struct.std::__1::__i_node"** %47 to i64*
  store i64 %51, i64* %52, align 8, !tbaa !20
  %53 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %48, i64 0, i32 2
  %54 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %53, align 8, !tbaa !36
  %55 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 5
  %56 = load i64, i64* %55, align 8, !tbaa !40
  %57 = add i64 %56, -1
  store i64 %57, i64* %55, align 8, !tbaa !40
  %58 = icmp eq %"struct.std::__1::__c_node"* %54, null
  br i1 %58, label %87, label %59

59:                                               ; preds = %46
  %60 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 3
  %61 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %60, align 8, !tbaa !26
  %62 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 4
  %63 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %62, align 8, !tbaa !38
  %64 = icmp eq %"struct.std::__1::__i_node"** %61, %63
  br i1 %64, label %74, label %65

65:                                               ; preds = %59, %69
  %66 = phi %"struct.std::__1::__i_node"** [ %70, %69 ], [ %61, %59 ]
  %67 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %66, align 8, !tbaa !20
  %68 = icmp eq %"struct.std::__1::__i_node"* %67, %48
  br i1 %68, label %74, label %69

69:                                               ; preds = %65
  %70 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %66, i64 1
  %71 = icmp eq %"struct.std::__1::__i_node"** %70, %63
  br i1 %71, label %72, label %65

72:                                               ; preds = %69
  %73 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %63, i64 -1
  store %"struct.std::__1::__i_node"** %73, %"struct.std::__1::__i_node"*** %62, align 8, !tbaa !38
  br label %78

74:                                               ; preds = %65, %59
  %75 = phi %"struct.std::__1::__i_node"** [ %61, %59 ], [ %66, %65 ]
  %76 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %63, i64 -1
  store %"struct.std::__1::__i_node"** %76, %"struct.std::__1::__i_node"*** %62, align 8, !tbaa !38
  %77 = icmp eq %"struct.std::__1::__i_node"** %76, %75
  br i1 %77, label %87, label %78

78:                                               ; preds = %74, %72
  %79 = phi %"struct.std::__1::__i_node"** [ %73, %72 ], [ %76, %74 ]
  %80 = phi %"struct.std::__1::__i_node"** [ %63, %72 ], [ %75, %74 ]
  %81 = bitcast %"struct.std::__1::__i_node"** %80 to i8*
  %82 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %80, i64 1
  %83 = bitcast %"struct.std::__1::__i_node"** %82 to i8*
  %84 = ptrtoint %"struct.std::__1::__i_node"** %79 to i64
  %85 = ptrtoint %"struct.std::__1::__i_node"** %80 to i64
  %86 = sub i64 %84, %85
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %81, i8* nonnull align 8 %83, i64 %86, i1 false) #19
  br label %87

87:                                               ; preds = %78, %74, %46
  %88 = bitcast %"struct.std::__1::__i_node"* %48 to i8*
  tail call void @free(i8* %88) #19
  br label %89

89:                                               ; preds = %39, %2, %8, %87
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void
}

; Function Attrs: nounwind uwtable
define hidden void @_ZNSt3__18__c_node8__removeEPNS_8__i_nodeE(%"struct.std::__1::__c_node"* nocapture %0, %"struct.std::__1::__i_node"* %1) local_unnamed_addr #8 align 2 {
  %3 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !26
  %5 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %0, i64 0, i32 4
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !38
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %17, label %8

8:                                                ; preds = %2, %12
  %9 = phi %"struct.std::__1::__i_node"** [ %13, %12 ], [ %4, %2 ]
  %10 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %9, align 8, !tbaa !20
  %11 = icmp eq %"struct.std::__1::__i_node"* %10, %1
  br i1 %11, label %17, label %12

12:                                               ; preds = %8
  %13 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %9, i64 1
  %14 = icmp eq %"struct.std::__1::__i_node"** %13, %6
  br i1 %14, label %15, label %8

15:                                               ; preds = %12
  %16 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %6, i64 -1
  store %"struct.std::__1::__i_node"** %16, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !38
  br label %21

17:                                               ; preds = %8, %2
  %18 = phi %"struct.std::__1::__i_node"** [ %4, %2 ], [ %9, %8 ]
  %19 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %6, i64 -1
  store %"struct.std::__1::__i_node"** %19, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !38
  %20 = icmp eq %"struct.std::__1::__i_node"** %19, %18
  br i1 %20, label %30, label %21

21:                                               ; preds = %15, %17
  %22 = phi %"struct.std::__1::__i_node"** [ %16, %15 ], [ %19, %17 ]
  %23 = phi %"struct.std::__1::__i_node"** [ %6, %15 ], [ %18, %17 ]
  %24 = bitcast %"struct.std::__1::__i_node"** %23 to i8*
  %25 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %23, i64 1
  %26 = bitcast %"struct.std::__1::__i_node"** %25 to i8*
  %27 = ptrtoint %"struct.std::__1::__i_node"** %22 to i64
  %28 = ptrtoint %"struct.std::__1::__i_node"** %23 to i64
  %29 = sub i64 %27, %28
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %24, i8* nonnull align 8 %26, i64 %29, i1 false)
  br label %30

30:                                               ; preds = %17, %21
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db16__invalidate_allEPv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %4 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %3, align 8, !tbaa !32
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %6 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %5, align 8, !tbaa !29
  %7 = icmp eq %"struct.std::__1::__c_node"** %4, %6
  br i1 %7, label %52, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__c_node"** %6 to i64
  %10 = ptrtoint %"struct.std::__1::__c_node"** %4 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %6, i64 %27
  %29 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__c_node"* %29, null
  br i1 %30, label %52, label %31

31:                                               ; preds = %8, %42
  %32 = phi %"struct.std::__1::__c_node"* [ %44, %42 ], [ %29, %8 ]
  %33 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 1
  %34 = load i8*, i8** %33, align 8, !tbaa !37
  %35 = icmp eq i8* %34, %1
  br i1 %35, label %36, label %42

36:                                               ; preds = %31
  %37 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 4
  %38 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %37, align 8, !tbaa !38
  %39 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 3
  %40 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %39, align 8, !tbaa !26
  %41 = icmp eq %"struct.std::__1::__i_node"** %38, %40
  br i1 %41, label %52, label %46

42:                                               ; preds = %31
  %43 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 2
  %44 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %43, align 8, !tbaa !28
  %45 = icmp eq %"struct.std::__1::__c_node"* %44, null
  br i1 %45, label %52, label %31

46:                                               ; preds = %36, %46
  %47 = phi %"struct.std::__1::__i_node"** [ %48, %46 ], [ %38, %36 ]
  %48 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %47, i64 -1
  store %"struct.std::__1::__i_node"** %48, %"struct.std::__1::__i_node"*** %37, align 8, !tbaa !38
  %49 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %48, align 8, !tbaa !20
  %50 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %49, i64 0, i32 2
  store %"struct.std::__1::__c_node"* null, %"struct.std::__1::__c_node"** %50, align 8, !tbaa !36
  %51 = icmp eq %"struct.std::__1::__i_node"** %48, %40
  br i1 %51, label %52, label %46

52:                                               ; preds = %42, %46, %36, %8, %2
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void
}

; Function Attrs: uwtable
define %"struct.std::__1::__c_node"* @_ZNKSt3__111__libcpp_db17__find_c_and_lockEPv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %4 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %3, align 8, !tbaa !32
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %6 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %5, align 8, !tbaa !29
  %7 = icmp eq %"struct.std::__1::__c_node"** %4, %6
  br i1 %7, label %40, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__c_node"** %6 to i64
  %10 = ptrtoint %"struct.std::__1::__c_node"** %4 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %6, i64 %27
  %29 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__c_node"* %29, null
  br i1 %30, label %40, label %31

31:                                               ; preds = %8, %36
  %32 = phi %"struct.std::__1::__c_node"* [ %38, %36 ], [ %29, %8 ]
  %33 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 1
  %34 = load i8*, i8** %33, align 8, !tbaa !37
  %35 = icmp eq i8* %34, %1
  br i1 %35, label %41, label %36

36:                                               ; preds = %31
  %37 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %32, i64 0, i32 2
  %38 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %37, align 8, !tbaa !28
  %39 = icmp eq %"struct.std::__1::__c_node"* %38, null
  br i1 %39, label %40, label %31

40:                                               ; preds = %36, %8, %2
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  br label %41

41:                                               ; preds = %31, %40
  %42 = phi %"struct.std::__1::__c_node"* [ null, %40 ], [ %32, %31 ]
  ret %"struct.std::__1::__c_node"* %42
}

declare void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"*) local_unnamed_addr #2

; Function Attrs: nounwind
declare void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"*) local_unnamed_addr #10

; Function Attrs: nounwind readonly uwtable
define %"struct.std::__1::__c_node"* @_ZNKSt3__111__libcpp_db8__find_cEPv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #13 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = ptrtoint i8* %1 to i64
  %4 = lshr i64 %3, 32
  %5 = shl i64 %3, 3
  %6 = and i64 %5, 4294967288
  %7 = add nuw nsw i64 %6, 8
  %8 = xor i64 %7, %4
  %9 = mul i64 %8, -7070675565921424023
  %10 = lshr i64 %9, 47
  %11 = xor i64 %9, %4
  %12 = xor i64 %11, %10
  %13 = mul i64 %12, -7070675565921424023
  %14 = lshr i64 %13, 47
  %15 = xor i64 %14, %13
  %16 = mul i64 %15, -7070675565921424023
  %17 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %18 = bitcast %"struct.std::__1::__c_node"*** %17 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !32
  %20 = bitcast %"class.std::__1::__libcpp_db"* %0 to i64*
  %21 = load i64, i64* %20, align 8, !tbaa !29
  %22 = sub i64 %19, %21
  %23 = ashr exact i64 %22, 3
  %24 = urem i64 %16, %23
  %25 = inttoptr i64 %21 to %"struct.std::__1::__c_node"**
  %26 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %25, i64 %24
  br label %27

27:                                               ; preds = %27, %2
  %28 = phi %"struct.std::__1::__c_node"** [ %26, %2 ], [ %33, %27 ]
  %29 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %28, align 8, !tbaa !20
  %30 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %29, i64 0, i32 1
  %31 = load i8*, i8** %30, align 8, !tbaa !37
  %32 = icmp eq i8* %31, %1
  %33 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %29, i64 0, i32 2
  br i1 %32, label %34, label %27

34:                                               ; preds = %27
  ret %"struct.std::__1::__c_node"* %29
}

; Function Attrs: nounwind uwtable
define void @_ZNKSt3__111__libcpp_db6unlockEv(%"class.std::__1::__libcpp_db"* nocapture readnone %0) local_unnamed_addr #8 align 2 {
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db9__erase_cEPv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %4 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %3, align 8, !tbaa !32
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 0
  %6 = load %"struct.std::__1::__c_node"**, %"struct.std::__1::__c_node"*** %5, align 8, !tbaa !29
  %7 = icmp eq %"struct.std::__1::__c_node"** %4, %6
  br i1 %7, label %71, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__c_node"** %6 to i64
  %10 = ptrtoint %"struct.std::__1::__c_node"** %4 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %6, i64 %27
  %29 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__c_node"* %29, null
  br i1 %30, label %71, label %31

31:                                               ; preds = %8
  %32 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %29, i64 0, i32 1
  %33 = load i8*, i8** %32, align 8, !tbaa !37
  %34 = icmp eq i8* %33, %1
  br i1 %34, label %46, label %39

35:                                               ; preds = %39
  %36 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %42, i64 0, i32 1
  %37 = load i8*, i8** %36, align 8, !tbaa !37
  %38 = icmp eq i8* %37, %1
  br i1 %38, label %44, label %39

39:                                               ; preds = %31, %35
  %40 = phi %"struct.std::__1::__c_node"* [ %42, %35 ], [ %29, %31 ]
  %41 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %40, i64 0, i32 2
  %42 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %41, align 8, !tbaa !28
  %43 = icmp eq %"struct.std::__1::__c_node"* %42, null
  br i1 %43, label %71, label %35

44:                                               ; preds = %35
  %45 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %40, i64 0, i32 2
  br label %46

46:                                               ; preds = %31, %44
  %47 = phi %"struct.std::__1::__c_node"** [ %45, %44 ], [ %28, %31 ]
  %48 = phi %"struct.std::__1::__c_node"* [ %42, %44 ], [ %29, %31 ]
  %49 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %48, i64 0, i32 2
  %50 = bitcast %"struct.std::__1::__c_node"** %49 to i64*
  %51 = load i64, i64* %50, align 8, !tbaa !28
  %52 = bitcast %"struct.std::__1::__c_node"** %47 to i64*
  store i64 %51, i64* %52, align 8, !tbaa !20
  %53 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %48, i64 0, i32 4
  %54 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %53, align 8, !tbaa !38
  %55 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %48, i64 0, i32 3
  %56 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %55, align 8, !tbaa !26
  %57 = icmp eq %"struct.std::__1::__i_node"** %54, %56
  br i1 %57, label %64, label %58

58:                                               ; preds = %46, %58
  %59 = phi %"struct.std::__1::__i_node"** [ %60, %58 ], [ %54, %46 ]
  %60 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %59, i64 -1
  store %"struct.std::__1::__i_node"** %60, %"struct.std::__1::__i_node"*** %53, align 8, !tbaa !38
  %61 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %60, align 8, !tbaa !20
  %62 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %61, i64 0, i32 2
  store %"struct.std::__1::__c_node"* null, %"struct.std::__1::__c_node"** %62, align 8, !tbaa !36
  %63 = icmp eq %"struct.std::__1::__i_node"** %60, %56
  br i1 %63, label %64, label %58

64:                                               ; preds = %58, %46
  %65 = phi %"struct.std::__1::__i_node"** [ %54, %46 ], [ %56, %58 ]
  %66 = bitcast %"struct.std::__1::__i_node"** %65 to i8*
  tail call void @free(i8* %66) #19
  %67 = bitcast %"struct.std::__1::__c_node"* %48 to i8*
  tail call void @free(i8* %67) #19
  %68 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 2
  %69 = load i64, i64* %68, align 8, !tbaa !41
  %70 = add i64 %69, -1
  store i64 %70, i64* %68, align 8, !tbaa !41
  br label %71

71:                                               ; preds = %39, %8, %64, %2
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db15__iterator_copyEPvPKv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1, i8* %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %5 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %4, align 8, !tbaa !33
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %7 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %8 = icmp eq %"struct.std::__1::__i_node"** %5, %7
  br i1 %8, label %157, label %9

9:                                                ; preds = %3
  %10 = ptrtoint %"struct.std::__1::__i_node"** %5 to i64
  %11 = ptrtoint %"struct.std::__1::__i_node"** %7 to i64
  %12 = ptrtoint i8* %1 to i64
  %13 = lshr i64 %12, 32
  %14 = shl i64 %12, 3
  %15 = and i64 %14, 4294967288
  %16 = add nuw nsw i64 %15, 8
  %17 = xor i64 %16, %13
  %18 = mul i64 %17, -7070675565921424023
  %19 = lshr i64 %18, 47
  %20 = xor i64 %18, %13
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = lshr i64 %22, 47
  %24 = xor i64 %23, %22
  %25 = mul i64 %24, -7070675565921424023
  %26 = sub i64 %11, %10
  %27 = ashr exact i64 %26, 3
  %28 = urem i64 %25, %27
  %29 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %28
  %30 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %29, align 8, !tbaa !20
  %31 = icmp eq %"struct.std::__1::__i_node"* %30, null
  br i1 %31, label %41, label %32

32:                                               ; preds = %9, %37
  %33 = phi %"struct.std::__1::__i_node"* [ %39, %37 ], [ %30, %9 ]
  %34 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 0
  %35 = load i8*, i8** %34, align 8, !tbaa !35
  %36 = icmp eq i8* %35, %1
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 1
  %39 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, align 8, !tbaa !20
  %40 = icmp eq %"struct.std::__1::__i_node"* %39, null
  br i1 %40, label %41, label %32

41:                                               ; preds = %37, %32, %9
  %42 = phi %"struct.std::__1::__i_node"* [ null, %9 ], [ null, %37 ], [ %33, %32 ]
  %43 = ptrtoint i8* %2 to i64
  %44 = lshr i64 %43, 32
  %45 = shl i64 %43, 3
  %46 = and i64 %45, 4294967288
  %47 = add nuw nsw i64 %46, 8
  %48 = xor i64 %47, %44
  %49 = mul i64 %48, -7070675565921424023
  %50 = lshr i64 %49, 47
  %51 = xor i64 %49, %44
  %52 = xor i64 %51, %50
  %53 = mul i64 %52, -7070675565921424023
  %54 = lshr i64 %53, 47
  %55 = xor i64 %54, %53
  %56 = mul i64 %55, -7070675565921424023
  %57 = urem i64 %56, %27
  %58 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %57
  %59 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %58, align 8, !tbaa !20
  %60 = icmp eq %"struct.std::__1::__i_node"* %59, null
  br i1 %60, label %78, label %61

61:                                               ; preds = %41, %66
  %62 = phi %"struct.std::__1::__i_node"* [ %68, %66 ], [ %59, %41 ]
  %63 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %62, i64 0, i32 0
  %64 = load i8*, i8** %63, align 8, !tbaa !35
  %65 = icmp eq i8* %64, %2
  br i1 %65, label %70, label %66

66:                                               ; preds = %61
  %67 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %62, i64 0, i32 1
  %68 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %67, align 8, !tbaa !20
  %69 = icmp eq %"struct.std::__1::__i_node"* %68, null
  br i1 %69, label %78, label %61

70:                                               ; preds = %61
  %71 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %62, i64 0, i32 2
  %72 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %71, align 8, !tbaa !36
  %73 = icmp eq %"struct.std::__1::__i_node"* %42, null
  br i1 %73, label %74, label %82

74:                                               ; preds = %70
  %75 = invoke %"struct.std::__1::__i_node"* @_ZNSt3__111__libcpp_db17__insert_iteratorEPv(%"class.std::__1::__libcpp_db"* %0, i8* %1)
          to label %78 unwind label %76

76:                                               ; preds = %74
  %77 = landingpad { i8*, i32 }
          cleanup
  br label %158

78:                                               ; preds = %66, %41, %74
  %79 = phi %"struct.std::__1::__c_node"* [ %72, %74 ], [ null, %41 ], [ null, %66 ]
  %80 = phi %"struct.std::__1::__i_node"* [ %75, %74 ], [ %42, %41 ], [ %42, %66 ]
  %81 = icmp eq %"struct.std::__1::__i_node"* %80, null
  br i1 %81, label %157, label %82

82:                                               ; preds = %70, %78
  %83 = phi %"struct.std::__1::__i_node"* [ %80, %78 ], [ %42, %70 ]
  %84 = phi %"struct.std::__1::__c_node"* [ %79, %78 ], [ %72, %70 ]
  %85 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %83, i64 0, i32 2
  %86 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %85, align 8, !tbaa !36
  %87 = icmp eq %"struct.std::__1::__c_node"* %86, %84
  br i1 %87, label %157, label %88

88:                                               ; preds = %82
  %89 = icmp eq %"struct.std::__1::__c_node"* %86, null
  br i1 %89, label %120, label %90

90:                                               ; preds = %88
  %91 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %86, i64 0, i32 3
  %92 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %91, align 8, !tbaa !26
  %93 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %86, i64 0, i32 4
  %94 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %93, align 8, !tbaa !38
  %95 = icmp eq %"struct.std::__1::__i_node"** %92, %94
  br i1 %95, label %105, label %96

96:                                               ; preds = %90, %100
  %97 = phi %"struct.std::__1::__i_node"** [ %101, %100 ], [ %92, %90 ]
  %98 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %97, align 8, !tbaa !20
  %99 = icmp eq %"struct.std::__1::__i_node"* %98, %83
  br i1 %99, label %105, label %100

100:                                              ; preds = %96
  %101 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %97, i64 1
  %102 = icmp eq %"struct.std::__1::__i_node"** %101, %94
  br i1 %102, label %103, label %96

103:                                              ; preds = %100
  %104 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %94, i64 -1
  store %"struct.std::__1::__i_node"** %104, %"struct.std::__1::__i_node"*** %93, align 8, !tbaa !38
  br label %109

105:                                              ; preds = %96, %90
  %106 = phi %"struct.std::__1::__i_node"** [ %92, %90 ], [ %97, %96 ]
  %107 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %94, i64 -1
  store %"struct.std::__1::__i_node"** %107, %"struct.std::__1::__i_node"*** %93, align 8, !tbaa !38
  %108 = icmp eq %"struct.std::__1::__i_node"** %107, %106
  br i1 %108, label %120, label %109

109:                                              ; preds = %105, %103
  %110 = phi %"struct.std::__1::__i_node"** [ %104, %103 ], [ %107, %105 ]
  %111 = phi %"struct.std::__1::__i_node"** [ %94, %103 ], [ %106, %105 ]
  %112 = bitcast %"struct.std::__1::__i_node"** %111 to i8*
  %113 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %111, i64 1
  %114 = bitcast %"struct.std::__1::__i_node"** %113 to i8*
  %115 = ptrtoint %"struct.std::__1::__i_node"** %110 to i64
  %116 = ptrtoint %"struct.std::__1::__i_node"** %111 to i64
  %117 = sub i64 %115, %116
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %112, i8* nonnull align 8 %114, i64 %117, i1 false) #19
  br label %120

118:                                              ; preds = %142
  %119 = landingpad { i8*, i32 }
          cleanup
  br label %158

120:                                              ; preds = %105, %109, %88
  store %"struct.std::__1::__c_node"* null, %"struct.std::__1::__c_node"** %85, align 8, !tbaa !36
  %121 = icmp eq %"struct.std::__1::__c_node"* %84, null
  br i1 %121, label %157, label %122

122:                                              ; preds = %120
  store %"struct.std::__1::__c_node"* %84, %"struct.std::__1::__c_node"** %85, align 8, !tbaa !36
  %123 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %84, i64 0, i32 4
  %124 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %123, align 8, !tbaa !38
  %125 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %84, i64 0, i32 5
  %126 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %125, align 8, !tbaa !39
  %127 = icmp eq %"struct.std::__1::__i_node"** %124, %126
  br i1 %127, label %128, label %154

128:                                              ; preds = %122
  %129 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %84, i64 0, i32 3
  %130 = bitcast %"struct.std::__1::__i_node"*** %129 to i64*
  %131 = load i64, i64* %130, align 8, !tbaa !26
  %132 = ptrtoint %"struct.std::__1::__i_node"** %124 to i64
  %133 = sub i64 %132, %131
  %134 = ashr exact i64 %133, 2
  %135 = icmp eq i64 %133, 0
  %136 = select i1 %135, i64 1, i64 %134
  %137 = shl i64 %136, 3
  %138 = tail call noalias i8* @malloc(i64 %137) #19
  %139 = bitcast i8* %138 to %"struct.std::__1::__i_node"**
  %140 = icmp eq i8* %138, null
  %141 = inttoptr i64 %131 to i8*
  br i1 %140, label %142, label %144

142:                                              ; preds = %128
  invoke void @_ZSt17__throw_bad_allocv() #20
          to label %143 unwind label %118

143:                                              ; preds = %142
  unreachable

144:                                              ; preds = %128
  %145 = icmp ugt i64 %136, 1
  br i1 %145, label %146, label %149

146:                                              ; preds = %144
  %147 = lshr i64 %136, 1
  %148 = shl i64 %147, 3
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 %138, i8* align 8 %141, i64 %148, i1 false)
  br label %149

149:                                              ; preds = %146, %144
  %150 = phi i64 [ %147, %146 ], [ 0, %144 ]
  %151 = bitcast %"struct.std::__1::__i_node"*** %129 to i8**
  tail call void @free(i8* %141) #19
  store i8* %138, i8** %151, align 8, !tbaa !26
  %152 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %139, i64 %150
  store %"struct.std::__1::__i_node"** %152, %"struct.std::__1::__i_node"*** %123, align 8, !tbaa !38
  %153 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %139, i64 %136
  store %"struct.std::__1::__i_node"** %153, %"struct.std::__1::__i_node"*** %125, align 8, !tbaa !39
  br label %154

154:                                              ; preds = %122, %149
  %155 = phi %"struct.std::__1::__i_node"** [ %152, %149 ], [ %124, %122 ]
  %156 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %155, i64 1
  store %"struct.std::__1::__i_node"** %156, %"struct.std::__1::__i_node"*** %123, align 8, !tbaa !38
  store %"struct.std::__1::__i_node"* %83, %"struct.std::__1::__i_node"** %155, align 8, !tbaa !20
  br label %157

157:                                              ; preds = %78, %3, %154, %120, %82
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void

158:                                              ; preds = %118, %76
  %159 = phi { i8*, i32 } [ %119, %118 ], [ %77, %76 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %159
}

; Function Attrs: uwtable
define zeroext i1 @_ZNKSt3__111__libcpp_db17__dereferenceableEPKv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !33
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !34
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %50, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %10 = ptrtoint %"struct.std::__1::__i_node"** %6 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %4, i64 %27
  %29 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__i_node"* %29, null
  br i1 %30, label %50, label %31

31:                                               ; preds = %8, %36
  %32 = phi %"struct.std::__1::__i_node"* [ %38, %36 ], [ %29, %8 ]
  %33 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8, !tbaa !35
  %35 = icmp eq i8* %34, %1
  br i1 %35, label %40, label %36

36:                                               ; preds = %31
  %37 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 1
  %38 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %37, align 8, !tbaa !20
  %39 = icmp eq %"struct.std::__1::__i_node"* %38, null
  br i1 %39, label %50, label %31

40:                                               ; preds = %31
  %41 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 2
  %42 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %41, align 8, !tbaa !36
  %43 = icmp eq %"struct.std::__1::__c_node"* %42, null
  br i1 %43, label %50, label %44

44:                                               ; preds = %40
  %45 = bitcast %"struct.std::__1::__c_node"* %42 to i1 (%"struct.std::__1::__c_node"*, i8*)***
  %46 = load i1 (%"struct.std::__1::__c_node"*, i8*)**, i1 (%"struct.std::__1::__c_node"*, i8*)*** %45, align 8, !tbaa !24
  %47 = getelementptr inbounds i1 (%"struct.std::__1::__c_node"*, i8*)*, i1 (%"struct.std::__1::__c_node"*, i8*)** %46, i64 2
  %48 = load i1 (%"struct.std::__1::__c_node"*, i8*)*, i1 (%"struct.std::__1::__c_node"*, i8*)** %47, align 8
  %49 = invoke zeroext i1 %48(%"struct.std::__1::__c_node"* nonnull %42, i8* %1)
          to label %50 unwind label %52

50:                                               ; preds = %36, %8, %2, %40, %44
  %51 = phi i1 [ false, %40 ], [ %49, %44 ], [ false, %2 ], [ false, %8 ], [ false, %36 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i1 %51

52:                                               ; preds = %44
  %53 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %53
}

; Function Attrs: uwtable
define zeroext i1 @_ZNKSt3__111__libcpp_db15__decrementableEPKv(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %4 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %3, align 8, !tbaa !33
  %5 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %6 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %5, align 8, !tbaa !34
  %7 = icmp eq %"struct.std::__1::__i_node"** %4, %6
  br i1 %7, label %50, label %8

8:                                                ; preds = %2
  %9 = ptrtoint %"struct.std::__1::__i_node"** %4 to i64
  %10 = ptrtoint %"struct.std::__1::__i_node"** %6 to i64
  %11 = ptrtoint i8* %1 to i64
  %12 = lshr i64 %11, 32
  %13 = shl i64 %11, 3
  %14 = and i64 %13, 4294967288
  %15 = add nuw nsw i64 %14, 8
  %16 = xor i64 %15, %12
  %17 = mul i64 %16, -7070675565921424023
  %18 = lshr i64 %17, 47
  %19 = xor i64 %17, %12
  %20 = xor i64 %19, %18
  %21 = mul i64 %20, -7070675565921424023
  %22 = lshr i64 %21, 47
  %23 = xor i64 %22, %21
  %24 = mul i64 %23, -7070675565921424023
  %25 = sub i64 %10, %9
  %26 = ashr exact i64 %25, 3
  %27 = urem i64 %24, %26
  %28 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %4, i64 %27
  %29 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %28, align 8, !tbaa !20
  %30 = icmp eq %"struct.std::__1::__i_node"* %29, null
  br i1 %30, label %50, label %31

31:                                               ; preds = %8, %36
  %32 = phi %"struct.std::__1::__i_node"* [ %38, %36 ], [ %29, %8 ]
  %33 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 0
  %34 = load i8*, i8** %33, align 8, !tbaa !35
  %35 = icmp eq i8* %34, %1
  br i1 %35, label %40, label %36

36:                                               ; preds = %31
  %37 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 1
  %38 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %37, align 8, !tbaa !20
  %39 = icmp eq %"struct.std::__1::__i_node"* %38, null
  br i1 %39, label %50, label %31

40:                                               ; preds = %31
  %41 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %32, i64 0, i32 2
  %42 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %41, align 8, !tbaa !36
  %43 = icmp eq %"struct.std::__1::__c_node"* %42, null
  br i1 %43, label %50, label %44

44:                                               ; preds = %40
  %45 = bitcast %"struct.std::__1::__c_node"* %42 to i1 (%"struct.std::__1::__c_node"*, i8*)***
  %46 = load i1 (%"struct.std::__1::__c_node"*, i8*)**, i1 (%"struct.std::__1::__c_node"*, i8*)*** %45, align 8, !tbaa !24
  %47 = getelementptr inbounds i1 (%"struct.std::__1::__c_node"*, i8*)*, i1 (%"struct.std::__1::__c_node"*, i8*)** %46, i64 3
  %48 = load i1 (%"struct.std::__1::__c_node"*, i8*)*, i1 (%"struct.std::__1::__c_node"*, i8*)** %47, align 8
  %49 = invoke zeroext i1 %48(%"struct.std::__1::__c_node"* nonnull %42, i8* %1)
          to label %50 unwind label %52

50:                                               ; preds = %36, %8, %2, %40, %44
  %51 = phi i1 [ false, %40 ], [ %49, %44 ], [ false, %2 ], [ false, %8 ], [ false, %36 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i1 %51

52:                                               ; preds = %44
  %53 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %53
}

; Function Attrs: uwtable
define zeroext i1 @_ZNKSt3__111__libcpp_db9__addableEPKvl(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1, i64 %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %5 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %4, align 8, !tbaa !33
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %7 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %8 = icmp eq %"struct.std::__1::__i_node"** %5, %7
  br i1 %8, label %51, label %9

9:                                                ; preds = %3
  %10 = ptrtoint %"struct.std::__1::__i_node"** %5 to i64
  %11 = ptrtoint %"struct.std::__1::__i_node"** %7 to i64
  %12 = ptrtoint i8* %1 to i64
  %13 = lshr i64 %12, 32
  %14 = shl i64 %12, 3
  %15 = and i64 %14, 4294967288
  %16 = add nuw nsw i64 %15, 8
  %17 = xor i64 %16, %13
  %18 = mul i64 %17, -7070675565921424023
  %19 = lshr i64 %18, 47
  %20 = xor i64 %18, %13
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = lshr i64 %22, 47
  %24 = xor i64 %23, %22
  %25 = mul i64 %24, -7070675565921424023
  %26 = sub i64 %11, %10
  %27 = ashr exact i64 %26, 3
  %28 = urem i64 %25, %27
  %29 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %28
  %30 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %29, align 8, !tbaa !20
  %31 = icmp eq %"struct.std::__1::__i_node"* %30, null
  br i1 %31, label %51, label %32

32:                                               ; preds = %9, %37
  %33 = phi %"struct.std::__1::__i_node"* [ %39, %37 ], [ %30, %9 ]
  %34 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 0
  %35 = load i8*, i8** %34, align 8, !tbaa !35
  %36 = icmp eq i8* %35, %1
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 1
  %39 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, align 8, !tbaa !20
  %40 = icmp eq %"struct.std::__1::__i_node"* %39, null
  br i1 %40, label %51, label %32

41:                                               ; preds = %32
  %42 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 2
  %43 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %42, align 8, !tbaa !36
  %44 = icmp eq %"struct.std::__1::__c_node"* %43, null
  br i1 %44, label %51, label %45

45:                                               ; preds = %41
  %46 = bitcast %"struct.std::__1::__c_node"* %43 to i1 (%"struct.std::__1::__c_node"*, i8*, i64)***
  %47 = load i1 (%"struct.std::__1::__c_node"*, i8*, i64)**, i1 (%"struct.std::__1::__c_node"*, i8*, i64)*** %46, align 8, !tbaa !24
  %48 = getelementptr inbounds i1 (%"struct.std::__1::__c_node"*, i8*, i64)*, i1 (%"struct.std::__1::__c_node"*, i8*, i64)** %47, i64 4
  %49 = load i1 (%"struct.std::__1::__c_node"*, i8*, i64)*, i1 (%"struct.std::__1::__c_node"*, i8*, i64)** %48, align 8
  %50 = invoke zeroext i1 %49(%"struct.std::__1::__c_node"* nonnull %43, i8* %1, i64 %2)
          to label %51 unwind label %53

51:                                               ; preds = %37, %9, %3, %41, %45
  %52 = phi i1 [ false, %41 ], [ %50, %45 ], [ false, %3 ], [ false, %9 ], [ false, %37 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i1 %52

53:                                               ; preds = %45
  %54 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %54
}

; Function Attrs: uwtable
define zeroext i1 @_ZNKSt3__111__libcpp_db15__subscriptableEPKvl(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1, i64 %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %5 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %4, align 8, !tbaa !33
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %7 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %8 = icmp eq %"struct.std::__1::__i_node"** %5, %7
  br i1 %8, label %51, label %9

9:                                                ; preds = %3
  %10 = ptrtoint %"struct.std::__1::__i_node"** %5 to i64
  %11 = ptrtoint %"struct.std::__1::__i_node"** %7 to i64
  %12 = ptrtoint i8* %1 to i64
  %13 = lshr i64 %12, 32
  %14 = shl i64 %12, 3
  %15 = and i64 %14, 4294967288
  %16 = add nuw nsw i64 %15, 8
  %17 = xor i64 %16, %13
  %18 = mul i64 %17, -7070675565921424023
  %19 = lshr i64 %18, 47
  %20 = xor i64 %18, %13
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = lshr i64 %22, 47
  %24 = xor i64 %23, %22
  %25 = mul i64 %24, -7070675565921424023
  %26 = sub i64 %11, %10
  %27 = ashr exact i64 %26, 3
  %28 = urem i64 %25, %27
  %29 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %28
  %30 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %29, align 8, !tbaa !20
  %31 = icmp eq %"struct.std::__1::__i_node"* %30, null
  br i1 %31, label %51, label %32

32:                                               ; preds = %9, %37
  %33 = phi %"struct.std::__1::__i_node"* [ %39, %37 ], [ %30, %9 ]
  %34 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 0
  %35 = load i8*, i8** %34, align 8, !tbaa !35
  %36 = icmp eq i8* %35, %1
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 1
  %39 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, align 8, !tbaa !20
  %40 = icmp eq %"struct.std::__1::__i_node"* %39, null
  br i1 %40, label %51, label %32

41:                                               ; preds = %32
  %42 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 2
  %43 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %42, align 8, !tbaa !36
  %44 = icmp eq %"struct.std::__1::__c_node"* %43, null
  br i1 %44, label %51, label %45

45:                                               ; preds = %41
  %46 = bitcast %"struct.std::__1::__c_node"* %43 to i1 (%"struct.std::__1::__c_node"*, i8*, i64)***
  %47 = load i1 (%"struct.std::__1::__c_node"*, i8*, i64)**, i1 (%"struct.std::__1::__c_node"*, i8*, i64)*** %46, align 8, !tbaa !24
  %48 = getelementptr inbounds i1 (%"struct.std::__1::__c_node"*, i8*, i64)*, i1 (%"struct.std::__1::__c_node"*, i8*, i64)** %47, i64 5
  %49 = load i1 (%"struct.std::__1::__c_node"*, i8*, i64)*, i1 (%"struct.std::__1::__c_node"*, i8*, i64)** %48, align 8
  %50 = invoke zeroext i1 %49(%"struct.std::__1::__c_node"* nonnull %43, i8* %1, i64 %2)
          to label %51 unwind label %53

51:                                               ; preds = %37, %9, %3, %41, %45
  %52 = phi i1 [ false, %41 ], [ %50, %45 ], [ false, %3 ], [ false, %9 ], [ false, %37 ]
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i1 %52

53:                                               ; preds = %45
  %54 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %54
}

; Function Attrs: uwtable
define zeroext i1 @_ZNKSt3__111__libcpp_db22__less_than_comparableEPKvS2_(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1, i8* %2) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 3
  %5 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %4, align 8, !tbaa !33
  %6 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 4
  %7 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %6, align 8, !tbaa !34
  %8 = icmp eq %"struct.std::__1::__i_node"** %5, %7
  br i1 %8, label %82, label %9

9:                                                ; preds = %3
  %10 = ptrtoint %"struct.std::__1::__i_node"** %5 to i64
  %11 = ptrtoint %"struct.std::__1::__i_node"** %7 to i64
  %12 = ptrtoint i8* %1 to i64
  %13 = lshr i64 %12, 32
  %14 = shl i64 %12, 3
  %15 = and i64 %14, 4294967288
  %16 = add nuw nsw i64 %15, 8
  %17 = xor i64 %16, %13
  %18 = mul i64 %17, -7070675565921424023
  %19 = lshr i64 %18, 47
  %20 = xor i64 %18, %13
  %21 = xor i64 %20, %19
  %22 = mul i64 %21, -7070675565921424023
  %23 = lshr i64 %22, 47
  %24 = xor i64 %23, %22
  %25 = mul i64 %24, -7070675565921424023
  %26 = sub i64 %11, %10
  %27 = ashr exact i64 %26, 3
  %28 = urem i64 %25, %27
  %29 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %28
  %30 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %29, align 8, !tbaa !20
  %31 = icmp eq %"struct.std::__1::__i_node"* %30, null
  br i1 %31, label %41, label %32

32:                                               ; preds = %9, %37
  %33 = phi %"struct.std::__1::__i_node"* [ %39, %37 ], [ %30, %9 ]
  %34 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 0
  %35 = load i8*, i8** %34, align 8, !tbaa !35
  %36 = icmp eq i8* %35, %1
  br i1 %36, label %41, label %37

37:                                               ; preds = %32
  %38 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %33, i64 0, i32 1
  %39 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %38, align 8, !tbaa !20
  %40 = icmp eq %"struct.std::__1::__i_node"* %39, null
  br i1 %40, label %41, label %32

41:                                               ; preds = %37, %32, %9
  %42 = phi %"struct.std::__1::__i_node"* [ null, %9 ], [ null, %37 ], [ %33, %32 ]
  %43 = ptrtoint i8* %2 to i64
  %44 = lshr i64 %43, 32
  %45 = shl i64 %43, 3
  %46 = and i64 %45, 4294967288
  %47 = add nuw nsw i64 %46, 8
  %48 = xor i64 %47, %44
  %49 = mul i64 %48, -7070675565921424023
  %50 = lshr i64 %49, 47
  %51 = xor i64 %49, %44
  %52 = xor i64 %51, %50
  %53 = mul i64 %52, -7070675565921424023
  %54 = lshr i64 %53, 47
  %55 = xor i64 %54, %53
  %56 = mul i64 %55, -7070675565921424023
  %57 = urem i64 %56, %27
  %58 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %5, i64 %57
  %59 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %58, align 8, !tbaa !20
  %60 = icmp eq %"struct.std::__1::__i_node"* %59, null
  br i1 %60, label %70, label %61

61:                                               ; preds = %41, %66
  %62 = phi %"struct.std::__1::__i_node"* [ %68, %66 ], [ %59, %41 ]
  %63 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %62, i64 0, i32 0
  %64 = load i8*, i8** %63, align 8, !tbaa !35
  %65 = icmp eq i8* %64, %2
  br i1 %65, label %70, label %66

66:                                               ; preds = %61
  %67 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %62, i64 0, i32 1
  %68 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %67, align 8, !tbaa !20
  %69 = icmp eq %"struct.std::__1::__i_node"* %68, null
  br i1 %69, label %70, label %61

70:                                               ; preds = %61, %66, %41
  %71 = phi %"struct.std::__1::__i_node"* [ null, %41 ], [ null, %66 ], [ %62, %61 ]
  %72 = icmp eq %"struct.std::__1::__i_node"* %42, null
  br i1 %72, label %76, label %73

73:                                               ; preds = %70
  %74 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %42, i64 0, i32 2
  %75 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %74, align 8, !tbaa !36
  br label %76

76:                                               ; preds = %70, %73
  %77 = phi %"struct.std::__1::__c_node"* [ %75, %73 ], [ null, %70 ]
  %78 = icmp eq %"struct.std::__1::__i_node"* %71, null
  br i1 %78, label %82, label %79

79:                                               ; preds = %76
  %80 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %71, i64 0, i32 2
  %81 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %80, align 8, !tbaa !36
  br label %82

82:                                               ; preds = %3, %76, %79
  %83 = phi %"struct.std::__1::__c_node"* [ %77, %79 ], [ %77, %76 ], [ null, %3 ]
  %84 = phi %"struct.std::__1::__c_node"* [ %81, %79 ], [ null, %76 ], [ null, %3 ]
  %85 = icmp eq %"struct.std::__1::__c_node"* %83, %84
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret i1 %85
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db4swapEPvS1_(%"class.std::__1::__libcpp_db"* nocapture readonly %0, i8* %1, i8* %2) local_unnamed_addr #0 align 2 personality i32 (...)* @__gxx_personality_v0 {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %4 = ptrtoint i8* %1 to i64
  %5 = lshr i64 %4, 32
  %6 = shl i64 %4, 3
  %7 = and i64 %6, 4294967288
  %8 = add nuw nsw i64 %7, 8
  %9 = xor i64 %8, %5
  %10 = mul i64 %9, -7070675565921424023
  %11 = lshr i64 %10, 47
  %12 = xor i64 %10, %5
  %13 = xor i64 %12, %11
  %14 = mul i64 %13, -7070675565921424023
  %15 = lshr i64 %14, 47
  %16 = xor i64 %15, %14
  %17 = mul i64 %16, -7070675565921424023
  %18 = getelementptr inbounds %"class.std::__1::__libcpp_db", %"class.std::__1::__libcpp_db"* %0, i64 0, i32 1
  %19 = bitcast %"struct.std::__1::__c_node"*** %18 to i64*
  %20 = load i64, i64* %19, align 8, !tbaa !32
  %21 = bitcast %"class.std::__1::__libcpp_db"* %0 to i64*
  %22 = load i64, i64* %21, align 8, !tbaa !29
  %23 = sub i64 %20, %22
  %24 = ashr exact i64 %23, 3
  %25 = urem i64 %17, %24
  %26 = inttoptr i64 %22 to %"struct.std::__1::__c_node"**
  %27 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %26, i64 %25
  br label %28

28:                                               ; preds = %28, %3
  %29 = phi %"struct.std::__1::__c_node"** [ %27, %3 ], [ %34, %28 ]
  %30 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %29, align 8, !tbaa !20
  %31 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %30, i64 0, i32 1
  %32 = load i8*, i8** %31, align 8, !tbaa !37
  %33 = icmp eq i8* %32, %1
  %34 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %30, i64 0, i32 2
  br i1 %33, label %35, label %28

35:                                               ; preds = %28
  %36 = ptrtoint i8* %2 to i64
  %37 = lshr i64 %36, 32
  %38 = shl i64 %36, 3
  %39 = and i64 %38, 4294967288
  %40 = add nuw nsw i64 %39, 8
  %41 = xor i64 %40, %37
  %42 = mul i64 %41, -7070675565921424023
  %43 = lshr i64 %42, 47
  %44 = xor i64 %42, %37
  %45 = xor i64 %44, %43
  %46 = mul i64 %45, -7070675565921424023
  %47 = lshr i64 %46, 47
  %48 = xor i64 %47, %46
  %49 = mul i64 %48, -7070675565921424023
  %50 = urem i64 %49, %24
  %51 = getelementptr inbounds %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %26, i64 %50
  br label %52

52:                                               ; preds = %52, %35
  %53 = phi %"struct.std::__1::__c_node"** [ %51, %35 ], [ %58, %52 ]
  %54 = load %"struct.std::__1::__c_node"*, %"struct.std::__1::__c_node"** %53, align 8, !tbaa !20
  %55 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 1
  %56 = load i8*, i8** %55, align 8, !tbaa !37
  %57 = icmp eq i8* %56, %2
  %58 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 2
  br i1 %57, label %59, label %52

59:                                               ; preds = %52
  %60 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %30, i64 0, i32 3
  %61 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 3
  %62 = bitcast %"struct.std::__1::__i_node"*** %60 to i64*
  %63 = load i64, i64* %62, align 8, !tbaa !20
  %64 = bitcast %"struct.std::__1::__i_node"*** %61 to i64*
  %65 = load i64, i64* %64, align 8, !tbaa !20
  store i64 %65, i64* %62, align 8, !tbaa !20
  store i64 %63, i64* %64, align 8, !tbaa !20
  %66 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %30, i64 0, i32 4
  %67 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 4
  %68 = bitcast %"struct.std::__1::__i_node"*** %66 to i64*
  %69 = load i64, i64* %68, align 8, !tbaa !20
  %70 = bitcast %"struct.std::__1::__i_node"*** %67 to i64*
  %71 = load i64, i64* %70, align 8, !tbaa !20
  store i64 %71, i64* %68, align 8, !tbaa !20
  store i64 %69, i64* %70, align 8, !tbaa !20
  %72 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %30, i64 0, i32 5
  %73 = getelementptr inbounds %"struct.std::__1::__c_node", %"struct.std::__1::__c_node"* %54, i64 0, i32 5
  %74 = bitcast %"struct.std::__1::__i_node"*** %72 to i64*
  %75 = load i64, i64* %74, align 8, !tbaa !20
  %76 = bitcast %"struct.std::__1::__i_node"*** %73 to i64*
  %77 = load i64, i64* %76, align 8, !tbaa !20
  store i64 %77, i64* %74, align 8, !tbaa !20
  store i64 %75, i64* %76, align 8, !tbaa !20
  %78 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %60, align 8, !tbaa !26
  %79 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %66, align 8, !tbaa !38
  %80 = icmp eq %"struct.std::__1::__i_node"** %78, %79
  br i1 %80, label %81, label %85

81:                                               ; preds = %85, %59
  %82 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %61, align 8, !tbaa !26
  %83 = load %"struct.std::__1::__i_node"**, %"struct.std::__1::__i_node"*** %67, align 8, !tbaa !38
  %84 = icmp eq %"struct.std::__1::__i_node"** %82, %83
  br i1 %84, label %91, label %92

85:                                               ; preds = %59, %85
  %86 = phi %"struct.std::__1::__i_node"** [ %89, %85 ], [ %78, %59 ]
  %87 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %86, align 8, !tbaa !20
  %88 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %87, i64 0, i32 2
  store %"struct.std::__1::__c_node"* %30, %"struct.std::__1::__c_node"** %88, align 8, !tbaa !36
  %89 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %86, i64 1
  %90 = icmp eq %"struct.std::__1::__i_node"** %89, %79
  br i1 %90, label %81, label %85

91:                                               ; preds = %92, %81
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void

92:                                               ; preds = %81, %92
  %93 = phi %"struct.std::__1::__i_node"** [ %96, %92 ], [ %82, %81 ]
  %94 = load %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %93, align 8, !tbaa !20
  %95 = getelementptr inbounds %"struct.std::__1::__i_node", %"struct.std::__1::__i_node"* %94, i64 0, i32 2
  store %"struct.std::__1::__c_node"* %54, %"struct.std::__1::__c_node"** %95, align 8, !tbaa !36
  %96 = getelementptr inbounds %"struct.std::__1::__i_node"*, %"struct.std::__1::__i_node"** %93, i64 1
  %97 = icmp eq %"struct.std::__1::__i_node"** %96, %83
  br i1 %97, label %91, label %92
}

; Function Attrs: uwtable
define void @_ZNSt3__111__libcpp_db10__insert_iEPv(%"class.std::__1::__libcpp_db"* nocapture %0, i8* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @_ZNSt3__15mutex4lockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m)
  %3 = invoke %"struct.std::__1::__i_node"* @_ZNSt3__111__libcpp_db17__insert_iteratorEPv(%"class.std::__1::__libcpp_db"* %0, i8* %1)
          to label %4 unwind label %5

4:                                                ; preds = %2
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  ret void

5:                                                ; preds = %2
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZNSt3__15mutex6unlockEv(%"class.std::__1::mutex"* nonnull @_ZZNSt3__112_GLOBAL__N_13mutEvE1m) #19
  resume { i8*, i32 } %6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #1

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #15

; Function Attrs: noreturn
declare void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"*) local_unnamed_addr #14

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #16

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #17

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6insertEmPKc(%"class.std::__1::basic_string"*, i64, i8*) local_unnamed_addr #2

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"*, i8*) local_unnamed_addr #2

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"*, i8*, i64) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #18

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nofree nounwind }
attributes #10 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { cold noreturn nounwind }
attributes #13 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #17 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #18 = { argmemonly nounwind willreturn writeonly }
attributes #19 = { nounwind }
attributes #20 = { noreturn }
attributes #21 = { builtin allocsize(0) }
attributes #22 = { builtin nounwind }
attributes #23 = { cold }
attributes #24 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !6, i64 0}
!5 = !{!"_ZTSNSt3__119__libcpp_debug_infoE", !6, i64 0, !9, i64 8, !6, i64 16, !6, i64 24}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!7, !7, i64 0}
!11 = !{!5, !9, i64 8}
!12 = !{!13}
!13 = distinct !{!13, !14, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_: argument 0"}
!14 = distinct !{!14, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_OS9_"}
!15 = !{!16}
!16 = distinct !{!16, !17, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_: argument 0"}
!17 = distinct !{!17, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_"}
!18 = !{!5, !6, i64 16}
!19 = !{!5, !6, i64 24}
!20 = !{!6, !6, i64 0}
!21 = !{!"branch_weights", i32 1, i32 1048575}
!22 = !{!23, !6, i64 8}
!23 = !{!"_ZTSNSt3__18__i_nodeE", !6, i64 0, !6, i64 8, !6, i64 16}
!24 = !{!25, !25, i64 0}
!25 = !{!"vtable pointer", !8, i64 0}
!26 = !{!27, !6, i64 24}
!27 = !{!"_ZTSNSt3__18__c_nodeE", !6, i64 8, !6, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!28 = !{!27, !6, i64 16}
!29 = !{!30, !6, i64 0}
!30 = !{!"_ZTSNSt3__111__libcpp_dbE", !6, i64 0, !6, i64 8, !31, i64 16, !6, i64 24, !6, i64 32, !31, i64 40}
!31 = !{!"long", !7, i64 0}
!32 = !{!30, !6, i64 8}
!33 = !{!30, !6, i64 24}
!34 = !{!30, !6, i64 32}
!35 = !{!23, !6, i64 0}
!36 = !{!23, !6, i64 16}
!37 = !{!27, !6, i64 8}
!38 = !{!27, !6, i64 32}
!39 = !{!27, !6, i64 40}
!40 = !{!30, !31, i64 40}
!41 = !{!30, !31, i64 16}

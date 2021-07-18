; ModuleID = 'll/.directory_iterator.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/filesystem/directory_iterator.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__fs::filesystem::directory_iterator" = type { %"class.std::__1::shared_ptr" }
%"class.std::__1::shared_ptr" = type { %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__shared_weak_count"* }
%"class.std::__1::__fs::filesystem::__dir_stream" = type { %struct.__dirstream*, %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::directory_entry" }
%struct.__dirstream = type opaque
%"class.std::__1::__fs::filesystem::path" = type { %"class.std::__1::basic_string" }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::__fs::filesystem::directory_entry" = type { %"class.std::__1::__fs::filesystem::path", [8 x i8], %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data" }
%"struct.std::__1::__fs::filesystem::directory_entry::__cached_data" = type <{ i64, i64, %"class.std::__1::chrono::time_point", i32, i32, i8, i8, [6 x i8] }>
%"class.std::__1::chrono::time_point" = type { %"class.std::__1::chrono::duration" }
%"class.std::__1::chrono::duration" = type { i128 }
%"class.std::__1::__shared_weak_count" = type { %"class.std::__1::__shared_count", i64 }
%"class.std::__1::__shared_count" = type { i32 (...)**, i64 }
%"class.std::__1::error_code" = type { i32, %"class.std::__1::error_category"* }
%"class.std::__1::error_category" = type { i32 (...)** }
%"class.std::__1::__fs::filesystem::recursive_directory_iterator" = type <{ %"class.std::__1::shared_ptr.2", i8, [7 x i8] }>
%"class.std::__1::shared_ptr.2" = type { %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"class.std::__1::__shared_weak_count"* }
%"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp" = type <{ %"class.std::__1::stack", i8, [7 x i8] }>
%"class.std::__1::stack" = type { %"class.std::__1::deque" }
%"class.std::__1::deque" = type { %"class.std::__1::__deque_base" }
%"class.std::__1::__deque_base" = type { %"struct.std::__1::__split_buffer", i64, %"class.std::__1::__compressed_pair.9" }
%"struct.std::__1::__split_buffer" = type { %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__compressed_pair.3" }
%"class.std::__1::__compressed_pair.3" = type { %"struct.std::__1::__compressed_pair_elem.4" }
%"struct.std::__1::__compressed_pair_elem.4" = type { %"class.std::__1::__fs::filesystem::__dir_stream"** }
%"class.std::__1::__compressed_pair.9" = type { %"struct.std::__1::__compressed_pair_elem.10" }
%"struct.std::__1::__compressed_pair_elem.10" = type { i64 }
%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler" = type { i8*, %"class.std::__1::error_code"*, %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::__fs::filesystem::path"* }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }
%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%"struct.std::__1::array" = type { [256 x i8] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%"class.std::__1::__fs::filesystem::file_status" = type { i8, i32 }
%"class.std::__1::__basic_string_common" = type { i8 }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"struct.std::__1::__shared_ptr_emplace" = type { %"class.std::__1::__shared_weak_count", [8 x i8], %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::__dir_stream, std::__1::allocator<std::__1::__fs::filesystem::__dir_stream>>::_Storage" }
%"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::__dir_stream, std::__1::allocator<std::__1::__fs::filesystem::__dir_stream>>::_Storage" = type { [112 x i8] }
%"class.std::type_info" = type { i32 (...)**, i8* }
%"class.std::__1::__fs::filesystem::filesystem_error" = type { %"class.std::__1::system_error", %"class.std::__1::shared_ptr.21" }
%"class.std::__1::system_error" = type { %"class.std::runtime_error", %"class.std::__1::error_code" }
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::__1::shared_ptr.21" = type { %"struct.std::__1::__fs::filesystem::filesystem_error::_Storage"*, %"class.std::__1::__shared_weak_count"* }
%"struct.std::__1::__fs::filesystem::filesystem_error::_Storage" = type { %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path", %"class.std::__1::basic_string" }
%"struct.std::__1::__shared_ptr_emplace.29" = type { %"class.std::__1::__shared_weak_count", %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::filesystem_error::_Storage, std::__1::allocator<std::__1::__fs::filesystem::filesystem_error::_Storage>>::_Storage" }
%"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::filesystem_error::_Storage, std::__1::allocator<std::__1::__fs::filesystem::filesystem_error::_Storage>>::_Storage" = type { [72 x i8] }
%"struct.std::__1::__shared_ptr_emplace.40" = type { %"class.std::__1::__shared_weak_count", %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp, std::__1::allocator<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp>>::_Storage" }
%"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp, std::__1::allocator<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp>>::_Storage" = type { [56 x i8] }

$_ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE = comdat any

$_ZNSt3__14__fs10filesystem12__dir_streamC2ERKNS1_4pathENS1_17directory_optionsERNS_10error_codeE = comdat any

$__clang_call_terminate = comdat any

$_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendIPKcEENS_9_MetaBaseIXsr27__is_cpp17_forward_iteratorIT_EE5valueEE13_EnableIfImplIRS5_EESA_SA_ = comdat any

$_ZNSt3__120__throw_length_errorEPKc = comdat any

$_ZNSt12length_errorC2EPKc = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED2Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED0Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE16__on_zero_sharedEv = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE21__on_zero_shared_weakEv = comdat any

$_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeEEEEvDpOT_ = comdat any

$_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathERKNS_10error_codeEEEEvDpOT_ = comdat any

$_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESC_RKNS_10error_codeEEEEvDpOT_ = comdat any

$_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10error_codeE = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED2Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED0Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE16__on_zero_sharedEv = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE21__on_zero_shared_weakEv = comdat any

$_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathENS_10error_codeE = comdat any

$_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESD_NS_10error_codeE = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED2Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED0Ev = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE16__on_zero_sharedEv = comdat any

$_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE21__on_zero_shared_weakEv = comdat any

$_ZNSt3__112__deque_baseINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE5clearEv = comdat any

$_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE19__add_back_capacityEv = comdat any

$_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE9push_backEOS4_ = comdat any

$_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE10push_frontEOS4_ = comdat any

$_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE8pop_backEv = comdat any

$_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = comdat any

$_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = comdat any

$_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = comdat any

$_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = comdat any

$_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = comdat any

$_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = comdat any

$_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = comdat any

$_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = comdat any

$_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = comdat any

@.str = private unnamed_addr constant [44 x i8] c"directory_iterator::directory_iterator(...)\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"directory_iterator::operator++()\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"at root \22%s\22\00", align 1
@.str.3 = private unnamed_addr constant [29 x i8] c"recursive_directory_iterator\00", align 1
@.str.4 = private unnamed_addr constant [43 x i8] c"recursive_directory_iterator::operator++()\00", align 1
@.str.5 = private unnamed_addr constant [31 x i8] c"attempting recursion into \22%s\22\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"..\00", align 1
@.str.8 = private unnamed_addr constant [68 x i8] c"allocator<T>::allocate(size_t n) 'n' exceeds maximum supported size\00", align 1
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8
@_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = linkonce_odr hidden unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED2Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED0Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE16__on_zero_sharedEv to i8*), i8* bitcast (i8* (%"class.std::__1::__shared_weak_count"*, %"class.std::type_info"*)* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE21__on_zero_shared_weakEv to i8*)] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = linkonce_odr hidden constant [87 x i8] c"NSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE\00", comdat, align 1
@_ZTINSt3__119__shared_weak_countE = external constant i8*
@_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([87 x i8], [87 x i8]* @_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__119__shared_weak_countE to i8*) }, comdat, align 8
@.str.9 = private unnamed_addr constant [4 x i8] c"in \00", align 1
@_ZTINSt3__14__fs10filesystem16filesystem_errorE = external constant i8*
@_ZTVNSt3__14__fs10filesystem16filesystem_errorE = external unnamed_addr constant { [5 x i8*] }, align 8
@_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = linkonce_odr hidden unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.29"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED2Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.29"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED0Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.29"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE16__on_zero_sharedEv to i8*), i8* bitcast (i8* (%"class.std::__1::__shared_weak_count"*, %"class.std::type_info"*)* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.29"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE21__on_zero_shared_weakEv to i8*)] }, comdat, align 8
@_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = linkonce_odr hidden constant [100 x i8] c"NSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE\00", comdat, align 1
@_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__119__shared_weak_countE to i8*) }, comdat, align 8
@.str.10 = private unnamed_addr constant [3 x i8] c": \00", align 1
@_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = linkonce_odr hidden unnamed_addr constant { [7 x i8*] } { [7 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.40"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED2Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.40"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED0Ev to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.40"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE16__on_zero_sharedEv to i8*), i8* bitcast (i8* (%"class.std::__1::__shared_weak_count"*, %"class.std::type_info"*)* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info to i8*), i8* bitcast (void (%"struct.std::__1::__shared_ptr_emplace.40"*)* @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE21__on_zero_shared_weakEv to i8*)] }, comdat, align 8
@_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = linkonce_odr hidden constant [117 x i8] c"NSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE\00", comdat, align 1
@_ZTINSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE = linkonce_odr hidden constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([117 x i8], [117 x i8]* @_ZTSNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE, i32 0, i32 0), i8* bitcast (i8** @_ZTINSt3__119__shared_weak_countE to i8*) }, comdat, align 8
@switch.table._ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE = private unnamed_addr constant [12 x i8] c"\02\02\00\02\00\02\00\02\00\01\00\02", align 1
@switch.table._ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE.12 = private unnamed_addr constant [12 x i8] c"\06\05\00\02\00\04\00\01\00\03\00\07", align 1

@_ZNSt3__14__fs10filesystem18directory_iteratorC1ERKNS1_4pathEPNS_10error_codeENS1_17directory_optionsE = unnamed_addr alias void (%"class.std::__1::__fs::filesystem::directory_iterator"*, %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::error_code"*, i8), void (%"class.std::__1::__fs::filesystem::directory_iterator"*, %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::error_code"*, i8)* @_ZNSt3__14__fs10filesystem18directory_iteratorC2ERKNS1_4pathEPNS_10error_codeENS1_17directory_optionsE
@_ZNSt3__14__fs10filesystem28recursive_directory_iteratorC1ERKNS1_4pathENS1_17directory_optionsEPNS_10error_codeE = unnamed_addr alias void (%"class.std::__1::__fs::filesystem::recursive_directory_iterator"*, %"class.std::__1::__fs::filesystem::path"*, i8, %"class.std::__1::error_code"*), void (%"class.std::__1::__fs::filesystem::recursive_directory_iterator"*, %"class.std::__1::__fs::filesystem::path"*, i8, %"class.std::__1::error_code"*)* @_ZNSt3__14__fs10filesystem28recursive_directory_iteratorC2ERKNS1_4pathENS1_17directory_optionsEPNS_10error_codeE

; Function Attrs: uwtable
define void @_ZNSt3__14__fs10filesystem18directory_iteratorC2ERKNS1_4pathEPNS_10error_codeENS1_17directory_optionsE(%"class.std::__1::__fs::filesystem::directory_iterator"* nocapture %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::error_code"* %2, i8 zeroext %3) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", align 8
  %6 = alloca %"class.std::__1::error_code", align 8
  %7 = bitcast %"class.std::__1::__fs::filesystem::directory_iterator"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %7, i8 0, i64 16, i1 false) #16
  %8 = bitcast %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %8) #16
  %9 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 0
  store i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i64 0, i64 0), i8** %9, align 8, !tbaa !3
  %10 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 1
  store %"class.std::__1::error_code"* %2, %"class.std::__1::error_code"** %10, align 8, !tbaa !8
  %11 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 2
  store %"class.std::__1::__fs::filesystem::path"* %1, %"class.std::__1::__fs::filesystem::path"** %11, align 8, !tbaa !9
  %12 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 3
  store %"class.std::__1::__fs::filesystem::path"* null, %"class.std::__1::__fs::filesystem::path"** %12, align 8, !tbaa !10
  %13 = icmp eq %"class.std::__1::error_code"* %2, null
  br i1 %13, label %18, label %14

14:                                               ; preds = %4
  %15 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 0
  store i32 0, i32* %15, align 8, !tbaa !11
  %16 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %17 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 1
  store %"class.std::__1::error_category"* %16, %"class.std::__1::error_category"** %17, align 8, !tbaa !14
  br label %18

18:                                               ; preds = %4, %14
  %19 = bitcast %"class.std::__1::error_code"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #16
  %20 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 0
  store i32 0, i32* %20, align 8, !tbaa !11
  %21 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 1
  %22 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %22, %"class.std::__1::error_category"** %21, align 8, !tbaa !14
  %23 = invoke noalias nonnull dereferenceable(144) i8* @_Znwm(i64 144) #19
          to label %24 unwind label %44

24:                                               ; preds = %18
  %25 = bitcast i8* %23 to i32 (...)***
  %26 = getelementptr inbounds i8, i8* %23, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %26, i8 0, i64 16, i1 false), !noalias !15
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %25, align 16, !tbaa !20, !noalias !15
  %27 = getelementptr inbounds i8, i8* %23, i64 32
  %28 = bitcast i8* %27 to %"class.std::__1::__fs::filesystem::__dir_stream"*
  invoke void @_ZNSt3__14__fs10filesystem12__dir_streamC2ERKNS1_4pathENS1_17directory_optionsERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* nonnull %28, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, i8 zeroext %3, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6)
          to label %32 unwind label %29, !noalias !15

29:                                               ; preds = %24
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = bitcast i8* %23 to %"class.std::__1::__shared_weak_count"*
  call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* nonnull %31) #16, !noalias !15
  call void @_ZdlPv(i8* nonnull %23) #20, !noalias !15
  br label %64

32:                                               ; preds = %24
  %33 = ptrtoint i8* %27 to i64
  %34 = ptrtoint i8* %23 to i64
  %35 = bitcast %"class.std::__1::__fs::filesystem::directory_iterator"* %0 to i64*
  store i64 %33, i64* %35, align 8, !tbaa !22
  %36 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 1
  %37 = bitcast %"class.std::__1::__shared_weak_count"** %36 to i64*
  %38 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %36, align 8, !tbaa !22
  store i64 %34, i64* %37, align 8, !tbaa !22
  %39 = icmp eq %"class.std::__1::__shared_weak_count"* %38, null
  br i1 %39, label %41, label %40

40:                                               ; preds = %32
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %38) #16
  br label %41

41:                                               ; preds = %40, %32
  br i1 %13, label %46, label %42

42:                                               ; preds = %41
  %43 = bitcast %"class.std::__1::error_code"* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %43, i8* nonnull align 8 dereferenceable(16) %19, i64 16, i1 false), !tbaa.struct !23
  br label %46

44:                                               ; preds = %18
  %45 = landingpad { i8*, i32 }
          cleanup
  br label %64

46:                                               ; preds = %41, %42
  %47 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 0
  %48 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %47, align 8, !tbaa !25
  %49 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 0
  %50 = load %struct.__dirstream*, %struct.__dirstream** %49, align 16, !tbaa !27
  %51 = icmp eq %struct.__dirstream* %50, null
  br i1 %51, label %52, label %63

52:                                               ; preds = %46
  %53 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %36, align 8, !tbaa !22
  %54 = bitcast %"class.std::__1::__fs::filesystem::directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %54, align 8, !tbaa !22
  %55 = icmp eq %"class.std::__1::__shared_weak_count"* %53, null
  br i1 %55, label %57, label %56

56:                                               ; preds = %52
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %53) #16
  br label %57

57:                                               ; preds = %52, %56
  %58 = load i32, i32* %20, align 8, !tbaa !11
  %59 = icmp eq i32 %58, 0
  br i1 %59, label %63, label %60

60:                                               ; preds = %57
  invoke fastcc void @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeE(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nonnull %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6)
          to label %63 unwind label %61

61:                                               ; preds = %60
  %62 = landingpad { i8*, i32 }
          cleanup
  br label %64

63:                                               ; preds = %57, %46, %60
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #16
  ret void

64:                                               ; preds = %44, %29, %61
  %65 = phi { i8*, i32 } [ %62, %61 ], [ %45, %44 ], [ %30, %29 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %8) #16
  %66 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 1
  %67 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %66, align 8, !tbaa !41
  %68 = icmp eq %"class.std::__1::__shared_weak_count"* %67, null
  br i1 %68, label %70, label %69

69:                                               ; preds = %64
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %67) #16
  br label %70

70:                                               ; preds = %64, %69
  resume { i8*, i32 } %65
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

; Function Attrs: uwtable
define internal fastcc void @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeE(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nocapture readonly %0, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = alloca %"class.std::__1::basic_string", align 8
  %5 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 1
  %6 = load %"class.std::__1::error_code"*, %"class.std::__1::error_code"** %5, align 8, !tbaa !8
  %7 = icmp eq %"class.std::__1::error_code"* %6, null
  br i1 %7, label %11, label %8

8:                                                ; preds = %2
  %9 = bitcast %"class.std::__1::error_code"* %6 to i8*
  %10 = bitcast %"class.std::__1::error_code"* %1 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %9, i8* nonnull align 8 dereferenceable(16) %10, i64 16, i1 false), !tbaa.struct !23
  ret void

11:                                               ; preds = %2
  %12 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %12) #16
  %13 = bitcast %"class.std::__1::basic_string"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %13) #16
  store i8 6, i8* %13, align 8, !tbaa !42
  %14 = bitcast %"class.std::__1::basic_string"* %4 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %15 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %14, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(3) %15, i8* nonnull align 1 dereferenceable(3) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i64 3, i1 false) #16
  %16 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %14, i64 0, i32 1, i64 3
  store i8 0, i8* %16, align 1, !tbaa !42
  %17 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 0
  %18 = load i8*, i8** %17, align 8, !tbaa !3
  %19 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %4, i8* %18)
          to label %20 unwind label %38

20:                                               ; preds = %11
  %21 = bitcast %"class.std::__1::basic_string"* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %12, i8* nonnull align 8 dereferenceable(24) %21, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %21, i8 0, i64 24, i1 false) #16, !noalias !43
  %22 = load i8, i8* %13, align 8, !tbaa !42
  %23 = and i8 %22, 1
  %24 = icmp eq i8 %23, 0
  br i1 %24, label %28, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8, !tbaa !42
  call void @_ZdlPv(i8* %27) #20
  br label %28

28:                                               ; preds = %20, %25
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %13) #16
  %29 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 2
  %30 = load %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::__fs::filesystem::path"** %29, align 8, !tbaa !9
  %31 = icmp ne %"class.std::__1::__fs::filesystem::path"* %30, null
  %32 = zext i1 %31 to i32
  %33 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 3
  %34 = load %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::__fs::filesystem::path"** %33, align 8, !tbaa !10
  %35 = icmp ne %"class.std::__1::__fs::filesystem::path"* %34, null
  %36 = zext i1 %35 to i32
  %37 = add nuw nsw i32 %36, %32
  switch i32 %37, label %65 [
    i32 0, label %49
    i32 1, label %61
    i32 2, label %63
  ]

38:                                               ; preds = %11
  %39 = landingpad { i8*, i32 }
          cleanup
  %40 = extractvalue { i8*, i32 } %39, 0
  %41 = extractvalue { i8*, i32 } %39, 1
  %42 = load i8, i8* %13, align 8, !tbaa !42
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %38
  %46 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %47 = load i8*, i8** %46, align 8, !tbaa !42
  call void @_ZdlPv(i8* %47) #20
  br label %48

48:                                               ; preds = %38, %45
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %13) #16
  br label %66

49:                                               ; preds = %28
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %50 unwind label %51

50:                                               ; preds = %49
  unreachable

51:                                               ; preds = %63, %61, %49
  %52 = landingpad { i8*, i32 }
          cleanup
  %53 = extractvalue { i8*, i32 } %52, 0
  %54 = extractvalue { i8*, i32 } %52, 1
  %55 = load i8, i8* %12, align 8, !tbaa !42
  %56 = and i8 %55, 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %66, label %58

58:                                               ; preds = %51
  %59 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !42
  call void @_ZdlPv(i8* %60) #20
  br label %66

61:                                               ; preds = %28
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %30, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %62 unwind label %51

62:                                               ; preds = %61
  unreachable

63:                                               ; preds = %28
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESC_RKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %3, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %30, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %34, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %64 unwind label %51

64:                                               ; preds = %63
  unreachable

65:                                               ; preds = %28
  unreachable

66:                                               ; preds = %58, %51, %48
  %67 = phi i8* [ %40, %48 ], [ %53, %51 ], [ %53, %58 ]
  %68 = phi i32 [ %41, %48 ], [ %54, %51 ], [ %54, %58 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #16
  %69 = insertvalue { i8*, i32 } undef, i8* %67, 0
  %70 = insertvalue { i8*, i32 } %69, i32 %68, 1
  resume { i8*, i32 } %70
}

; Function Attrs: uwtable
define nonnull align 8 dereferenceable(16) %"class.std::__1::__fs::filesystem::directory_iterator"* @_ZNSt3__14__fs10filesystem18directory_iterator11__incrementEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::directory_iterator"* returned %0, %"class.std::__1::error_code"* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", align 8
  %4 = alloca %"class.std::__1::error_code", align 8
  %5 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %6 = bitcast %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #16
  %7 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 0
  store i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0), i8** %7, align 8, !tbaa !3
  %8 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 1
  store %"class.std::__1::error_code"* %1, %"class.std::__1::error_code"** %8, align 8, !tbaa !8
  %9 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 2
  %10 = icmp eq %"class.std::__1::error_code"* %1, null
  %11 = bitcast %"class.std::__1::__fs::filesystem::path"** %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  br i1 %10, label %16, label %12

12:                                               ; preds = %2
  %13 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %13, align 8, !tbaa !11
  %14 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %15 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %14, %"class.std::__1::error_category"** %15, align 8, !tbaa !14
  br label %16

16:                                               ; preds = %2, %12
  %17 = bitcast %"class.std::__1::error_code"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %17) #16
  %18 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 0
  store i32 0, i32* %18, align 8, !tbaa !11
  %19 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 1
  %20 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %20, %"class.std::__1::error_category"** %19, align 8, !tbaa !14
  %21 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 0
  %22 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %21, align 8, !tbaa !25
  %23 = call zeroext i1 @_ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* %22, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %4)
  br i1 %23, label %62, label %24

24:                                               ; preds = %16
  %25 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %25) #16
  %26 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %21, align 8, !tbaa !25
  %27 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %26, i64 0, i32 1
  %28 = bitcast %"class.std::__1::__fs::filesystem::path"* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %25, i8* nonnull align 8 dereferenceable(24) %28, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %28, i8 0, i64 24, i1 false) #16
  %29 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 1
  %30 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %29, align 8, !tbaa !22
  %31 = bitcast %"class.std::__1::__fs::filesystem::directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %31, align 8, !tbaa !22
  %32 = icmp eq %"class.std::__1::__shared_weak_count"* %30, null
  br i1 %32, label %34, label %33

33:                                               ; preds = %24
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %30) #16
  br label %34

34:                                               ; preds = %24, %33
  %35 = load i32, i32* %18, align 8, !tbaa !11
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %54, label %37

37:                                               ; preds = %34
  %38 = load i8, i8* %25, align 8, !tbaa !42
  %39 = and i8 %38, 1
  %40 = icmp eq i8 %39, 0
  %41 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %42 = load i8*, i8** %41, align 8
  %43 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %44 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %43, i64 0, i32 1, i64 0
  %45 = select i1 %40, i8* %44, i8* %42
  invoke void (%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"*, %"class.std::__1::error_code"*, i8*, ...) @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeEPKcz(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nonnull %3, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %4, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i8* %45)
          to label %54 unwind label %46

46:                                               ; preds = %37
  %47 = landingpad { i8*, i32 }
          cleanup
  %48 = load i8, i8* %25, align 8, !tbaa !42
  %49 = and i8 %48, 1
  %50 = icmp eq i8 %49, 0
  br i1 %50, label %53, label %51

51:                                               ; preds = %46
  %52 = load i8*, i8** %41, align 8, !tbaa !42
  call void @_ZdlPv(i8* %52) #20
  br label %53

53:                                               ; preds = %46, %51
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %25) #16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %17) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #16
  resume { i8*, i32 } %47

54:                                               ; preds = %34, %37
  %55 = load i8, i8* %25, align 8, !tbaa !42
  %56 = and i8 %55, 1
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %61, label %58

58:                                               ; preds = %54
  %59 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !42
  call void @_ZdlPv(i8* %60) #20
  br label %61

61:                                               ; preds = %54, %58
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %25) #16
  br label %62

62:                                               ; preds = %61, %16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %17) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #16
  ret %"class.std::__1::__fs::filesystem::directory_iterator"* %0
}

; Function Attrs: uwtable
define linkonce_odr hidden zeroext i1 @_ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* %0, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca [16 x i8], align 16
  %4 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %5 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %6 = getelementptr inbounds [16 x i8], [16 x i8]* %3, i64 0, i64 0
  %7 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 0
  %8 = tail call i32* @__errno_location() #22
  %9 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %10 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  %11 = load %struct.__dirstream*, %struct.__dirstream** %7, align 16, !tbaa !27
  store i32 0, i32* %8, align 4, !tbaa !24, !noalias !46
  store i32 0, i32* %9, align 8, !tbaa !11, !noalias !46
  %12 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16, !noalias !46
  store %"class.std::__1::error_category"* %12, %"class.std::__1::error_category"** %10, align 8, !tbaa !14, !noalias !46
  %13 = tail call %struct.dirent* @readdir(%struct.__dirstream* %11), !noalias !46
  %14 = icmp eq %struct.dirent* %13, null
  br i1 %14, label %15, label %20

15:                                               ; preds = %150, %2
  %16 = load i32, i32* %8, align 4, !tbaa !24, !noalias !46
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %50, label %18

18:                                               ; preds = %15
  %19 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16, !noalias !46
  store i32 %16, i32* %9, align 8, !tbaa.struct !23, !noalias !46
  store %"class.std::__1::error_category"* %19, %"class.std::__1::error_category"** %10, align 8, !tbaa.struct !23, !noalias !46
  br label %50

20:                                               ; preds = %2, %150
  %21 = phi %struct.dirent* [ %153, %150 ], [ %13, %2 ]
  %22 = getelementptr %struct.dirent, %struct.dirent* %21, i64 0, i32 3
  %23 = load i8, i8* %22, align 2, !tbaa !49, !noalias !46
  %24 = add i8 %23, -1
  %25 = icmp ult i8 %24, 12
  br i1 %25, label %26, label %33

26:                                               ; preds = %20
  %27 = sext i8 %24 to i64
  %28 = getelementptr inbounds [12 x i8], [12 x i8]* @switch.table._ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE, i64 0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = sext i8 %24 to i64
  %31 = getelementptr inbounds [12 x i8], [12 x i8]* @switch.table._ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE.12, i64 0, i64 %30
  %32 = load i8, i8* %31, align 1
  br label %33

33:                                               ; preds = %20, %26
  %34 = phi i8 [ %29, %26 ], [ 0, %20 ]
  %35 = phi i8 [ %32, %26 ], [ 0, %20 ]
  %36 = getelementptr inbounds %struct.dirent, %struct.dirent* %21, i64 0, i32 4, i64 0
  %37 = tail call i64 @strlen(i8* nonnull dereferenceable(1) %36) #16, !noalias !46
  switch i64 %37, label %44 [
    i64 1, label %38
    i64 2, label %41
  ]

38:                                               ; preds = %33
  %39 = load i8, i8* %36, align 1
  %40 = icmp eq i8 %39, 46
  br i1 %40, label %150, label %44

41:                                               ; preds = %33
  %42 = tail call i32 @bcmp(i8* nonnull %36, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0), i64 %37)
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %150, label %44

44:                                               ; preds = %38, %33, %41
  %45 = phi i64 [ %37, %33 ], [ 2, %41 ], [ 1, %38 ]
  %46 = load i32, i32* %9, align 8, !tbaa !11
  %47 = icmp ne i32 %46, 0
  %48 = icmp eq i64 %45, 0
  %49 = or i1 %48, %47
  br i1 %49, label %50, label %58

50:                                               ; preds = %18, %15, %44
  %51 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %52 = load %struct.__dirstream*, %struct.__dirstream** %7, align 16, !tbaa !27
  %53 = tail call i32 @closedir(%struct.__dirstream* %52) #16
  %54 = icmp eq i32 %53, -1
  br i1 %54, label %55, label %57

55:                                               ; preds = %50
  %56 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %57

57:                                               ; preds = %50, %55
  store %struct.__dirstream* null, %struct.__dirstream** %7, align 16, !tbaa !27
  br label %155

58:                                               ; preds = %44
  %59 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2
  %60 = bitcast %"class.std::__1::__fs::filesystem::path"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %60) #16
  %61 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %61) #16
  %62 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %61, i8 0, i64 24, i1 false) #16
  %63 = getelementptr inbounds %struct.dirent, %struct.dirent* %21, i64 0, i32 4, i64 %45
  %64 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendIPKcEENS_9_MetaBaseIXsr27__is_cpp17_forward_iteratorIT_EE5valueEE13_EnableIfImplIRS5_EESA_SA_(%"class.std::__1::basic_string"* nonnull %62, i8* nonnull %36, i8* nonnull %63)
          to label %74 unwind label %65

65:                                               ; preds = %58
  %66 = landingpad { i8*, i32 }
          cleanup
  %67 = load i8, i8* %61, align 8, !tbaa !42
  %68 = and i8 %67, 1
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %65
  %71 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %72 = load i8*, i8** %71, align 8, !tbaa !42
  call void @_ZdlPv(i8* %72) #20
  br label %73

73:                                               ; preds = %70, %65
  resume { i8*, i32 } %66

74:                                               ; preds = %58
  %75 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %4, i64 0, i32 0
  %76 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 1, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %75, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %76)
          to label %77 unwind label %139

77:                                               ; preds = %74
  %78 = invoke { i8*, i64 } @_ZNKSt3__14__fs10filesystem4path16__root_directoryEv(%"class.std::__1::__fs::filesystem::path"* nonnull %5)
          to label %79 unwind label %105

79:                                               ; preds = %77
  %80 = extractvalue { i8*, i64 } %78, 1
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %84, label %82

82:                                               ; preds = %79
  %83 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_(%"class.std::__1::basic_string"* nonnull %75, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %62)
          to label %113 unwind label %105

84:                                               ; preds = %79
  %85 = invoke { i8*, i64 } @_ZNKSt3__14__fs10filesystem4path10__filenameEv(%"class.std::__1::__fs::filesystem::path"* nonnull %4)
          to label %86 unwind label %105

86:                                               ; preds = %84
  %87 = extractvalue { i8*, i64 } %85, 1
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %90, label %89

89:                                               ; preds = %86
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc(%"class.std::__1::basic_string"* nonnull %75, i8 signext 47)
          to label %90 unwind label %105

90:                                               ; preds = %89, %86
  %91 = load i8, i8* %61, align 8, !tbaa !42
  %92 = and i8 %91, 1
  %93 = icmp eq i8 %92, 0
  %94 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %95 = load i8*, i8** %94, align 8
  %96 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %97 = load i64, i64* %96, align 8
  %98 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %99 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %98, i64 0, i32 1, i64 0
  %100 = lshr i8 %91, 1
  %101 = zext i8 %100 to i64
  %102 = select i1 %93, i8* %99, i8* %95
  %103 = select i1 %93, i64 %101, i64 %97
  %104 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %75, i8* %102, i64 %103)
          to label %113 unwind label %105

105:                                              ; preds = %90, %89, %84, %82, %77
  %106 = landingpad { i8*, i32 }
          cleanup
  %107 = load i8, i8* %60, align 8, !tbaa !42, !alias.scope !52
  %108 = and i8 %107, 1
  %109 = icmp eq i8 %108, 0
  br i1 %109, label %141, label %110

110:                                              ; preds = %105
  %111 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %4, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %112 = load i8*, i8** %111, align 8, !tbaa !42, !alias.scope !52
  call void @_ZdlPv(i8* %112) #20
  br label %141

113:                                              ; preds = %82, %90
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %6)
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %6, i8 -1, i64 16, i1 false)
  %114 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %59 to i8*
  %115 = load i8, i8* %114, align 8, !tbaa !42
  %116 = and i8 %115, 1
  %117 = icmp eq i8 %116, 0
  br i1 %117, label %121, label %118

118:                                              ; preds = %113
  %119 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %120 = load i8*, i8** %119, align 8, !tbaa !42
  call void @_ZdlPv(i8* %120) #20
  br label %121

121:                                              ; preds = %118, %113
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %114, i8* nonnull align 8 dereferenceable(24) %60, i64 24, i1 false) #16, !tbaa.struct !55
  store i8 0, i8* %60, align 8, !tbaa !42
  %122 = bitcast %"class.std::__1::__fs::filesystem::path"* %4 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %123 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %122, i64 0, i32 1, i64 0
  store i8 0, i8* %123, align 1, !tbaa !42
  %124 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2
  %125 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %124 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %125, i8* nonnull align 16 dereferenceable(16) %6, i64 16, i1 false), !tbaa.struct !57
  %126 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 2
  %127 = bitcast %"class.std::__1::chrono::time_point"* %126 to <2 x i64>*
  store <2 x i64> <i64 0, i64 -9223372036854775808>, <2 x i64>* %127, align 16
  %128 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 3
  store i32 65535, i32* %128, align 16, !tbaa.struct !57
  %129 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 4
  store i32 65535, i32* %129, align 4, !tbaa.struct !57
  %130 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 5
  store i8 %35, i8* %130, align 8, !tbaa.struct !57
  %131 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 6
  store i8 %34, i8* %131, align 1, !tbaa.struct !57
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %6)
  %132 = load i8, i8* %61, align 8, !tbaa !42
  %133 = and i8 %132, 1
  %134 = icmp eq i8 %133, 0
  br i1 %134, label %138, label %135

135:                                              ; preds = %121
  %136 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %137 = load i8*, i8** %136, align 8, !tbaa !42
  call void @_ZdlPv(i8* %137) #20
  br label %138

138:                                              ; preds = %121, %135
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %61) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %60) #16
  br label %155

139:                                              ; preds = %74
  %140 = landingpad { i8*, i32 }
          cleanup
  br label %141

141:                                              ; preds = %105, %110, %139
  %142 = phi { i8*, i32 } [ %140, %139 ], [ %106, %110 ], [ %106, %105 ]
  %143 = load i8, i8* %61, align 8, !tbaa !42
  %144 = and i8 %143, 1
  %145 = icmp eq i8 %144, 0
  br i1 %145, label %149, label %146

146:                                              ; preds = %141
  %147 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %148 = load i8*, i8** %147, align 8, !tbaa !42
  call void @_ZdlPv(i8* %148) #20
  br label %149

149:                                              ; preds = %141, %146
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %61) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %60) #16
  resume { i8*, i32 } %142

150:                                              ; preds = %41, %38
  %151 = load %struct.__dirstream*, %struct.__dirstream** %7, align 16, !tbaa !27
  store i32 0, i32* %8, align 4, !tbaa !24, !noalias !46
  store i32 0, i32* %9, align 8, !tbaa !11, !noalias !46
  %152 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16, !noalias !46
  store %"class.std::__1::error_category"* %152, %"class.std::__1::error_category"** %10, align 8, !tbaa !14, !noalias !46
  %153 = tail call %struct.dirent* @readdir(%struct.__dirstream* %151), !noalias !46
  %154 = icmp eq %struct.dirent* %153, null
  br i1 %154, label %15, label %20

155:                                              ; preds = %138, %57
  %156 = phi i1 [ false, %57 ], [ true, %138 ]
  ret i1 %156
}

; Function Attrs: uwtable
define internal void @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeEPKcz(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nocapture readonly %0, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1, i8* nocapture readonly %2, ...) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = alloca %"struct.std::__1::array", align 1
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = alloca %"class.std::__1::basic_string", align 8
  %7 = alloca %"class.std::__1::basic_string", align 8
  %8 = alloca %"class.std::__1::basic_string", align 8
  %9 = alloca %"class.std::__1::basic_string", align 8
  %10 = alloca %"class.std::__1::basic_string", align 8
  %11 = alloca [1 x %struct.__va_list_tag], align 16
  %12 = bitcast [1 x %struct.__va_list_tag]* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %12) #16
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %11, i64 0, i64 0
  call void @llvm.va_start(i8* nonnull %12)
  %14 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 1
  %15 = load %"class.std::__1::error_code"*, %"class.std::__1::error_code"** %14, align 8, !tbaa !8
  %16 = icmp eq %"class.std::__1::error_code"* %15, null
  br i1 %16, label %17, label %202

17:                                               ; preds = %3
  %18 = bitcast %"class.std::__1::basic_string"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %18) #16
  %19 = bitcast %"class.std::__1::basic_string"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %19) #16
  %20 = bitcast %"class.std::__1::basic_string"* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %20) #16
  %21 = bitcast %"class.std::__1::basic_string"* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %21) #16
  store i8 6, i8* %21, align 8, !tbaa !42
  %22 = bitcast %"class.std::__1::basic_string"* %9 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %23 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 1 dereferenceable(3) %23, i8* nonnull align 1 dereferenceable(3) getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i64 0, i64 0), i64 3, i1 false) #16
  %24 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %22, i64 0, i32 1, i64 3
  store i8 0, i8* %24, align 1, !tbaa !42
  %25 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 0
  %26 = load i8*, i8** %25, align 8, !tbaa !3
  %27 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %9, i8* %26)
          to label %28 unwind label %141

28:                                               ; preds = %17
  %29 = bitcast %"class.std::__1::basic_string"* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %20, i8* nonnull align 8 dereferenceable(24) %29, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %29, i8 0, i64 24, i1 false) #16, !noalias !62
  %30 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"* nonnull %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i64 0, i64 0))
          to label %31 unwind label %144

31:                                               ; preds = %28
  %32 = bitcast %"class.std::__1::basic_string"* %30 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %19, i8* nonnull align 8 dereferenceable(24) %32, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %32, i8 0, i64 24, i1 false) #16, !noalias !65
  %33 = bitcast %"class.std::__1::basic_string"* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %33) #16
  %34 = getelementptr inbounds %"struct.std::__1::array", %"struct.std::__1::array"* %4, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 256, i8* nonnull %34) #16, !noalias !68
  %35 = bitcast [1 x %struct.__va_list_tag]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %35) #16, !noalias !68
  %36 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0
  call void @llvm.va_copy(i8* nonnull %35, i8* nonnull %12), !noalias !68
  %37 = call i32 @vsnprintf(i8* nonnull %34, i64 256, i8* %2, %struct.__va_list_tag* nonnull %36) #16, !noalias !68
  call void @llvm.va_end(i8* nonnull %35), !noalias !68
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %33, i8 0, i64 24, i1 false) #16, !alias.scope !68
  %38 = sext i32 %37 to i64
  %39 = icmp ult i32 %37, 256
  br i1 %39, label %40, label %46

40:                                               ; preds = %31
  %41 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm(%"class.std::__1::basic_string"* nonnull %10, i8* nonnull %34, i64 %38)
          to label %42 unwind label %44

42:                                               ; preds = %40
  %43 = bitcast %"class.std::__1::basic_string"* %10 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  br label %88

44:                                               ; preds = %40
  %45 = landingpad { i8*, i32 }
          catch i8* null
  br label %78

46:                                               ; preds = %31
  %47 = add nsw i64 %38, -22
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string"* nonnull %10, i64 22, i64 %47, i64 0, i64 0, i64 0, i64 0)
          to label %48 unwind label %76

48:                                               ; preds = %46
  %49 = load i8, i8* %33, align 8, !tbaa !42, !alias.scope !68
  %50 = and i8 %49, 1
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %58, label %52

52:                                               ; preds = %48
  %53 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %54 = load i8*, i8** %53, align 8, !tbaa !42, !alias.scope !68
  %55 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %38, i64* %55, align 8, !tbaa !42, !alias.scope !68
  %56 = bitcast %"class.std::__1::basic_string"* %10 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %57 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %56, i64 0, i32 1, i64 0
  br label %63

58:                                               ; preds = %48
  %59 = bitcast %"class.std::__1::basic_string"* %10 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %60 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %59, i64 0, i32 1, i64 0
  %61 = trunc i32 %37 to i8
  %62 = shl i8 %61, 1
  store i8 %62, i8* %33, align 8, !tbaa !42, !alias.scope !68
  br label %63

63:                                               ; preds = %58, %52
  %64 = phi %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* [ %59, %58 ], [ %56, %52 ]
  %65 = phi i8* [ %60, %58 ], [ %54, %52 ]
  %66 = phi i8* [ %60, %58 ], [ %57, %52 ]
  %67 = getelementptr inbounds i8, i8* %65, i64 %38
  store i8 0, i8* %67, align 1, !tbaa !42
  %68 = load i8, i8* %33, align 8, !tbaa !42, !alias.scope !68
  %69 = add nsw i64 %38, 1
  %70 = and i8 %68, 1
  %71 = icmp eq i8 %70, 0
  %72 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %73 = load i8*, i8** %72, align 8
  %74 = select i1 %71, i8* %66, i8* %73
  %75 = call i32 @vsnprintf(i8* nonnull %74, i64 %69, i8* %2, %struct.__va_list_tag* nonnull %13) #16
  br label %88

76:                                               ; preds = %46
  %77 = landingpad { i8*, i32 }
          catch i8* null
  br label %78

78:                                               ; preds = %76, %44
  %79 = phi { i8*, i32 } [ %77, %76 ], [ %45, %44 ]
  %80 = extractvalue { i8*, i32 } %79, 0
  %81 = load i8, i8* %33, align 8, !tbaa !42, !alias.scope !68
  %82 = and i8 %81, 1
  %83 = icmp eq i8 %82, 0
  br i1 %83, label %87, label %84

84:                                               ; preds = %78
  %85 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %86 = load i8*, i8** %85, align 8, !tbaa !42, !alias.scope !68
  call void @_ZdlPv(i8* %86) #20
  br label %87

87:                                               ; preds = %84, %78
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %35) #16, !noalias !68
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %34) #16, !noalias !68
  br label %155

88:                                               ; preds = %63, %42
  %89 = phi %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* [ %43, %42 ], [ %64, %63 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %35) #16, !noalias !68
  call void @llvm.lifetime.end.p0i8(i64 256, i8* nonnull %34) #16, !noalias !68
  %90 = load i8, i8* %33, align 8, !tbaa !42, !noalias !71
  %91 = and i8 %90, 1
  %92 = icmp eq i8 %91, 0
  %93 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %94 = load i8*, i8** %93, align 8, !noalias !71
  %95 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %10, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %96 = load i64, i64* %95, align 8, !noalias !71
  %97 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %89, i64 0, i32 1, i64 0
  %98 = lshr i8 %90, 1
  %99 = zext i8 %98 to i64
  %100 = select i1 %92, i8* %97, i8* %94
  %101 = select i1 %92, i64 %99, i64 %96
  %102 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* nonnull %7, i8* %100, i64 %101)
          to label %103 unwind label %147

103:                                              ; preds = %88
  %104 = bitcast %"class.std::__1::basic_string"* %102 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %18, i8* nonnull align 8 dereferenceable(24) %104, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %104, i8 0, i64 24, i1 false) #16, !noalias !71
  %105 = load i8, i8* %33, align 8, !tbaa !42
  %106 = and i8 %105, 1
  %107 = icmp eq i8 %106, 0
  br i1 %107, label %110, label %108

108:                                              ; preds = %103
  %109 = load i8*, i8** %93, align 8, !tbaa !42
  call void @_ZdlPv(i8* %109) #20
  br label %110

110:                                              ; preds = %108, %103
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %33) #16
  %111 = load i8, i8* %19, align 8, !tbaa !42
  %112 = and i8 %111, 1
  %113 = icmp eq i8 %112, 0
  br i1 %113, label %117, label %114

114:                                              ; preds = %110
  %115 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %116 = load i8*, i8** %115, align 8, !tbaa !42
  call void @_ZdlPv(i8* %116) #20
  br label %117

117:                                              ; preds = %114, %110
  %118 = load i8, i8* %20, align 8, !tbaa !42
  %119 = and i8 %118, 1
  %120 = icmp eq i8 %119, 0
  br i1 %120, label %124, label %121

121:                                              ; preds = %117
  %122 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %123 = load i8*, i8** %122, align 8, !tbaa !42
  call void @_ZdlPv(i8* %123) #20
  br label %124

124:                                              ; preds = %121, %117
  %125 = load i8, i8* %21, align 8, !tbaa !42
  %126 = and i8 %125, 1
  %127 = icmp eq i8 %126, 0
  br i1 %127, label %131, label %128

128:                                              ; preds = %124
  %129 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %9, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %130 = load i8*, i8** %129, align 8, !tbaa !42
  call void @_ZdlPv(i8* %130) #20
  br label %131

131:                                              ; preds = %128, %124
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %21) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %20) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %19) #16
  %132 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 2
  %133 = load %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::__fs::filesystem::path"** %132, align 8, !tbaa !9
  %134 = icmp ne %"class.std::__1::__fs::filesystem::path"* %133, null
  %135 = zext i1 %134 to i32
  %136 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %0, i64 0, i32 3
  %137 = load %"class.std::__1::__fs::filesystem::path"*, %"class.std::__1::__fs::filesystem::path"** %136, align 8, !tbaa !10
  %138 = icmp ne %"class.std::__1::__fs::filesystem::path"* %137, null
  %139 = zext i1 %138 to i32
  %140 = add nuw nsw i32 %139, %135
  switch i32 %140, label %195 [
    i32 0, label %180
    i32 1, label %191
    i32 2, label %193
  ]

141:                                              ; preds = %17
  %142 = landingpad { i8*, i32 }
          catch i8* null
  %143 = extractvalue { i8*, i32 } %142, 0
  br label %171

144:                                              ; preds = %28
  %145 = landingpad { i8*, i32 }
          catch i8* null
  %146 = extractvalue { i8*, i32 } %145, 0
  br label %163

147:                                              ; preds = %88
  %148 = landingpad { i8*, i32 }
          catch i8* null
  %149 = extractvalue { i8*, i32 } %148, 0
  %150 = load i8, i8* %33, align 8, !tbaa !42
  %151 = and i8 %150, 1
  %152 = icmp eq i8 %151, 0
  br i1 %152, label %155, label %153

153:                                              ; preds = %147
  %154 = load i8*, i8** %93, align 8, !tbaa !42
  call void @_ZdlPv(i8* %154) #20
  br label %155

155:                                              ; preds = %153, %147, %87
  %156 = phi i8* [ %80, %87 ], [ %149, %147 ], [ %149, %153 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %33) #16
  %157 = load i8, i8* %19, align 8, !tbaa !42
  %158 = and i8 %157, 1
  %159 = icmp eq i8 %158, 0
  br i1 %159, label %163, label %160

160:                                              ; preds = %155
  %161 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %7, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %162 = load i8*, i8** %161, align 8, !tbaa !42
  call void @_ZdlPv(i8* %162) #20
  br label %163

163:                                              ; preds = %160, %155, %144
  %164 = phi i8* [ %146, %144 ], [ %156, %155 ], [ %156, %160 ]
  %165 = load i8, i8* %20, align 8, !tbaa !42
  %166 = and i8 %165, 1
  %167 = icmp eq i8 %166, 0
  br i1 %167, label %171, label %168

168:                                              ; preds = %163
  %169 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %170 = load i8*, i8** %169, align 8, !tbaa !42
  call void @_ZdlPv(i8* %170) #20
  br label %171

171:                                              ; preds = %168, %163, %141
  %172 = phi i8* [ %143, %141 ], [ %164, %163 ], [ %164, %168 ]
  %173 = load i8, i8* %21, align 8, !tbaa !42
  %174 = and i8 %173, 1
  %175 = icmp eq i8 %174, 0
  br i1 %175, label %179, label %176

176:                                              ; preds = %171
  %177 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %9, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %178 = load i8*, i8** %177, align 8, !tbaa !42
  call void @_ZdlPv(i8* %178) #20
  br label %179

179:                                              ; preds = %176, %171
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %21) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %20) #16
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %19) #16
  br label %196

180:                                              ; preds = %131
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %181 unwind label %182

181:                                              ; preds = %180
  unreachable

182:                                              ; preds = %193, %191, %180
  %183 = landingpad { i8*, i32 }
          catch i8* null
  %184 = extractvalue { i8*, i32 } %183, 0
  %185 = load i8, i8* %18, align 8, !tbaa !42
  %186 = and i8 %185, 1
  %187 = icmp eq i8 %186, 0
  br i1 %187, label %196, label %188

188:                                              ; preds = %182
  %189 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %190 = load i8*, i8** %189, align 8, !tbaa !42
  call void @_ZdlPv(i8* %190) #20
  br label %196

191:                                              ; preds = %131
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %133, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %192 unwind label %182

192:                                              ; preds = %191
  unreachable

193:                                              ; preds = %131
  invoke void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESC_RKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %6, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %133, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %137, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) #21
          to label %194 unwind label %182

194:                                              ; preds = %193
  unreachable

195:                                              ; preds = %131
  unreachable

196:                                              ; preds = %188, %182, %179
  %197 = phi i8* [ %172, %179 ], [ %184, %182 ], [ %184, %188 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %18) #16
  %198 = call i8* @__cxa_begin_catch(i8* %197) #16
  call void @llvm.va_end(i8* nonnull %12)
  invoke void @__cxa_rethrow() #21
          to label %208 unwind label %199

199:                                              ; preds = %196
  %200 = landingpad { i8*, i32 }
          cleanup
  invoke void @__cxa_end_catch()
          to label %201 unwind label %205

201:                                              ; preds = %199
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #16
  resume { i8*, i32 } %200

202:                                              ; preds = %3
  %203 = bitcast %"class.std::__1::error_code"* %15 to i8*
  %204 = bitcast %"class.std::__1::error_code"* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %203, i8* nonnull align 8 dereferenceable(16) %204, i64 16, i1 false), !tbaa.struct !23
  call void @llvm.va_end(i8* nonnull %12)
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %12) #16
  ret void

205:                                              ; preds = %199
  %206 = landingpad { i8*, i32 }
          catch i8* null
  %207 = extractvalue { i8*, i32 } %206, 0
  call void @__clang_call_terminate(i8* %207) #23
  unreachable

208:                                              ; preds = %196
  unreachable
}

; Function Attrs: norecurse nounwind readonly uwtable
define nonnull align 16 dereferenceable(80) %"class.std::__1::__fs::filesystem::directory_entry"* @_ZNKSt3__14__fs10filesystem18directory_iterator13__dereferenceEv(%"class.std::__1::__fs::filesystem::directory_iterator"* nocapture readonly %0) local_unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_iterator", %"class.std::__1::__fs::filesystem::directory_iterator"* %0, i64 0, i32 0, i32 0
  %3 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %2, align 8, !tbaa !25
  %4 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %3, i64 0, i32 2
  ret %"class.std::__1::__fs::filesystem::directory_entry"* %4
}

; Function Attrs: uwtable
define void @_ZNSt3__14__fs10filesystem28recursive_directory_iteratorC2ERKNS1_4pathENS1_17directory_optionsEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, i8 zeroext %2, %"class.std::__1::error_code"* %3) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", align 8
  %6 = alloca %"class.std::__1::error_code", align 8
  %7 = alloca %"class.std::__1::__fs::filesystem::__dir_stream", align 16
  %8 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %8, i8 0, i64 16, i1 false) #16
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 1
  store i8 1, i8* %9, align 8, !tbaa !74
  %10 = bitcast %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %10) #16
  %11 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 0
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8** %11, align 8, !tbaa !3
  %12 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 1
  store %"class.std::__1::error_code"* %3, %"class.std::__1::error_code"** %12, align 8, !tbaa !8
  %13 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 2
  store %"class.std::__1::__fs::filesystem::path"* %1, %"class.std::__1::__fs::filesystem::path"** %13, align 8, !tbaa !9
  %14 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 3
  store %"class.std::__1::__fs::filesystem::path"* null, %"class.std::__1::__fs::filesystem::path"** %14, align 8, !tbaa !10
  %15 = icmp eq %"class.std::__1::error_code"* %3, null
  br i1 %15, label %20, label %16

16:                                               ; preds = %4
  %17 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 0
  store i32 0, i32* %17, align 8, !tbaa !11
  %18 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %19 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 1
  store %"class.std::__1::error_category"* %18, %"class.std::__1::error_category"** %19, align 8, !tbaa !14
  br label %20

20:                                               ; preds = %4, %16
  %21 = bitcast %"class.std::__1::error_code"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %21) #16
  %22 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 0
  store i32 0, i32* %22, align 8, !tbaa !11
  %23 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 1
  %24 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %24, %"class.std::__1::error_category"** %23, align 8, !tbaa !14
  %25 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 112, i8* nonnull %25) #16
  invoke void @_ZNSt3__14__fs10filesystem12__dir_streamC2ERKNS1_4pathENS1_17directory_optionsERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* nonnull %7, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, i8 zeroext %2, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6)
          to label %26 unwind label %30

26:                                               ; preds = %20
  %27 = load i32, i32* %22, align 8, !tbaa !11
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %37, label %29

29:                                               ; preds = %26
  invoke fastcc void @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeE(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nonnull %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6)
          to label %34 unwind label %149

30:                                               ; preds = %20
  %31 = landingpad { i8*, i32 }
          cleanup
  %32 = extractvalue { i8*, i32 } %31, 0
  %33 = extractvalue { i8*, i32 } %31, 1
  br label %188

34:                                               ; preds = %29
  %35 = load i32, i32* %22, align 8, !tbaa !11
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %112

37:                                               ; preds = %34, %26
  %38 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  %39 = load %struct.__dirstream*, %struct.__dirstream** %38, align 16, !tbaa !27
  %40 = icmp eq %struct.__dirstream* %39, null
  br i1 %40, label %125, label %41

41:                                               ; preds = %37
  %42 = invoke noalias nonnull dereferenceable(80) i8* @_Znwm(i64 80) #19
          to label %43 unwind label %144

43:                                               ; preds = %41
  %44 = bitcast i8* %42 to i32 (...)***
  %45 = getelementptr inbounds i8, i8* %42, i64 8
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %45, i8 0, i64 16, i1 false), !noalias !78
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %44, align 8, !tbaa !20, !noalias !78
  %46 = getelementptr inbounds i8, i8* %42, i64 24
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(56) %46, i8 0, i64 56, i1 false) #16, !noalias !78
  %47 = ptrtoint i8* %46 to i64
  %48 = ptrtoint i8* %42 to i64
  %49 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to i64*
  store i64 %47, i64* %49, align 8, !tbaa !22
  %50 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %51 = bitcast %"class.std::__1::__shared_weak_count"** %50 to i64*
  %52 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %50, align 8, !tbaa !22
  store i64 %48, i64* %51, align 8, !tbaa !22
  %53 = icmp eq %"class.std::__1::__shared_weak_count"* %52, null
  %54 = bitcast i8* %46 to %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*
  br i1 %53, label %58, label %55

55:                                               ; preds = %43
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %52) #16
  %56 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %57 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %56, align 8, !tbaa !83
  br label %58

58:                                               ; preds = %55, %43
  %59 = phi %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* [ %57, %55 ], [ %54, %43 ]
  %60 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 1
  store i8 %2, i8* %60, align 8, !tbaa !84
  %61 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %62 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %61 to i64*
  %63 = load i64, i64* %62, align 8, !tbaa !89
  %64 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %65 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %64 to i64*
  %66 = load i64, i64* %65, align 8, !tbaa !92
  %67 = sub i64 %63, %66
  %68 = ashr exact i64 %67, 3
  %69 = icmp eq i64 %67, 0
  %70 = mul i64 %68, 36
  %71 = add i64 %70, -1
  %72 = select i1 %69, i64 0, i64 %71
  %73 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 0, i32 0, i32 0, i32 1
  %74 = load i64, i64* %73, align 8, !tbaa !93
  %75 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %76 = load i64, i64* %75, align 8, !tbaa !56
  %77 = add i64 %76, %74
  %78 = icmp eq i64 %72, %77
  %79 = inttoptr i64 %66 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  br i1 %78, label %80, label %87

80:                                               ; preds = %58
  %81 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %59, i64 0, i32 0, i32 0
  invoke void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE19__add_back_capacityEv(%"class.std::__1::deque"* nonnull %81)
          to label %82 unwind label %149

82:                                               ; preds = %80
  %83 = load i64, i64* %75, align 8, !tbaa !56
  %84 = load i64, i64* %73, align 8, !tbaa !93
  %85 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %64, align 8, !tbaa !92
  %86 = add i64 %84, %83
  br label %87

87:                                               ; preds = %58, %82
  %88 = phi i64 [ %86, %82 ], [ %77, %58 ]
  %89 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %85, %82 ], [ %79, %58 ]
  %90 = udiv i64 %88, 36
  %91 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 %90
  %92 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, align 8, !tbaa !22
  %93 = urem i64 %88, 36
  %94 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %92, i64 %93
  %95 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %7 to i64*
  %96 = load i64, i64* %95, align 16, !tbaa !27
  %97 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %94 to i64*
  store i64 %96, i64* %97, align 16, !tbaa !27
  %98 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %92, i64 %93, i32 1
  %99 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %100 = bitcast %"class.std::__1::__fs::filesystem::path"* %98 to i8*
  %101 = bitcast %"class.std::__1::__fs::filesystem::path"* %99 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %100, i8* nonnull align 8 dereferenceable(24) %101, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %101, i8 0, i64 24, i1 false) #16
  %102 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %92, i64 %93, i32 2
  %103 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %104 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %102 to i8*
  %105 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %103 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %104, i8* nonnull align 16 dereferenceable(24) %105, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(24) %105, i8 0, i64 24, i1 false) #16
  %106 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %92, i64 %93, i32 2, i32 2
  %107 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 2
  %108 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %106 to i8*
  %109 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %107 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(48) %108, i8* nonnull align 16 dereferenceable(48) %109, i64 48, i1 false) #16, !tbaa.struct !57
  store %struct.__dirstream* null, %struct.__dirstream** %38, align 16, !tbaa !27
  %110 = load i64, i64* %75, align 8, !tbaa !56
  %111 = add i64 %110, 1
  store i64 %111, i64* %75, align 8, !tbaa !56
  br label %125

112:                                              ; preds = %34
  %113 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  %114 = load %struct.__dirstream*, %struct.__dirstream** %113, align 16, !tbaa !27
  %115 = icmp eq %struct.__dirstream* %114, null
  %116 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  br i1 %115, label %125, label %117

117:                                              ; preds = %112
  %118 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %119 = load %struct.__dirstream*, %struct.__dirstream** %116, align 16, !tbaa !27
  %120 = call i32 @closedir(%struct.__dirstream* %119) #16
  %121 = icmp eq i32 %120, -1
  br i1 %121, label %122, label %124

122:                                              ; preds = %117
  %123 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %124

124:                                              ; preds = %122, %117
  store %struct.__dirstream* null, %struct.__dirstream** %116, align 16, !tbaa !27
  br label %125

125:                                              ; preds = %87, %37, %124, %112
  %126 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %127 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %126 to i8*
  %128 = load i8, i8* %127, align 16, !tbaa !42
  %129 = and i8 %128, 1
  %130 = icmp eq i8 %129, 0
  br i1 %130, label %134, label %131

131:                                              ; preds = %125
  %132 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %133 = load i8*, i8** %132, align 16, !tbaa !42
  call void @_ZdlPv(i8* %133) #20
  br label %134

134:                                              ; preds = %131, %125
  %135 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %136 = bitcast %"class.std::__1::__fs::filesystem::path"* %135 to i8*
  %137 = load i8, i8* %136, align 8, !tbaa !42
  %138 = and i8 %137, 1
  %139 = icmp eq i8 %138, 0
  br i1 %139, label %143, label %140

140:                                              ; preds = %134
  %141 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %142 = load i8*, i8** %141, align 8, !tbaa !42
  call void @_ZdlPv(i8* %142) #20
  br label %143

143:                                              ; preds = %134, %140
  call void @llvm.lifetime.end.p0i8(i64 112, i8* nonnull %25) #16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %21) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %10) #16
  ret void

144:                                              ; preds = %41
  %145 = landingpad { i8*, i32 }
          cleanup
  %146 = extractvalue { i8*, i32 } %145, 0
  %147 = extractvalue { i8*, i32 } %145, 1
  %148 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  br label %157

149:                                              ; preds = %29, %80
  %150 = landingpad { i8*, i32 }
          cleanup
  %151 = extractvalue { i8*, i32 } %150, 0
  %152 = extractvalue { i8*, i32 } %150, 1
  %153 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  %154 = load %struct.__dirstream*, %struct.__dirstream** %153, align 16, !tbaa !27
  %155 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  %156 = icmp eq %struct.__dirstream* %154, null
  br i1 %156, label %168, label %157

157:                                              ; preds = %144, %149
  %158 = phi %struct.__dirstream** [ %148, %144 ], [ %155, %149 ]
  %159 = phi i32 [ %147, %144 ], [ %152, %149 ]
  %160 = phi i8* [ %146, %144 ], [ %151, %149 ]
  %161 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %162 = load %struct.__dirstream*, %struct.__dirstream** %158, align 16, !tbaa !27
  %163 = call i32 @closedir(%struct.__dirstream* %162) #16
  %164 = icmp eq i32 %163, -1
  br i1 %164, label %165, label %167

165:                                              ; preds = %157
  %166 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %167

167:                                              ; preds = %165, %157
  store %struct.__dirstream* null, %struct.__dirstream** %158, align 16, !tbaa !27
  br label %168

168:                                              ; preds = %167, %149
  %169 = phi i32 [ %159, %167 ], [ %152, %149 ]
  %170 = phi i8* [ %160, %167 ], [ %151, %149 ]
  %171 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %172 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %171 to i8*
  %173 = load i8, i8* %172, align 16, !tbaa !42
  %174 = and i8 %173, 1
  %175 = icmp eq i8 %174, 0
  br i1 %175, label %179, label %176

176:                                              ; preds = %168
  %177 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %178 = load i8*, i8** %177, align 16, !tbaa !42
  call void @_ZdlPv(i8* %178) #20
  br label %179

179:                                              ; preds = %176, %168
  %180 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %181 = bitcast %"class.std::__1::__fs::filesystem::path"* %180 to i8*
  %182 = load i8, i8* %181, align 8, !tbaa !42
  %183 = and i8 %182, 1
  %184 = icmp eq i8 %183, 0
  br i1 %184, label %188, label %185

185:                                              ; preds = %179
  %186 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %187 = load i8*, i8** %186, align 8, !tbaa !42
  call void @_ZdlPv(i8* %187) #20
  br label %188

188:                                              ; preds = %185, %179, %30
  %189 = phi i8* [ %32, %30 ], [ %170, %179 ], [ %170, %185 ]
  %190 = phi i32 [ %33, %30 ], [ %169, %179 ], [ %169, %185 ]
  call void @llvm.lifetime.end.p0i8(i64 112, i8* nonnull %25) #16
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %21) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %10) #16
  %191 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %192 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %191, align 8, !tbaa !96
  %193 = icmp eq %"class.std::__1::__shared_weak_count"* %192, null
  br i1 %193, label %195, label %194

194:                                              ; preds = %188
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %192) #16
  br label %195

195:                                              ; preds = %188, %194
  %196 = insertvalue { i8*, i32 } undef, i8* %189, 0
  %197 = insertvalue { i8*, i32 } %196, i32 %190, 1
  resume { i8*, i32 } %197
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem12__dir_streamC2ERKNS1_4pathENS1_17directory_optionsERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, i8 zeroext %2, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %3) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 0
  store %struct.__dirstream* null, %struct.__dirstream** %5, align 16, !tbaa !27
  %6 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 1
  %7 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0
  %8 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %1, i64 0, i32 0
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %7, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %8)
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2
  %10 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %9 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %10, i8 0, i64 24, i1 false) #16
  %11 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2
  %12 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 2
  %13 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 6
  store i8 0, i8* %13, align 1, !tbaa !97
  %14 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 5
  store i8 0, i8* %14, align 8, !tbaa !98
  %15 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 4
  store i32 65535, i32* %15, align 4, !tbaa !99
  %16 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 2, i32 3
  store i32 65535, i32* %16, align 16, !tbaa !100
  %17 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %11 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(16) %17, i8 -1, i64 16, i1 false) #16
  %18 = bitcast %"class.std::__1::chrono::time_point"* %12 to <2 x i64>*
  store <2 x i64> <i64 0, i64 -9223372036854775808>, <2 x i64>* %18, align 16
  %19 = bitcast %"class.std::__1::__fs::filesystem::path"* %1 to i8*
  %20 = load i8, i8* %19, align 8, !tbaa !42
  %21 = and i8 %20, 1
  %22 = icmp eq i8 %21, 0
  %23 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast %"class.std::__1::__fs::filesystem::path"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  %27 = select i1 %22, i8* %26, i8* %24
  %28 = tail call %struct.__dirstream* @opendir(i8* %27)
  store %struct.__dirstream* %28, %struct.__dirstream** %5, align 16, !tbaa !27
  %29 = icmp eq %struct.__dirstream* %28, null
  br i1 %29, label %30, label %59

30:                                               ; preds = %4
  %31 = tail call i32* @__errno_location() #22
  %32 = load i32, i32* %31, align 4, !tbaa !24
  %33 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  %34 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 0
  store i32 %32, i32* %34, align 8, !tbaa.struct !23
  %35 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 1
  store %"class.std::__1::error_category"* %33, %"class.std::__1::error_category"** %35, align 8, !tbaa.struct !23
  %36 = and i8 %2, 2
  %37 = icmp ne i8 %36, 0
  %38 = icmp eq i32 %32, 13
  %39 = and i1 %37, %38
  br i1 %39, label %40, label %61

40:                                               ; preds = %30
  store i32 0, i32* %34, align 8, !tbaa !11
  %41 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %41, %"class.std::__1::error_category"** %35, align 8, !tbaa !14
  br label %61

42:                                               ; preds = %59
  %43 = landingpad { i8*, i32 }
          cleanup
  %44 = load i8, i8* %10, align 8, !tbaa !42
  %45 = and i8 %44, 1
  %46 = icmp eq i8 %45, 0
  br i1 %46, label %50, label %47

47:                                               ; preds = %42
  %48 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %49 = load i8*, i8** %48, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %49) #20
  br label %50

50:                                               ; preds = %42, %47
  %51 = bitcast %"class.std::__1::__fs::filesystem::path"* %6 to i8*
  %52 = load i8, i8* %51, align 8, !tbaa !42
  %53 = and i8 %52, 1
  %54 = icmp eq i8 %53, 0
  br i1 %54, label %58, label %55

55:                                               ; preds = %50
  %56 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %0, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %57 = load i8*, i8** %56, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %57) #20
  br label %58

58:                                               ; preds = %50, %55
  resume { i8*, i32 } %43

59:                                               ; preds = %4
  %60 = invoke zeroext i1 @_ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* nonnull %0, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %3)
          to label %61 unwind label %42

61:                                               ; preds = %30, %40, %59
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__14__fs10filesystem28recursive_directory_iterator5__popEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture %0, %"class.std::__1::error_code"* %1) local_unnamed_addr #0 align 2 {
  %3 = icmp eq %"class.std::__1::error_code"* %1, null
  br i1 %3, label %8, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %5, align 8, !tbaa !11
  %6 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %6, %"class.std::__1::error_category"** %7, align 8, !tbaa !14
  br label %8

8:                                                ; preds = %2, %4
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %10 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %9, align 8, !tbaa !83
  %11 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %10, i64 0, i32 0, i32 0
  tail call void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE8pop_backEv(%"class.std::__1::deque"* %11)
  %12 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %9, align 8, !tbaa !83
  %13 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %12, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %14 = load i64, i64* %13, align 8, !tbaa !56
  %15 = icmp eq i64 %14, 0
  br i1 %15, label %16, label %22

16:                                               ; preds = %8
  %17 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %18 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %17, align 8, !tbaa !22
  %19 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %19, align 8, !tbaa !22
  %20 = icmp eq %"class.std::__1::__shared_weak_count"* %18, null
  br i1 %20, label %23, label %21

21:                                               ; preds = %16
  tail call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %18) #16
  br label %23

22:                                               ; preds = %8
  tail call void @_ZNSt3__14__fs10filesystem28recursive_directory_iterator9__advanceEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nonnull %0, %"class.std::__1::error_code"* %1)
  br label %23

23:                                               ; preds = %21, %16, %22
  ret void
}

; Function Attrs: uwtable
define void @_ZNSt3__14__fs10filesystem28recursive_directory_iterator9__advanceEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture %0, %"class.std::__1::error_code"* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", align 8
  %4 = alloca %"class.std::__1::error_code", align 8
  %5 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %6 = bitcast %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #16
  %7 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 0
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.4, i64 0, i64 0), i8** %7, align 8, !tbaa !3
  %8 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 1
  store %"class.std::__1::error_code"* %1, %"class.std::__1::error_code"** %8, align 8, !tbaa !8
  %9 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %3, i64 0, i32 2
  %10 = icmp eq %"class.std::__1::error_code"* %1, null
  %11 = bitcast %"class.std::__1::__fs::filesystem::path"** %9 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %11, i8 0, i64 16, i1 false)
  br i1 %10, label %16, label %12

12:                                               ; preds = %2
  %13 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %13, align 8, !tbaa !11
  %14 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %15 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %14, %"class.std::__1::error_category"** %15, align 8, !tbaa !14
  br label %16

16:                                               ; preds = %2, %12
  %17 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %18 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %17, align 8, !tbaa !83
  %19 = bitcast %"class.std::__1::error_code"* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %19) #16
  %20 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 0
  store i32 0, i32* %20, align 8, !tbaa !11
  %21 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %4, i64 0, i32 1
  %22 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %22, %"class.std::__1::error_category"** %21, align 8, !tbaa !14
  %23 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %18, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %24 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %18, i64 0, i32 0, i32 0, i32 0, i32 1
  %25 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %18, i64 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %26 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %18, i64 0, i32 0, i32 0
  br label %27

27:                                               ; preds = %49, %16
  %28 = load i64, i64* %23, align 8, !tbaa !56
  %29 = icmp eq i64 %28, 0
  br i1 %29, label %50, label %30

30:                                               ; preds = %27
  %31 = load i64, i64* %24, align 8, !tbaa !93
  %32 = add i64 %28, -1
  %33 = add i64 %32, %31
  %34 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %25, align 8, !tbaa !92
  %35 = udiv i64 %33, 36
  %36 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %34, i64 %35
  %37 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %36, align 8, !tbaa !22
  %38 = urem i64 %33, 36
  %39 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %37, i64 %38
  %40 = invoke zeroext i1 @_ZNSt3__14__fs10filesystem12__dir_stream7advanceERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* nonnull %39, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %4)
          to label %41 unwind label %42

41:                                               ; preds = %30
  br i1 %40, label %105, label %46

42:                                               ; preds = %49, %30
  %43 = landingpad { i8*, i32 }
          cleanup
  %44 = extractvalue { i8*, i32 } %43, 0
  %45 = extractvalue { i8*, i32 } %43, 1
  br label %106

46:                                               ; preds = %41
  %47 = load i32, i32* %20, align 8, !tbaa !11
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %53

49:                                               ; preds = %46
  invoke void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE8pop_backEv(%"class.std::__1::deque"* nonnull %26)
          to label %27 unwind label %42

50:                                               ; preds = %27
  %51 = load i32, i32* %20, align 8, !tbaa !11
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %99, label %56

53:                                               ; preds = %46
  %54 = load i64, i64* %23, align 8, !tbaa !56
  %55 = add i64 %54, -1
  br label %56

56:                                               ; preds = %53, %50
  %57 = phi i64 [ %55, %53 ], [ -1, %50 ]
  %58 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %58) #16
  %59 = load i64, i64* %24, align 8, !tbaa !93
  %60 = add i64 %57, %59
  %61 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %25, align 8, !tbaa !92
  %62 = udiv i64 %60, 36
  %63 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %61, i64 %62
  %64 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %63, align 8, !tbaa !22
  %65 = urem i64 %60, 36
  %66 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %64, i64 %65, i32 1
  %67 = bitcast %"class.std::__1::__fs::filesystem::path"* %66 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %58, i8* nonnull align 8 dereferenceable(24) %67, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %67, i8 0, i64 24, i1 false) #16
  %68 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %69 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %68, align 8, !tbaa !22
  %70 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %70, align 8, !tbaa !22
  %71 = icmp eq %"class.std::__1::__shared_weak_count"* %69, null
  br i1 %71, label %73, label %72

72:                                               ; preds = %56
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %69) #16
  br label %73

73:                                               ; preds = %56, %72
  %74 = load i8, i8* %58, align 8, !tbaa !42
  %75 = and i8 %74, 1
  %76 = icmp eq i8 %75, 0
  %77 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %78 = load i8*, i8** %77, align 8
  %79 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %80 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %79, i64 0, i32 1, i64 0
  %81 = select i1 %76, i8* %80, i8* %78
  invoke void (%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"*, %"class.std::__1::error_code"*, i8*, ...) @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeEPKcz(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nonnull %3, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %4, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i8* %81)
          to label %82 unwind label %89

82:                                               ; preds = %73
  %83 = load i8, i8* %58, align 8, !tbaa !42
  %84 = and i8 %83, 1
  %85 = icmp eq i8 %84, 0
  br i1 %85, label %88, label %86

86:                                               ; preds = %82
  %87 = load i8*, i8** %77, align 8, !tbaa !42
  call void @_ZdlPv(i8* %87) #20
  br label %88

88:                                               ; preds = %82, %86
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %58) #16
  br label %105

89:                                               ; preds = %73
  %90 = landingpad { i8*, i32 }
          cleanup
  %91 = extractvalue { i8*, i32 } %90, 0
  %92 = extractvalue { i8*, i32 } %90, 1
  %93 = load i8, i8* %58, align 8, !tbaa !42
  %94 = and i8 %93, 1
  %95 = icmp eq i8 %94, 0
  br i1 %95, label %98, label %96

96:                                               ; preds = %89
  %97 = load i8*, i8** %77, align 8, !tbaa !42
  call void @_ZdlPv(i8* %97) #20
  br label %98

98:                                               ; preds = %89, %96
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %58) #16
  br label %106

99:                                               ; preds = %50
  %100 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %101 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %100, align 8, !tbaa !22
  %102 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %102, align 8, !tbaa !22
  %103 = icmp eq %"class.std::__1::__shared_weak_count"* %101, null
  br i1 %103, label %105, label %104

104:                                              ; preds = %99
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %101) #16
  br label %105

105:                                              ; preds = %41, %88, %99, %104
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #16
  ret void

106:                                              ; preds = %42, %98
  %107 = phi i8* [ %91, %98 ], [ %44, %42 ]
  %108 = phi i32 [ %92, %98 ], [ %45, %42 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %19) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #16
  %109 = insertvalue { i8*, i32 } undef, i8* %107, 0
  %110 = insertvalue { i8*, i32 } %109, i32 %108, 1
  resume { i8*, i32 } %110
}

; Function Attrs: norecurse nounwind readonly uwtable
define zeroext i8 @_ZNKSt3__14__fs10filesystem28recursive_directory_iterator7optionsEv(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture readonly %0) local_unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %3 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %2, align 8, !tbaa !83
  %4 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %3, i64 0, i32 1
  %5 = load i8, i8* %4, align 8, !tbaa !84
  ret i8 %5
}

; Function Attrs: norecurse nounwind readonly uwtable
define i32 @_ZNKSt3__14__fs10filesystem28recursive_directory_iterator5depthEv(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture readonly %0) local_unnamed_addr #2 align 2 {
  %2 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %3 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %2, align 8, !tbaa !83
  %4 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %3, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !56
  %6 = trunc i64 %5 to i32
  %7 = add i32 %6, -1
  ret i32 %7
}

; Function Attrs: norecurse nounwind readonly uwtable
define nonnull align 16 dereferenceable(80) %"class.std::__1::__fs::filesystem::directory_entry"* @_ZNKSt3__14__fs10filesystem28recursive_directory_iterator13__dereferenceEv(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture readonly %0) local_unnamed_addr #2 align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %3 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %2, align 8, !tbaa !83
  %4 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %3, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %5 = load i64, i64* %4, align 8, !tbaa !56
  %6 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %3, i64 0, i32 0, i32 0, i32 0, i32 1
  %7 = load i64, i64* %6, align 8, !tbaa !93
  %8 = add i64 %5, -1
  %9 = add i64 %8, %7
  %10 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %11 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %10, align 8, !tbaa !92
  %12 = udiv i64 %9, 36
  %13 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %11, i64 %12
  %14 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %13, align 8, !tbaa !22
  %15 = urem i64 %9, 36
  %16 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %14, i64 %15, i32 2
  ret %"class.std::__1::__fs::filesystem::directory_entry"* %16
}

; Function Attrs: uwtable
define nonnull align 8 dereferenceable(17) %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* @_ZNSt3__14__fs10filesystem28recursive_directory_iterator11__incrementEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* returned %0, %"class.std::__1::error_code"* %1) local_unnamed_addr #0 align 2 {
  %3 = icmp eq %"class.std::__1::error_code"* %1, null
  br i1 %3, label %8, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %5, align 8, !tbaa !11
  %6 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %6, %"class.std::__1::error_category"** %7, align 8, !tbaa !14
  br label %8

8:                                                ; preds = %2, %4
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 1
  %10 = load i8, i8* %9, align 8, !tbaa !74, !range !101
  %11 = icmp eq i8 %10, 0
  br i1 %11, label %19, label %12

12:                                               ; preds = %8
  %13 = tail call zeroext i1 @_ZNSt3__14__fs10filesystem28recursive_directory_iterator15__try_recursionEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nonnull %0, %"class.std::__1::error_code"* %1)
  br i1 %13, label %20, label %14

14:                                               ; preds = %12
  br i1 %3, label %19, label %15

15:                                               ; preds = %14
  %16 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %17 = load i32, i32* %16, align 8, !tbaa !11
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %20

19:                                               ; preds = %15, %8, %14
  store i8 1, i8* %9, align 8, !tbaa !74
  tail call void @_ZNSt3__14__fs10filesystem28recursive_directory_iterator9__advanceEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nonnull %0, %"class.std::__1::error_code"* %1)
  br label %20

20:                                               ; preds = %15, %12, %19
  ret %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0
}

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__14__fs10filesystem28recursive_directory_iterator15__try_recursionEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::recursive_directory_iterator"* nocapture %0, %"class.std::__1::error_code"* %1) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::__fs::filesystem::file_status", align 4
  %4 = alloca %"class.std::__1::__fs::filesystem::file_status", align 4
  %5 = alloca %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", align 8
  %6 = alloca %"class.std::__1::error_code", align 8
  %7 = alloca %"class.std::__1::__fs::filesystem::__dir_stream", align 16
  %8 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %9 = bitcast %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %9) #16
  %10 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 0
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str.4, i64 0, i64 0), i8** %10, align 8, !tbaa !3
  %11 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 1
  store %"class.std::__1::error_code"* %1, %"class.std::__1::error_code"** %11, align 8, !tbaa !8
  %12 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler", %"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* %5, i64 0, i32 2
  %13 = icmp eq %"class.std::__1::error_code"* %1, null
  %14 = bitcast %"class.std::__1::__fs::filesystem::path"** %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %14, i8 0, i64 16, i1 false)
  br i1 %13, label %19, label %15

15:                                               ; preds = %2
  %16 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %16, align 8, !tbaa !11
  %17 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %18 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %17, %"class.std::__1::error_category"** %18, align 8, !tbaa !14
  br label %19

19:                                               ; preds = %2, %15
  %20 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 0
  %21 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %20, align 8, !tbaa !83
  %22 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %21, i64 0, i32 1
  %23 = load i8, i8* %22, align 8, !tbaa !84
  %24 = and i8 %23, 1
  %25 = icmp eq i8 %24, 0
  %26 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %21, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %27 = load i64, i64* %26, align 8, !tbaa !56
  %28 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %21, i64 0, i32 0, i32 0, i32 0, i32 1
  %29 = load i64, i64* %28, align 8, !tbaa !93
  %30 = add i64 %27, -1
  %31 = add i64 %30, %29
  %32 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %21, i64 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %33 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %32, align 8, !tbaa !92
  %34 = udiv i64 %31, 36
  %35 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %33, i64 %34
  %36 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %35, align 8, !tbaa !22
  %37 = urem i64 %31, 36
  %38 = bitcast %"class.std::__1::error_code"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %38) #16
  %39 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 0
  store i32 0, i32* %39, align 8, !tbaa !11
  %40 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %6, i64 0, i32 1
  %41 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %41, %"class.std::__1::error_category"** %40, align 8, !tbaa !14
  %42 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2
  %43 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2, i32 2, i32 6
  %44 = load i8, i8* %43, align 1, !tbaa !102
  br i1 %25, label %45, label %79

45:                                               ; preds = %19
  switch i8 %44, label %66 [
    i8 0, label %46
    i8 1, label %51
    i8 3, label %51
    i8 4, label %51
    i8 2, label %53
    i8 5, label %53
  ]

46:                                               ; preds = %45
  %47 = getelementptr inbounds %"class.std::__1::__fs::filesystem::file_status", %"class.std::__1::__fs::filesystem::file_status"* %4, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %47) #16
  %48 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_entry", %"class.std::__1::__fs::filesystem::directory_entry"* %42, i64 0, i32 0
  call void @_ZNSt3__14__fs10filesystem16__symlink_statusERKNS1_4pathEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::file_status"* nonnull sret align 4 %4, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %48, %"class.std::__1::error_code"* nonnull %6)
  %49 = load i8, i8* %47, align 4, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %47) #16
  %50 = load i32, i32* %39, align 8, !tbaa !11
  br label %67

51:                                               ; preds = %45, %45, %45
  store i32 0, i32* %39, align 8, !tbaa !11
  %52 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %52, %"class.std::__1::error_category"** %40, align 8, !tbaa !14
  br label %293

53:                                               ; preds = %45, %45
  %54 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2, i32 2, i32 5
  %55 = load i8, i8* %54, align 8, !tbaa !105
  %56 = add i8 %55, 1
  %57 = icmp ult i8 %56, 2
  br i1 %57, label %58, label %60

58:                                               ; preds = %53
  %59 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  store i32 2, i32* %39, align 8, !tbaa.struct !23
  br label %62

60:                                               ; preds = %53
  store i32 0, i32* %39, align 8, !tbaa !11
  %61 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  br label %62

62:                                               ; preds = %60, %58
  %63 = phi i32 [ 0, %60 ], [ 2, %58 ]
  %64 = phi %"class.std::__1::error_category"* [ %61, %60 ], [ %59, %58 ]
  store %"class.std::__1::error_category"* %64, %"class.std::__1::error_category"** %40, align 8
  %65 = load i8, i8* %54, align 8, !tbaa !105
  br label %67

66:                                               ; preds = %45
  unreachable

67:                                               ; preds = %46, %62
  %68 = phi i32 [ %63, %62 ], [ %50, %46 ]
  %69 = phi i8 [ %65, %62 ], [ %49, %46 ]
  %70 = icmp eq i32 %68, 0
  br i1 %70, label %77, label %71

71:                                               ; preds = %67
  %72 = icmp eq i8 %69, 0
  br i1 %72, label %206, label %73

73:                                               ; preds = %71
  store i32 0, i32* %39, align 8, !tbaa !11
  %74 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %74, %"class.std::__1::error_category"** %40, align 8, !tbaa !14
  %75 = load i32, i32* %39, align 8, !tbaa !11
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %206

77:                                               ; preds = %73, %67
  %78 = icmp eq i8 %69, 2
  br i1 %78, label %111, label %293

79:                                               ; preds = %19
  switch i8 %44, label %98 [
    i8 0, label %80
    i8 1, label %80
    i8 4, label %80
    i8 2, label %85
    i8 5, label %85
    i8 3, label %85
  ]

80:                                               ; preds = %79, %79, %79
  %81 = getelementptr inbounds %"class.std::__1::__fs::filesystem::file_status", %"class.std::__1::__fs::filesystem::file_status"* %3, i64 0, i32 0
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %81) #16
  %82 = getelementptr inbounds %"class.std::__1::__fs::filesystem::directory_entry", %"class.std::__1::__fs::filesystem::directory_entry"* %42, i64 0, i32 0
  call void @_ZNSt3__14__fs10filesystem8__statusERKNS1_4pathEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::file_status"* nonnull sret align 4 %3, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %82, %"class.std::__1::error_code"* nonnull %6)
  %83 = load i8, i8* %81, align 4, !tbaa !103
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %81) #16
  %84 = load i32, i32* %39, align 8, !tbaa !11
  br label %99

85:                                               ; preds = %79, %79, %79
  %86 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2, i32 2, i32 5
  %87 = load i8, i8* %86, align 8, !tbaa !105
  %88 = add i8 %87, 1
  %89 = icmp ult i8 %88, 2
  br i1 %89, label %90, label %92

90:                                               ; preds = %85
  %91 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  store i32 2, i32* %39, align 8, !tbaa.struct !23
  br label %94

92:                                               ; preds = %85
  store i32 0, i32* %39, align 8, !tbaa !11
  %93 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  br label %94

94:                                               ; preds = %92, %90
  %95 = phi i32 [ 0, %92 ], [ 2, %90 ]
  %96 = phi %"class.std::__1::error_category"* [ %93, %92 ], [ %91, %90 ]
  store %"class.std::__1::error_category"* %96, %"class.std::__1::error_category"** %40, align 8
  %97 = load i8, i8* %86, align 8, !tbaa !105
  br label %99

98:                                               ; preds = %79
  unreachable

99:                                               ; preds = %80, %94
  %100 = phi i32 [ %95, %94 ], [ %84, %80 ]
  %101 = phi i8 [ %97, %94 ], [ %83, %80 ]
  %102 = icmp eq i32 %100, 0
  br i1 %102, label %109, label %103

103:                                              ; preds = %99
  %104 = icmp eq i8 %101, 0
  br i1 %104, label %206, label %105

105:                                              ; preds = %103
  store i32 0, i32* %39, align 8, !tbaa !11
  %106 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  store %"class.std::__1::error_category"* %106, %"class.std::__1::error_category"** %40, align 8, !tbaa !14
  %107 = load i32, i32* %39, align 8, !tbaa !11
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %109, label %206

109:                                              ; preds = %105, %99
  %110 = icmp eq i8 %101, 2
  br i1 %110, label %111, label %293

111:                                              ; preds = %77, %109
  %112 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 112, i8* nonnull %112) #16
  %113 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2, i32 0
  %114 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %20, align 8, !tbaa !83
  %115 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %114, i64 0, i32 1
  %116 = load i8, i8* %115, align 8, !tbaa !84
  call void @_ZNSt3__14__fs10filesystem12__dir_streamC2ERKNS1_4pathENS1_17directory_optionsERNS_10error_codeE(%"class.std::__1::__fs::filesystem::__dir_stream"* nonnull %7, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %113, i8 zeroext %116, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6)
  %117 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 0
  %118 = load %struct.__dirstream*, %struct.__dirstream** %117, align 16, !tbaa !27
  %119 = icmp eq %struct.__dirstream* %118, null
  %120 = ptrtoint %struct.__dirstream* %118 to i64
  br i1 %119, label %185, label %121

121:                                              ; preds = %111
  %122 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %20, align 8, !tbaa !83
  %123 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %122, i64 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %124 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %123 to i64*
  %125 = load i64, i64* %124, align 8, !tbaa !89
  %126 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %122, i64 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %127 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %126 to i64*
  %128 = load i64, i64* %127, align 8, !tbaa !92
  %129 = sub i64 %125, %128
  %130 = ashr exact i64 %129, 3
  %131 = icmp eq i64 %129, 0
  %132 = mul i64 %130, 36
  %133 = add i64 %132, -1
  %134 = select i1 %131, i64 0, i64 %133
  %135 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %122, i64 0, i32 0, i32 0, i32 0, i32 1
  %136 = load i64, i64* %135, align 8, !tbaa !93
  %137 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %122, i64 0, i32 0, i32 0, i32 0, i32 2, i32 0, i32 0
  %138 = load i64, i64* %137, align 8, !tbaa !56
  %139 = add i64 %138, %136
  %140 = icmp eq i64 %134, %139
  br i1 %140, label %143, label %141

141:                                              ; preds = %121
  %142 = inttoptr i64 %128 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  br label %255

143:                                              ; preds = %121
  %144 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %122, i64 0, i32 0, i32 0
  invoke void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE19__add_back_capacityEv(%"class.std::__1::deque"* nonnull %144)
          to label %145 unwind label %152

145:                                              ; preds = %143
  %146 = load i64, i64* %137, align 8, !tbaa !56
  %147 = load i64, i64* %135, align 8, !tbaa !93
  %148 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %126, align 8, !tbaa !92
  %149 = add i64 %147, %146
  %150 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %7 to i64*
  %151 = load i64, i64* %150, align 16, !tbaa !27
  br label %255

152:                                              ; preds = %143
  %153 = landingpad { i8*, i32 }
          cleanup
  %154 = extractvalue { i8*, i32 } %153, 0
  %155 = extractvalue { i8*, i32 } %153, 1
  %156 = load %struct.__dirstream*, %struct.__dirstream** %117, align 16, !tbaa !27
  %157 = icmp eq %struct.__dirstream* %156, null
  br i1 %157, label %166, label %158

158:                                              ; preds = %152
  %159 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %160 = load %struct.__dirstream*, %struct.__dirstream** %117, align 16, !tbaa !27
  %161 = call i32 @closedir(%struct.__dirstream* %160) #16
  %162 = icmp eq i32 %161, -1
  br i1 %162, label %163, label %165

163:                                              ; preds = %158
  %164 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %165

165:                                              ; preds = %163, %158
  store %struct.__dirstream* null, %struct.__dirstream** %117, align 16, !tbaa !27
  br label %166

166:                                              ; preds = %165, %152
  %167 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %168 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %167 to i8*
  %169 = load i8, i8* %168, align 16, !tbaa !42
  %170 = and i8 %169, 1
  %171 = icmp eq i8 %170, 0
  br i1 %171, label %175, label %172

172:                                              ; preds = %166
  %173 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %174 = load i8*, i8** %173, align 16, !tbaa !42
  call void @_ZdlPv(i8* %174) #20
  br label %175

175:                                              ; preds = %172, %166
  %176 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %177 = bitcast %"class.std::__1::__fs::filesystem::path"* %176 to i8*
  %178 = load i8, i8* %177, align 8, !tbaa !42
  %179 = and i8 %178, 1
  %180 = icmp eq i8 %179, 0
  br i1 %180, label %184, label %181

181:                                              ; preds = %175
  %182 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %183 = load i8*, i8** %182, align 8, !tbaa !42
  call void @_ZdlPv(i8* %183) #20
  br label %184

184:                                              ; preds = %175, %181
  call void @llvm.lifetime.end.p0i8(i64 112, i8* nonnull %112) #16
  br label %295

185:                                              ; preds = %111
  %186 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %187 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %186 to i8*
  %188 = load i8, i8* %187, align 16, !tbaa !42
  %189 = and i8 %188, 1
  %190 = icmp eq i8 %189, 0
  br i1 %190, label %194, label %191

191:                                              ; preds = %185
  %192 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %193 = load i8*, i8** %192, align 16, !tbaa !42
  call void @_ZdlPv(i8* %193) #20
  br label %194

194:                                              ; preds = %191, %185
  %195 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %196 = bitcast %"class.std::__1::__fs::filesystem::path"* %195 to i8*
  %197 = load i8, i8* %196, align 8, !tbaa !42
  %198 = and i8 %197, 1
  %199 = icmp eq i8 %198, 0
  br i1 %199, label %203, label %200

200:                                              ; preds = %194
  %201 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %202 = load i8*, i8** %201, align 8, !tbaa !42
  call void @_ZdlPv(i8* %202) #20
  br label %203

203:                                              ; preds = %200, %194
  call void @llvm.lifetime.end.p0i8(i64 112, i8* nonnull %112) #16
  %204 = load i32, i32* %39, align 8, !tbaa !11
  %205 = icmp eq i32 %204, 0
  br i1 %205, label %293, label %206

206:                                              ; preds = %103, %71, %73, %105, %203
  %207 = phi i32 [ %204, %203 ], [ %75, %73 ], [ %107, %105 ], [ %68, %71 ], [ %100, %103 ]
  %208 = load %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"*, %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"** %20, align 8, !tbaa !83
  %209 = getelementptr inbounds %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp", %"struct.std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp"* %208, i64 0, i32 1
  %210 = load i8, i8* %209, align 8, !tbaa !84
  %211 = and i8 %210, 2
  %212 = icmp ne i32 %207, 13
  %213 = icmp eq i8 %211, 0
  %214 = or i1 %212, %213
  br i1 %214, label %220, label %215

215:                                              ; preds = %206
  br i1 %13, label %293, label %216

216:                                              ; preds = %215
  %217 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  store i32 0, i32* %217, align 8, !tbaa !11
  %218 = call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %219 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  store %"class.std::__1::error_category"* %218, %"class.std::__1::error_category"** %219, align 8, !tbaa !14
  br label %293

220:                                              ; preds = %206
  %221 = bitcast %"class.std::__1::__fs::filesystem::path"* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %221) #16
  %222 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %36, i64 %37, i32 2, i32 0
  %223 = bitcast %"class.std::__1::__fs::filesystem::path"* %222 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %221, i8* nonnull align 8 dereferenceable(24) %223, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %223, i8 0, i64 24, i1 false) #16
  %224 = getelementptr inbounds %"class.std::__1::__fs::filesystem::recursive_directory_iterator", %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0, i64 0, i32 0, i32 1
  %225 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %224, align 8, !tbaa !22
  %226 = bitcast %"class.std::__1::__fs::filesystem::recursive_directory_iterator"* %0 to <2 x i64>*
  store <2 x i64> zeroinitializer, <2 x i64>* %226, align 8, !tbaa !22
  %227 = icmp eq %"class.std::__1::__shared_weak_count"* %225, null
  br i1 %227, label %229, label %228

228:                                              ; preds = %220
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %225) #16
  br label %229

229:                                              ; preds = %220, %228
  %230 = load i8, i8* %221, align 8, !tbaa !42
  %231 = and i8 %230, 1
  %232 = icmp eq i8 %231, 0
  %233 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %8, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %234 = load i8*, i8** %233, align 8
  %235 = bitcast %"class.std::__1::__fs::filesystem::path"* %8 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %236 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %235, i64 0, i32 1, i64 0
  %237 = select i1 %232, i8* %236, i8* %234
  invoke void (%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"*, %"class.std::__1::error_code"*, i8*, ...) @_ZNKSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvE6reportERKNS_10error_codeEPKcz(%"struct.std::__1::__fs::filesystem::detail::(anonymous namespace)::ErrorHandler"* nonnull %5, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %6, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.5, i64 0, i64 0), i8* %237)
          to label %238 unwind label %245

238:                                              ; preds = %229
  %239 = load i8, i8* %221, align 8, !tbaa !42
  %240 = and i8 %239, 1
  %241 = icmp eq i8 %240, 0
  br i1 %241, label %244, label %242

242:                                              ; preds = %238
  %243 = load i8*, i8** %233, align 8, !tbaa !42
  call void @_ZdlPv(i8* %243) #20
  br label %244

244:                                              ; preds = %238, %242
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %221) #16
  br label %293

245:                                              ; preds = %229
  %246 = landingpad { i8*, i32 }
          cleanup
  %247 = extractvalue { i8*, i32 } %246, 0
  %248 = extractvalue { i8*, i32 } %246, 1
  %249 = load i8, i8* %221, align 8, !tbaa !42
  %250 = and i8 %249, 1
  %251 = icmp eq i8 %250, 0
  br i1 %251, label %254, label %252

252:                                              ; preds = %245
  %253 = load i8*, i8** %233, align 8, !tbaa !42
  call void @_ZdlPv(i8* %253) #20
  br label %254

254:                                              ; preds = %245, %252
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %221) #16
  br label %295

255:                                              ; preds = %141, %145
  %256 = phi i64 [ %151, %145 ], [ %120, %141 ]
  %257 = phi i64 [ %149, %145 ], [ %139, %141 ]
  %258 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %148, %145 ], [ %142, %141 ]
  %259 = udiv i64 %257, 36
  %260 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %258, i64 %259
  %261 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %260, align 8, !tbaa !22
  %262 = urem i64 %257, 36
  %263 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %261, i64 %262
  %264 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"* %263 to i64*
  store i64 %256, i64* %264, align 16, !tbaa !27
  %265 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %261, i64 %262, i32 1
  %266 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1
  %267 = bitcast %"class.std::__1::__fs::filesystem::path"* %265 to i8*
  %268 = bitcast %"class.std::__1::__fs::filesystem::path"* %266 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %267, i8* nonnull align 8 dereferenceable(24) %268, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %268, i8 0, i64 24, i1 false) #16
  %269 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %261, i64 %262, i32 2
  %270 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2
  %271 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %269 to i8*
  %272 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %270 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %271, i8* nonnull align 16 dereferenceable(24) %272, i64 24, i1 false) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 16 dereferenceable(24) %272, i8 0, i64 24, i1 false) #16
  %273 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %261, i64 %262, i32 2, i32 2
  %274 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 2
  %275 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %273 to i8*
  %276 = bitcast %"struct.std::__1::__fs::filesystem::directory_entry::__cached_data"* %274 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 dereferenceable(48) %275, i8* nonnull align 16 dereferenceable(48) %276, i64 48, i1 false) #16, !tbaa.struct !57
  store %struct.__dirstream* null, %struct.__dirstream** %117, align 16, !tbaa !27
  %277 = load i64, i64* %137, align 8, !tbaa !56
  %278 = add i64 %277, 1
  store i64 %278, i64* %137, align 8, !tbaa !56
  %279 = load i8, i8* %272, align 16, !tbaa !42
  %280 = and i8 %279, 1
  %281 = icmp eq i8 %280, 0
  br i1 %281, label %285, label %282

282:                                              ; preds = %255
  %283 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %284 = load i8*, i8** %283, align 16, !tbaa !42
  call void @_ZdlPv(i8* %284) #20
  br label %285

285:                                              ; preds = %282, %255
  %286 = load i8, i8* %268, align 8, !tbaa !42
  %287 = and i8 %286, 1
  %288 = icmp eq i8 %287, 0
  br i1 %288, label %292, label %289

289:                                              ; preds = %285
  %290 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %7, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %291 = load i8*, i8** %290, align 8, !tbaa !42
  call void @_ZdlPv(i8* %291) #20
  br label %292

292:                                              ; preds = %285, %289
  call void @llvm.lifetime.end.p0i8(i64 112, i8* nonnull %112) #16
  br label %293

293:                                              ; preds = %51, %109, %77, %203, %215, %216, %244, %292
  %294 = phi i1 [ true, %292 ], [ false, %244 ], [ false, %216 ], [ false, %215 ], [ false, %203 ], [ false, %77 ], [ false, %109 ], [ false, %51 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %38) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %9) #16
  ret i1 %294

295:                                              ; preds = %254, %184
  %296 = phi i8* [ %247, %254 ], [ %154, %184 ]
  %297 = phi i32 [ %248, %254 ], [ %155, %184 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %38) #16
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %9) #16
  %298 = insertvalue { i8*, i32 } undef, i8* %296, 0
  %299 = insertvalue { i8*, i32 } %298, i32 %297, 1
  resume { i8*, i32 } %299
}

; Function Attrs: nounwind
declare nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #4

declare %struct.dirent* @readdir(%struct.__dirstream*) local_unnamed_addr #5

; Function Attrs: nounwind
declare nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() local_unnamed_addr #3

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #6 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #16
  tail call void @_ZSt9terminatev() #23
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: argmemonly nofree nounwind readonly
declare i64 @strlen(i8* nocapture) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare i32 @closedir(%struct.__dirstream* nocapture) local_unnamed_addr #8

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #9

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #5

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSERKS5_(%"class.std::__1::basic_string"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) local_unnamed_addr #5

declare { i8*, i64 } @_ZNKSt3__14__fs10filesystem4path16__root_directoryEv(%"class.std::__1::__fs::filesystem::path"*) local_unnamed_addr #5

declare { i8*, i64 } @_ZNKSt3__14__fs10filesystem4path10__filenameEv(%"class.std::__1::__fs::filesystem::path"*) local_unnamed_addr #5

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9push_backEc(%"class.std::__1::basic_string"*, i8 signext) local_unnamed_addr #5

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"*, i8*, i64) local_unnamed_addr #5

; Function Attrs: inlinehint uwtable
define linkonce_odr hidden nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendIPKcEENS_9_MetaBaseIXsr27__is_cpp17_forward_iteratorIT_EE5valueEE13_EnableIfImplIRS5_EESA_SA_(%"class.std::__1::basic_string"* %0, i8* %1, i8* %2) local_unnamed_addr #10 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = ptrtoint i8* %1 to i64
  %5 = alloca %"class.std::__1::basic_string", align 8
  %6 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  %7 = load i8, i8* %6, align 8, !tbaa !42
  %8 = and i8 %7, 1
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %10, label %17

10:                                               ; preds = %3
  %11 = lshr i8 %7, 1
  %12 = zext i8 %11 to i64
  %13 = ptrtoint i8* %2 to i64
  %14 = ptrtoint i8* %1 to i64
  %15 = sub i64 %13, %14
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %332, label %28

17:                                               ; preds = %3
  %18 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %19 = load i64, i64* %18, align 8, !tbaa !42
  %20 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  %21 = load i64, i64* %20, align 8, !tbaa !42
  %22 = and i64 %21, -2
  %23 = add i64 %22, -1
  %24 = ptrtoint i8* %2 to i64
  %25 = sub i64 %24, %4
  %26 = icmp eq i64 %25, 0
  %27 = trunc i64 %21 to i8
  br i1 %26, label %332, label %32

28:                                               ; preds = %10
  %29 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %30 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %29, i64 0, i32 1, i64 0
  %31 = icmp ugt i8* %30, %1
  br i1 %31, label %44, label %36

32:                                               ; preds = %17
  %33 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %34 = load i8*, i8** %33, align 8, !tbaa !42
  %35 = icmp ugt i8* %34, %1
  br i1 %35, label %44, label %36

36:                                               ; preds = %28, %32
  %37 = phi i8 [ %27, %32 ], [ %7, %28 ]
  %38 = phi i64 [ %19, %32 ], [ %12, %28 ]
  %39 = phi i64 [ %23, %32 ], [ 22, %28 ]
  %40 = phi i64 [ %25, %32 ], [ %15, %28 ]
  %41 = phi i8* [ %34, %32 ], [ %30, %28 ]
  %42 = getelementptr inbounds i8, i8* %41, i64 %38
  %43 = icmp ult i8* %42, %1
  br i1 %43, label %44, label %183

44:                                               ; preds = %36, %32, %28
  %45 = phi i8 [ %37, %36 ], [ %27, %32 ], [ %7, %28 ]
  %46 = phi i64 [ %40, %36 ], [ %25, %32 ], [ %15, %28 ]
  %47 = phi i64 [ %39, %36 ], [ %23, %32 ], [ 22, %28 ]
  %48 = phi i64 [ %38, %36 ], [ %19, %32 ], [ %12, %28 ]
  %49 = sub i64 %47, %48
  %50 = icmp ult i64 %49, %46
  br i1 %50, label %51, label %55

51:                                               ; preds = %44
  %52 = add i64 %48, %46
  %53 = sub i64 %52, %47
  tail call void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string"* nonnull %0, i64 %47, i64 %53, i64 %48, i64 %48, i64 0, i64 0)
  %54 = load i8, i8* %6, align 8, !tbaa !42
  br label %55

55:                                               ; preds = %51, %44
  %56 = phi i8 [ %54, %51 ], [ %45, %44 ]
  %57 = and i8 %56, 1
  %58 = icmp eq i8 %57, 0
  br i1 %58, label %62, label %59

59:                                               ; preds = %55
  %60 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %61 = load i8*, i8** %60, align 8, !tbaa !42
  br label %65

62:                                               ; preds = %55
  %63 = bitcast %"class.std::__1::basic_string"* %0 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %64 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %63, i64 0, i32 1, i64 0
  br label %65

65:                                               ; preds = %59, %62
  %66 = phi i8* [ %61, %59 ], [ %64, %62 ]
  %67 = getelementptr inbounds i8, i8* %66, i64 %48
  %68 = icmp eq i8* %1, %2
  br i1 %68, label %172, label %69

69:                                               ; preds = %65
  %70 = ptrtoint i8* %2 to i64
  %71 = sub i64 %70, %4
  %72 = icmp ult i64 %71, 32
  br i1 %72, label %162, label %73

73:                                               ; preds = %69
  %74 = sub i64 %48, %4
  %75 = getelementptr i8, i8* %2, i64 %74
  %76 = ptrtoint i8* %75 to i64
  %77 = getelementptr i8, i8* %66, i64 %76
  %78 = icmp ult i8* %67, %2
  %79 = icmp ugt i8* %77, %1
  %80 = and i1 %78, %79
  br i1 %80, label %162, label %81

81:                                               ; preds = %73
  %82 = and i64 %71, -32
  %83 = getelementptr i8, i8* %1, i64 %82
  %84 = getelementptr i8, i8* %67, i64 %82
  %85 = add i64 %82, -32
  %86 = lshr exact i64 %85, 5
  %87 = add nuw nsw i64 %86, 1
  %88 = and i64 %87, 3
  %89 = icmp ult i64 %85, 96
  br i1 %89, label %141, label %90

90:                                               ; preds = %81
  %91 = and i64 %87, 1152921504606846972
  br label %92

92:                                               ; preds = %92, %90
  %93 = phi i64 [ 0, %90 ], [ %138, %92 ]
  %94 = phi i64 [ %91, %90 ], [ %139, %92 ]
  %95 = getelementptr i8, i8* %1, i64 %93
  %96 = getelementptr i8, i8* %67, i64 %93
  %97 = bitcast i8* %95 to <16 x i8>*
  %98 = load <16 x i8>, <16 x i8>* %97, align 1, !tbaa !42, !alias.scope !106
  %99 = getelementptr i8, i8* %95, i64 16
  %100 = bitcast i8* %99 to <16 x i8>*
  %101 = load <16 x i8>, <16 x i8>* %100, align 1, !tbaa !42, !alias.scope !106
  %102 = bitcast i8* %96 to <16 x i8>*
  store <16 x i8> %98, <16 x i8>* %102, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %103 = getelementptr i8, i8* %96, i64 16
  %104 = bitcast i8* %103 to <16 x i8>*
  store <16 x i8> %101, <16 x i8>* %104, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %105 = or i64 %93, 32
  %106 = getelementptr i8, i8* %1, i64 %105
  %107 = getelementptr i8, i8* %67, i64 %105
  %108 = bitcast i8* %106 to <16 x i8>*
  %109 = load <16 x i8>, <16 x i8>* %108, align 1, !tbaa !42, !alias.scope !106
  %110 = getelementptr i8, i8* %106, i64 16
  %111 = bitcast i8* %110 to <16 x i8>*
  %112 = load <16 x i8>, <16 x i8>* %111, align 1, !tbaa !42, !alias.scope !106
  %113 = bitcast i8* %107 to <16 x i8>*
  store <16 x i8> %109, <16 x i8>* %113, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %114 = getelementptr i8, i8* %107, i64 16
  %115 = bitcast i8* %114 to <16 x i8>*
  store <16 x i8> %112, <16 x i8>* %115, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %116 = or i64 %93, 64
  %117 = getelementptr i8, i8* %1, i64 %116
  %118 = getelementptr i8, i8* %67, i64 %116
  %119 = bitcast i8* %117 to <16 x i8>*
  %120 = load <16 x i8>, <16 x i8>* %119, align 1, !tbaa !42, !alias.scope !106
  %121 = getelementptr i8, i8* %117, i64 16
  %122 = bitcast i8* %121 to <16 x i8>*
  %123 = load <16 x i8>, <16 x i8>* %122, align 1, !tbaa !42, !alias.scope !106
  %124 = bitcast i8* %118 to <16 x i8>*
  store <16 x i8> %120, <16 x i8>* %124, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %125 = getelementptr i8, i8* %118, i64 16
  %126 = bitcast i8* %125 to <16 x i8>*
  store <16 x i8> %123, <16 x i8>* %126, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %127 = or i64 %93, 96
  %128 = getelementptr i8, i8* %1, i64 %127
  %129 = getelementptr i8, i8* %67, i64 %127
  %130 = bitcast i8* %128 to <16 x i8>*
  %131 = load <16 x i8>, <16 x i8>* %130, align 1, !tbaa !42, !alias.scope !106
  %132 = getelementptr i8, i8* %128, i64 16
  %133 = bitcast i8* %132 to <16 x i8>*
  %134 = load <16 x i8>, <16 x i8>* %133, align 1, !tbaa !42, !alias.scope !106
  %135 = bitcast i8* %129 to <16 x i8>*
  store <16 x i8> %131, <16 x i8>* %135, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %136 = getelementptr i8, i8* %129, i64 16
  %137 = bitcast i8* %136 to <16 x i8>*
  store <16 x i8> %134, <16 x i8>* %137, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %138 = add i64 %93, 128
  %139 = add i64 %94, -4
  %140 = icmp eq i64 %139, 0
  br i1 %140, label %141, label %92, !llvm.loop !111

141:                                              ; preds = %92, %81
  %142 = phi i64 [ 0, %81 ], [ %138, %92 ]
  %143 = icmp eq i64 %88, 0
  br i1 %143, label %160, label %144

144:                                              ; preds = %141, %144
  %145 = phi i64 [ %157, %144 ], [ %142, %141 ]
  %146 = phi i64 [ %158, %144 ], [ %88, %141 ]
  %147 = getelementptr i8, i8* %1, i64 %145
  %148 = getelementptr i8, i8* %67, i64 %145
  %149 = bitcast i8* %147 to <16 x i8>*
  %150 = load <16 x i8>, <16 x i8>* %149, align 1, !tbaa !42, !alias.scope !106
  %151 = getelementptr i8, i8* %147, i64 16
  %152 = bitcast i8* %151 to <16 x i8>*
  %153 = load <16 x i8>, <16 x i8>* %152, align 1, !tbaa !42, !alias.scope !106
  %154 = bitcast i8* %148 to <16 x i8>*
  store <16 x i8> %150, <16 x i8>* %154, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %155 = getelementptr i8, i8* %148, i64 16
  %156 = bitcast i8* %155 to <16 x i8>*
  store <16 x i8> %153, <16 x i8>* %156, align 1, !tbaa !42, !alias.scope !109, !noalias !106
  %157 = add i64 %145, 32
  %158 = add i64 %146, -1
  %159 = icmp eq i64 %158, 0
  br i1 %159, label %160, label %144, !llvm.loop !113

160:                                              ; preds = %144, %141
  %161 = icmp eq i64 %71, %82
  br i1 %161, label %172, label %162

162:                                              ; preds = %160, %73, %69
  %163 = phi i8* [ %1, %73 ], [ %1, %69 ], [ %83, %160 ]
  %164 = phi i8* [ %67, %73 ], [ %67, %69 ], [ %84, %160 ]
  br label %165

165:                                              ; preds = %162, %165
  %166 = phi i8* [ %170, %165 ], [ %163, %162 ]
  %167 = phi i8* [ %169, %165 ], [ %164, %162 ]
  %168 = load i8, i8* %166, align 1, !tbaa !42
  store i8 %168, i8* %167, align 1, !tbaa !42
  %169 = getelementptr inbounds i8, i8* %167, i64 1
  %170 = getelementptr inbounds i8, i8* %166, i64 1
  %171 = icmp eq i8* %170, %2
  br i1 %171, label %172, label %165, !llvm.loop !115

172:                                              ; preds = %165, %160, %65
  %173 = phi i8* [ %67, %65 ], [ %84, %160 ], [ %169, %165 ]
  store i8 0, i8* %173, align 1, !tbaa !42
  %174 = add i64 %48, %46
  %175 = load i8, i8* %6, align 8, !tbaa !42
  %176 = and i8 %175, 1
  %177 = icmp eq i8 %176, 0
  br i1 %177, label %180, label %178

178:                                              ; preds = %172
  %179 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %174, i64* %179, align 8, !tbaa !42
  br label %332

180:                                              ; preds = %172
  %181 = trunc i64 %174 to i8
  %182 = shl i8 %181, 1
  store i8 %182, i8* %6, align 8, !tbaa !42
  br label %332

183:                                              ; preds = %36
  %184 = bitcast %"class.std::__1::basic_string"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %184) #16
  %185 = icmp ugt i64 %40, -17
  br i1 %185, label %186, label %188

186:                                              ; preds = %183
  %187 = bitcast %"class.std::__1::basic_string"* %5 to %"class.std::__1::__basic_string_common"*
  call void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"* nonnull %187) #21
  unreachable

188:                                              ; preds = %183
  %189 = icmp ult i64 %40, 23
  br i1 %189, label %190, label %195

190:                                              ; preds = %188
  %191 = trunc i64 %40 to i8
  %192 = shl nuw nsw i8 %191, 1
  store i8 %192, i8* %184, align 8, !tbaa !42
  %193 = bitcast %"class.std::__1::basic_string"* %5 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %194 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %193, i64 0, i32 1, i64 0
  br label %203

195:                                              ; preds = %188
  %196 = add nuw i64 %40, 16
  %197 = and i64 %196, -16
  %198 = tail call noalias nonnull i8* @_Znwm(i64 %197) #19
  %199 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  store i8* %198, i8** %199, align 8, !tbaa !42
  %200 = or i64 %197, 1
  %201 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0
  store i64 %200, i64* %201, align 8, !tbaa !42
  %202 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  store i64 %40, i64* %202, align 8, !tbaa !42
  br label %203

203:                                              ; preds = %195, %190
  %204 = phi i8* [ %194, %190 ], [ %198, %195 ]
  %205 = icmp eq i8* %1, %2
  br i1 %205, label %301, label %206

206:                                              ; preds = %203
  %207 = ptrtoint i8* %2 to i64
  %208 = sub i64 %207, %4
  %209 = icmp ult i64 %208, 32
  br i1 %209, label %291, label %210

210:                                              ; preds = %206
  %211 = and i64 %208, -32
  %212 = getelementptr i8, i8* %1, i64 %211
  %213 = getelementptr i8, i8* %204, i64 %211
  %214 = add i64 %211, -32
  %215 = lshr exact i64 %214, 5
  %216 = add nuw nsw i64 %215, 1
  %217 = and i64 %216, 3
  %218 = icmp ult i64 %214, 96
  br i1 %218, label %270, label %219

219:                                              ; preds = %210
  %220 = and i64 %216, 1152921504606846972
  br label %221

221:                                              ; preds = %221, %219
  %222 = phi i64 [ 0, %219 ], [ %267, %221 ]
  %223 = phi i64 [ %220, %219 ], [ %268, %221 ]
  %224 = getelementptr i8, i8* %1, i64 %222
  %225 = getelementptr i8, i8* %204, i64 %222
  %226 = bitcast i8* %224 to <16 x i8>*
  %227 = load <16 x i8>, <16 x i8>* %226, align 1, !tbaa !42
  %228 = getelementptr i8, i8* %224, i64 16
  %229 = bitcast i8* %228 to <16 x i8>*
  %230 = load <16 x i8>, <16 x i8>* %229, align 1, !tbaa !42
  %231 = bitcast i8* %225 to <16 x i8>*
  store <16 x i8> %227, <16 x i8>* %231, align 1, !tbaa !42
  %232 = getelementptr i8, i8* %225, i64 16
  %233 = bitcast i8* %232 to <16 x i8>*
  store <16 x i8> %230, <16 x i8>* %233, align 1, !tbaa !42
  %234 = or i64 %222, 32
  %235 = getelementptr i8, i8* %1, i64 %234
  %236 = getelementptr i8, i8* %204, i64 %234
  %237 = bitcast i8* %235 to <16 x i8>*
  %238 = load <16 x i8>, <16 x i8>* %237, align 1, !tbaa !42
  %239 = getelementptr i8, i8* %235, i64 16
  %240 = bitcast i8* %239 to <16 x i8>*
  %241 = load <16 x i8>, <16 x i8>* %240, align 1, !tbaa !42
  %242 = bitcast i8* %236 to <16 x i8>*
  store <16 x i8> %238, <16 x i8>* %242, align 1, !tbaa !42
  %243 = getelementptr i8, i8* %236, i64 16
  %244 = bitcast i8* %243 to <16 x i8>*
  store <16 x i8> %241, <16 x i8>* %244, align 1, !tbaa !42
  %245 = or i64 %222, 64
  %246 = getelementptr i8, i8* %1, i64 %245
  %247 = getelementptr i8, i8* %204, i64 %245
  %248 = bitcast i8* %246 to <16 x i8>*
  %249 = load <16 x i8>, <16 x i8>* %248, align 1, !tbaa !42
  %250 = getelementptr i8, i8* %246, i64 16
  %251 = bitcast i8* %250 to <16 x i8>*
  %252 = load <16 x i8>, <16 x i8>* %251, align 1, !tbaa !42
  %253 = bitcast i8* %247 to <16 x i8>*
  store <16 x i8> %249, <16 x i8>* %253, align 1, !tbaa !42
  %254 = getelementptr i8, i8* %247, i64 16
  %255 = bitcast i8* %254 to <16 x i8>*
  store <16 x i8> %252, <16 x i8>* %255, align 1, !tbaa !42
  %256 = or i64 %222, 96
  %257 = getelementptr i8, i8* %1, i64 %256
  %258 = getelementptr i8, i8* %204, i64 %256
  %259 = bitcast i8* %257 to <16 x i8>*
  %260 = load <16 x i8>, <16 x i8>* %259, align 1, !tbaa !42
  %261 = getelementptr i8, i8* %257, i64 16
  %262 = bitcast i8* %261 to <16 x i8>*
  %263 = load <16 x i8>, <16 x i8>* %262, align 1, !tbaa !42
  %264 = bitcast i8* %258 to <16 x i8>*
  store <16 x i8> %260, <16 x i8>* %264, align 1, !tbaa !42
  %265 = getelementptr i8, i8* %258, i64 16
  %266 = bitcast i8* %265 to <16 x i8>*
  store <16 x i8> %263, <16 x i8>* %266, align 1, !tbaa !42
  %267 = add i64 %222, 128
  %268 = add i64 %223, -4
  %269 = icmp eq i64 %268, 0
  br i1 %269, label %270, label %221, !llvm.loop !116

270:                                              ; preds = %221, %210
  %271 = phi i64 [ 0, %210 ], [ %267, %221 ]
  %272 = icmp eq i64 %217, 0
  br i1 %272, label %289, label %273

273:                                              ; preds = %270, %273
  %274 = phi i64 [ %286, %273 ], [ %271, %270 ]
  %275 = phi i64 [ %287, %273 ], [ %217, %270 ]
  %276 = getelementptr i8, i8* %1, i64 %274
  %277 = getelementptr i8, i8* %204, i64 %274
  %278 = bitcast i8* %276 to <16 x i8>*
  %279 = load <16 x i8>, <16 x i8>* %278, align 1, !tbaa !42
  %280 = getelementptr i8, i8* %276, i64 16
  %281 = bitcast i8* %280 to <16 x i8>*
  %282 = load <16 x i8>, <16 x i8>* %281, align 1, !tbaa !42
  %283 = bitcast i8* %277 to <16 x i8>*
  store <16 x i8> %279, <16 x i8>* %283, align 1, !tbaa !42
  %284 = getelementptr i8, i8* %277, i64 16
  %285 = bitcast i8* %284 to <16 x i8>*
  store <16 x i8> %282, <16 x i8>* %285, align 1, !tbaa !42
  %286 = add i64 %274, 32
  %287 = add i64 %275, -1
  %288 = icmp eq i64 %287, 0
  br i1 %288, label %289, label %273, !llvm.loop !117

289:                                              ; preds = %273, %270
  %290 = icmp eq i64 %208, %211
  br i1 %290, label %301, label %291

291:                                              ; preds = %289, %206
  %292 = phi i8* [ %1, %206 ], [ %212, %289 ]
  %293 = phi i8* [ %204, %206 ], [ %213, %289 ]
  br label %294

294:                                              ; preds = %291, %294
  %295 = phi i8* [ %298, %294 ], [ %292, %291 ]
  %296 = phi i8* [ %299, %294 ], [ %293, %291 ]
  %297 = load i8, i8* %295, align 1, !tbaa !42
  store i8 %297, i8* %296, align 1, !tbaa !42
  %298 = getelementptr inbounds i8, i8* %295, i64 1
  %299 = getelementptr inbounds i8, i8* %296, i64 1
  %300 = icmp eq i8* %298, %2
  br i1 %300, label %301, label %294, !llvm.loop !118

301:                                              ; preds = %294, %289, %203
  %302 = phi i8* [ %204, %203 ], [ %213, %289 ], [ %299, %294 ]
  store i8 0, i8* %302, align 1, !tbaa !42
  %303 = load i8, i8* %184, align 8, !tbaa !42
  %304 = and i8 %303, 1
  %305 = icmp eq i8 %304, 0
  %306 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %307 = load i8*, i8** %306, align 8
  %308 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1
  %309 = load i64, i64* %308, align 8
  %310 = bitcast %"class.std::__1::basic_string"* %5 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %311 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %310, i64 0, i32 1, i64 0
  %312 = lshr i8 %303, 1
  %313 = zext i8 %312 to i64
  %314 = select i1 %305, i8* %311, i8* %307
  %315 = select i1 %305, i64 %313, i64 %309
  %316 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm(%"class.std::__1::basic_string"* %0, i8* %314, i64 %315)
          to label %317 unwind label %324

317:                                              ; preds = %301
  %318 = load i8, i8* %184, align 8, !tbaa !42
  %319 = and i8 %318, 1
  %320 = icmp eq i8 %319, 0
  br i1 %320, label %323, label %321

321:                                              ; preds = %317
  %322 = load i8*, i8** %306, align 8, !tbaa !42
  call void @_ZdlPv(i8* %322) #20
  br label %323

323:                                              ; preds = %317, %321
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %184) #16
  br label %332

324:                                              ; preds = %301
  %325 = landingpad { i8*, i32 }
          cleanup
  %326 = load i8, i8* %184, align 8, !tbaa !42
  %327 = and i8 %326, 1
  %328 = icmp eq i8 %327, 0
  br i1 %328, label %331, label %329

329:                                              ; preds = %324
  %330 = load i8*, i8** %306, align 8, !tbaa !42
  call void @_ZdlPv(i8* %330) #20
  br label %331

331:                                              ; preds = %324, %329
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %184) #16
  resume { i8*, i32 } %325

332:                                              ; preds = %180, %178, %17, %10, %323
  ret %"class.std::__1::basic_string"* %0
}

declare void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE9__grow_byEmmmmmm(%"class.std::__1::basic_string"*, i64, i64, i64, i64, i64, i64) local_unnamed_addr #5

; Function Attrs: noreturn
declare void @_ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__basic_string_common"*) local_unnamed_addr #11

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorEPKc(i8* %0) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #16
  %3 = bitcast i8* %2 to %"class.std::length_error"*
  invoke void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #21
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #16
  resume { i8*, i32 } %6
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %0, i8* %1) unnamed_addr #0 comdat align 2 {
  %3 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !20
  ret void
}

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD1Ev(%"class.std::length_error"*) unnamed_addr #3

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"*, i8*) unnamed_addr #5

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #13

; Function Attrs: nofree nounwind
declare noalias %struct.__dirstream* @opendir(i8* nocapture readonly) local_unnamed_addr #8

declare void @_ZNSt3__14__fs10filesystem16__symlink_statusERKNS1_4pathEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::file_status"* sret align 4, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24), %"class.std::__1::error_code"*) local_unnamed_addr #5

declare void @_ZNSt3__14__fs10filesystem8__statusERKNS1_4pathEPNS_10error_codeE(%"class.std::__1::__fs::filesystem::file_status"* sret align 4, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24), %"class.std::__1::error_code"*) local_unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"*) local_unnamed_addr #3

; Function Attrs: nounwind
declare void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"*) unnamed_addr #3

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED2Ev(%"struct.std::__1::__shared_ptr_emplace"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 16, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEED0Ev(%"struct.std::__1::__shared_ptr_emplace"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 16, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  %4 = bitcast %"struct.std::__1::__shared_ptr_emplace"* %0 to i8*
  tail call void @_ZdlPv(i8* %4) #20
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE16__on_zero_sharedEv(%"struct.std::__1::__shared_ptr_emplace"* %0) unnamed_addr #15 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 2
  %3 = bitcast %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::__dir_stream, std::__1::allocator<std::__1::__fs::filesystem::__dir_stream>>::_Storage"* %2 to %struct.__dirstream**
  %4 = load %struct.__dirstream*, %struct.__dirstream** %3, align 16, !tbaa !27
  %5 = icmp eq %struct.__dirstream* %4, null
  br i1 %5, label %14, label %6

6:                                                ; preds = %1
  %7 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %8 = load %struct.__dirstream*, %struct.__dirstream** %3, align 16, !tbaa !27
  %9 = tail call i32 @closedir(%struct.__dirstream* %8) #16
  %10 = icmp eq i32 %9, -1
  br i1 %10, label %11, label %13

11:                                               ; preds = %6
  %12 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %13

13:                                               ; preds = %11, %6
  store %struct.__dirstream* null, %struct.__dirstream** %3, align 16, !tbaa !27
  br label %14

14:                                               ; preds = %13, %1
  %15 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 2, i32 0, i64 32
  %16 = load i8, i8* %15, align 8, !tbaa !42
  %17 = and i8 %16, 1
  %18 = icmp eq i8 %17, 0
  br i1 %18, label %23, label %19

19:                                               ; preds = %14
  %20 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 2, i32 0, i64 48
  %21 = bitcast i8* %20 to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %22) #20
  br label %23

23:                                               ; preds = %19, %14
  %24 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 2, i32 0, i64 8
  %25 = load i8, i8* %24, align 8, !tbaa !42
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %32, label %28

28:                                               ; preds = %23
  %29 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace", %"struct.std::__1::__shared_ptr_emplace"* %0, i64 0, i32 2, i32 0, i64 24
  %30 = bitcast i8* %29 to i8**
  %31 = load i8*, i8** %30, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %31) #20
  br label %32

32:                                               ; preds = %28, %23
  ret void
}

; Function Attrs: nounwind
declare i8* @_ZNKSt3__119__shared_weak_count13__get_deleterERKSt9type_info(%"class.std::__1::__shared_weak_count"*, %"class.std::type_info"* nonnull align 8 dereferenceable(16)) unnamed_addr #3

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE21__on_zero_shared_weakEv(%"struct.std::__1::__shared_ptr_emplace"* %0) unnamed_addr #15 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"struct.std::__1::__shared_ptr_emplace"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #20
  ret void
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %1) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = tail call i8* @__cxa_allocate_exception(i64 48) #16
  %4 = bitcast i8* %3 to %"class.std::__1::__fs::filesystem::filesystem_error"*
  %5 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 0
  %6 = load i32, i32* %5, align 8, !tbaa.struct !23
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %1, i64 0, i32 1
  %8 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %7, align 8, !tbaa.struct !23
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, i32 %6, %"class.std::__1::error_category"* %8)
          to label %9 unwind label %10

9:                                                ; preds = %2
  tail call void @__cxa_throw(i8* %3, i8* bitcast (i8** @_ZTINSt3__14__fs10filesystem16filesystem_errorE to i8*), i8* bitcast (void (%"class.std::__1::__fs::filesystem::filesystem_error"*)* @_ZNSt3__14__fs10filesystem16filesystem_errorD1Ev to i8*)) #21
  unreachable

10:                                               ; preds = %2
  %11 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %3) #16
  resume { i8*, i32 } %11
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathERKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %2) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = tail call i8* @__cxa_allocate_exception(i64 48) #16
  %5 = bitcast i8* %4 to %"class.std::__1::__fs::filesystem::filesystem_error"*
  %6 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 0
  %7 = load i32, i32* %6, align 8, !tbaa.struct !23
  %8 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %2, i64 0, i32 1
  %9 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %8, align 8, !tbaa.struct !23
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathENS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, i32 %7, %"class.std::__1::error_category"* %9)
          to label %10 unwind label %11

10:                                               ; preds = %3
  tail call void @__cxa_throw(i8* %4, i8* bitcast (i8** @_ZTINSt3__14__fs10filesystem16filesystem_errorE to i8*), i8* bitcast (void (%"class.std::__1::__fs::filesystem::filesystem_error"*)* @_ZNSt3__14__fs10filesystem16filesystem_errorD1Ev to i8*)) #21
  unreachable

11:                                               ; preds = %3
  %12 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %4) #16
  resume { i8*, i32 } %12
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem24__throw_filesystem_errorIJRNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESC_RKNS_10error_codeEEEEvDpOT_(%"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %2, %"class.std::__1::error_code"* nonnull align 8 dereferenceable(16) %3) local_unnamed_addr #12 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = tail call i8* @__cxa_allocate_exception(i64 48) #16
  %6 = bitcast i8* %5 to %"class.std::__1::__fs::filesystem::filesystem_error"*
  %7 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 0
  %8 = load i32, i32* %7, align 8, !tbaa.struct !23
  %9 = getelementptr inbounds %"class.std::__1::error_code", %"class.std::__1::error_code"* %3, i64 0, i32 1
  %10 = load %"class.std::__1::error_category"*, %"class.std::__1::error_category"** %9, align 8, !tbaa.struct !23
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESD_NS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %6, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %0, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %2, i32 %8, %"class.std::__1::error_category"* %10)
          to label %11 unwind label %12

11:                                               ; preds = %4
  tail call void @__cxa_throw(i8* %5, i8* bitcast (i8** @_ZTINSt3__14__fs10filesystem16filesystem_errorE to i8*), i8* bitcast (void (%"class.std::__1::__fs::filesystem::filesystem_error"*)* @_ZNSt3__14__fs10filesystem16filesystem_errorD1Ev to i8*)) #21
  unreachable

12:                                               ; preds = %4
  %13 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %5) #16
  resume { i8*, i32 } %13
}

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKc(%"class.std::__1::basic_string"*, i8*) local_unnamed_addr #5

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, i32 %2, %"class.std::__1::error_category"* %3) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %5 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %6 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %7 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0
  tail call void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %7, i32 %2, %"class.std::__1::error_category"* %3, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1)
  %8 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__14__fs10filesystem16filesystem_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %8, align 8, !tbaa !20
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1
  %10 = bitcast %"class.std::__1::__fs::filesystem::path"* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %10, i8 0, i64 24, i1 false) #16
  %11 = bitcast %"class.std::__1::__fs::filesystem::path"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %11) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %11, i8 0, i64 24, i1 false) #16
  %12 = invoke noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #19
          to label %13 unwind label %55

13:                                               ; preds = %4
  %14 = bitcast i8* %12 to %"class.std::__1::__shared_weak_count"*
  %15 = bitcast i8* %12 to i32 (...)***
  %16 = getelementptr inbounds i8, i8* %12, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %16, i8 0, i64 16, i1 false), !noalias !120
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %15, align 8, !tbaa !20, !noalias !120
  %17 = getelementptr inbounds i8, i8* %12, i64 24
  %18 = bitcast i8* %17 to %"class.std::__1::basic_string"*
  %19 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %18, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %19)
          to label %20 unwind label %33, !noalias !120

20:                                               ; preds = %13
  %21 = getelementptr inbounds i8, i8* %12, i64 48
  %22 = bitcast i8* %21 to %"class.std::__1::basic_string"*
  %23 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %22, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %23)
          to label %35 unwind label %24, !noalias !120

24:                                               ; preds = %20
  %25 = landingpad { i8*, i32 }
          cleanup
  %26 = load i8, i8* %17, align 8, !tbaa !42, !noalias !120
  %27 = and i8 %26, 1
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %59, label %29

29:                                               ; preds = %24
  %30 = getelementptr inbounds i8, i8* %12, i64 40
  %31 = bitcast i8* %30 to i8**
  %32 = load i8*, i8** %31, align 8, !tbaa !42, !noalias !120
  call void @_ZdlPv(i8* %32) #20, !noalias !120
  br label %59

33:                                               ; preds = %13
  %34 = landingpad { i8*, i32 }
          cleanup
  br label %59

35:                                               ; preds = %20
  %36 = getelementptr inbounds i8, i8* %12, i64 72
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %36, i8 0, i64 24, i1 false) #16, !noalias !120
  %37 = bitcast %"class.std::__1::shared_ptr.21"* %9 to i8**
  store i8* %17, i8** %37, align 8, !tbaa !125, !alias.scope !127
  %38 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1, i32 1
  %39 = bitcast %"class.std::__1::__shared_weak_count"** %38 to i8**
  store i8* %12, i8** %39, align 8, !tbaa !130, !alias.scope !127
  %40 = load i8, i8* %11, align 8, !tbaa !42
  %41 = and i8 %40, 1
  %42 = icmp eq i8 %41, 0
  br i1 %42, label %46, label %43

43:                                               ; preds = %35
  %44 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %45 = load i8*, i8** %44, align 8, !tbaa !42
  call void @_ZdlPv(i8* %45) #20
  br label %46

46:                                               ; preds = %35, %43
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %11) #16
  %47 = load i8, i8* %10, align 8, !tbaa !42
  %48 = and i8 %47, 1
  %49 = icmp eq i8 %48, 0
  br i1 %49, label %53, label %50

50:                                               ; preds = %46
  %51 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %52 = load i8*, i8** %51, align 8, !tbaa !42
  call void @_ZdlPv(i8* %52) #20
  br label %53

53:                                               ; preds = %46, %50
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #16
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_error13__create_whatEi(%"class.std::__1::__fs::filesystem::filesystem_error"* nonnull %0, i32 0)
          to label %54 unwind label %79

54:                                               ; preds = %53
  ret void

55:                                               ; preds = %4
  %56 = landingpad { i8*, i32 }
          cleanup
  %57 = extractvalue { i8*, i32 } %56, 0
  %58 = extractvalue { i8*, i32 } %56, 1
  br label %69

59:                                               ; preds = %24, %29, %33
  %60 = phi { i8*, i32 } [ %34, %33 ], [ %25, %29 ], [ %25, %24 ]
  call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* nonnull %14) #16, !noalias !120
  call void @_ZdlPv(i8* nonnull %12) #20, !noalias !120
  %61 = load i8, i8* %11, align 8, !tbaa !42
  %62 = and i8 %61, 1
  %63 = icmp eq i8 %62, 0
  %64 = extractvalue { i8*, i32 } %60, 0
  %65 = extractvalue { i8*, i32 } %60, 1
  br i1 %63, label %69, label %66

66:                                               ; preds = %59
  %67 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %68 = load i8*, i8** %67, align 8, !tbaa !42
  call void @_ZdlPv(i8* %68) #20
  br label %69

69:                                               ; preds = %55, %59, %66
  %70 = phi i32 [ %58, %55 ], [ %65, %59 ], [ %65, %66 ]
  %71 = phi i8* [ %57, %55 ], [ %64, %59 ], [ %64, %66 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %11) #16
  %72 = load i8, i8* %10, align 8, !tbaa !42
  %73 = and i8 %72, 1
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %78, label %75

75:                                               ; preds = %69
  %76 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %5, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %77 = load i8*, i8** %76, align 8, !tbaa !42
  call void @_ZdlPv(i8* %77) #20
  br label %78

78:                                               ; preds = %69, %75
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #16
  br label %86

79:                                               ; preds = %53
  %80 = landingpad { i8*, i32 }
          cleanup
  %81 = extractvalue { i8*, i32 } %80, 0
  %82 = extractvalue { i8*, i32 } %80, 1
  %83 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %38, align 8, !tbaa !130
  %84 = icmp eq %"class.std::__1::__shared_weak_count"* %83, null
  br i1 %84, label %86, label %85

85:                                               ; preds = %79
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %83) #16
  br label %86

86:                                               ; preds = %85, %79, %78
  %87 = phi i8* [ %71, %78 ], [ %81, %79 ], [ %81, %85 ]
  %88 = phi i32 [ %70, %78 ], [ %82, %79 ], [ %82, %85 ]
  call void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %7) #16
  %89 = insertvalue { i8*, i32 } undef, i8* %87, 0
  %90 = insertvalue { i8*, i32 } %89, i32 %88, 1
  resume { i8*, i32 } %90
}

; Function Attrs: nounwind
declare void @_ZNSt3__14__fs10filesystem16filesystem_errorD1Ev(%"class.std::__1::__fs::filesystem::filesystem_error"*) unnamed_addr #3

declare void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"*, i32, %"class.std::__1::error_category"*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) unnamed_addr #5

declare void @_ZNSt3__14__fs10filesystem16filesystem_error13__create_whatEi(%"class.std::__1::__fs::filesystem::filesystem_error"*, i32) local_unnamed_addr #5

; Function Attrs: nounwind
declare void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"*) unnamed_addr #3

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED2Ev(%"struct.std::__1::__shared_ptr_emplace.29"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEED0Ev(%"struct.std::__1::__shared_ptr_emplace.29"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  %4 = bitcast %"struct.std::__1::__shared_ptr_emplace.29"* %0 to i8*
  tail call void @_ZdlPv(i8* %4) #20
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE16__on_zero_sharedEv(%"struct.std::__1::__shared_ptr_emplace.29"* %0) unnamed_addr #15 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 48
  %3 = load i8, i8* %2, align 8, !tbaa !42
  %4 = and i8 %3, 1
  %5 = icmp eq i8 %4, 0
  br i1 %5, label %10, label %6

6:                                                ; preds = %1
  %7 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 64
  %8 = bitcast i8* %7 to i8**
  %9 = load i8*, i8** %8, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %9) #20
  br label %10

10:                                               ; preds = %6, %1
  %11 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 24
  %12 = load i8, i8* %11, align 8, !tbaa !42
  %13 = and i8 %12, 1
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %19, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 40
  %17 = bitcast i8* %16 to i8**
  %18 = load i8*, i8** %17, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %18) #20
  br label %19

19:                                               ; preds = %15, %10
  %20 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 0
  %21 = load i8, i8* %20, align 8, !tbaa !42
  %22 = and i8 %21, 1
  %23 = icmp eq i8 %22, 0
  br i1 %23, label %28, label %24

24:                                               ; preds = %19
  %25 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.29", %"struct.std::__1::__shared_ptr_emplace.29"* %0, i64 0, i32 1, i32 0, i64 16
  %26 = bitcast i8* %25 to i8**
  %27 = load i8*, i8** %26, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %27) #20
  br label %28

28:                                               ; preds = %24, %19
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEE21__on_zero_shared_weakEv(%"struct.std::__1::__shared_ptr_emplace.29"* %0) unnamed_addr #15 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"struct.std::__1::__shared_ptr_emplace.29"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #20
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathENS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %2, i32 %3, %"class.std::__1::error_category"* %4) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %6 = alloca %"class.std::__1::__fs::filesystem::path", align 8
  %7 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0
  tail call void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %7, i32 %3, %"class.std::__1::error_category"* %4, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1)
  %8 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__14__fs10filesystem16filesystem_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %8, align 8, !tbaa !20
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1
  %10 = bitcast %"class.std::__1::__fs::filesystem::path"* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #16
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %10, i8 0, i64 24, i1 false) #16
  %11 = invoke noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #19
          to label %12 unwind label %47

12:                                               ; preds = %5
  %13 = bitcast i8* %11 to %"class.std::__1::__shared_weak_count"*
  %14 = bitcast i8* %11 to i32 (...)***
  %15 = getelementptr inbounds i8, i8* %11, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %15, i8 0, i64 16, i1 false), !noalias !131
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %14, align 8, !tbaa !20, !noalias !131
  %16 = getelementptr inbounds i8, i8* %11, i64 24
  %17 = bitcast i8* %16 to %"class.std::__1::basic_string"*
  %18 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %2, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %17, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %18)
          to label %19 unwind label %32, !noalias !131

19:                                               ; preds = %12
  %20 = getelementptr inbounds i8, i8* %11, i64 48
  %21 = bitcast i8* %20 to %"class.std::__1::basic_string"*
  %22 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %21, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %22)
          to label %34 unwind label %23, !noalias !131

23:                                               ; preds = %19
  %24 = landingpad { i8*, i32 }
          cleanup
  %25 = load i8, i8* %16, align 8, !tbaa !42, !noalias !131
  %26 = and i8 %25, 1
  %27 = icmp eq i8 %26, 0
  br i1 %27, label %51, label %28

28:                                               ; preds = %23
  %29 = getelementptr inbounds i8, i8* %11, i64 40
  %30 = bitcast i8* %29 to i8**
  %31 = load i8*, i8** %30, align 8, !tbaa !42, !noalias !131
  call void @_ZdlPv(i8* %31) #20, !noalias !131
  br label %51

32:                                               ; preds = %12
  %33 = landingpad { i8*, i32 }
          cleanup
  br label %51

34:                                               ; preds = %19
  %35 = getelementptr inbounds i8, i8* %11, i64 72
  call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %35, i8 0, i64 24, i1 false) #16, !noalias !131
  %36 = bitcast %"class.std::__1::shared_ptr.21"* %9 to i8**
  store i8* %16, i8** %36, align 8, !tbaa !125, !alias.scope !136
  %37 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1, i32 1
  %38 = bitcast %"class.std::__1::__shared_weak_count"** %37 to i8**
  store i8* %11, i8** %38, align 8, !tbaa !130, !alias.scope !136
  %39 = load i8, i8* %10, align 8, !tbaa !42
  %40 = and i8 %39, 1
  %41 = icmp eq i8 %40, 0
  br i1 %41, label %45, label %42

42:                                               ; preds = %34
  %43 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %44 = load i8*, i8** %43, align 8, !tbaa !42
  call void @_ZdlPv(i8* %44) #20
  br label %45

45:                                               ; preds = %34, %42
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #16
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_error13__create_whatEi(%"class.std::__1::__fs::filesystem::filesystem_error"* nonnull %0, i32 1)
          to label %46 unwind label %64

46:                                               ; preds = %45
  ret void

47:                                               ; preds = %5
  %48 = landingpad { i8*, i32 }
          cleanup
  %49 = extractvalue { i8*, i32 } %48, 0
  %50 = extractvalue { i8*, i32 } %48, 1
  br label %61

51:                                               ; preds = %23, %28, %32
  %52 = phi { i8*, i32 } [ %33, %32 ], [ %24, %28 ], [ %24, %23 ]
  call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* nonnull %13) #16, !noalias !131
  call void @_ZdlPv(i8* nonnull %11) #20, !noalias !131
  %53 = load i8, i8* %10, align 8, !tbaa !42
  %54 = and i8 %53, 1
  %55 = icmp eq i8 %54, 0
  %56 = extractvalue { i8*, i32 } %52, 0
  %57 = extractvalue { i8*, i32 } %52, 1
  br i1 %55, label %61, label %58

58:                                               ; preds = %51
  %59 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %6, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %60 = load i8*, i8** %59, align 8, !tbaa !42
  call void @_ZdlPv(i8* %60) #20
  br label %61

61:                                               ; preds = %47, %51, %58
  %62 = phi i32 [ %50, %47 ], [ %57, %51 ], [ %57, %58 ]
  %63 = phi i8* [ %49, %47 ], [ %56, %51 ], [ %56, %58 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #16
  br label %71

64:                                               ; preds = %45
  %65 = landingpad { i8*, i32 }
          cleanup
  %66 = extractvalue { i8*, i32 } %65, 0
  %67 = extractvalue { i8*, i32 } %65, 1
  %68 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %37, align 8, !tbaa !130
  %69 = icmp eq %"class.std::__1::__shared_weak_count"* %68, null
  br i1 %69, label %71, label %70

70:                                               ; preds = %64
  call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %68) #16
  br label %71

71:                                               ; preds = %70, %64, %61
  %72 = phi i8* [ %63, %61 ], [ %66, %64 ], [ %66, %70 ]
  %73 = phi i32 [ %62, %61 ], [ %67, %64 ], [ %67, %70 ]
  call void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %7) #16
  %74 = insertvalue { i8*, i32 } undef, i8* %72, 0
  %75 = insertvalue { i8*, i32 } %74, i32 %73, 1
  resume { i8*, i32 } %75
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__14__fs10filesystem16filesystem_errorC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEERKNS1_4pathESD_NS_10error_codeE(%"class.std::__1::__fs::filesystem::filesystem_error"* %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %2, %"class.std::__1::__fs::filesystem::path"* nonnull align 8 dereferenceable(24) %3, i32 %4, %"class.std::__1::error_category"* %5) unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %7 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0
  tail call void @_ZNSt3__112system_errorC2ENS_10error_codeERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::system_error"* %7, i32 %4, %"class.std::__1::error_category"* %5, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1)
  %8 = getelementptr %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__14__fs10filesystem16filesystem_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %8, align 8, !tbaa !20
  %9 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1
  %10 = invoke noalias nonnull dereferenceable(96) i8* @_Znwm(i64 96) #19
          to label %11 unwind label %41

11:                                               ; preds = %6
  %12 = bitcast i8* %10 to %"class.std::__1::__shared_weak_count"*
  %13 = bitcast i8* %10 to i32 (...)***
  %14 = getelementptr inbounds i8, i8* %10, i64 8
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(16) %14, i8 0, i64 16, i1 false), !noalias !139
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %13, align 8, !tbaa !20, !noalias !139
  %15 = getelementptr inbounds i8, i8* %10, i64 24
  %16 = bitcast i8* %15 to %"class.std::__1::basic_string"*
  %17 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %2, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %16, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %17)
          to label %18 unwind label %31, !noalias !139

18:                                               ; preds = %11
  %19 = getelementptr inbounds i8, i8* %10, i64 48
  %20 = bitcast i8* %19 to %"class.std::__1::basic_string"*
  %21 = getelementptr inbounds %"class.std::__1::__fs::filesystem::path", %"class.std::__1::__fs::filesystem::path"* %3, i64 0, i32 0
  invoke void @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEC1ERKS5_(%"class.std::__1::basic_string"* nonnull %20, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %21)
          to label %35 unwind label %22, !noalias !139

22:                                               ; preds = %18
  %23 = landingpad { i8*, i32 }
          cleanup
  %24 = load i8, i8* %15, align 8, !tbaa !42, !noalias !139
  %25 = and i8 %24, 1
  %26 = icmp eq i8 %25, 0
  br i1 %26, label %33, label %27

27:                                               ; preds = %22
  %28 = getelementptr inbounds i8, i8* %10, i64 40
  %29 = bitcast i8* %28 to i8**
  %30 = load i8*, i8** %29, align 8, !tbaa !42, !noalias !139
  tail call void @_ZdlPv(i8* %30) #20, !noalias !139
  br label %33

31:                                               ; preds = %11
  %32 = landingpad { i8*, i32 }
          cleanup
  br label %33

33:                                               ; preds = %31, %27, %22
  %34 = phi { i8*, i32 } [ %32, %31 ], [ %23, %27 ], [ %23, %22 ]
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* nonnull %12) #16, !noalias !139
  tail call void @_ZdlPv(i8* nonnull %10) #20, !noalias !139
  br label %43

35:                                               ; preds = %18
  %36 = getelementptr inbounds i8, i8* %10, i64 72
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %36, i8 0, i64 24, i1 false) #16, !noalias !139
  %37 = bitcast %"class.std::__1::shared_ptr.21"* %9 to i8**
  store i8* %15, i8** %37, align 8, !tbaa !125, !alias.scope !144
  %38 = getelementptr inbounds %"class.std::__1::__fs::filesystem::filesystem_error", %"class.std::__1::__fs::filesystem::filesystem_error"* %0, i64 0, i32 1, i32 1
  %39 = bitcast %"class.std::__1::__shared_weak_count"** %38 to i8**
  store i8* %10, i8** %39, align 8, !tbaa !130, !alias.scope !144
  invoke void @_ZNSt3__14__fs10filesystem16filesystem_error13__create_whatEi(%"class.std::__1::__fs::filesystem::filesystem_error"* nonnull %0, i32 2)
          to label %40 unwind label %47

40:                                               ; preds = %35
  ret void

41:                                               ; preds = %6
  %42 = landingpad { i8*, i32 }
          cleanup
  br label %43

43:                                               ; preds = %33, %41
  %44 = phi { i8*, i32 } [ %42, %41 ], [ %34, %33 ]
  %45 = extractvalue { i8*, i32 } %44, 0
  %46 = extractvalue { i8*, i32 } %44, 1
  br label %54

47:                                               ; preds = %35
  %48 = landingpad { i8*, i32 }
          cleanup
  %49 = extractvalue { i8*, i32 } %48, 0
  %50 = extractvalue { i8*, i32 } %48, 1
  %51 = load %"class.std::__1::__shared_weak_count"*, %"class.std::__1::__shared_weak_count"** %38, align 8, !tbaa !130
  %52 = icmp eq %"class.std::__1::__shared_weak_count"* %51, null
  br i1 %52, label %54, label %53

53:                                               ; preds = %47
  tail call void @_ZNSt3__119__shared_weak_count16__release_sharedEv(%"class.std::__1::__shared_weak_count"* nonnull %51) #16
  br label %54

54:                                               ; preds = %53, %47, %43
  %55 = phi i8* [ %45, %43 ], [ %49, %47 ], [ %49, %53 ]
  %56 = phi i32 [ %46, %43 ], [ %50, %47 ], [ %50, %53 ]
  tail call void @_ZNSt3__112system_errorD2Ev(%"class.std::__1::system_error"* %7) #16
  %57 = insertvalue { i8*, i32 } undef, i8* %55, 0
  %58 = insertvalue { i8*, i32 } %57, i32 %56, 1
  resume { i8*, i32 } %58
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #16

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #16

declare void @__cxa_rethrow() local_unnamed_addr

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #16

; Function Attrs: nofree nounwind
declare i32 @vsnprintf(i8* nocapture, i64, i8* nocapture readonly, %struct.__va_list_tag*) local_unnamed_addr #8

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6assignEPKcm(%"class.std::__1::basic_string"*, i8*, i64) local_unnamed_addr #5

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED2Ev(%"struct.std::__1::__shared_ptr_emplace.40"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEED0Ev(%"struct.std::__1::__shared_ptr_emplace.40"* %0) unnamed_addr #14 comdat align 2 {
  %2 = getelementptr %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [7 x i8*] }, { [7 x i8*] }* @_ZTVNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEEE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !20
  %3 = getelementptr %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 0
  tail call void @_ZNSt3__119__shared_weak_countD2Ev(%"class.std::__1::__shared_weak_count"* %3) #16
  %4 = bitcast %"struct.std::__1::__shared_ptr_emplace.40"* %0 to i8*
  tail call void @_ZdlPv(i8* %4) #20
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE16__on_zero_sharedEv(%"struct.std::__1::__shared_ptr_emplace.40"* %0) unnamed_addr #15 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 1
  %3 = bitcast %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp, std::__1::allocator<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp>>::_Storage"* %2 to %"class.std::__1::__deque_base"*
  tail call void @_ZNSt3__112__deque_baseINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE5clearEv(%"class.std::__1::__deque_base"* nonnull %3) #16
  %4 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 1, i32 0, i64 8
  %5 = bitcast i8* %4 to %"class.std::__1::__fs::filesystem::__dir_stream"***
  %6 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %5, align 8, !tbaa !92
  %7 = getelementptr inbounds %"struct.std::__1::__shared_ptr_emplace.40", %"struct.std::__1::__shared_ptr_emplace.40"* %0, i64 0, i32 1, i32 0, i64 16
  %8 = bitcast i8* %7 to %"class.std::__1::__fs::filesystem::__dir_stream"***
  %9 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %8, align 8, !tbaa !89
  %10 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %6, %9
  br i1 %10, label %29, label %11

11:                                               ; preds = %1, %11
  %12 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %15, %11 ], [ %6, %1 ]
  %13 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %12 to i8**
  %14 = load i8*, i8** %13, align 8, !tbaa !22
  tail call void @_ZdlPv(i8* %14) #20
  %15 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %12, i64 1
  %16 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %15, %9
  br i1 %16, label %17, label %11

17:                                               ; preds = %11
  %18 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %5, align 8, !tbaa !92
  %19 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %8, align 8, !tbaa !89
  %20 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %19, %18
  br i1 %20, label %29, label %21

21:                                               ; preds = %17
  %22 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %18 to i64
  %23 = getelementptr %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %19, i64 -1
  %24 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %23 to i64
  %25 = sub i64 %24, %22
  %26 = lshr i64 %25, 3
  %27 = xor i64 %26, -1
  %28 = getelementptr %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %19, i64 %27
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %28, %"class.std::__1::__fs::filesystem::__dir_stream"*** %8, align 8, !tbaa !89
  br label %29

29:                                               ; preds = %21, %17, %1
  %30 = bitcast %"struct.std::__1::__shared_ptr_emplace<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp, std::__1::allocator<std::__1::__fs::filesystem::recursive_directory_iterator::__shared_imp>>::_Storage"* %2 to %"class.std::__1::__fs::filesystem::__dir_stream"***
  %31 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %30, align 8, !tbaa !147
  %32 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %31, null
  br i1 %32, label %35, label %33

33:                                               ; preds = %29
  %34 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %31 to i8*
  tail call void @_ZdlPv(i8* %34) #20
  br label %35

35:                                               ; preds = %33, %29
  ret void
}

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__120__shared_ptr_emplaceINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEE21__on_zero_shared_weakEv(%"struct.std::__1::__shared_ptr_emplace.40"* %0) unnamed_addr #15 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = bitcast %"struct.std::__1::__shared_ptr_emplace.40"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #20
  ret void
}

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #17

; Function Attrs: nounwind uwtable
define linkonce_odr hidden void @_ZNSt3__112__deque_baseINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE5clearEv(%"class.std::__1::__deque_base"* %0) local_unnamed_addr #15 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::__deque_base", %"class.std::__1::__deque_base"* %0, i64 0, i32 0, i32 1
  %3 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %2, align 8, !tbaa !92
  %4 = getelementptr inbounds %"class.std::__1::__deque_base", %"class.std::__1::__deque_base"* %0, i64 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !93
  %6 = udiv i64 %5, 36
  %7 = urem i64 %5, 36
  %8 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %3, i64 %6
  %9 = getelementptr inbounds %"class.std::__1::__deque_base", %"class.std::__1::__deque_base"* %0, i64 0, i32 0, i32 2
  %10 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %9, align 8, !tbaa !89
  %11 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %10, %3
  %12 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %10 to i64
  %13 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %3 to i64
  %14 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %3 to i8**
  br i1 %11, label %15, label %17

15:                                               ; preds = %1
  %16 = getelementptr inbounds %"class.std::__1::__deque_base", %"class.std::__1::__deque_base"* %0, i64 0, i32 2, i32 0, i32 0
  br label %29

17:                                               ; preds = %1
  %18 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %8, align 8, !tbaa !22
  %19 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %18, i64 %7
  %20 = getelementptr inbounds %"class.std::__1::__deque_base", %"class.std::__1::__deque_base"* %0, i64 0, i32 2, i32 0, i32 0
  %21 = load i64, i64* %20, align 8, !tbaa !56
  %22 = add i64 %21, %5
  %23 = udiv i64 %22, 36
  %24 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %3, i64 %23
  %25 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %24, align 8, !tbaa !22
  %26 = urem i64 %22, 36
  %27 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %25, i64 %26
  %28 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"* %27, %19
  br i1 %28, label %29, label %47

29:                                               ; preds = %15, %17
  %30 = phi i64* [ %16, %15 ], [ %20, %17 ]
  %31 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %9 to i64*
  br label %38

32:                                               ; preds = %90
  %33 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %9 to i64*
  %34 = load i64, i64* %33, align 8, !tbaa !89
  %35 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %2 to i64*
  %36 = load i64, i64* %35, align 8, !tbaa !92
  %37 = inttoptr i64 %36 to i8**
  br label %38

38:                                               ; preds = %29, %32
  %39 = phi i64* [ %30, %29 ], [ %20, %32 ]
  %40 = phi i64* [ %31, %29 ], [ %33, %32 ]
  %41 = phi i8** [ %14, %29 ], [ %37, %32 ]
  %42 = phi i64 [ %13, %29 ], [ %36, %32 ]
  %43 = phi i64 [ %12, %29 ], [ %34, %32 ]
  store i64 0, i64* %39, align 8, !tbaa !56
  %44 = sub i64 %43, %42
  %45 = ashr exact i64 %44, 3
  %46 = icmp ugt i64 %45, 2
  br i1 %46, label %95, label %106

47:                                               ; preds = %17, %90
  %48 = phi %"class.std::__1::__fs::filesystem::__dir_stream"* [ %93, %90 ], [ %19, %17 ]
  %49 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %91, %90 ], [ %8, %17 ]
  %50 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 0
  %51 = load %struct.__dirstream*, %struct.__dirstream** %50, align 16, !tbaa !27
  %52 = icmp eq %struct.__dirstream* %51, null
  br i1 %52, label %61, label %53

53:                                               ; preds = %47
  %54 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %55 = load %struct.__dirstream*, %struct.__dirstream** %50, align 16, !tbaa !27
  %56 = tail call i32 @closedir(%struct.__dirstream* %55) #16
  %57 = icmp eq i32 %56, -1
  br i1 %57, label %58, label %60

58:                                               ; preds = %53
  %59 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %60

60:                                               ; preds = %58, %53
  store %struct.__dirstream* null, %struct.__dirstream** %50, align 16, !tbaa !27
  br label %61

61:                                               ; preds = %60, %47
  %62 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 2
  %63 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %62 to i8*
  %64 = load i8, i8* %63, align 8, !tbaa !42
  %65 = and i8 %64, 1
  %66 = icmp eq i8 %65, 0
  br i1 %66, label %70, label %67

67:                                               ; preds = %61
  %68 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %69 = load i8*, i8** %68, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %69) #20
  br label %70

70:                                               ; preds = %67, %61
  %71 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 1
  %72 = bitcast %"class.std::__1::__fs::filesystem::path"* %71 to i8*
  %73 = load i8, i8* %72, align 8, !tbaa !42
  %74 = and i8 %73, 1
  %75 = icmp eq i8 %74, 0
  br i1 %75, label %79, label %76

76:                                               ; preds = %70
  %77 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 0, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %78 = load i8*, i8** %77, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %78) #20
  br label %79

79:                                               ; preds = %76, %70
  %80 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %48, i64 1
  %81 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"* %80 to i64
  %82 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %49 to i64*
  %83 = load i64, i64* %82, align 8, !tbaa !22
  %84 = sub i64 %81, %83
  %85 = icmp eq i64 %84, 4032
  br i1 %85, label %86, label %90

86:                                               ; preds = %79
  %87 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %49, i64 1
  %88 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %87 to i64*
  %89 = load i64, i64* %88, align 8, !tbaa !22
  br label %90

90:                                               ; preds = %79, %86
  %91 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %87, %86 ], [ %49, %79 ]
  %92 = phi i64 [ %89, %86 ], [ %81, %79 ]
  %93 = inttoptr i64 %92 to %"class.std::__1::__fs::filesystem::__dir_stream"*
  %94 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"* %27, %93
  br i1 %94, label %32, label %47

95:                                               ; preds = %38, %95
  %96 = phi i8** [ %105, %95 ], [ %41, %38 ]
  %97 = load i8*, i8** %96, align 8, !tbaa !22
  tail call void @_ZdlPv(i8* %97) #20
  %98 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %2, align 8, !tbaa !92
  %99 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %99, %"class.std::__1::__fs::filesystem::__dir_stream"*** %2, align 8, !tbaa !92
  %100 = load i64, i64* %40, align 8, !tbaa !89
  %101 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %99 to i64
  %102 = sub i64 %100, %101
  %103 = ashr exact i64 %102, 3
  %104 = icmp ugt i64 %103, 2
  %105 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %99 to i8**
  br i1 %104, label %95, label %106

106:                                              ; preds = %95, %38
  %107 = phi i64 [ %45, %38 ], [ %103, %95 ]
  switch i64 %107, label %111 [
    i64 1, label %109
    i64 2, label %108
  ]

108:                                              ; preds = %106
  br label %109

109:                                              ; preds = %106, %108
  %110 = phi i64 [ 36, %108 ], [ 18, %106 ]
  store i64 %110, i64* %4, align 8, !tbaa !93
  br label %111

111:                                              ; preds = %109, %106
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE19__add_back_capacityEv(%"class.std::__1::deque"* %0) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::__1::__fs::filesystem::__dir_stream"*, align 8
  %3 = alloca %"class.std::__1::__fs::filesystem::__dir_stream"*, align 8
  %4 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !93
  %6 = icmp ugt i64 %5, 35
  br i1 %6, label %7, label %161

7:                                                ; preds = %1
  %8 = add i64 %5, -36
  store i64 %8, i64* %4, align 8, !tbaa !93
  %9 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 1
  %10 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %9, align 8, !tbaa !92
  %11 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %10 to i64*
  %12 = load i64, i64* %11, align 8, !tbaa !22
  %13 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %10, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %13, %"class.std::__1::__fs::filesystem::__dir_stream"*** %9, align 8, !tbaa !92
  %14 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 2
  %15 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %14, align 8, !tbaa !89
  %16 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 3, i32 0, i32 0
  %17 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %16, align 8, !tbaa !22
  %18 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %15, %17
  %19 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %17 to i64
  %20 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %15 to i64*
  br i1 %18, label %21, label %157

21:                                               ; preds = %7
  %22 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 0
  %23 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %22, align 8, !tbaa !147
  %24 = icmp ugt %"class.std::__1::__fs::filesystem::__dir_stream"** %13, %23
  %25 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %23 to i64
  br i1 %24, label %26, label %46

26:                                               ; preds = %21
  %27 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %13 to i64
  %28 = sub i64 %27, %25
  %29 = ashr exact i64 %28, 3
  %30 = add nsw i64 %29, 1
  %31 = sdiv i64 %30, -2
  %32 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %13, i64 %31
  %33 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %15 to i64
  %34 = sub i64 %33, %27
  %35 = icmp eq i64 %34, 0
  br i1 %35, label %40, label %36

36:                                               ; preds = %26
  %37 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %32 to i8*
  %38 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %13 to i8*
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %37, i8* nonnull align 8 %38, i64 %34, i1 false) #16
  %39 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %9, align 8, !tbaa !92
  br label %40

40:                                               ; preds = %36, %26
  %41 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %13, %26 ], [ %39, %36 ]
  %42 = ashr exact i64 %34, 3
  %43 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %32, i64 %42
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %43, %"class.std::__1::__fs::filesystem::__dir_stream"*** %14, align 8, !tbaa !89
  %44 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %41, i64 %31
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %44, %"class.std::__1::__fs::filesystem::__dir_stream"*** %9, align 8, !tbaa !92
  %45 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %43 to i64*
  br label %157

46:                                               ; preds = %21
  %47 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %16 to i64*
  %48 = bitcast %"class.std::__1::deque"* %0 to i64*
  %49 = sub i64 %19, %25
  %50 = ashr exact i64 %49, 2
  %51 = icmp eq i64 %49, 0
  %52 = select i1 %51, i64 1, i64 %50
  %53 = icmp ugt i64 %52, 2305843009213693951
  br i1 %53, label %54, label %55

54:                                               ; preds = %46
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
  unreachable

55:                                               ; preds = %46
  %56 = lshr i64 %52, 2
  %57 = shl nuw i64 %52, 3
  %58 = tail call noalias nonnull i8* @_Znwm(i64 %57) #19
  %59 = bitcast i8* %58 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %60 = ptrtoint i8* %58 to i64
  %61 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %59, i64 %56
  %62 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %61 to i64
  %63 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %59, i64 %52
  %64 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %63 to i64
  %65 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %13 to i64
  %66 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %15 to i64
  %67 = sub i64 %66, %65
  %68 = ashr exact i64 %67, 3
  %69 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %61, i64 %68
  %70 = icmp eq i64 %67, 0
  br i1 %70, label %146, label %71

71:                                               ; preds = %55
  %72 = add i64 %67, -8
  %73 = lshr i64 %72, 3
  %74 = add nuw nsw i64 %73, 1
  %75 = and i64 %74, 7
  %76 = icmp eq i64 %75, 0
  br i1 %76, label %92, label %77

77:                                               ; preds = %71, %77
  %78 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %85, %77 ], [ %61, %71 ]
  %79 = phi i64 [ %86, %77 ], [ %62, %71 ]
  %80 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %87, %77 ], [ %13, %71 ]
  %81 = phi i64 [ %88, %77 ], [ %75, %71 ]
  %82 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %80 to i64*
  %83 = load i64, i64* %82, align 8, !tbaa !22
  %84 = inttoptr i64 %79 to i64*
  store i64 %83, i64* %84, align 8, !tbaa !22
  %85 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %78, i64 1
  %86 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %85 to i64
  %87 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %80, i64 1
  %88 = add i64 %81, -1
  %89 = icmp eq i64 %88, 0
  br i1 %89, label %90, label %77, !llvm.loop !148

90:                                               ; preds = %77
  %91 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %85 to i64
  br label %92

92:                                               ; preds = %71, %90
  %93 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %61, %71 ], [ %85, %90 ]
  %94 = phi i64 [ %62, %71 ], [ %91, %90 ]
  %95 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %13, %71 ], [ %87, %90 ]
  %96 = icmp ult i64 %72, 56
  br i1 %96, label %143, label %97

97:                                               ; preds = %92, %97
  %98 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %139, %97 ], [ %93, %92 ]
  %99 = phi i64 [ %140, %97 ], [ %94, %92 ]
  %100 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %141, %97 ], [ %95, %92 ]
  %101 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %100 to i64*
  %102 = load i64, i64* %101, align 8, !tbaa !22
  %103 = inttoptr i64 %99 to i64*
  store i64 %102, i64* %103, align 8, !tbaa !22
  %104 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 1
  %105 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 1
  %106 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %105 to i64*
  %107 = load i64, i64* %106, align 8, !tbaa !22
  %108 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %104 to i64*
  store i64 %107, i64* %108, align 8, !tbaa !22
  %109 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 2
  %110 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 2
  %111 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %110 to i64*
  %112 = load i64, i64* %111, align 8, !tbaa !22
  %113 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %109 to i64*
  store i64 %112, i64* %113, align 8, !tbaa !22
  %114 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 3
  %115 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 3
  %116 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %115 to i64*
  %117 = load i64, i64* %116, align 8, !tbaa !22
  %118 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %114 to i64*
  store i64 %117, i64* %118, align 8, !tbaa !22
  %119 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 4
  %120 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 4
  %121 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %120 to i64*
  %122 = load i64, i64* %121, align 8, !tbaa !22
  %123 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %119 to i64*
  store i64 %122, i64* %123, align 8, !tbaa !22
  %124 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 5
  %125 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 5
  %126 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %125 to i64*
  %127 = load i64, i64* %126, align 8, !tbaa !22
  %128 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %124 to i64*
  store i64 %127, i64* %128, align 8, !tbaa !22
  %129 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 6
  %130 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 6
  %131 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %130 to i64*
  %132 = load i64, i64* %131, align 8, !tbaa !22
  %133 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %129 to i64*
  store i64 %132, i64* %133, align 8, !tbaa !22
  %134 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 7
  %135 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 7
  %136 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %135 to i64*
  %137 = load i64, i64* %136, align 8, !tbaa !22
  %138 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %134 to i64*
  store i64 %137, i64* %138, align 8, !tbaa !22
  %139 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %98, i64 8
  %140 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %139 to i64
  %141 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %100, i64 8
  %142 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %69, %139
  br i1 %142, label %143, label %97

143:                                              ; preds = %97, %92
  %144 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %69 to i64
  %145 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %22, align 8, !tbaa !22
  br label %146

146:                                              ; preds = %143, %55
  %147 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %145, %143 ], [ %23, %55 ]
  %148 = phi i64 [ %144, %143 ], [ %62, %55 ]
  store i64 %60, i64* %48, align 8, !tbaa !22
  %149 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %9 to i64*
  store i64 %62, i64* %149, align 8, !tbaa !22
  %150 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %14 to i64*
  store i64 %148, i64* %150, align 8, !tbaa !22
  store i64 %64, i64* %47, align 8, !tbaa !22
  %151 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %147, null
  %152 = inttoptr i64 %148 to i64*
  br i1 %151, label %157, label %153

153:                                              ; preds = %146
  %154 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %147 to i8*
  tail call void @_ZdlPv(i8* %154) #20
  %155 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %14 to i64**
  %156 = load i64*, i64** %155, align 8, !tbaa !89
  br label %157

157:                                              ; preds = %7, %40, %146, %153
  %158 = phi i64* [ %156, %153 ], [ %152, %146 ], [ %45, %40 ], [ %20, %7 ]
  store i64 %12, i64* %158, align 8, !tbaa !22
  %159 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %14, align 8, !tbaa !89
  %160 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %159, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %160, %"class.std::__1::__fs::filesystem::__dir_stream"*** %14, align 8, !tbaa !89
  br label %579

161:                                              ; preds = %1
  %162 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0
  %163 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 2
  %164 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %163 to i64*
  %165 = load i64, i64* %164, align 8, !tbaa !89
  %166 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 1
  %167 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %166 to i64*
  %168 = load i64, i64* %167, align 8, !tbaa !92
  %169 = sub i64 %165, %168
  %170 = ashr exact i64 %169, 3
  %171 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 3, i32 0, i32 0
  %172 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %171 to i64*
  %173 = load i64, i64* %172, align 8, !tbaa !22
  %174 = bitcast %"class.std::__1::deque"* %0 to i64*
  %175 = load i64, i64* %174, align 8, !tbaa !147
  %176 = sub i64 %173, %175
  %177 = ashr exact i64 %176, 3
  %178 = icmp ult i64 %170, %177
  %179 = inttoptr i64 %165 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %180 = inttoptr i64 %168 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  br i1 %178, label %181, label %336

181:                                              ; preds = %161
  %182 = icmp eq i64 %173, %165
  br i1 %182, label %187, label %183

183:                                              ; preds = %181
  %184 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %184) #16
  %185 = tail call noalias nonnull dereferenceable(4032) i8* @_Znwm(i64 4032) #19
  %186 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %2 to i8**
  store i8* %185, i8** %186, align 8, !tbaa !22
  call void @_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE9push_backEOS4_(%"struct.std::__1::__split_buffer"* %162, %"class.std::__1::__fs::filesystem::__dir_stream"** nonnull align 8 dereferenceable(8) %2)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %184) #16
  br label %579

187:                                              ; preds = %181
  %188 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %188) #16
  %189 = tail call noalias nonnull dereferenceable(4032) i8* @_Znwm(i64 4032) #19
  %190 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %3 to i8**
  store i8* %189, i8** %190, align 8, !tbaa !22
  call void @_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE10push_frontEOS4_(%"struct.std::__1::__split_buffer"* %162, %"class.std::__1::__fs::filesystem::__dir_stream"** nonnull align 8 dereferenceable(8) %3)
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %188) #16
  %191 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  %192 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %191 to i64*
  %193 = load i64, i64* %192, align 8, !tbaa !22
  %194 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %191, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %194, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  %195 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %163, align 8, !tbaa !89
  %196 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %171, align 8, !tbaa !22
  %197 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %195, %196
  %198 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %196 to i64
  %199 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %195 to i64*
  br i1 %197, label %200, label %332

200:                                              ; preds = %187
  %201 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 0
  %202 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %201, align 8, !tbaa !147
  %203 = icmp ugt %"class.std::__1::__fs::filesystem::__dir_stream"** %194, %202
  %204 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %202 to i64
  br i1 %203, label %205, label %225

205:                                              ; preds = %200
  %206 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %194 to i64
  %207 = sub i64 %206, %204
  %208 = ashr exact i64 %207, 3
  %209 = add nsw i64 %208, 1
  %210 = sdiv i64 %209, -2
  %211 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %194, i64 %210
  %212 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %195 to i64
  %213 = sub i64 %212, %206
  %214 = icmp eq i64 %213, 0
  br i1 %214, label %219, label %215

215:                                              ; preds = %205
  %216 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %211 to i8*
  %217 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %194 to i8*
  call void @llvm.memmove.p0i8.p0i8.i64(i8* nonnull align 8 %216, i8* nonnull align 8 %217, i64 %213, i1 false) #16
  %218 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  br label %219

219:                                              ; preds = %215, %205
  %220 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %194, %205 ], [ %218, %215 ]
  %221 = ashr exact i64 %213, 3
  %222 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %211, i64 %221
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %222, %"class.std::__1::__fs::filesystem::__dir_stream"*** %163, align 8, !tbaa !89
  %223 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %220, i64 %210
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %223, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  %224 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %222 to i64*
  br label %332

225:                                              ; preds = %200
  %226 = sub i64 %198, %204
  %227 = ashr exact i64 %226, 2
  %228 = icmp eq i64 %226, 0
  %229 = select i1 %228, i64 1, i64 %227
  %230 = icmp ugt i64 %229, 2305843009213693951
  br i1 %230, label %231, label %232

231:                                              ; preds = %225
  call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
  unreachable

232:                                              ; preds = %225
  %233 = lshr i64 %229, 2
  %234 = shl nuw i64 %229, 3
  %235 = call noalias nonnull i8* @_Znwm(i64 %234) #19
  %236 = bitcast i8* %235 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %237 = ptrtoint i8* %235 to i64
  %238 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %236, i64 %233
  %239 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %238 to i64
  %240 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %236, i64 %229
  %241 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %240 to i64
  %242 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %194 to i64
  %243 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %195 to i64
  %244 = sub i64 %243, %242
  %245 = ashr exact i64 %244, 3
  %246 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %238, i64 %245
  %247 = icmp eq i64 %244, 0
  br i1 %247, label %323, label %248

248:                                              ; preds = %232
  %249 = add i64 %244, -8
  %250 = lshr i64 %249, 3
  %251 = add nuw nsw i64 %250, 1
  %252 = and i64 %251, 7
  %253 = icmp eq i64 %252, 0
  br i1 %253, label %269, label %254

254:                                              ; preds = %248, %254
  %255 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %262, %254 ], [ %238, %248 ]
  %256 = phi i64 [ %263, %254 ], [ %239, %248 ]
  %257 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %264, %254 ], [ %194, %248 ]
  %258 = phi i64 [ %265, %254 ], [ %252, %248 ]
  %259 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %257 to i64*
  %260 = load i64, i64* %259, align 8, !tbaa !22
  %261 = inttoptr i64 %256 to i64*
  store i64 %260, i64* %261, align 8, !tbaa !22
  %262 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %255, i64 1
  %263 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %262 to i64
  %264 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %257, i64 1
  %265 = add i64 %258, -1
  %266 = icmp eq i64 %265, 0
  br i1 %266, label %267, label %254, !llvm.loop !149

267:                                              ; preds = %254
  %268 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %262 to i64
  br label %269

269:                                              ; preds = %248, %267
  %270 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %238, %248 ], [ %262, %267 ]
  %271 = phi i64 [ %239, %248 ], [ %268, %267 ]
  %272 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %194, %248 ], [ %264, %267 ]
  %273 = icmp ult i64 %249, 56
  br i1 %273, label %320, label %274

274:                                              ; preds = %269, %274
  %275 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %316, %274 ], [ %270, %269 ]
  %276 = phi i64 [ %317, %274 ], [ %271, %269 ]
  %277 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %318, %274 ], [ %272, %269 ]
  %278 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %277 to i64*
  %279 = load i64, i64* %278, align 8, !tbaa !22
  %280 = inttoptr i64 %276 to i64*
  store i64 %279, i64* %280, align 8, !tbaa !22
  %281 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 1
  %282 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 1
  %283 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %282 to i64*
  %284 = load i64, i64* %283, align 8, !tbaa !22
  %285 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %281 to i64*
  store i64 %284, i64* %285, align 8, !tbaa !22
  %286 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 2
  %287 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 2
  %288 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %287 to i64*
  %289 = load i64, i64* %288, align 8, !tbaa !22
  %290 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %286 to i64*
  store i64 %289, i64* %290, align 8, !tbaa !22
  %291 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 3
  %292 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 3
  %293 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %292 to i64*
  %294 = load i64, i64* %293, align 8, !tbaa !22
  %295 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %291 to i64*
  store i64 %294, i64* %295, align 8, !tbaa !22
  %296 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 4
  %297 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 4
  %298 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %297 to i64*
  %299 = load i64, i64* %298, align 8, !tbaa !22
  %300 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %296 to i64*
  store i64 %299, i64* %300, align 8, !tbaa !22
  %301 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 5
  %302 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 5
  %303 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %302 to i64*
  %304 = load i64, i64* %303, align 8, !tbaa !22
  %305 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %301 to i64*
  store i64 %304, i64* %305, align 8, !tbaa !22
  %306 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 6
  %307 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 6
  %308 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %307 to i64*
  %309 = load i64, i64* %308, align 8, !tbaa !22
  %310 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %306 to i64*
  store i64 %309, i64* %310, align 8, !tbaa !22
  %311 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 7
  %312 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 7
  %313 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %312 to i64*
  %314 = load i64, i64* %313, align 8, !tbaa !22
  %315 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %311 to i64*
  store i64 %314, i64* %315, align 8, !tbaa !22
  %316 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %275, i64 8
  %317 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %316 to i64
  %318 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %277, i64 8
  %319 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %246, %316
  br i1 %319, label %320, label %274

320:                                              ; preds = %274, %269
  %321 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %246 to i64
  %322 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %201, align 8, !tbaa !22
  br label %323

323:                                              ; preds = %320, %232
  %324 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %322, %320 ], [ %202, %232 ]
  %325 = phi i64 [ %321, %320 ], [ %239, %232 ]
  store i64 %237, i64* %174, align 8, !tbaa !22
  store i64 %239, i64* %167, align 8, !tbaa !22
  store i64 %325, i64* %164, align 8, !tbaa !22
  store i64 %241, i64* %172, align 8, !tbaa !22
  %326 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %324, null
  %327 = inttoptr i64 %325 to i64*
  br i1 %326, label %332, label %328

328:                                              ; preds = %323
  %329 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %324 to i8*
  call void @_ZdlPv(i8* %329) #20
  %330 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %163 to i64**
  %331 = load i64*, i64** %330, align 8, !tbaa !89
  br label %332

332:                                              ; preds = %187, %219, %323, %328
  %333 = phi i64* [ %331, %328 ], [ %327, %323 ], [ %224, %219 ], [ %199, %187 ]
  store i64 %193, i64* %333, align 8, !tbaa !22
  %334 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %163, align 8, !tbaa !89
  %335 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %334, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %335, %"class.std::__1::__fs::filesystem::__dir_stream"*** %163, align 8, !tbaa !89
  br label %579

336:                                              ; preds = %161
  %337 = ashr exact i64 %176, 2
  %338 = icmp eq i64 %176, 0
  %339 = select i1 %338, i64 1, i64 %337
  %340 = icmp ugt i64 %339, 2305843009213693951
  br i1 %340, label %341, label %342

341:                                              ; preds = %336
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
  unreachable

342:                                              ; preds = %336
  %343 = shl nuw i64 %339, 3
  %344 = tail call noalias nonnull i8* @_Znwm(i64 %343) #19
  %345 = bitcast i8* %344 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %346 = ptrtoint i8* %344 to i64
  %347 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %345, i64 %170
  %348 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %347 to i64
  %349 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %345, i64 %339
  %350 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %349 to i64
  %351 = invoke noalias nonnull dereferenceable(4032) i8* @_Znwm(i64 4032) #19
          to label %352 unwind label %408

352:                                              ; preds = %342
  %353 = ptrtoint i8* %351 to i64
  %354 = icmp eq i64 %170, %339
  br i1 %354, label %355, label %385

355:                                              ; preds = %352
  %356 = icmp ugt %"class.std::__1::__fs::filesystem::__dir_stream"** %347, %345
  br i1 %356, label %357, label %364

357:                                              ; preds = %355
  %358 = sub i64 %348, %346
  %359 = ashr exact i64 %358, 3
  %360 = add nsw i64 %359, 1
  %361 = sdiv i64 %360, -2
  %362 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %347, i64 %361
  %363 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %362 to i64
  br label %385

364:                                              ; preds = %355
  %365 = sub i64 %350, %346
  %366 = ashr exact i64 %365, 2
  %367 = icmp eq i64 %365, 0
  %368 = select i1 %367, i64 1, i64 %366
  %369 = icmp ugt i64 %368, 2305843009213693951
  br i1 %369, label %370, label %372

370:                                              ; preds = %364
  invoke void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
          to label %371 unwind label %560

371:                                              ; preds = %370
  unreachable

372:                                              ; preds = %364
  %373 = shl nuw i64 %368, 3
  %374 = invoke noalias nonnull i8* @_Znwm(i64 %373) #19
          to label %375 unwind label %560

375:                                              ; preds = %372
  %376 = lshr i64 %368, 2
  %377 = bitcast i8* %374 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %378 = ptrtoint i8* %374 to i64
  %379 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %377, i64 %376
  %380 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %379 to i64
  %381 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %377, i64 %368
  %382 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %381 to i64
  tail call void @_ZdlPv(i8* nonnull %344) #20
  %383 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %163, align 8, !tbaa !89
  %384 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  br label %385

385:                                              ; preds = %375, %357, %352
  %386 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %180, %357 ], [ %384, %375 ], [ %180, %352 ]
  %387 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %179, %357 ], [ %383, %375 ], [ %179, %352 ]
  %388 = phi i64 [ %346, %357 ], [ %378, %375 ], [ %346, %352 ]
  %389 = phi i64 [ %363, %357 ], [ %380, %375 ], [ %348, %352 ]
  %390 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %362, %357 ], [ %379, %375 ], [ %347, %352 ]
  %391 = phi i64 [ %350, %357 ], [ %382, %375 ], [ %350, %352 ]
  %392 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %390 to i64*
  store i64 %353, i64* %392, align 8, !tbaa !22
  %393 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %390, i64 1
  %394 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %393 to i64
  %395 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %387, %386
  br i1 %395, label %398, label %412

396:                                              ; preds = %544
  %397 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %549 to i64
  br label %398

398:                                              ; preds = %396, %385
  %399 = phi i64 [ %388, %385 ], [ %545, %396 ]
  %400 = phi i64 [ %389, %385 ], [ %397, %396 ]
  %401 = phi i64 [ %394, %385 ], [ %546, %396 ]
  %402 = phi i64 [ %391, %385 ], [ %547, %396 ]
  %403 = getelementptr %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 0
  %404 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %403, align 8, !tbaa !22
  store i64 %399, i64* %174, align 8, !tbaa !22
  store i64 %400, i64* %167, align 8, !tbaa !22
  store i64 %401, i64* %164, align 8, !tbaa !22
  store i64 %402, i64* %172, align 8, !tbaa !22
  %405 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %404, null
  br i1 %405, label %579, label %406

406:                                              ; preds = %398
  %407 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %404 to i8*
  tail call void @_ZdlPv(i8* %407) #20
  br label %579

408:                                              ; preds = %342
  %409 = landingpad { i8*, i32 }
          cleanup
  %410 = extractvalue { i8*, i32 } %409, 0
  %411 = extractvalue { i8*, i32 } %409, 1
  br label %569

412:                                              ; preds = %385, %544
  %413 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %418, %544 ], [ %387, %385 ]
  %414 = phi i64 [ %547, %544 ], [ %391, %385 ]
  %415 = phi i64 [ %546, %544 ], [ %394, %385 ]
  %416 = phi i64 [ %553, %544 ], [ %389, %385 ]
  %417 = phi i64 [ %545, %544 ], [ %388, %385 ]
  %418 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %413, i64 -1
  %419 = inttoptr i64 %416 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %420 = inttoptr i64 %417 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %421 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %419, %420
  br i1 %421, label %422, label %544

422:                                              ; preds = %412
  %423 = inttoptr i64 %415 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %424 = inttoptr i64 %414 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %425 = icmp ult %"class.std::__1::__fs::filesystem::__dir_stream"** %423, %424
  br i1 %425, label %426, label %443

426:                                              ; preds = %422
  %427 = sub i64 %414, %415
  %428 = ashr exact i64 %427, 3
  %429 = add nsw i64 %428, 1
  %430 = sdiv i64 %429, 2
  %431 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %423, i64 %430
  %432 = sub i64 %415, %416
  %433 = icmp eq i64 %432, 0
  br i1 %433, label %440, label %434

434:                                              ; preds = %426
  %435 = ashr exact i64 %432, 3
  %436 = sub nsw i64 0, %435
  %437 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %431, i64 %436
  %438 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %437 to i8*
  %439 = inttoptr i64 %416 to i8*
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %438, i8* align 8 %439, i64 %432, i1 false) #16
  br label %440

440:                                              ; preds = %434, %426
  %441 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %437, %434 ], [ %431, %426 ]
  %442 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %431 to i64
  br label %544

443:                                              ; preds = %422
  %444 = sub i64 %414, %417
  %445 = ashr exact i64 %444, 2
  %446 = icmp eq i64 %444, 0
  %447 = select i1 %446, i64 1, i64 %445
  %448 = icmp ugt i64 %447, 2305843009213693951
  br i1 %448, label %449, label %451

449:                                              ; preds = %443
  invoke void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
          to label %450 unwind label %558

450:                                              ; preds = %449
  unreachable

451:                                              ; preds = %443
  %452 = shl nuw i64 %447, 3
  %453 = invoke noalias nonnull i8* @_Znwm(i64 %452) #19
          to label %454 unwind label %556

454:                                              ; preds = %451
  %455 = add nuw nsw i64 %447, 3
  %456 = lshr i64 %455, 2
  %457 = bitcast i8* %453 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %458 = ptrtoint i8* %453 to i64
  %459 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %457, i64 %456
  %460 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %459 to i64
  %461 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %457, i64 %447
  %462 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %461 to i64
  %463 = sub i64 %415, %416
  %464 = ashr exact i64 %463, 3
  %465 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %459, i64 %464
  %466 = icmp eq i64 %463, 0
  br i1 %466, label %541, label %467

467:                                              ; preds = %454
  %468 = add i64 %463, -8
  %469 = lshr i64 %468, 3
  %470 = add nuw nsw i64 %469, 1
  %471 = and i64 %470, 7
  %472 = icmp eq i64 %471, 0
  br i1 %472, label %488, label %473

473:                                              ; preds = %467, %473
  %474 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %481, %473 ], [ %459, %467 ]
  %475 = phi i64 [ %482, %473 ], [ %460, %467 ]
  %476 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %483, %473 ], [ %419, %467 ]
  %477 = phi i64 [ %484, %473 ], [ %471, %467 ]
  %478 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %476 to i64*
  %479 = load i64, i64* %478, align 8, !tbaa !22
  %480 = inttoptr i64 %475 to i64*
  store i64 %479, i64* %480, align 8, !tbaa !22
  %481 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %474, i64 1
  %482 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %481 to i64
  %483 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %476, i64 1
  %484 = add i64 %477, -1
  %485 = icmp eq i64 %484, 0
  br i1 %485, label %486, label %473, !llvm.loop !150

486:                                              ; preds = %473
  %487 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %481 to i64
  br label %488

488:                                              ; preds = %467, %486
  %489 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %459, %467 ], [ %481, %486 ]
  %490 = phi i64 [ %460, %467 ], [ %487, %486 ]
  %491 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %419, %467 ], [ %483, %486 ]
  %492 = icmp ult i64 %468, 56
  br i1 %492, label %539, label %493

493:                                              ; preds = %488, %493
  %494 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %535, %493 ], [ %489, %488 ]
  %495 = phi i64 [ %536, %493 ], [ %490, %488 ]
  %496 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %537, %493 ], [ %491, %488 ]
  %497 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %496 to i64*
  %498 = load i64, i64* %497, align 8, !tbaa !22
  %499 = inttoptr i64 %495 to i64*
  store i64 %498, i64* %499, align 8, !tbaa !22
  %500 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 1
  %501 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 1
  %502 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %501 to i64*
  %503 = load i64, i64* %502, align 8, !tbaa !22
  %504 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %500 to i64*
  store i64 %503, i64* %504, align 8, !tbaa !22
  %505 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 2
  %506 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 2
  %507 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %506 to i64*
  %508 = load i64, i64* %507, align 8, !tbaa !22
  %509 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %505 to i64*
  store i64 %508, i64* %509, align 8, !tbaa !22
  %510 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 3
  %511 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 3
  %512 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %511 to i64*
  %513 = load i64, i64* %512, align 8, !tbaa !22
  %514 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %510 to i64*
  store i64 %513, i64* %514, align 8, !tbaa !22
  %515 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 4
  %516 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 4
  %517 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %516 to i64*
  %518 = load i64, i64* %517, align 8, !tbaa !22
  %519 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %515 to i64*
  store i64 %518, i64* %519, align 8, !tbaa !22
  %520 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 5
  %521 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 5
  %522 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %521 to i64*
  %523 = load i64, i64* %522, align 8, !tbaa !22
  %524 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %520 to i64*
  store i64 %523, i64* %524, align 8, !tbaa !22
  %525 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 6
  %526 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 6
  %527 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %526 to i64*
  %528 = load i64, i64* %527, align 8, !tbaa !22
  %529 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %525 to i64*
  store i64 %528, i64* %529, align 8, !tbaa !22
  %530 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 7
  %531 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 7
  %532 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %531 to i64*
  %533 = load i64, i64* %532, align 8, !tbaa !22
  %534 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %530 to i64*
  store i64 %533, i64* %534, align 8, !tbaa !22
  %535 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %494, i64 8
  %536 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %535 to i64
  %537 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %496, i64 8
  %538 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %465, %535
  br i1 %538, label %539, label %493

539:                                              ; preds = %493, %488
  %540 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %465 to i64
  br label %541

541:                                              ; preds = %454, %539
  %542 = phi i64 [ %540, %539 ], [ %460, %454 ]
  %543 = inttoptr i64 %416 to i8*
  tail call void @_ZdlPv(i8* %543) #20
  br label %544

544:                                              ; preds = %412, %440, %541
  %545 = phi i64 [ %417, %440 ], [ %458, %541 ], [ %417, %412 ]
  %546 = phi i64 [ %442, %440 ], [ %542, %541 ], [ %415, %412 ]
  %547 = phi i64 [ %414, %440 ], [ %462, %541 ], [ %414, %412 ]
  %548 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %441, %440 ], [ %459, %541 ], [ %419, %412 ]
  %549 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %548, i64 -1
  %550 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %418 to i64*
  %551 = load i64, i64* %550, align 8, !tbaa !22
  %552 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %549 to i64*
  store i64 %551, i64* %552, align 8, !tbaa !22
  %553 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %549 to i64
  %554 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %166, align 8, !tbaa !92
  %555 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %418, %554
  br i1 %555, label %396, label %412

556:                                              ; preds = %451
  %557 = landingpad { i8*, i32 }
          cleanup
  br label %564

558:                                              ; preds = %449
  %559 = landingpad { i8*, i32 }
          cleanup
  br label %564

560:                                              ; preds = %372, %370
  %561 = landingpad { i8*, i32 }
          cleanup
  %562 = extractvalue { i8*, i32 } %561, 0
  %563 = extractvalue { i8*, i32 } %561, 1
  tail call void @_ZdlPv(i8* nonnull %351) #20
  br label %569

564:                                              ; preds = %556, %558
  %565 = phi { i8*, i32 } [ %557, %556 ], [ %559, %558 ]
  %566 = extractvalue { i8*, i32 } %565, 0
  %567 = extractvalue { i8*, i32 } %565, 1
  %568 = icmp eq i64 %417, 0
  br i1 %568, label %574, label %569

569:                                              ; preds = %560, %408, %564
  %570 = phi i32 [ %567, %564 ], [ %563, %560 ], [ %411, %408 ]
  %571 = phi i8* [ %566, %564 ], [ %562, %560 ], [ %410, %408 ]
  %572 = phi i64 [ %417, %564 ], [ %346, %560 ], [ %346, %408 ]
  %573 = inttoptr i64 %572 to i8*
  tail call void @_ZdlPv(i8* %573) #20
  br label %574

574:                                              ; preds = %564, %569
  %575 = phi i32 [ %567, %564 ], [ %570, %569 ]
  %576 = phi i8* [ %566, %564 ], [ %571, %569 ]
  %577 = insertvalue { i8*, i32 } undef, i8* %576, 0
  %578 = insertvalue { i8*, i32 } %577, i32 %575, 1
  resume { i8*, i32 } %578

579:                                              ; preds = %406, %398, %332, %183, %157
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE9push_backEOS4_(%"struct.std::__1::__split_buffer"* %0, %"class.std::__1::__fs::filesystem::__dir_stream"** nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 2
  %4 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !89
  %5 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 3, i32 0, i32 0
  %6 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %5, align 8, !tbaa !22
  %7 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %4, %6
  %8 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %6 to i64
  %9 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i64*
  br i1 %7, label %10, label %148

10:                                               ; preds = %2
  %11 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 1
  %12 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %11, align 8, !tbaa !92
  %13 = getelementptr %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 0
  %14 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %13, align 8, !tbaa !147
  %15 = icmp ugt %"class.std::__1::__fs::filesystem::__dir_stream"** %12, %14
  %16 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %14 to i64
  br i1 %15, label %17, label %37

17:                                               ; preds = %10
  %18 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %12 to i64
  %19 = sub i64 %18, %16
  %20 = ashr exact i64 %19, 3
  %21 = add nsw i64 %20, 1
  %22 = sdiv i64 %21, -2
  %23 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %12, i64 %22
  %24 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i64
  %25 = sub i64 %24, %18
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %31, label %27

27:                                               ; preds = %17
  %28 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %23 to i8*
  %29 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %12 to i8*
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %28, i8* align 8 %29, i64 %25, i1 false) #16
  %30 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %11, align 8, !tbaa !92
  br label %31

31:                                               ; preds = %17, %27
  %32 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %12, %17 ], [ %30, %27 ]
  %33 = ashr exact i64 %25, 3
  %34 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %23, i64 %33
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %34, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !89
  %35 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %32, i64 %22
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %35, %"class.std::__1::__fs::filesystem::__dir_stream"*** %11, align 8, !tbaa !92
  %36 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %34 to i64*
  br label %148

37:                                               ; preds = %10
  %38 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %5 to i64*
  %39 = bitcast %"struct.std::__1::__split_buffer"* %0 to i64*
  %40 = sub i64 %8, %16
  %41 = ashr exact i64 %40, 2
  %42 = icmp eq i64 %40, 0
  %43 = select i1 %42, i64 1, i64 %41
  %44 = icmp ugt i64 %43, 2305843009213693951
  br i1 %44, label %45, label %46

45:                                               ; preds = %37
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
  unreachable

46:                                               ; preds = %37
  %47 = lshr i64 %43, 2
  %48 = shl nuw i64 %43, 3
  %49 = tail call noalias nonnull i8* @_Znwm(i64 %48) #19
  %50 = bitcast i8* %49 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %51 = ptrtoint i8* %49 to i64
  %52 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %50, i64 %47
  %53 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %52 to i64
  %54 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %50, i64 %43
  %55 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %54 to i64
  %56 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %12 to i64
  %57 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i64
  %58 = sub i64 %57, %56
  %59 = ashr exact i64 %58, 3
  %60 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %52, i64 %59
  %61 = icmp eq i64 %58, 0
  br i1 %61, label %137, label %62

62:                                               ; preds = %46
  %63 = add i64 %58, -8
  %64 = lshr i64 %63, 3
  %65 = add nuw nsw i64 %64, 1
  %66 = and i64 %65, 7
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %83, label %68

68:                                               ; preds = %62, %68
  %69 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %76, %68 ], [ %52, %62 ]
  %70 = phi i64 [ %77, %68 ], [ %53, %62 ]
  %71 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %78, %68 ], [ %12, %62 ]
  %72 = phi i64 [ %79, %68 ], [ %66, %62 ]
  %73 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %71 to i64*
  %74 = load i64, i64* %73, align 8, !tbaa !22
  %75 = inttoptr i64 %70 to i64*
  store i64 %74, i64* %75, align 8, !tbaa !22
  %76 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %69, i64 1
  %77 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %76 to i64
  %78 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %71, i64 1
  %79 = add i64 %72, -1
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %81, label %68, !llvm.loop !151

81:                                               ; preds = %68
  %82 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %76 to i64
  br label %83

83:                                               ; preds = %62, %81
  %84 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %52, %62 ], [ %76, %81 ]
  %85 = phi i64 [ %53, %62 ], [ %82, %81 ]
  %86 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %12, %62 ], [ %78, %81 ]
  %87 = icmp ult i64 %63, 56
  br i1 %87, label %134, label %88

88:                                               ; preds = %83, %88
  %89 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %130, %88 ], [ %84, %83 ]
  %90 = phi i64 [ %131, %88 ], [ %85, %83 ]
  %91 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %132, %88 ], [ %86, %83 ]
  %92 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %91 to i64*
  %93 = load i64, i64* %92, align 8, !tbaa !22
  %94 = inttoptr i64 %90 to i64*
  store i64 %93, i64* %94, align 8, !tbaa !22
  %95 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 1
  %96 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 1
  %97 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %96 to i64*
  %98 = load i64, i64* %97, align 8, !tbaa !22
  %99 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %95 to i64*
  store i64 %98, i64* %99, align 8, !tbaa !22
  %100 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 2
  %101 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 2
  %102 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %101 to i64*
  %103 = load i64, i64* %102, align 8, !tbaa !22
  %104 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %100 to i64*
  store i64 %103, i64* %104, align 8, !tbaa !22
  %105 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 3
  %106 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 3
  %107 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %106 to i64*
  %108 = load i64, i64* %107, align 8, !tbaa !22
  %109 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %105 to i64*
  store i64 %108, i64* %109, align 8, !tbaa !22
  %110 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 4
  %111 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 4
  %112 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %111 to i64*
  %113 = load i64, i64* %112, align 8, !tbaa !22
  %114 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %110 to i64*
  store i64 %113, i64* %114, align 8, !tbaa !22
  %115 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 5
  %116 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 5
  %117 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %116 to i64*
  %118 = load i64, i64* %117, align 8, !tbaa !22
  %119 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %115 to i64*
  store i64 %118, i64* %119, align 8, !tbaa !22
  %120 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 6
  %121 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 6
  %122 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %121 to i64*
  %123 = load i64, i64* %122, align 8, !tbaa !22
  %124 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %120 to i64*
  store i64 %123, i64* %124, align 8, !tbaa !22
  %125 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 7
  %126 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 7
  %127 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %126 to i64*
  %128 = load i64, i64* %127, align 8, !tbaa !22
  %129 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %125 to i64*
  store i64 %128, i64* %129, align 8, !tbaa !22
  %130 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %89, i64 8
  %131 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %130 to i64
  %132 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %91, i64 8
  %133 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %60, %130
  br i1 %133, label %134, label %88

134:                                              ; preds = %88, %83
  %135 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %60 to i64
  %136 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %13, align 8, !tbaa !22
  br label %137

137:                                              ; preds = %134, %46
  %138 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %136, %134 ], [ %14, %46 ]
  %139 = phi i64 [ %135, %134 ], [ %53, %46 ]
  store i64 %51, i64* %39, align 8, !tbaa !22
  %140 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %11 to i64*
  store i64 %53, i64* %140, align 8, !tbaa !22
  %141 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %3 to i64*
  store i64 %139, i64* %141, align 8, !tbaa !22
  store i64 %55, i64* %38, align 8, !tbaa !22
  %142 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %138, null
  %143 = inttoptr i64 %139 to i64*
  br i1 %142, label %148, label %144

144:                                              ; preds = %137
  %145 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %138 to i8*
  tail call void @_ZdlPv(i8* %145) #20
  %146 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %3 to i64**
  %147 = load i64*, i64** %146, align 8, !tbaa !89
  br label %148

148:                                              ; preds = %144, %137, %31, %2
  %149 = phi i64* [ %147, %144 ], [ %143, %137 ], [ %36, %31 ], [ %9, %2 ]
  %150 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %1 to i64*
  %151 = load i64, i64* %150, align 8, !tbaa !22
  store i64 %151, i64* %149, align 8, !tbaa !22
  %152 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !89
  %153 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %152, i64 1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %153, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !89
  ret void
}

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEE10push_frontEOS4_(%"struct.std::__1::__split_buffer"* %0, %"class.std::__1::__fs::filesystem::__dir_stream"** nonnull align 8 dereferenceable(8) %1) local_unnamed_addr #0 comdat align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 1
  %4 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !92
  %5 = getelementptr %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 0
  %6 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %5, align 8, !tbaa !147
  %7 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %4, %6
  %8 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %6 to i64
  br i1 %7, label %9, label %147

9:                                                ; preds = %2
  %10 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 2
  %11 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %10, align 8, !tbaa !89
  %12 = getelementptr inbounds %"struct.std::__1::__split_buffer", %"struct.std::__1::__split_buffer"* %0, i64 0, i32 3, i32 0, i32 0
  %13 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %12, align 8, !tbaa !22
  %14 = icmp ult %"class.std::__1::__fs::filesystem::__dir_stream"** %11, %13
  %15 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %12 to i64*
  %16 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %13 to i64
  br i1 %14, label %17, label %38

17:                                               ; preds = %9
  %18 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %11 to i64
  %19 = sub i64 %16, %18
  %20 = ashr exact i64 %19, 3
  %21 = add nsw i64 %20, 1
  %22 = sdiv i64 %21, 2
  %23 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %11, i64 %22
  %24 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i64
  %25 = sub i64 %18, %24
  %26 = icmp eq i64 %25, 0
  br i1 %26, label %34, label %27

27:                                               ; preds = %17
  %28 = ashr exact i64 %25, 3
  %29 = sub nsw i64 0, %28
  %30 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %23, i64 %29
  %31 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %30 to i8*
  %32 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i8*
  tail call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %31, i8* align 8 %32, i64 %25, i1 false) #16
  %33 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %10, align 8, !tbaa !89
  br label %34

34:                                               ; preds = %17, %27
  %35 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %33, %27 ], [ %11, %17 ]
  %36 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %30, %27 ], [ %23, %17 ]
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %36, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !92
  %37 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %35, i64 %22
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %37, %"class.std::__1::__fs::filesystem::__dir_stream"*** %10, align 8, !tbaa !89
  br label %147

38:                                               ; preds = %9
  %39 = bitcast %"struct.std::__1::__split_buffer"* %0 to i64*
  %40 = sub i64 %16, %8
  %41 = ashr exact i64 %40, 2
  %42 = icmp eq i64 %40, 0
  %43 = select i1 %42, i64 1, i64 %41
  %44 = icmp ugt i64 %43, 2305843009213693951
  br i1 %44, label %45, label %46

45:                                               ; preds = %38
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([68 x i8], [68 x i8]* @.str.8, i64 0, i64 0)) #21
  unreachable

46:                                               ; preds = %38
  %47 = add nuw nsw i64 %43, 3
  %48 = lshr i64 %47, 2
  %49 = shl nuw i64 %43, 3
  %50 = tail call noalias nonnull i8* @_Znwm(i64 %49) #19
  %51 = bitcast i8* %50 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %52 = ptrtoint i8* %50 to i64
  %53 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %51, i64 %48
  %54 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %53 to i64
  %55 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %51, i64 %43
  %56 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %55 to i64
  %57 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %4 to i64
  %58 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %11 to i64
  %59 = sub i64 %58, %57
  %60 = ashr exact i64 %59, 3
  %61 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %53, i64 %60
  %62 = icmp eq i64 %59, 0
  br i1 %62, label %138, label %63

63:                                               ; preds = %46
  %64 = add i64 %59, -8
  %65 = lshr i64 %64, 3
  %66 = add nuw nsw i64 %65, 1
  %67 = and i64 %66, 7
  %68 = icmp eq i64 %67, 0
  br i1 %68, label %84, label %69

69:                                               ; preds = %63, %69
  %70 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %77, %69 ], [ %53, %63 ]
  %71 = phi i64 [ %78, %69 ], [ %54, %63 ]
  %72 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %79, %69 ], [ %4, %63 ]
  %73 = phi i64 [ %80, %69 ], [ %67, %63 ]
  %74 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %72 to i64*
  %75 = load i64, i64* %74, align 8, !tbaa !22
  %76 = inttoptr i64 %71 to i64*
  store i64 %75, i64* %76, align 8, !tbaa !22
  %77 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %70, i64 1
  %78 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %77 to i64
  %79 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %72, i64 1
  %80 = add i64 %73, -1
  %81 = icmp eq i64 %80, 0
  br i1 %81, label %82, label %69, !llvm.loop !152

82:                                               ; preds = %69
  %83 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %77 to i64
  br label %84

84:                                               ; preds = %63, %82
  %85 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %53, %63 ], [ %77, %82 ]
  %86 = phi i64 [ %54, %63 ], [ %83, %82 ]
  %87 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %4, %63 ], [ %79, %82 ]
  %88 = icmp ult i64 %64, 56
  br i1 %88, label %135, label %89

89:                                               ; preds = %84, %89
  %90 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %131, %89 ], [ %85, %84 ]
  %91 = phi i64 [ %132, %89 ], [ %86, %84 ]
  %92 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %133, %89 ], [ %87, %84 ]
  %93 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %92 to i64*
  %94 = load i64, i64* %93, align 8, !tbaa !22
  %95 = inttoptr i64 %91 to i64*
  store i64 %94, i64* %95, align 8, !tbaa !22
  %96 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 1
  %97 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 1
  %98 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %97 to i64*
  %99 = load i64, i64* %98, align 8, !tbaa !22
  %100 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %96 to i64*
  store i64 %99, i64* %100, align 8, !tbaa !22
  %101 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 2
  %102 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 2
  %103 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %102 to i64*
  %104 = load i64, i64* %103, align 8, !tbaa !22
  %105 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %101 to i64*
  store i64 %104, i64* %105, align 8, !tbaa !22
  %106 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 3
  %107 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 3
  %108 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %107 to i64*
  %109 = load i64, i64* %108, align 8, !tbaa !22
  %110 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %106 to i64*
  store i64 %109, i64* %110, align 8, !tbaa !22
  %111 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 4
  %112 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 4
  %113 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %112 to i64*
  %114 = load i64, i64* %113, align 8, !tbaa !22
  %115 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %111 to i64*
  store i64 %114, i64* %115, align 8, !tbaa !22
  %116 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 5
  %117 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 5
  %118 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %117 to i64*
  %119 = load i64, i64* %118, align 8, !tbaa !22
  %120 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %116 to i64*
  store i64 %119, i64* %120, align 8, !tbaa !22
  %121 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 6
  %122 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 6
  %123 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %122 to i64*
  %124 = load i64, i64* %123, align 8, !tbaa !22
  %125 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %121 to i64*
  store i64 %124, i64* %125, align 8, !tbaa !22
  %126 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 7
  %127 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 7
  %128 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %127 to i64*
  %129 = load i64, i64* %128, align 8, !tbaa !22
  %130 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %126 to i64*
  store i64 %129, i64* %130, align 8, !tbaa !22
  %131 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %90, i64 8
  %132 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %131 to i64
  %133 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %92, i64 8
  %134 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %61, %131
  br i1 %134, label %135, label %89

135:                                              ; preds = %89, %84
  %136 = ptrtoint %"class.std::__1::__fs::filesystem::__dir_stream"** %61 to i64
  %137 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %5, align 8, !tbaa !22
  br label %138

138:                                              ; preds = %135, %46
  %139 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %137, %135 ], [ %4, %46 ]
  %140 = phi i64 [ %136, %135 ], [ %54, %46 ]
  store i64 %52, i64* %39, align 8, !tbaa !22
  %141 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %3 to i64*
  store i64 %54, i64* %141, align 8, !tbaa !22
  %142 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %10 to i64*
  store i64 %140, i64* %142, align 8, !tbaa !22
  store i64 %56, i64* %15, align 8, !tbaa !22
  %143 = icmp eq %"class.std::__1::__fs::filesystem::__dir_stream"** %139, null
  br i1 %143, label %147, label %144

144:                                              ; preds = %138
  %145 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %139 to i8*
  tail call void @_ZdlPv(i8* %145) #20
  %146 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !92
  br label %147

147:                                              ; preds = %144, %138, %34, %2
  %148 = phi %"class.std::__1::__fs::filesystem::__dir_stream"** [ %146, %144 ], [ %53, %138 ], [ %36, %34 ], [ %4, %2 ]
  %149 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %148, i64 -1
  %150 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %1 to i64*
  %151 = load i64, i64* %150, align 8, !tbaa !22
  %152 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %149 to i64*
  store i64 %151, i64* %152, align 8, !tbaa !22
  %153 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !92
  %154 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %153, i64 -1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %154, %"class.std::__1::__fs::filesystem::__dir_stream"*** %3, align 8, !tbaa !92
  ret void
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i1 immarg) #1

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEE8pop_backEv(%"class.std::__1::deque"* %0) local_unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %2 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 2, i32 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa !56
  %4 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 1
  %5 = load i64, i64* %4, align 8, !tbaa !93
  %6 = add i64 %3, -1
  %7 = add i64 %6, %5
  %8 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 1
  %9 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %8, align 8, !tbaa !92
  %10 = udiv i64 %7, 36
  %11 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %9, i64 %10
  %12 = load %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %11, align 8, !tbaa !22
  %13 = urem i64 %7, 36
  %14 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %12, i64 %13, i32 0
  %15 = load %struct.__dirstream*, %struct.__dirstream** %14, align 16, !tbaa !27
  %16 = icmp eq %struct.__dirstream* %15, null
  br i1 %16, label %25, label %17

17:                                               ; preds = %1
  %18 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__115system_categoryEv() #16
  %19 = load %struct.__dirstream*, %struct.__dirstream** %14, align 16, !tbaa !27
  %20 = tail call i32 @closedir(%struct.__dirstream* %19) #16
  %21 = icmp eq i32 %20, -1
  br i1 %21, label %22, label %24

22:                                               ; preds = %17
  %23 = tail call nonnull align 8 dereferenceable(8) %"class.std::__1::error_category"* @_ZNSt3__116generic_categoryEv() #16
  br label %24

24:                                               ; preds = %22, %17
  store %struct.__dirstream* null, %struct.__dirstream** %14, align 16, !tbaa !27
  br label %25

25:                                               ; preds = %24, %1
  %26 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %12, i64 %13, i32 2
  %27 = bitcast %"class.std::__1::__fs::filesystem::directory_entry"* %26 to i8*
  %28 = load i8, i8* %27, align 8, !tbaa !42
  %29 = and i8 %28, 1
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %34, label %31

31:                                               ; preds = %25
  %32 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %12, i64 %13, i32 2, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %33 = load i8*, i8** %32, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %33) #20
  br label %34

34:                                               ; preds = %31, %25
  %35 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %12, i64 %13, i32 1
  %36 = bitcast %"class.std::__1::__fs::filesystem::path"* %35 to i8*
  %37 = load i8, i8* %36, align 8, !tbaa !42
  %38 = and i8 %37, 1
  %39 = icmp eq i8 %38, 0
  br i1 %39, label %43, label %40

40:                                               ; preds = %34
  %41 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream", %"class.std::__1::__fs::filesystem::__dir_stream"* %12, i64 %13, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %42 = load i8*, i8** %41, align 8, !tbaa !42
  tail call void @_ZdlPv(i8* %42) #20
  br label %43

43:                                               ; preds = %34, %40
  %44 = load i64, i64* %2, align 8, !tbaa !56
  %45 = add i64 %44, -1
  store i64 %45, i64* %2, align 8, !tbaa !56
  %46 = getelementptr inbounds %"class.std::__1::deque", %"class.std::__1::deque"* %0, i64 0, i32 0, i32 0, i32 2
  %47 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %46 to i64*
  %48 = load i64, i64* %47, align 8, !tbaa !89
  %49 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"*** %8 to i64*
  %50 = load i64, i64* %49, align 8, !tbaa !92
  %51 = sub i64 %48, %50
  %52 = ashr exact i64 %51, 3
  %53 = icmp eq i64 %51, 0
  %54 = mul i64 %52, 36
  %55 = add i64 %54, -1
  %56 = select i1 %53, i64 0, i64 %55
  %57 = load i64, i64* %4, align 8, !tbaa !93
  %58 = add i64 %45, %57
  %59 = sub i64 %56, %58
  %60 = icmp ult i64 %59, 72
  br i1 %60, label %68, label %61

61:                                               ; preds = %43
  %62 = inttoptr i64 %48 to %"class.std::__1::__fs::filesystem::__dir_stream"**
  %63 = getelementptr inbounds %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %62, i64 -1
  %64 = bitcast %"class.std::__1::__fs::filesystem::__dir_stream"** %63 to i8**
  %65 = load i8*, i8** %64, align 8, !tbaa !22
  tail call void @_ZdlPv(i8* %65) #20
  %66 = load %"class.std::__1::__fs::filesystem::__dir_stream"**, %"class.std::__1::__fs::filesystem::__dir_stream"*** %46, align 8, !tbaa !89
  %67 = getelementptr %"class.std::__1::__fs::filesystem::__dir_stream"*, %"class.std::__1::__fs::filesystem::__dir_stream"** %66, i64 -1
  store %"class.std::__1::__fs::filesystem::__dir_stream"** %67, %"class.std::__1::__fs::filesystem::__dir_stream"*** %46, align 8, !tbaa !89
  br label %68

68:                                               ; preds = %43, %61
  ret void
}

; Function Attrs: nofree nounwind readonly
declare i32 @bcmp(i8* nocapture, i8* nocapture, i64) local_unnamed_addr #18

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noinline noreturn nounwind }
attributes #7 = { argmemonly nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { inlinehint uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #11 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #13 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #14 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #15 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #16 = { nounwind }
attributes #17 = { argmemonly nounwind willreturn writeonly }
attributes #18 = { nofree nounwind readonly }
attributes #19 = { builtin allocsize(0) }
attributes #20 = { builtin nounwind }
attributes #21 = { noreturn }
attributes #22 = { nounwind readnone }
attributes #23 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_ZTSNSt3__14__fs10filesystem6detail12_GLOBAL__N_112ErrorHandlerIvEE", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!4, !5, i64 8}
!9 = !{!4, !5, i64 16}
!10 = !{!4, !5, i64 24}
!11 = !{!12, !13, i64 0}
!12 = !{!"_ZTSNSt3__110error_codeE", !13, i64 0, !5, i64 8}
!13 = !{!"int", !6, i64 0}
!14 = !{!12, !5, i64 8}
!15 = !{!16, !18}
!16 = distinct !{!16, !17, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEJRKNS2_4pathERNS2_17directory_optionsERNS_10error_codeEEvEENS_10shared_ptrIT_EERKT0_DpOT1_: argument 0"}
!17 = distinct !{!17, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEJRKNS2_4pathERNS2_17directory_optionsERNS_10error_codeEEvEENS_10shared_ptrIT_EERKT0_DpOT1_"}
!18 = distinct !{!18, !19, !"_ZNSt3__111make_sharedINS_4__fs10filesystem12__dir_streamEJRKNS2_4pathERNS2_17directory_optionsERNS_10error_codeEEvEENS_10shared_ptrIT_EEDpOT0_: argument 0"}
!19 = distinct !{!19, !"_ZNSt3__111make_sharedINS_4__fs10filesystem12__dir_streamEJRKNS2_4pathERNS2_17directory_optionsERNS_10error_codeEEvEENS_10shared_ptrIT_EEDpOT0_"}
!20 = !{!21, !21, i64 0}
!21 = !{!"vtable pointer", !7, i64 0}
!22 = !{!5, !5, i64 0}
!23 = !{i64 0, i64 4, !24, i64 8, i64 8, !22}
!24 = !{!13, !13, i64 0}
!25 = !{!26, !5, i64 0}
!26 = !{!"_ZTSNSt3__110shared_ptrINS_4__fs10filesystem12__dir_streamEEE", !5, i64 0, !5, i64 8}
!27 = !{!28, !5, i64 0}
!28 = !{!"_ZTSNSt3__14__fs10filesystem12__dir_streamE", !5, i64 0, !29, i64 8, !32, i64 32}
!29 = !{!"_ZTSNSt3__14__fs10filesystem4pathE", !30, i64 0}
!30 = !{!"_ZTSNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE", !31, i64 0}
!31 = !{!"_ZTSNSt3__117__compressed_pairINS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE5__repES5_EE"}
!32 = !{!"_ZTSNSt3__14__fs10filesystem15directory_entryE", !29, i64 0, !33, i64 32}
!33 = !{!"_ZTSNSt3__14__fs10filesystem15directory_entry13__cached_dataE", !34, i64 0, !34, i64 8, !35, i64 16, !38, i64 32, !38, i64 36, !39, i64 40, !40, i64 41}
!34 = !{!"long", !6, i64 0}
!35 = !{!"_ZTSNSt3__16chrono10time_pointINS_4__fs10filesystem16_FilesystemClockENS0_8durationInNS_5ratioILl1ELl1000000000EEEEEEE", !36, i64 0}
!36 = !{!"_ZTSNSt3__16chrono8durationInNS_5ratioILl1ELl1000000000EEEEE", !37, i64 0}
!37 = !{!"__int128", !6, i64 0}
!38 = !{!"_ZTSNSt3__14__fs10filesystem5permsE", !6, i64 0}
!39 = !{!"_ZTSNSt3__14__fs10filesystem9file_typeE", !6, i64 0}
!40 = !{!"_ZTSNSt3__14__fs10filesystem15directory_entry10_CacheTypeE", !6, i64 0}
!41 = !{!26, !5, i64 8}
!42 = !{!6, !6, i64 0}
!43 = !{!44}
!44 = distinct !{!44, !45, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_: argument 0"}
!45 = distinct !{!45, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_"}
!46 = !{!47}
!47 = distinct !{!47, !48, !"_ZNSt3__14__fs10filesystem6detail12_GLOBAL__N_113posix_readdirEP11__dirstreamRNS_10error_codeE: argument 0"}
!48 = distinct !{!48, !"_ZNSt3__14__fs10filesystem6detail12_GLOBAL__N_113posix_readdirEP11__dirstreamRNS_10error_codeE"}
!49 = !{!50, !6, i64 18}
!50 = !{!"_ZTS6dirent", !34, i64 0, !34, i64 8, !51, i64 16, !6, i64 18, !6, i64 19}
!51 = !{!"short", !6, i64 0}
!52 = !{!53}
!53 = distinct !{!53, !54, !"_ZNSt3__14__fs10filesystemdvERKNS1_4pathES4_: argument 0"}
!54 = distinct !{!54, !"_ZNSt3__14__fs10filesystemdvERKNS1_4pathES4_"}
!55 = !{i64 0, i64 8, !56, i64 8, i64 8, !56, i64 16, i64 8, !22, i64 0, i64 1, !42, i64 0, i64 1, !42, i64 1, i64 23, !42, i64 0, i64 24, !42}
!56 = !{!34, !34, i64 0}
!57 = !{i64 0, i64 8, !56, i64 8, i64 8, !56, i64 16, i64 16, !58, i64 32, i64 4, !59, i64 36, i64 4, !59, i64 40, i64 1, !60, i64 41, i64 1, !61}
!58 = !{!37, !37, i64 0}
!59 = !{!38, !38, i64 0}
!60 = !{!39, !39, i64 0}
!61 = !{!40, !40, i64 0}
!62 = !{!63}
!63 = distinct !{!63, !64, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_: argument 0"}
!64 = distinct !{!64, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_"}
!65 = !{!66}
!66 = distinct !{!66, !67, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_: argument 0"}
!67 = distinct !{!67, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_PKS6_"}
!68 = !{!69}
!69 = distinct !{!69, !70, !"_ZNSt3__14__fs10filesystem6detail12_GLOBAL__N_118format_string_implEPKcP13__va_list_tag: argument 0"}
!70 = distinct !{!70, !"_ZNSt3__14__fs10filesystem6detail12_GLOBAL__N_118format_string_implEPKcP13__va_list_tag"}
!71 = !{!72}
!72 = distinct !{!72, !73, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_: argument 0"}
!73 = distinct !{!73, !"_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEOS9_SA_"}
!74 = !{!75, !77, i64 16}
!75 = !{!"_ZTSNSt3__14__fs10filesystem28recursive_directory_iteratorE", !76, i64 0, !77, i64 16}
!76 = !{!"_ZTSNSt3__110shared_ptrINS_4__fs10filesystem28recursive_directory_iterator12__shared_impEEE", !5, i64 0, !5, i64 8}
!77 = !{!"bool", !6, i64 0}
!78 = !{!79, !81}
!79 = distinct !{!79, !80, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_: argument 0"}
!80 = distinct !{!80, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem28recursive_directory_iterator12__shared_impENS_9allocatorIS4_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_"}
!81 = distinct !{!81, !82, !"_ZNSt3__111make_sharedINS_4__fs10filesystem28recursive_directory_iterator12__shared_impEJEvEENS_10shared_ptrIT_EEDpOT0_: argument 0"}
!82 = distinct !{!82, !"_ZNSt3__111make_sharedINS_4__fs10filesystem28recursive_directory_iterator12__shared_impEJEvEENS_10shared_ptrIT_EEDpOT0_"}
!83 = !{!76, !5, i64 0}
!84 = !{!85, !88, i64 48}
!85 = !{!"_ZTSNSt3__14__fs10filesystem28recursive_directory_iterator12__shared_impE", !86, i64 0, !88, i64 48}
!86 = !{!"_ZTSNSt3__15stackINS_4__fs10filesystem12__dir_streamENS_5dequeIS3_NS_9allocatorIS3_EEEEEE", !87, i64 0}
!87 = !{!"_ZTSNSt3__15dequeINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE"}
!88 = !{!"_ZTSNSt3__14__fs10filesystem17directory_optionsE", !6, i64 0}
!89 = !{!90, !5, i64 16}
!90 = !{!"_ZTSNSt3__114__split_bufferIPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEEE", !5, i64 0, !5, i64 8, !5, i64 16, !91, i64 24}
!91 = !{!"_ZTSNSt3__117__compressed_pairIPPNS_4__fs10filesystem12__dir_streamENS_9allocatorIS4_EEEE"}
!92 = !{!90, !5, i64 8}
!93 = !{!94, !34, i64 32}
!94 = !{!"_ZTSNSt3__112__deque_baseINS_4__fs10filesystem12__dir_streamENS_9allocatorIS3_EEEE", !90, i64 0, !34, i64 32, !95, i64 40}
!95 = !{!"_ZTSNSt3__117__compressed_pairImNS_9allocatorINS_4__fs10filesystem12__dir_streamEEEEE"}
!96 = !{!76, !5, i64 8}
!97 = !{!33, !40, i64 41}
!98 = !{!33, !39, i64 40}
!99 = !{!33, !38, i64 36}
!100 = !{!33, !38, i64 32}
!101 = !{i8 0, i8 2}
!102 = !{!32, !40, i64 73}
!103 = !{!104, !39, i64 0}
!104 = !{!"_ZTSNSt3__14__fs10filesystem11file_statusE", !39, i64 0, !38, i64 4}
!105 = !{!32, !39, i64 72}
!106 = !{!107}
!107 = distinct !{!107, !108}
!108 = distinct !{!108, !"LVerDomain"}
!109 = !{!110}
!110 = distinct !{!110, !108}
!111 = distinct !{!111, !112}
!112 = !{!"llvm.loop.isvectorized", i32 1}
!113 = distinct !{!113, !114}
!114 = !{!"llvm.loop.unroll.disable"}
!115 = distinct !{!115, !112}
!116 = distinct !{!116, !112}
!117 = distinct !{!117, !114}
!118 = distinct !{!118, !119, !112}
!119 = !{!"llvm.loop.unroll.runtime.disable"}
!120 = !{!121, !123}
!121 = distinct !{!121, !122, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJNS2_4pathES7_EvEENS_10shared_ptrIT_EERKT0_DpOT1_: argument 0"}
!122 = distinct !{!122, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJNS2_4pathES7_EvEENS_10shared_ptrIT_EERKT0_DpOT1_"}
!123 = distinct !{!123, !124, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJNS2_4pathES5_EvEENS_10shared_ptrIT_EEDpOT0_: argument 0"}
!124 = distinct !{!124, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJNS2_4pathES5_EvEENS_10shared_ptrIT_EEDpOT0_"}
!125 = !{!126, !5, i64 0}
!126 = !{!"_ZTSNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEEE", !5, i64 0, !5, i64 8}
!127 = !{!128, !121, !123}
!128 = distinct !{!128, !129, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_: argument 0"}
!129 = distinct !{!129, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_"}
!130 = !{!126, !5, i64 8}
!131 = !{!132, !134}
!132 = distinct !{!132, !133, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJRKNS2_4pathES7_EvEENS_10shared_ptrIT_EERKT0_DpOT1_: argument 0"}
!133 = distinct !{!133, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJRKNS2_4pathES7_EvEENS_10shared_ptrIT_EERKT0_DpOT1_"}
!134 = distinct !{!134, !135, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJRKNS2_4pathES5_EvEENS_10shared_ptrIT_EEDpOT0_: argument 0"}
!135 = distinct !{!135, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJRKNS2_4pathES5_EvEENS_10shared_ptrIT_EEDpOT0_"}
!136 = !{!137, !132, !134}
!137 = distinct !{!137, !138, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_: argument 0"}
!138 = distinct !{!138, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_"}
!139 = !{!140, !142}
!140 = distinct !{!140, !141, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJRKNS2_4pathES9_EvEENS_10shared_ptrIT_EERKT0_DpOT1_: argument 0"}
!141 = distinct !{!141, !"_ZNSt3__115allocate_sharedINS_4__fs10filesystem16filesystem_error8_StorageENS_9allocatorIS4_EEJRKNS2_4pathES9_EvEENS_10shared_ptrIT_EERKT0_DpOT1_"}
!142 = distinct !{!142, !143, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJRKNS2_4pathES7_EvEENS_10shared_ptrIT_EEDpOT0_: argument 0"}
!143 = distinct !{!143, !"_ZNSt3__111make_sharedINS_4__fs10filesystem16filesystem_error8_StorageEJRKNS2_4pathES7_EvEENS_10shared_ptrIT_EEDpOT0_"}
!144 = !{!145, !140, !142}
!145 = distinct !{!145, !146, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_: argument 0"}
!146 = distinct !{!146, !"_ZNSt3__110shared_ptrINS_4__fs10filesystem16filesystem_error8_StorageEE27__create_with_control_blockIS4_NS_20__shared_ptr_emplaceIS4_NS_9allocatorIS4_EEEEEES5_PT_PT0_"}
!147 = !{!90, !5, i64 0}
!148 = distinct !{!148, !114}
!149 = distinct !{!149, !114}
!150 = distinct !{!150, !114}
!151 = distinct !{!151, !114}
!152 = distinct !{!152, !114}

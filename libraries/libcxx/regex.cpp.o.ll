; ModuleID = 'll/.regex.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/regex.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.std::__1::(anonymous namespace)::collationnames" = type { i8*, i8 }
%"struct.std::__1::(anonymous namespace)::classnames" = type { i8*, i16 }
%"class.std::__1::regex_error" = type <{ %"class.std::runtime_error", i32, [4 x i8] }>
%"class.std::runtime_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"class.std::__1::__match_any_but_newline" = type { %"class.std::__1::__owns_one_state" }
%"class.std::__1::__owns_one_state" = type { %"class.std::__1::__has_one_state" }
%"class.std::__1::__has_one_state" = type { %"class.std::__1::__node", %"class.std::__1::__node"* }
%"class.std::__1::__node" = type { i32 (...)** }
%"struct.std::__1::__state" = type <{ i32, [4 x i8], i8*, i8*, i8*, %"class.std::__1::vector", %"class.std::__1::vector.8", %"class.std::__1::__node"*, i32, i8, [3 x i8] }>
%"class.std::__1::vector" = type { %"class.std::__1::__vector_base" }
%"class.std::__1::__vector_base" = type { %"class.std::__1::sub_match"*, %"class.std::__1::sub_match"*, %"class.std::__1::__compressed_pair.2" }
%"class.std::__1::sub_match" = type opaque
%"class.std::__1::__compressed_pair.2" = type { %"struct.std::__1::__compressed_pair_elem.3" }
%"struct.std::__1::__compressed_pair_elem.3" = type { %"class.std::__1::sub_match"* }
%"class.std::__1::vector.8" = type { %"class.std::__1::__vector_base.9" }
%"class.std::__1::__vector_base.9" = type { %"struct.std::__1::pair"*, %"struct.std::__1::pair"*, %"class.std::__1::__compressed_pair.10" }
%"struct.std::__1::pair" = type opaque
%"class.std::__1::__compressed_pair.10" = type { %"struct.std::__1::__compressed_pair_elem.11" }
%"struct.std::__1::__compressed_pair_elem.11" = type { %"struct.std::__1::pair"* }
%"class.std::__1::__match_any_but_newline.16" = type { %"class.std::__1::__owns_one_state.17" }
%"class.std::__1::__owns_one_state.17" = type { %"class.std::__1::__has_one_state.18" }
%"class.std::__1::__has_one_state.18" = type { %"class.std::__1::__node.19", %"class.std::__1::__node.19"* }
%"class.std::__1::__node.19" = type { i32 (...)** }
%"struct.std::__1::__state.20" = type <{ i32, [4 x i8], i32*, i32*, i32*, %"class.std::__1::vector.21", %"class.std::__1::vector.30", %"class.std::__1::__node.19"*, i32, i8, [3 x i8] }>
%"class.std::__1::vector.21" = type { %"class.std::__1::__vector_base.22" }
%"class.std::__1::__vector_base.22" = type { %"class.std::__1::sub_match.23"*, %"class.std::__1::sub_match.23"*, %"class.std::__1::__compressed_pair.24" }
%"class.std::__1::sub_match.23" = type opaque
%"class.std::__1::__compressed_pair.24" = type { %"struct.std::__1::__compressed_pair_elem.25" }
%"struct.std::__1::__compressed_pair_elem.25" = type { %"class.std::__1::sub_match.23"* }
%"class.std::__1::vector.30" = type { %"class.std::__1::__vector_base.31" }
%"class.std::__1::__vector_base.31" = type { %"struct.std::__1::pair.32"*, %"struct.std::__1::pair.32"*, %"class.std::__1::__compressed_pair.33" }
%"struct.std::__1::pair.32" = type opaque
%"class.std::__1::__compressed_pair.33" = type { %"struct.std::__1::__compressed_pair_elem.34" }
%"struct.std::__1::__compressed_pair_elem.34" = type { %"struct.std::__1::pair.32"* }

@_ZTVNSt3__111regex_errorE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt3__111regex_errorE to i8*), i8* bitcast (void (%"class.std::__1::regex_error"*)* @_ZNSt3__111regex_errorD2Ev to i8*), i8* bitcast (void (%"class.std::__1::regex_error"*)* @_ZNSt3__111regex_errorD0Ev to i8*), i8* bitcast (i8* (%"class.std::runtime_error"*)* @_ZNKSt13runtime_error4whatEv to i8*)] }, align 8
@_ZNSt3__112_GLOBAL__N_112collatenamesE = internal constant [111 x %"struct.std::__1::(anonymous namespace)::collationnames"] [%"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i32 0, i32 0), i8 65 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.18, i32 0, i32 0), i8 66 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.19, i32 0, i32 0), i8 67 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0), i8 68 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0), i8 69 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.22, i32 0, i32 0), i8 70 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.23, i32 0, i32 0), i8 71 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24, i32 0, i32 0), i8 72 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i32 0, i32 0), i8 73 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.26, i32 0, i32 0), i8 74 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.27, i32 0, i32 0), i8 75 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i32 0, i32 0), i8 76 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.29, i32 0, i32 0), i8 77 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30, i32 0, i32 0), i8 78 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.31, i32 0, i32 0), i8 0 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.32, i32 0, i32 0), i8 79 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0), i8 80 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i32 0, i32 0), i8 81 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.35, i32 0, i32 0), i8 82 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.36, i32 0, i32 0), i8 83 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.37, i32 0, i32 0), i8 84 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.38, i32 0, i32 0), i8 85 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.39, i32 0, i32 0), i8 86 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.40, i32 0, i32 0), i8 87 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.41, i32 0, i32 0), i8 88 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0), i8 89 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.43, i32 0, i32 0), i8 90 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.44, i32 0, i32 0), i8 97 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.45, i32 0, i32 0), i8 7 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.46, i32 0, i32 0), i8 38 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.47, i32 0, i32 0), i8 39 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.48, i32 0, i32 0), i8 42 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.49, i32 0, i32 0), i8 98 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.50, i32 0, i32 0), i8 92 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.51, i32 0, i32 0), i8 8 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.52, i32 0, i32 0), i8 99 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.53, i32 0, i32 0), i8 13 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.54, i32 0, i32 0), i8 94 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.55, i32 0, i32 0), i8 94 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.56, i32 0, i32 0), i8 58 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.57, i32 0, i32 0), i8 44 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.58, i32 0, i32 0), i8 64 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i8 100 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.60, i32 0, i32 0), i8 36 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.61, i32 0, i32 0), i8 101 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.62, i32 0, i32 0), i8 56 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.63, i32 0, i32 0), i8 61 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.64, i32 0, i32 0), i8 33 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.65, i32 0, i32 0), i8 102 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.66, i32 0, i32 0), i8 53 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.67, i32 0, i32 0), i8 12 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.68, i32 0, i32 0), i8 52 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.69, i32 0, i32 0), i8 46 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.70, i32 0, i32 0), i8 103 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.71, i32 0, i32 0), i8 96 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.72, i32 0, i32 0), i8 62 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.73, i32 0, i32 0), i8 104 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.74, i32 0, i32 0), i8 45 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.75, i32 0, i32 0), i8 45 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.76, i32 0, i32 0), i8 105 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.77, i32 0, i32 0), i8 106 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.78, i32 0, i32 0), i8 107 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.79, i32 0, i32 0), i8 108 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.80, i32 0, i32 0), i8 123 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.81, i32 0, i32 0), i8 123 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.82, i32 0, i32 0), i8 40 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.83, i32 0, i32 0), i8 91 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.84, i32 0, i32 0), i8 60 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.85, i32 0, i32 0), i8 95 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.86, i32 0, i32 0), i8 109 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.87, i32 0, i32 0), i8 110 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.88, i32 0, i32 0), i8 10 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.89, i32 0, i32 0), i8 57 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.90, i32 0, i32 0), i8 35 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.91, i32 0, i32 0), i8 111 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.92, i32 0, i32 0), i8 49 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.93, i32 0, i32 0), i8 112 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.94, i32 0, i32 0), i8 37 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.95, i32 0, i32 0), i8 46 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.96, i32 0, i32 0), i8 43 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.97, i32 0, i32 0), i8 113 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.98, i32 0, i32 0), i8 63 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.99, i32 0, i32 0), i8 34 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.100, i32 0, i32 0), i8 114 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.101, i32 0, i32 0), i8 92 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.102, i32 0, i32 0), i8 125 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.103, i32 0, i32 0), i8 125 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.104, i32 0, i32 0), i8 41 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.105, i32 0, i32 0), i8 93 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.106, i32 0, i32 0), i8 115 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.107, i32 0, i32 0), i8 59 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.108, i32 0, i32 0), i8 55 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.109, i32 0, i32 0), i8 54 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.110, i32 0, i32 0), i8 47 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.111, i32 0, i32 0), i8 47 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.112, i32 0, i32 0), i8 32 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.113, i32 0, i32 0), i8 116 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.114, i32 0, i32 0), i8 9 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.115, i32 0, i32 0), i8 51 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.116, i32 0, i32 0), i8 126 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.117, i32 0, i32 0), i8 50 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.118, i32 0, i32 0), i8 117 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.119, i32 0, i32 0), i8 95 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.120, i32 0, i32 0), i8 118 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.121, i32 0, i32 0), i8 124 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.122, i32 0, i32 0), i8 11 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.123, i32 0, i32 0), i8 119 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.124, i32 0, i32 0), i8 120 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.125, i32 0, i32 0), i8 121 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.126, i32 0, i32 0), i8 122 }, %"struct.std::__1::(anonymous namespace)::collationnames" { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.127, i32 0, i32 0), i8 48 }], align 16
@_ZNSt3__112_GLOBAL__N_110ClassNamesE = internal constant [15 x %"struct.std::__1::(anonymous namespace)::classnames"] [%"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.128, i32 0, i32 0), i16 3072 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.129, i32 0, i32 0), i16 1024 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.130, i32 0, i32 0), i16 1 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.131, i32 0, i32 0), i16 2 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i16 2048 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.132, i32 0, i32 0), i16 2048 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.133, i32 0, i32 0), i16 3076 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.134, i32 0, i32 0), i16 512 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.135, i32 0, i32 0), i16 16384 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.136, i32 0, i32 0), i16 4 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.106, i32 0, i32 0), i16 8192 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.112, i32 0, i32 0), i16 8192 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.137, i32 0, i32 0), i16 256 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.123, i32 0, i32 0), i16 128 }, %"struct.std::__1::(anonymous namespace)::classnames" { i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.138, i32 0, i32 0), i16 4096 }], align 16
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSNSt3__111regex_errorE = constant [22 x i8] c"NSt3__111regex_errorE\00", align 1
@_ZTISt13runtime_error = external constant i8*
@_ZTINSt3__111regex_errorE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([22 x i8], [22 x i8]* @_ZTSNSt3__111regex_errorE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt13runtime_error to i8*) }, align 8
@.str = private unnamed_addr constant [60 x i8] c"The expression contained an invalid collating element name.\00", align 1
@.str.1 = private unnamed_addr constant [58 x i8] c"The expression contained an invalid character class name.\00", align 1
@.str.2 = private unnamed_addr constant [77 x i8] c"The expression contained an invalid escaped character, or a trailing escape.\00", align 1
@.str.3 = private unnamed_addr constant [52 x i8] c"The expression contained an invalid back reference.\00", align 1
@.str.4 = private unnamed_addr constant [45 x i8] c"The expression contained mismatched [ and ].\00", align 1
@.str.5 = private unnamed_addr constant [45 x i8] c"The expression contained mismatched ( and ).\00", align 1
@.str.6 = private unnamed_addr constant [45 x i8] c"The expression contained mismatched { and }.\00", align 1
@.str.7 = private unnamed_addr constant [62 x i8] c"The expression contained an invalid range in a {} expression.\00", align 1
@.str.8 = private unnamed_addr constant [86 x i8] c"The expression contained an invalid character range, such as [b-a] in most encodings.\00", align 1
@.str.9 = private unnamed_addr constant [85 x i8] c"There was insufficient memory to convert the expression into a finite state machine.\00", align 1
@.str.10 = private unnamed_addr constant [60 x i8] c"One of *?+{ was not preceded by a valid regular expression.\00", align 1
@.str.11 = private unnamed_addr constant [92 x i8] c"The complexity of an attempted match against a regular expression exceeded a pre-set level.\00", align 1
@.str.12 = private unnamed_addr constant [120 x i8] c"There was insufficient memory to determine whether the regular expression could match the specified character sequence.\00", align 1
@.str.13 = private unnamed_addr constant [45 x i8] c"An invalid regex grammar has been requested.\00", align 1
@.str.14 = private unnamed_addr constant [52 x i8] c"An empty regex is not allowed in the POSIX grammar.\00", align 1
@.str.15 = private unnamed_addr constant [58 x i8] c"The parser did not consume the entire regular expression.\00", align 1
@.str.16 = private unnamed_addr constant [19 x i8] c"Unknown error type\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.18 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.19 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.22 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.23 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"H\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.26 = private unnamed_addr constant [2 x i8] c"J\00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"K\00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str.30 = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str.31 = private unnamed_addr constant [4 x i8] c"NUL\00", align 1
@.str.32 = private unnamed_addr constant [2 x i8] c"O\00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"P\00", align 1
@.str.34 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.36 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str.37 = private unnamed_addr constant [2 x i8] c"T\00", align 1
@.str.38 = private unnamed_addr constant [2 x i8] c"U\00", align 1
@.str.39 = private unnamed_addr constant [2 x i8] c"V\00", align 1
@.str.40 = private unnamed_addr constant [2 x i8] c"W\00", align 1
@.str.41 = private unnamed_addr constant [2 x i8] c"X\00", align 1
@.str.42 = private unnamed_addr constant [2 x i8] c"Y\00", align 1
@.str.43 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@.str.44 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.45 = private unnamed_addr constant [6 x i8] c"alert\00", align 1
@.str.46 = private unnamed_addr constant [10 x i8] c"ampersand\00", align 1
@.str.47 = private unnamed_addr constant [11 x i8] c"apostrophe\00", align 1
@.str.48 = private unnamed_addr constant [9 x i8] c"asterisk\00", align 1
@.str.49 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.50 = private unnamed_addr constant [10 x i8] c"backslash\00", align 1
@.str.51 = private unnamed_addr constant [10 x i8] c"backspace\00", align 1
@.str.52 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.53 = private unnamed_addr constant [16 x i8] c"carriage-return\00", align 1
@.str.54 = private unnamed_addr constant [11 x i8] c"circumflex\00", align 1
@.str.55 = private unnamed_addr constant [18 x i8] c"circumflex-accent\00", align 1
@.str.56 = private unnamed_addr constant [6 x i8] c"colon\00", align 1
@.str.57 = private unnamed_addr constant [6 x i8] c"comma\00", align 1
@.str.58 = private unnamed_addr constant [14 x i8] c"commercial-at\00", align 1
@.str.59 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.60 = private unnamed_addr constant [12 x i8] c"dollar-sign\00", align 1
@.str.61 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str.62 = private unnamed_addr constant [6 x i8] c"eight\00", align 1
@.str.63 = private unnamed_addr constant [12 x i8] c"equals-sign\00", align 1
@.str.64 = private unnamed_addr constant [17 x i8] c"exclamation-mark\00", align 1
@.str.65 = private unnamed_addr constant [2 x i8] c"f\00", align 1
@.str.66 = private unnamed_addr constant [5 x i8] c"five\00", align 1
@.str.67 = private unnamed_addr constant [10 x i8] c"form-feed\00", align 1
@.str.68 = private unnamed_addr constant [5 x i8] c"four\00", align 1
@.str.69 = private unnamed_addr constant [10 x i8] c"full-stop\00", align 1
@.str.70 = private unnamed_addr constant [2 x i8] c"g\00", align 1
@.str.71 = private unnamed_addr constant [13 x i8] c"grave-accent\00", align 1
@.str.72 = private unnamed_addr constant [18 x i8] c"greater-than-sign\00", align 1
@.str.73 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.74 = private unnamed_addr constant [7 x i8] c"hyphen\00", align 1
@.str.75 = private unnamed_addr constant [13 x i8] c"hyphen-minus\00", align 1
@.str.76 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.77 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str.78 = private unnamed_addr constant [2 x i8] c"k\00", align 1
@.str.79 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str.80 = private unnamed_addr constant [11 x i8] c"left-brace\00", align 1
@.str.81 = private unnamed_addr constant [19 x i8] c"left-curly-bracket\00", align 1
@.str.82 = private unnamed_addr constant [17 x i8] c"left-parenthesis\00", align 1
@.str.83 = private unnamed_addr constant [20 x i8] c"left-square-bracket\00", align 1
@.str.84 = private unnamed_addr constant [15 x i8] c"less-than-sign\00", align 1
@.str.85 = private unnamed_addr constant [9 x i8] c"low-line\00", align 1
@.str.86 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.87 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.88 = private unnamed_addr constant [8 x i8] c"newline\00", align 1
@.str.89 = private unnamed_addr constant [5 x i8] c"nine\00", align 1
@.str.90 = private unnamed_addr constant [12 x i8] c"number-sign\00", align 1
@.str.91 = private unnamed_addr constant [2 x i8] c"o\00", align 1
@.str.92 = private unnamed_addr constant [4 x i8] c"one\00", align 1
@.str.93 = private unnamed_addr constant [2 x i8] c"p\00", align 1
@.str.94 = private unnamed_addr constant [13 x i8] c"percent-sign\00", align 1
@.str.95 = private unnamed_addr constant [7 x i8] c"period\00", align 1
@.str.96 = private unnamed_addr constant [10 x i8] c"plus-sign\00", align 1
@.str.97 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.98 = private unnamed_addr constant [14 x i8] c"question-mark\00", align 1
@.str.99 = private unnamed_addr constant [15 x i8] c"quotation-mark\00", align 1
@.str.100 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.101 = private unnamed_addr constant [16 x i8] c"reverse-solidus\00", align 1
@.str.102 = private unnamed_addr constant [12 x i8] c"right-brace\00", align 1
@.str.103 = private unnamed_addr constant [20 x i8] c"right-curly-bracket\00", align 1
@.str.104 = private unnamed_addr constant [18 x i8] c"right-parenthesis\00", align 1
@.str.105 = private unnamed_addr constant [21 x i8] c"right-square-bracket\00", align 1
@.str.106 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.107 = private unnamed_addr constant [10 x i8] c"semicolon\00", align 1
@.str.108 = private unnamed_addr constant [6 x i8] c"seven\00", align 1
@.str.109 = private unnamed_addr constant [4 x i8] c"six\00", align 1
@.str.110 = private unnamed_addr constant [6 x i8] c"slash\00", align 1
@.str.111 = private unnamed_addr constant [8 x i8] c"solidus\00", align 1
@.str.112 = private unnamed_addr constant [6 x i8] c"space\00", align 1
@.str.113 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@.str.114 = private unnamed_addr constant [4 x i8] c"tab\00", align 1
@.str.115 = private unnamed_addr constant [6 x i8] c"three\00", align 1
@.str.116 = private unnamed_addr constant [6 x i8] c"tilde\00", align 1
@.str.117 = private unnamed_addr constant [4 x i8] c"two\00", align 1
@.str.118 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.119 = private unnamed_addr constant [11 x i8] c"underscore\00", align 1
@.str.120 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@.str.121 = private unnamed_addr constant [14 x i8] c"vertical-line\00", align 1
@.str.122 = private unnamed_addr constant [13 x i8] c"vertical-tab\00", align 1
@.str.123 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.124 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.125 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.126 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.127 = private unnamed_addr constant [5 x i8] c"zero\00", align 1
@.str.128 = private unnamed_addr constant [6 x i8] c"alnum\00", align 1
@.str.129 = private unnamed_addr constant [6 x i8] c"alpha\00", align 1
@.str.130 = private unnamed_addr constant [6 x i8] c"blank\00", align 1
@.str.131 = private unnamed_addr constant [6 x i8] c"cntrl\00", align 1
@.str.132 = private unnamed_addr constant [6 x i8] c"digit\00", align 1
@.str.133 = private unnamed_addr constant [6 x i8] c"graph\00", align 1
@.str.134 = private unnamed_addr constant [6 x i8] c"lower\00", align 1
@.str.135 = private unnamed_addr constant [6 x i8] c"print\00", align 1
@.str.136 = private unnamed_addr constant [6 x i8] c"punct\00", align 1
@.str.137 = private unnamed_addr constant [6 x i8] c"upper\00", align 1
@.str.138 = private unnamed_addr constant [7 x i8] c"xdigit\00", align 1
@switch.table._ZNSt3__111regex_errorC2ENS_15regex_constants10error_typeE = private unnamed_addr constant [17 x i8*] [i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([77 x i8], [77 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @.str.7, i64 0, i64 0), i8* getelementptr inbounds ([86 x i8], [86 x i8]* @.str.8, i64 0, i64 0), i8* getelementptr inbounds ([85 x i8], [85 x i8]* @.str.9, i64 0, i64 0), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @.str.10, i64 0, i64 0), i8* getelementptr inbounds ([92 x i8], [92 x i8]* @.str.11, i64 0, i64 0), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @.str.12, i64 0, i64 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @.str.15, i64 0, i64 0)], align 8

@_ZNSt3__111regex_errorC1ENS_15regex_constants10error_typeE = unnamed_addr alias void (%"class.std::__1::regex_error"*, i32), void (%"class.std::__1::regex_error"*, i32)* @_ZNSt3__111regex_errorC2ENS_15regex_constants10error_typeE
@_ZNSt3__111regex_errorD1Ev = unnamed_addr alias void (%"class.std::__1::regex_error"*), void (%"class.std::__1::regex_error"*)* @_ZNSt3__111regex_errorD2Ev

; Function Attrs: uwtable
define void @_ZNSt3__111regex_errorC2ENS_15regex_constants10error_typeE(%"class.std::__1::regex_error"* %0, i32 %1) unnamed_addr #0 align 2 {
  %3 = add i32 %1, -1
  %4 = icmp ult i32 %3, 17
  br i1 %4, label %5, label %9

5:                                                ; preds = %2
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds [17 x i8*], [17 x i8*]* @switch.table._ZNSt3__111regex_errorC2ENS_15regex_constants10error_typeE, i64 0, i64 %6
  %8 = load i8*, i8** %7, align 8
  br label %9

9:                                                ; preds = %2, %5
  %10 = phi i8* [ %8, %5 ], [ getelementptr inbounds ([19 x i8], [19 x i8]* @.str.16, i64 0, i64 0), %2 ]
  %11 = getelementptr %"class.std::__1::regex_error", %"class.std::__1::regex_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorC2EPKc(%"class.std::runtime_error"* %11, i8* nonnull %10)
  %12 = getelementptr %"class.std::__1::regex_error", %"class.std::__1::regex_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVNSt3__111regex_errorE, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %12, align 8, !tbaa !3
  %13 = getelementptr inbounds %"class.std::__1::regex_error", %"class.std::__1::regex_error"* %0, i64 0, i32 1
  store i32 %1, i32* %13, align 8, !tbaa !6
  ret void
}

declare void @_ZNSt13runtime_errorC2EPKc(%"class.std::runtime_error"*, i8*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"*) unnamed_addr #2

; Function Attrs: nounwind uwtable
define void @_ZNSt3__111regex_errorD2Ev(%"class.std::__1::regex_error"* %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::__1::regex_error", %"class.std::__1::regex_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"* %2) #9
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__111regex_errorD0Ev(%"class.std::__1::regex_error"* %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::__1::regex_error", %"class.std::__1::regex_error"* %0, i64 0, i32 0
  tail call void @_ZNSt13runtime_errorD2Ev(%"class.std::runtime_error"* %2) #9
  %3 = bitcast %"class.std::__1::regex_error"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #10
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #4

; Function Attrs: uwtable
define void @_ZNSt3__120__get_collation_nameEPKc(%"class.std::__1::basic_string"* noalias sret align 8 %0, i8* %1) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi %"struct.std::__1::(anonymous namespace)::collationnames"* [ getelementptr inbounds ([111 x %"struct.std::__1::(anonymous namespace)::collationnames"], [111 x %"struct.std::__1::(anonymous namespace)::collationnames"]* @_ZNSt3__112_GLOBAL__N_112collatenamesE, i64 0, i64 0), %2 ], [ %16, %3 ]
  %5 = phi i64 [ 111, %2 ], [ %15, %3 ]
  %6 = lshr i64 %5, 1
  %7 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::collationnames", %"struct.std::__1::(anonymous namespace)::collationnames"* %4, i64 %6
  %8 = getelementptr %"struct.std::__1::(anonymous namespace)::collationnames", %"struct.std::__1::(anonymous namespace)::collationnames"* %7, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8, !tbaa !10
  %10 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %9, i8* nonnull dereferenceable(1) %1) #11
  %11 = icmp slt i32 %10, 0
  %12 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::collationnames", %"struct.std::__1::(anonymous namespace)::collationnames"* %7, i64 1
  %13 = xor i64 %6, -1
  %14 = add i64 %5, %13
  %15 = select i1 %11, i64 %14, i64 %6
  %16 = select i1 %11, %"struct.std::__1::(anonymous namespace)::collationnames"* %12, %"struct.std::__1::(anonymous namespace)::collationnames"* %4
  %17 = icmp eq i64 %15, 0
  br i1 %17, label %18, label %3

18:                                               ; preds = %3
  %19 = bitcast %"class.std::__1::basic_string"* %0 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 8 dereferenceable(24) %19, i8 0, i64 24, i1 false) #9
  %20 = icmp eq %"struct.std::__1::(anonymous namespace)::collationnames"* %16, getelementptr inbounds ([111 x %"struct.std::__1::(anonymous namespace)::collationnames"], [111 x %"struct.std::__1::(anonymous namespace)::collationnames"]* @_ZNSt3__112_GLOBAL__N_112collatenamesE, i64 1, i64 0)
  br i1 %20, label %39, label %21

21:                                               ; preds = %18
  %22 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::collationnames", %"struct.std::__1::(anonymous namespace)::collationnames"* %16, i64 0, i32 0
  %23 = load i8*, i8** %22, align 8, !tbaa !10
  %24 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %1, i8* nonnull dereferenceable(1) %23) #11
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %39

26:                                               ; preds = %21
  %27 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::collationnames", %"struct.std::__1::(anonymous namespace)::collationnames"* %16, i64 0, i32 1
  %28 = load i8, i8* %27, align 8, !tbaa !13
  %29 = invoke nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEc(%"class.std::__1::basic_string"* nonnull %0, i8 signext %28)
          to label %39 unwind label %30

30:                                               ; preds = %26
  %31 = landingpad { i8*, i32 }
          cleanup
  %32 = load i8, i8* %19, align 8, !tbaa !14
  %33 = and i8 %32, 1
  %34 = icmp eq i8 %33, 0
  br i1 %34, label %38, label %35

35:                                               ; preds = %30
  %36 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %37 = load i8*, i8** %36, align 8, !tbaa !14
  tail call void @_ZdlPv(i8* %37) #10
  br label %38

38:                                               ; preds = %30, %35
  resume { i8*, i32 } %31

39:                                               ; preds = %21, %26, %18
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nofree nounwind readonly
declare i32 @strcmp(i8* nocapture, i8* nocapture) local_unnamed_addr #5

declare nonnull align 8 dereferenceable(24) %"class.std::__1::basic_string"* @_ZNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEaSEc(%"class.std::__1::basic_string"*, i8 signext) local_unnamed_addr #1

; Function Attrs: nounwind readonly uwtable
define zeroext i16 @_ZNSt3__115__get_classnameEPKcb(i8* %0, i1 zeroext %1) local_unnamed_addr #6 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi %"struct.std::__1::(anonymous namespace)::classnames"* [ getelementptr inbounds ([15 x %"struct.std::__1::(anonymous namespace)::classnames"], [15 x %"struct.std::__1::(anonymous namespace)::classnames"]* @_ZNSt3__112_GLOBAL__N_110ClassNamesE, i64 0, i64 0), %2 ], [ %16, %3 ]
  %5 = phi i64 [ 15, %2 ], [ %15, %3 ]
  %6 = lshr i64 %5, 1
  %7 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::classnames", %"struct.std::__1::(anonymous namespace)::classnames"* %4, i64 %6
  %8 = getelementptr %"struct.std::__1::(anonymous namespace)::classnames", %"struct.std::__1::(anonymous namespace)::classnames"* %7, i64 0, i32 0
  %9 = load i8*, i8** %8, align 8, !tbaa !15
  %10 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %9, i8* nonnull dereferenceable(1) %0) #11
  %11 = icmp slt i32 %10, 0
  %12 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::classnames", %"struct.std::__1::(anonymous namespace)::classnames"* %7, i64 1
  %13 = xor i64 %6, -1
  %14 = add i64 %5, %13
  %15 = select i1 %11, i64 %14, i64 %6
  %16 = select i1 %11, %"struct.std::__1::(anonymous namespace)::classnames"* %12, %"struct.std::__1::(anonymous namespace)::classnames"* %4
  %17 = icmp eq i64 %15, 0
  br i1 %17, label %18, label %3

18:                                               ; preds = %3
  %19 = icmp eq %"struct.std::__1::(anonymous namespace)::classnames"* %16, getelementptr inbounds ([15 x %"struct.std::__1::(anonymous namespace)::classnames"], [15 x %"struct.std::__1::(anonymous namespace)::classnames"]* @_ZNSt3__112_GLOBAL__N_110ClassNamesE, i64 1, i64 0)
  br i1 %19, label %37, label %20

20:                                               ; preds = %18
  %21 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::classnames", %"struct.std::__1::(anonymous namespace)::classnames"* %16, i64 0, i32 0
  %22 = load i8*, i8** %21, align 8, !tbaa !15
  %23 = tail call i32 @strcmp(i8* nonnull dereferenceable(1) %0, i8* nonnull dereferenceable(1) %22) #11
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %37

25:                                               ; preds = %20
  %26 = getelementptr inbounds %"struct.std::__1::(anonymous namespace)::classnames", %"struct.std::__1::(anonymous namespace)::classnames"* %16, i64 0, i32 1
  %27 = load i16, i16* %26, align 8, !tbaa !18
  %28 = icmp eq i16 %27, 128
  %29 = xor i1 %1, true
  %30 = or i1 %28, %29
  %31 = select i1 %28, i16 3968, i16 %27
  br i1 %30, label %37, label %32

32:                                               ; preds = %25
  %33 = and i16 %27, 768
  %34 = icmp eq i16 %33, 0
  %35 = or i16 %27, 1024
  %36 = select i1 %34, i16 %27, i16 %35
  ret i16 %36

37:                                               ; preds = %25, %18, %20
  %38 = phi i16 [ 0, %20 ], [ 0, %18 ], [ %31, %25 ]
  ret i16 %38
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNKSt3__123__match_any_but_newlineIcE6__execERNS_7__stateIcEE(%"class.std::__1::__match_any_but_newline"* nocapture readonly %0, %"struct.std::__1::__state"* nocapture nonnull align 8 dereferenceable(93) %1) unnamed_addr #7 align 2 {
  %3 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 3
  %4 = load i8*, i8** %3, align 8, !tbaa !19
  %5 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 4
  %6 = load i8*, i8** %5, align 8, !tbaa !26
  %7 = icmp eq i8* %4, %6
  br i1 %7, label %22, label %8

8:                                                ; preds = %2
  %9 = load i8, i8* %4, align 1, !tbaa !14
  %10 = sext i8 %9 to i32
  switch i32 %10, label %14 [
    i32 13, label %11
    i32 10, label %11
  ]

11:                                               ; preds = %8, %8
  %12 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 0
  store i32 -993, i32* %12, align 8, !tbaa !27
  %13 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 7
  store %"class.std::__1::__node"* null, %"class.std::__1::__node"** %13, align 8, !tbaa !28
  br label %25

14:                                               ; preds = %8
  %15 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 0
  store i32 -995, i32* %15, align 8, !tbaa !27
  %16 = getelementptr inbounds i8, i8* %4, i64 1
  store i8* %16, i8** %3, align 8, !tbaa !19
  %17 = getelementptr inbounds %"class.std::__1::__match_any_but_newline", %"class.std::__1::__match_any_but_newline"* %0, i64 0, i32 0, i32 0, i32 1
  %18 = bitcast %"class.std::__1::__node"** %17 to i64*
  %19 = load i64, i64* %18, align 8, !tbaa !29
  %20 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 7
  %21 = bitcast %"class.std::__1::__node"** %20 to i64*
  store i64 %19, i64* %21, align 8, !tbaa !28
  br label %25

22:                                               ; preds = %2
  %23 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 0
  store i32 -993, i32* %23, align 8, !tbaa !27
  %24 = getelementptr inbounds %"struct.std::__1::__state", %"struct.std::__1::__state"* %1, i64 0, i32 7
  store %"class.std::__1::__node"* null, %"class.std::__1::__node"** %24, align 8, !tbaa !28
  br label %25

25:                                               ; preds = %11, %14, %22
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNKSt3__123__match_any_but_newlineIwE6__execERNS_7__stateIwEE(%"class.std::__1::__match_any_but_newline.16"* nocapture readonly %0, %"struct.std::__1::__state.20"* nocapture nonnull align 8 dereferenceable(93) %1) unnamed_addr #7 align 2 {
  %3 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 3
  %4 = load i32*, i32** %3, align 8, !tbaa !31
  %5 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 4
  %6 = load i32*, i32** %5, align 8, !tbaa !35
  %7 = icmp eq i32* %4, %6
  br i1 %7, label %21, label %8

8:                                                ; preds = %2
  %9 = load i32, i32* %4, align 4, !tbaa !36
  switch i32 %9, label %13 [
    i32 13, label %10
    i32 10, label %10
    i32 8232, label %10
    i32 8233, label %10
  ]

10:                                               ; preds = %8, %8, %8, %8
  %11 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 0
  store i32 -993, i32* %11, align 8, !tbaa !38
  %12 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 7
  store %"class.std::__1::__node.19"* null, %"class.std::__1::__node.19"** %12, align 8, !tbaa !39
  br label %24

13:                                               ; preds = %8
  %14 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 0
  store i32 -995, i32* %14, align 8, !tbaa !38
  %15 = getelementptr inbounds i32, i32* %4, i64 1
  store i32* %15, i32** %3, align 8, !tbaa !31
  %16 = getelementptr inbounds %"class.std::__1::__match_any_but_newline.16", %"class.std::__1::__match_any_but_newline.16"* %0, i64 0, i32 0, i32 0, i32 1
  %17 = bitcast %"class.std::__1::__node.19"** %16 to i64*
  %18 = load i64, i64* %17, align 8, !tbaa !40
  %19 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 7
  %20 = bitcast %"class.std::__1::__node.19"** %19 to i64*
  store i64 %18, i64* %20, align 8, !tbaa !39
  br label %24

21:                                               ; preds = %2
  %22 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 0
  store i32 -993, i32* %22, align 8, !tbaa !38
  %23 = getelementptr inbounds %"struct.std::__1::__state.20", %"struct.std::__1::__state.20"* %1, i64 0, i32 7
  store %"class.std::__1::__node.19"* null, %"class.std::__1::__node.19"** %23, align 8, !tbaa !39
  br label %24

24:                                               ; preds = %10, %13, %21
  ret void
}

; Function Attrs: nounwind
declare i8* @_ZNKSt13runtime_error4whatEv(%"class.std::runtime_error"*) unnamed_addr #2

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #8

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nofree nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { argmemonly nounwind willreturn writeonly }
attributes #9 = { nounwind }
attributes #10 = { builtin nounwind }
attributes #11 = { nounwind readonly }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 16}
!7 = !{!"_ZTSNSt3__111regex_errorE", !8, i64 16}
!8 = !{!"_ZTSNSt3__115regex_constants10error_typeE", !9, i64 0}
!9 = !{!"omnipotent char", !5, i64 0}
!10 = !{!11, !12, i64 0}
!11 = !{!"_ZTSNSt3__112_GLOBAL__N_114collationnamesE", !12, i64 0, !9, i64 8}
!12 = !{!"any pointer", !9, i64 0}
!13 = !{!11, !9, i64 8}
!14 = !{!9, !9, i64 0}
!15 = !{!16, !12, i64 0}
!16 = !{!"_ZTSNSt3__112_GLOBAL__N_110classnamesE", !12, i64 0, !17, i64 8}
!17 = !{!"short", !9, i64 0}
!18 = !{!16, !17, i64 8}
!19 = !{!20, !12, i64 16}
!20 = !{!"_ZTSNSt3__17__stateIcEE", !21, i64 0, !12, i64 8, !12, i64 16, !12, i64 24, !22, i64 32, !23, i64 56, !12, i64 80, !24, i64 88, !25, i64 92}
!21 = !{!"int", !9, i64 0}
!22 = !{!"_ZTSNSt3__16vectorINS_9sub_matchIPKcEENS_9allocatorIS4_EEEE"}
!23 = !{!"_ZTSNSt3__16vectorINS_4pairImPKcEENS_9allocatorIS4_EEEE"}
!24 = !{!"_ZTSNSt3__115regex_constants15match_flag_typeE", !9, i64 0}
!25 = !{!"bool", !9, i64 0}
!26 = !{!20, !12, i64 24}
!27 = !{!20, !21, i64 0}
!28 = !{!20, !12, i64 80}
!29 = !{!30, !12, i64 8}
!30 = !{!"_ZTSNSt3__115__has_one_stateIcEE", !12, i64 8}
!31 = !{!32, !12, i64 16}
!32 = !{!"_ZTSNSt3__17__stateIwEE", !21, i64 0, !12, i64 8, !12, i64 16, !12, i64 24, !33, i64 32, !34, i64 56, !12, i64 80, !24, i64 88, !25, i64 92}
!33 = !{!"_ZTSNSt3__16vectorINS_9sub_matchIPKwEENS_9allocatorIS4_EEEE"}
!34 = !{!"_ZTSNSt3__16vectorINS_4pairImPKwEENS_9allocatorIS4_EEEE"}
!35 = !{!32, !12, i64 24}
!36 = !{!37, !37, i64 0}
!37 = !{!"wchar_t", !9, i64 0}
!38 = !{!32, !21, i64 0}
!39 = !{!32, !12, i64 80}
!40 = !{!41, !12, i64 8}
!41 = !{!"_ZTSNSt3__115__has_one_stateIwEE", !12, i64 8}

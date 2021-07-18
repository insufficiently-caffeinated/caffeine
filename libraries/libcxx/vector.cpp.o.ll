; ModuleID = 'll/.vector.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/vector.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__vector_base_common" = type { i8 }
%"class.std::length_error" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::__1::__libcpp_refstring" = type { i8* }
%"class.std::out_of_range" = type { %"class.std::logic_error" }

$_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv = comdat any

$_ZNSt3__120__throw_length_errorEPKc = comdat any

$_ZNKSt3__120__vector_base_commonILb1EE20__throw_out_of_rangeEv = comdat any

$_ZNSt3__120__throw_out_of_rangeEPKc = comdat any

$_ZNSt12length_errorC2EPKc = comdat any

$_ZNSt12out_of_rangeC2EPKc = comdat any

@.str = private unnamed_addr constant [7 x i8] c"vector\00", align 1
@_ZTISt12length_error = external constant i8*
@_ZTVSt12length_error = external unnamed_addr constant { [5 x i8*] }, align 8
@_ZTISt12out_of_range = external constant i8*
@_ZTVSt12out_of_range = external unnamed_addr constant { [5 x i8*] }, align 8

; Function Attrs: noreturn uwtable
define weak_odr void @_ZNKSt3__120__vector_base_commonILb1EE20__throw_length_errorEv(%"class.std::__1::__vector_base_common"* %0) local_unnamed_addr #0 comdat align 2 {
  tail call void @_ZNSt3__120__throw_length_errorEPKc(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)) #5
  unreachable
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_length_errorEPKc(i8* %0) local_unnamed_addr #1 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #6
  %3 = bitcast i8* %2 to %"class.std::length_error"*
  invoke void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12length_error to i8*), i8* bitcast (void (%"class.std::length_error"*)* @_ZNSt12length_errorD1Ev to i8*)) #5
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #6
  resume { i8*, i32 } %6
}

; Function Attrs: noreturn uwtable
define weak_odr void @_ZNKSt3__120__vector_base_commonILb1EE20__throw_out_of_rangeEv(%"class.std::__1::__vector_base_common"* %0) local_unnamed_addr #0 comdat align 2 {
  tail call void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0)) #5
  unreachable
}

; Function Attrs: inlinehint noreturn uwtable
define linkonce_odr hidden void @_ZNSt3__120__throw_out_of_rangeEPKc(i8* %0) local_unnamed_addr #1 comdat personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call i8* @__cxa_allocate_exception(i64 16) #6
  %3 = bitcast i8* %2 to %"class.std::out_of_range"*
  invoke void @_ZNSt12out_of_rangeC2EPKc(%"class.std::out_of_range"* %3, i8* %0)
          to label %4 unwind label %5

4:                                                ; preds = %1
  tail call void @__cxa_throw(i8* %2, i8* bitcast (i8** @_ZTISt12out_of_range to i8*), i8* bitcast (void (%"class.std::out_of_range"*)* @_ZNSt12out_of_rangeD1Ev to i8*)) #5
  unreachable

5:                                                ; preds = %1
  %6 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_free_exception(i8* %2) #6
  resume { i8*, i32 } %6
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12length_errorC2EPKc(%"class.std::length_error"* %0, i8* %1) unnamed_addr #2 comdat align 2 {
  %3 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::length_error", %"class.std::length_error"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12length_error, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !3
  ret void
}

declare i32 @__gxx_personality_v0(...)

declare void @__cxa_free_exception(i8*) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt12length_errorD1Ev(%"class.std::length_error"*) unnamed_addr #3

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

declare void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"*, i8*) unnamed_addr #4

; Function Attrs: uwtable
define linkonce_odr hidden void @_ZNSt12out_of_rangeC2EPKc(%"class.std::out_of_range"* %0, i8* %1) unnamed_addr #2 comdat align 2 {
  %3 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorC2EPKc(%"class.std::logic_error"* %3, i8* %1)
  %4 = getelementptr %"class.std::out_of_range", %"class.std::out_of_range"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt12out_of_range, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %4, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt12out_of_rangeD1Ev(%"class.std::out_of_range"*) unnamed_addr #3

attributes #0 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn }
attributes #6 = { nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}

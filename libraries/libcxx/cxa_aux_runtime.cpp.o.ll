; ModuleID = 'll/.cxa_aux_runtime.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_aux_runtime.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::bad_cast" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::bad_typeid" = type { %"class.std::exception" }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }
%"class.std::bad_alloc" = type { %"class.std::exception" }

@_ZTISt8bad_cast = external constant i8*
@_ZTISt10bad_typeid = external constant i8*
@_ZTISt20bad_array_new_length = external constant i8*

; Function Attrs: noreturn uwtable
define void @__cxa_bad_cast() local_unnamed_addr #0 {
  %1 = tail call i8* @__cxa_allocate_exception(i64 8) #2
  %2 = bitcast i8* %1 to %"class.std::bad_cast"*
  tail call void @_ZNSt8bad_castC1Ev(%"class.std::bad_cast"* %2) #2
  tail call void @__cxa_throw(i8* %1, i8* bitcast (i8** @_ZTISt8bad_cast to i8*), i8* bitcast (void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD1Ev to i8*)) #3
  unreachable
}

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt8bad_castC1Ev(%"class.std::bad_cast"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8bad_castD1Ev(%"class.std::bad_cast"*) unnamed_addr #1

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

; Function Attrs: noreturn uwtable
define void @__cxa_bad_typeid() local_unnamed_addr #0 {
  %1 = tail call i8* @__cxa_allocate_exception(i64 8) #2
  %2 = bitcast i8* %1 to %"class.std::bad_typeid"*
  tail call void @_ZNSt10bad_typeidC1Ev(%"class.std::bad_typeid"* %2) #2
  tail call void @__cxa_throw(i8* %1, i8* bitcast (i8** @_ZTISt10bad_typeid to i8*), i8* bitcast (void (%"class.std::bad_typeid"*)* @_ZNSt10bad_typeidD1Ev to i8*)) #3
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt10bad_typeidC1Ev(%"class.std::bad_typeid"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt10bad_typeidD1Ev(%"class.std::bad_typeid"*) unnamed_addr #1

; Function Attrs: noreturn uwtable
define void @__cxa_throw_bad_array_new_length() local_unnamed_addr #0 {
  %1 = tail call i8* @__cxa_allocate_exception(i64 8) #2
  %2 = bitcast i8* %1 to %"class.std::bad_array_new_length"*
  tail call void @_ZNSt20bad_array_new_lengthC1Ev(%"class.std::bad_array_new_length"* %2) #2
  tail call void @__cxa_throw(i8* %1, i8* bitcast (i8** @_ZTISt20bad_array_new_length to i8*), i8* bitcast (void (%"class.std::bad_array_new_length"*)* @_ZNSt20bad_array_new_lengthD1Ev to i8*)) #3
  unreachable
}

; Function Attrs: nounwind
declare void @_ZNSt20bad_array_new_lengthC1Ev(%"class.std::bad_array_new_length"*) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt20bad_array_new_lengthD1Ev(%"class.std::bad_array_new_length"*) unnamed_addr #1

attributes #0 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}

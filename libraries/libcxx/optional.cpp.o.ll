; ModuleID = 'll/.optional.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/optional.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::bad_optional_access" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::experimental::bad_optional_access" = type { %"class.std::logic_error" }
%"class.std::logic_error" = type { %"class.std::exception", %"class.std::__1::__libcpp_refstring" }
%"class.std::__1::__libcpp_refstring" = type { i8* }

@.str = private unnamed_addr constant [20 x i8] c"bad_optional_access\00", align 1
@_ZTVSt19bad_optional_access = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt19bad_optional_access to i8*), i8* bitcast (void (%"class.std::bad_optional_access"*)* @_ZNSt19bad_optional_accessD2Ev to i8*), i8* bitcast (void (%"class.std::bad_optional_access"*)* @_ZNSt19bad_optional_accessD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_optional_access"*)* @_ZNKSt19bad_optional_access4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSSt19bad_optional_access = constant [24 x i8] c"St19bad_optional_access\00", align 1
@_ZTISt9exception = external constant i8*
@_ZTISt19bad_optional_access = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @_ZTSSt19bad_optional_access, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8
@_ZTVNSt12experimental19bad_optional_accessE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt12experimental19bad_optional_accessE to i8*), i8* bitcast (void (%"class.std::experimental::bad_optional_access"*)* @_ZNSt12experimental19bad_optional_accessD2Ev to i8*), i8* bitcast (void (%"class.std::experimental::bad_optional_access"*)* @_ZNSt12experimental19bad_optional_accessD0Ev to i8*), i8* bitcast (i8* (%"class.std::logic_error"*)* @_ZNKSt11logic_error4whatEv to i8*)] }, align 8
@_ZTSNSt12experimental19bad_optional_accessE = constant [40 x i8] c"NSt12experimental19bad_optional_accessE\00", align 1
@_ZTISt11logic_error = external constant i8*
@_ZTINSt12experimental19bad_optional_accessE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([40 x i8], [40 x i8]* @_ZTSNSt12experimental19bad_optional_accessE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt11logic_error to i8*) }, align 8

@_ZNSt19bad_optional_accessD1Ev = unnamed_addr alias void (%"class.std::bad_optional_access"*), void (%"class.std::bad_optional_access"*)* @_ZNSt19bad_optional_accessD2Ev
@_ZNSt12experimental19bad_optional_accessD1Ev = unnamed_addr alias void (%"class.std::experimental::bad_optional_access"*), void (%"class.std::experimental::bad_optional_access"*)* @_ZNSt12experimental19bad_optional_accessD2Ev

; Function Attrs: nounwind
declare void @_ZNSt9exceptionD2Ev(%"class.std::exception"*) unnamed_addr #0

; Function Attrs: nounwind uwtable
define void @_ZNSt19bad_optional_accessD2Ev(%"class.std::bad_optional_access"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_optional_access", %"class.std::bad_optional_access"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #4
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt19bad_optional_accessD0Ev(%"class.std::bad_optional_access"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_optional_access", %"class.std::bad_optional_access"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #4
  %3 = bitcast %"class.std::bad_optional_access"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt19bad_optional_access4whatEv(%"class.std::bad_optional_access"* nocapture readnone %0) unnamed_addr #3 align 2 {
  ret i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: nounwind
declare void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"*) unnamed_addr #0

; Function Attrs: nounwind uwtable
define void @_ZNSt12experimental19bad_optional_accessD2Ev(%"class.std::experimental::bad_optional_access"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::experimental::bad_optional_access", %"class.std::experimental::bad_optional_access"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* %2) #4
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt12experimental19bad_optional_accessD0Ev(%"class.std::experimental::bad_optional_access"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::experimental::bad_optional_access", %"class.std::experimental::bad_optional_access"* %0, i64 0, i32 0
  tail call void @_ZNSt11logic_errorD2Ev(%"class.std::logic_error"* %2) #4
  %3 = bitcast %"class.std::experimental::bad_optional_access"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: nounwind
declare i8* @_ZNKSt11logic_error4whatEv(%"class.std::logic_error"*) unnamed_addr #0

attributes #0 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}

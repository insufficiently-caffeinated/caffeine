; ModuleID = 'll/.any.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/any.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::bad_any_cast" = type { %"class.std::bad_cast" }
%"class.std::bad_cast" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::experimental::fundamentals_v1::bad_any_cast" = type { %"class.std::bad_cast" }

$_ZNSt12bad_any_castD0Ev = comdat any

$_ZNSt12experimental15fundamentals_v112bad_any_castD0Ev = comdat any

@.str = private unnamed_addr constant [13 x i8] c"bad any cast\00", align 1
@_ZTVSt12bad_any_cast = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt12bad_any_cast to i8*), i8* bitcast (void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD2Ev to i8*), i8* bitcast (void (%"class.std::bad_any_cast"*)* @_ZNSt12bad_any_castD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_any_cast"*)* @_ZNKSt12bad_any_cast4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSSt12bad_any_cast = constant [17 x i8] c"St12bad_any_cast\00", align 1
@_ZTISt8bad_cast = external constant i8*
@_ZTISt12bad_any_cast = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @_ZTSSt12bad_any_cast, i32 0, i32 0), i8* bitcast (i8** @_ZTISt8bad_cast to i8*) }, align 8
@_ZTVNSt12experimental15fundamentals_v112bad_any_castE = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTINSt12experimental15fundamentals_v112bad_any_castE to i8*), i8* bitcast (void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD2Ev to i8*), i8* bitcast (void (%"class.std::experimental::fundamentals_v1::bad_any_cast"*)* @_ZNSt12experimental15fundamentals_v112bad_any_castD0Ev to i8*), i8* bitcast (i8* (%"class.std::experimental::fundamentals_v1::bad_any_cast"*)* @_ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv to i8*)] }, align 8
@_ZTSNSt12experimental15fundamentals_v112bad_any_castE = constant [50 x i8] c"NSt12experimental15fundamentals_v112bad_any_castE\00", align 1
@_ZTINSt12experimental15fundamentals_v112bad_any_castE = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([50 x i8], [50 x i8]* @_ZTSNSt12experimental15fundamentals_v112bad_any_castE, i32 0, i32 0), i8* bitcast (i8** @_ZTISt8bad_cast to i8*) }, align 8

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt12bad_any_cast4whatEv(%"class.std::bad_any_cast"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt12experimental15fundamentals_v112bad_any_cast4whatEv(%"class.std::experimental::fundamentals_v1::bad_any_cast"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt12bad_any_castD0Ev(%"class.std::bad_any_cast"* %0) unnamed_addr #1 comdat align 2 {
  %2 = getelementptr %"class.std::bad_any_cast", %"class.std::bad_any_cast"* %0, i64 0, i32 0
  tail call void @_ZNSt8bad_castD2Ev(%"class.std::bad_cast"* %2) #4
  %3 = bitcast %"class.std::bad_any_cast"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt8bad_castD2Ev(%"class.std::bad_cast"*) unnamed_addr #2

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr hidden void @_ZNSt12experimental15fundamentals_v112bad_any_castD0Ev(%"class.std::experimental::fundamentals_v1::bad_any_cast"* %0) unnamed_addr #1 comdat align 2 {
  %2 = getelementptr %"class.std::experimental::fundamentals_v1::bad_any_cast", %"class.std::experimental::fundamentals_v1::bad_any_cast"* %0, i64 0, i32 0
  tail call void @_ZNSt8bad_castD2Ev(%"class.std::bad_cast"* %2) #4
  %3 = bitcast %"class.std::experimental::fundamentals_v1::bad_any_cast"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #3

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}

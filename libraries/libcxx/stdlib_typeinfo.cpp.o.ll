; ModuleID = 'll/.stdlib_typeinfo.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/stdlib_typeinfo.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::type_info" = type { i32 (...)**, i8* }
%"class.std::bad_cast" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"class.std::bad_typeid" = type { %"class.std::exception" }

@_ZTVSt8bad_cast = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt8bad_cast to i8*), i8* bitcast (void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD2Ev to i8*), i8* bitcast (void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_cast"*)* @_ZNKSt8bad_cast4whatEv to i8*)] }, align 8
@.str = private unnamed_addr constant [14 x i8] c"std::bad_cast\00", align 1
@_ZTVSt10bad_typeid = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt10bad_typeid to i8*), i8* bitcast (void (%"class.std::bad_typeid"*)* @_ZNSt10bad_typeidD2Ev to i8*), i8* bitcast (void (%"class.std::bad_typeid"*)* @_ZNSt10bad_typeidD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_typeid"*)* @_ZNKSt10bad_typeid4whatEv to i8*)] }, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"std::bad_typeid\00", align 1
@_ZTVSt9type_info = unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTISt9type_info to i8*), i8* bitcast (void (%"class.std::type_info"*)* @_ZNSt9type_infoD2Ev to i8*), i8* bitcast (void (%"class.std::type_info"*)* @_ZNSt9type_infoD0Ev to i8*)] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSSt9type_info = constant [13 x i8] c"St9type_info\00", align 1
@_ZTISt9type_info = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @_ZTSSt9type_info, i32 0, i32 0) }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSSt8bad_cast = constant [12 x i8] c"St8bad_cast\00", align 1
@_ZTISt9exception = external constant i8*
@_ZTISt8bad_cast = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @_ZTSSt8bad_cast, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8
@_ZTSSt10bad_typeid = constant [15 x i8] c"St10bad_typeid\00", align 1
@_ZTISt10bad_typeid = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @_ZTSSt10bad_typeid, i32 0, i32 0), i8* bitcast (i8** @_ZTISt9exception to i8*) }, align 8

@_ZNSt9type_infoD1Ev = unnamed_addr alias void (%"class.std::type_info"*), void (%"class.std::type_info"*)* @_ZNSt9type_infoD2Ev
@_ZNSt8bad_castC1Ev = unnamed_addr alias void (%"class.std::bad_cast"*), void (%"class.std::bad_cast"*)* @_ZNSt8bad_castC2Ev
@_ZNSt8bad_castD1Ev = unnamed_addr alias void (%"class.std::bad_cast"*), void (%"class.std::bad_cast"*)* @_ZNSt8bad_castD2Ev
@_ZNSt10bad_typeidC1Ev = unnamed_addr alias void (%"class.std::bad_typeid"*), void (%"class.std::bad_typeid"*)* @_ZNSt10bad_typeidC2Ev
@_ZNSt10bad_typeidD1Ev = unnamed_addr alias void (%"class.std::bad_typeid"*), void (%"class.std::bad_typeid"*)* @_ZNSt10bad_typeidD2Ev

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt9type_infoD2Ev(%"class.std::type_info"* nocapture %0) unnamed_addr #0 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt9type_infoD0Ev(%"class.std::type_info"* %0) unnamed_addr #1 align 2 {
  %2 = bitcast %"class.std::type_info"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #5
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt8bad_castC2Ev(%"class.std::bad_cast"* nocapture %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::bad_cast", %"class.std::bad_cast"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt8bad_cast, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind
declare void @_ZNSt9exceptionD2Ev(%"class.std::exception"*) unnamed_addr #4

; Function Attrs: nounwind uwtable
define void @_ZNSt8bad_castD2Ev(%"class.std::bad_cast"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_cast", %"class.std::bad_cast"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt8bad_castD0Ev(%"class.std::bad_cast"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_cast", %"class.std::bad_cast"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #6
  %3 = bitcast %"class.std::bad_cast"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt8bad_cast4whatEv(%"class.std::bad_cast"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt10bad_typeidC2Ev(%"class.std::bad_typeid"* nocapture %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::bad_typeid", %"class.std::bad_typeid"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt10bad_typeid, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt10bad_typeidD2Ev(%"class.std::bad_typeid"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_typeid", %"class.std::bad_typeid"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt10bad_typeidD0Ev(%"class.std::bad_typeid"* %0) unnamed_addr #1 align 2 {
  %2 = getelementptr %"class.std::bad_typeid", %"class.std::bad_typeid"* %0, i64 0, i32 0
  tail call void @_ZNSt9exceptionD2Ev(%"class.std::exception"* %2) #6
  %3 = bitcast %"class.std::bad_typeid"* %0 to i8*
  tail call void @_ZdlPv(i8* %3) #5
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt10bad_typeid4whatEv(%"class.std::bad_typeid"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { builtin nounwind }
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

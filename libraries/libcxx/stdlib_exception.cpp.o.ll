; ModuleID = 'll/.stdlib_exception.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/stdlib_exception.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::exception" = type { i32 (...)** }
%"class.std::bad_exception" = type { %"class.std::exception" }
%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::bad_array_new_length" = type { %"class.std::bad_alloc" }

@.str = private unnamed_addr constant [15 x i8] c"std::exception\00", align 1
@.str.1 = private unnamed_addr constant [19 x i8] c"std::bad_exception\00", align 1
@_ZTVSt9bad_alloc = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt9bad_alloc to i8*), i8* bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to i8*), i8* bitcast (void (%"class.std::bad_alloc"*)* @_ZNSt9bad_allocD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_alloc"*)* @_ZNKSt9bad_alloc4whatEv to i8*)] }, align 8
@.str.2 = private unnamed_addr constant [15 x i8] c"std::bad_alloc\00", align 1
@_ZTVSt20bad_array_new_length = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt20bad_array_new_length to i8*), i8* bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to i8*), i8* bitcast (void (%"class.std::bad_array_new_length"*)* @_ZNSt20bad_array_new_lengthD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_array_new_length"*)* @_ZNKSt20bad_array_new_length4whatEv to i8*)] }, align 8
@.str.3 = private unnamed_addr constant [21 x i8] c"bad_array_new_length\00", align 1
@_ZTVSt9exception = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTISt9exception to i8*), i8* bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to i8*), i8* bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD0Ev to i8*), i8* bitcast (i8* (%"class.std::exception"*)* @_ZNKSt9exception4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSSt9exception = constant [13 x i8] c"St9exception\00", align 1
@_ZTISt9exception = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @_ZTSSt9exception, i32 0, i32 0) }, align 8
@_ZTVSt13bad_exception = unnamed_addr constant { [5 x i8*] } { [5 x i8*] [i8* null, i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt13bad_exception to i8*), i8* bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to i8*), i8* bitcast (void (%"class.std::bad_exception"*)* @_ZNSt13bad_exceptionD0Ev to i8*), i8* bitcast (i8* (%"class.std::bad_exception"*)* @_ZNKSt13bad_exception4whatEv to i8*)] }, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global i8*
@_ZTSSt13bad_exception = constant [18 x i8] c"St13bad_exception\00", align 1
@_ZTISt13bad_exception = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @_ZTSSt13bad_exception, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTISt9exception to i8*) }, align 8
@_ZTSSt9bad_alloc = constant [13 x i8] c"St9bad_alloc\00", align 1
@_ZTISt9bad_alloc = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @_ZTSSt9bad_alloc, i32 0, i32 0), i8* bitcast ({ i8*, i8* }* @_ZTISt9exception to i8*) }, align 8
@_ZTSSt20bad_array_new_length = constant [25 x i8] c"St20bad_array_new_length\00", align 1
@_ZTISt20bad_array_new_length = constant { i8*, i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @_ZTSSt20bad_array_new_length, i32 0, i32 0), i8* bitcast ({ i8*, i8*, i8* }* @_ZTISt9bad_alloc to i8*) }, align 8

@_ZNSt9exceptionD1Ev = unnamed_addr alias void (%"class.std::exception"*), void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev
@_ZNSt13bad_exceptionD2Ev = unnamed_addr alias void (%"class.std::bad_exception"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_exception"*)*)
@_ZNSt13bad_exceptionD1Ev = unnamed_addr alias void (%"class.std::bad_exception"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_exception"*)*)
@_ZNSt9bad_allocC1Ev = unnamed_addr alias void (%"class.std::bad_alloc"*), void (%"class.std::bad_alloc"*)* @_ZNSt9bad_allocC2Ev
@_ZNSt9bad_allocD2Ev = unnamed_addr alias void (%"class.std::bad_alloc"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_alloc"*)*)
@_ZNSt9bad_allocD1Ev = unnamed_addr alias void (%"class.std::bad_alloc"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_alloc"*)*)
@_ZNSt20bad_array_new_lengthC1Ev = unnamed_addr alias void (%"class.std::bad_array_new_length"*), void (%"class.std::bad_array_new_length"*)* @_ZNSt20bad_array_new_lengthC2Ev
@_ZNSt20bad_array_new_lengthD2Ev = unnamed_addr alias void (%"class.std::bad_array_new_length"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_array_new_length"*)*)
@_ZNSt20bad_array_new_lengthD1Ev = unnamed_addr alias void (%"class.std::bad_array_new_length"*), bitcast (void (%"class.std::exception"*)* @_ZNSt9exceptionD2Ev to void (%"class.std::bad_array_new_length"*)*)

; Function Attrs: norecurse nounwind readnone uwtable
define void @_ZNSt9exceptionD2Ev(%"class.std::exception"* nocapture %0) unnamed_addr #0 align 2 {
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt9exceptionD0Ev(%"class.std::exception"* %0) unnamed_addr #1 align 2 {
  %2 = bitcast %"class.std::exception"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #4
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt9exception4whatEv(%"class.std::exception"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0)
}

; Function Attrs: nounwind uwtable
define void @_ZNSt13bad_exceptionD0Ev(%"class.std::bad_exception"* %0) unnamed_addr #1 align 2 {
  %2 = bitcast %"class.std::bad_exception"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #4
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt13bad_exception4whatEv(%"class.std::bad_exception"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.1, i64 0, i64 0)
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt9bad_allocC2Ev(%"class.std::bad_alloc"* nocapture %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::bad_alloc", %"class.std::bad_alloc"* %0, i64 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt9bad_alloc, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt9bad_allocD0Ev(%"class.std::bad_alloc"* %0) unnamed_addr #1 align 2 {
  %2 = bitcast %"class.std::bad_alloc"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #4
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt9bad_alloc4whatEv(%"class.std::bad_alloc"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0)
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define void @_ZNSt20bad_array_new_lengthC2Ev(%"class.std::bad_array_new_length"* nocapture %0) unnamed_addr #3 align 2 {
  %2 = getelementptr %"class.std::bad_array_new_length", %"class.std::bad_array_new_length"* %0, i64 0, i32 0, i32 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [5 x i8*] }, { [5 x i8*] }* @_ZTVSt20bad_array_new_length, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt20bad_array_new_lengthD0Ev(%"class.std::bad_array_new_length"* %0) unnamed_addr #1 align 2 {
  %2 = bitcast %"class.std::bad_array_new_length"* %0 to i8*
  tail call void @_ZdlPv(i8* %2) #4
  ret void
}

; Function Attrs: norecurse nounwind readnone uwtable
define i8* @_ZNKSt20bad_array_new_length4whatEv(%"class.std::bad_array_new_length"* nocapture readnone %0) unnamed_addr #0 align 2 {
  ret i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i64 0, i64 0)
}

attributes #0 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { builtin nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"vtable pointer", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}

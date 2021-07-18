; ModuleID = 'll/.exception.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/exception.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::exception_ptr" = type { i8* }
%"class.std::nested_exception" = type { i32 (...)**, %"class.std::exception_ptr" }

@_ZTVSt16nested_exception = unnamed_addr constant { [4 x i8*] } { [4 x i8*] [i8* null, i8* bitcast ({ i8*, i8* }* @_ZTISt16nested_exception to i8*), i8* bitcast (void (%"class.std::nested_exception"*)* @_ZNSt16nested_exceptionD2Ev to i8*), i8* bitcast (void (%"class.std::nested_exception"*)* @_ZNSt16nested_exceptionD0Ev to i8*)] }, align 8
@_ZTVN10__cxxabiv117__class_type_infoE = external global i8*
@_ZTSSt16nested_exception = constant [21 x i8] c"St16nested_exception\00", align 1
@_ZTISt16nested_exception = constant { i8*, i8* } { i8* bitcast (i8** getelementptr inbounds (i8*, i8** @_ZTVN10__cxxabiv117__class_type_infoE, i64 2) to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @_ZTSSt16nested_exception, i32 0, i32 0) }, align 8

@_ZNSt13exception_ptrD1Ev = unnamed_addr alias void (%"class.std::exception_ptr"*), void (%"class.std::exception_ptr"*)* @_ZNSt13exception_ptrD2Ev
@_ZNSt13exception_ptrC1ERKS_ = unnamed_addr alias void (%"class.std::exception_ptr"*, %"class.std::exception_ptr"*), void (%"class.std::exception_ptr"*, %"class.std::exception_ptr"*)* @_ZNSt13exception_ptrC2ERKS_
@_ZNSt16nested_exceptionC1Ev = unnamed_addr alias void (%"class.std::nested_exception"*), void (%"class.std::nested_exception"*)* @_ZNSt16nested_exceptionC2Ev
@_ZNSt16nested_exceptionD1Ev = unnamed_addr alias void (%"class.std::nested_exception"*), void (%"class.std::nested_exception"*)* @_ZNSt16nested_exceptionD2Ev

; Function Attrs: nounwind uwtable
define zeroext i1 @_ZSt18uncaught_exceptionv() local_unnamed_addr #0 {
  %1 = tail call i32 @__cxa_uncaught_exceptions() #6
  %2 = icmp sgt i32 %1, 0
  ret i1 %2
}

; Function Attrs: nounwind uwtable
define i32 @_ZSt19uncaught_exceptionsv() local_unnamed_addr #0 {
  %1 = tail call i32 @__cxa_uncaught_exceptions() #6
  ret i32 %1
}

; Function Attrs: nounwind
declare i32 @__cxa_uncaught_exceptions() local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @_ZNSt13exception_ptrD2Ev(%"class.std::exception_ptr"* nocapture readonly %0) unnamed_addr #0 align 2 {
  %2 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %0, i64 0, i32 0
  %3 = load i8*, i8** %2, align 8, !tbaa !3
  tail call void @__cxa_decrement_exception_refcount(i8* %3) #6
  ret void
}

; Function Attrs: nounwind
declare void @__cxa_decrement_exception_refcount(i8*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @_ZNSt13exception_ptrC2ERKS_(%"class.std::exception_ptr"* nocapture %0, %"class.std::exception_ptr"* nocapture nonnull readonly align 8 dereferenceable(8) %1) unnamed_addr #0 align 2 {
  %3 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %0, i64 0, i32 0
  %4 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %1, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8, !tbaa !3
  store i8* %5, i8** %3, align 8, !tbaa !3
  tail call void @__cxa_increment_exception_refcount(i8* %5) #6
  ret void
}

; Function Attrs: nounwind
declare void @__cxa_increment_exception_refcount(i8*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define nonnull align 8 dereferenceable(8) %"class.std::exception_ptr"* @_ZNSt13exception_ptraSERKS_(%"class.std::exception_ptr"* returned %0, %"class.std::exception_ptr"* nocapture nonnull readonly align 8 dereferenceable(8) %1) local_unnamed_addr #0 align 2 {
  %3 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %1, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8, !tbaa !3
  %7 = icmp eq i8* %4, %6
  br i1 %7, label %13, label %8

8:                                                ; preds = %2
  tail call void @__cxa_increment_exception_refcount(i8* %6) #6
  %9 = load i8*, i8** %3, align 8, !tbaa !3
  tail call void @__cxa_decrement_exception_refcount(i8* %9) #6
  %10 = bitcast %"class.std::exception_ptr"* %1 to i64*
  %11 = load i64, i64* %10, align 8, !tbaa !3
  %12 = bitcast %"class.std::exception_ptr"* %0 to i64*
  store i64 %11, i64* %12, align 8, !tbaa !3
  br label %13

13:                                               ; preds = %2, %8
  ret %"class.std::exception_ptr"* %0
}

; Function Attrs: nounwind uwtable
define void @_ZNSt16nested_exceptionC2Ev(%"class.std::nested_exception"* nocapture %0) unnamed_addr #0 align 2 {
  %2 = getelementptr %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTVSt16nested_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !8
  %3 = getelementptr inbounds %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 1, i32 0
  %4 = tail call i8* @__cxa_current_primary_exception() #6, !noalias !10
  store i8* %4, i8** %3, align 8, !tbaa !3, !alias.scope !10
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZSt17current_exceptionv(%"class.std::exception_ptr"* noalias nocapture sret align 8 %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %0, i64 0, i32 0
  %3 = tail call i8* @__cxa_current_primary_exception() #6
  store i8* %3, i8** %2, align 8, !tbaa !3
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt16nested_exceptionD2Ev(%"class.std::nested_exception"* nocapture %0) unnamed_addr #0 align 2 {
  %2 = getelementptr %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTVSt16nested_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !8
  %3 = getelementptr inbounds %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  tail call void @__cxa_decrement_exception_refcount(i8* %4) #6
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt16nested_exceptionD0Ev(%"class.std::nested_exception"* %0) unnamed_addr #0 align 2 {
  %2 = getelementptr %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 0
  store i32 (...)** bitcast (i8** getelementptr inbounds ({ [4 x i8*] }, { [4 x i8*] }* @_ZTVSt16nested_exception, i64 0, inrange i32 0, i64 2) to i32 (...)**), i32 (...)*** %2, align 8, !tbaa !8
  %3 = getelementptr inbounds %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  tail call void @__cxa_decrement_exception_refcount(i8* %4) #6
  %5 = bitcast %"class.std::nested_exception"* %0 to i8*
  tail call void @_ZdlPv(i8* %5) #7
  ret void
}

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: noreturn uwtable
define void @_ZNKSt16nested_exception14rethrow_nestedEv(%"class.std::nested_exception"* nocapture readonly %0) local_unnamed_addr #3 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = alloca %"class.std::exception_ptr", align 8
  %3 = getelementptr inbounds %"class.std::nested_exception", %"class.std::nested_exception"* %0, i64 0, i32 1, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = icmp eq i8* %4, null
  tail call void @__cxa_decrement_exception_refcount(i8* null) #6
  br i1 %5, label %6, label %7

6:                                                ; preds = %1
  tail call void @_ZSt9terminatev() #8
  unreachable

7:                                                ; preds = %1
  %8 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %2, i64 0, i32 0
  %9 = load i8*, i8** %3, align 8, !tbaa !3
  store i8* %9, i8** %8, align 8, !tbaa !3
  tail call void @__cxa_increment_exception_refcount(i8* %9) #6
  invoke void @_ZSt17rethrow_exceptionSt13exception_ptr(%"class.std::exception_ptr"* nonnull %2) #9
          to label %10 unwind label %11

10:                                               ; preds = %7
  unreachable

11:                                               ; preds = %7
  %12 = landingpad { i8*, i32 }
          cleanup
  tail call void @__cxa_decrement_exception_refcount(i8* %9) #6
  resume { i8*, i32 } %12
}

; Function Attrs: noreturn nounwind
declare void @_ZSt9terminatev() local_unnamed_addr #4

; Function Attrs: noreturn uwtable
define void @_ZSt17rethrow_exceptionSt13exception_ptr(%"class.std::exception_ptr"* nocapture readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %"class.std::exception_ptr", %"class.std::exception_ptr"* %0, i64 0, i32 0
  %3 = load i8*, i8** %2, align 8, !tbaa !3
  tail call void @__cxa_rethrow_primary_exception(i8* %3)
  tail call void @_ZSt9terminatev() #8
  unreachable
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind
declare i8* @__cxa_current_primary_exception() local_unnamed_addr #1

declare void @__cxa_rethrow_primary_exception(i8*) local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { builtin nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { noreturn }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_ZTSSt13exception_ptr", !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"vtable pointer", !7, i64 0}
!10 = !{!11}
!11 = distinct !{!11, !12, !"_ZSt17current_exceptionv: argument 0"}
!12 = distinct !{!12, !"_ZSt17current_exceptionv"}

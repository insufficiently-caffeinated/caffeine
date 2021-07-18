; ModuleID = 'll/.cxa_default_handlers.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/cxa_default_handlers.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"struct.__cxxabiv1::__cxa_eh_globals" = type { %"struct.__cxxabiv1::__cxa_exception"*, i32 }
%"struct.__cxxabiv1::__cxa_exception" = type { i8*, i64, %"class.std::type_info"*, void (i8*)*, void ()*, void ()*, %"struct.__cxxabiv1::__cxa_exception"*, i32, i32, i8*, i8*, i8*, i8*, %struct._Unwind_Exception }
%"class.std::type_info" = type { i32 (...)**, i8* }
%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }
%"class.__cxxabiv1::__shim_type_info" = type { %"class.std::type_info" }
%"class.std::exception" = type { i32 (...)** }

@__cxa_terminate_handler = global void ()* @_ZL28demangling_terminate_handlerv, align 8
@__cxa_unexpected_handler = global void ()* @_ZL29demangling_unexpected_handlerv, align 8
@_ZTISt9exception = external constant i8*
@.str = private unnamed_addr constant [45 x i8] c"terminating with %s exception of type %s: %s\00", align 1
@_ZL5cause = internal unnamed_addr global i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i64 0, i64 0), align 8
@.str.1 = private unnamed_addr constant [41 x i8] c"terminating with %s exception of type %s\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"terminating with %s foreign exception\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"terminating\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"uncaught\00", align 1
@.str.5 = private unnamed_addr constant [11 x i8] c"unexpected\00", align 1

; Function Attrs: noreturn uwtable
define internal void @_ZL28demangling_terminate_handlerv() #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i32, align 4
  %3 = alloca [1024 x i8], align 16
  %4 = alloca i64, align 8
  %5 = tail call %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast()
  %6 = icmp eq %"struct.__cxxabiv1::__cxa_eh_globals"* %5, null
  br i1 %6, label %59, label %7

7:                                                ; preds = %0
  %8 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_eh_globals", %"struct.__cxxabiv1::__cxa_eh_globals"* %5, i64 0, i32 0
  %9 = load %"struct.__cxxabiv1::__cxa_exception"*, %"struct.__cxxabiv1::__cxa_exception"** %8, align 8, !tbaa !3
  %10 = icmp eq %"struct.__cxxabiv1::__cxa_exception"* %9, null
  br i1 %10, label %59, label %11

11:                                               ; preds = %7
  %12 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 1
  %13 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 0, i32 13
  %14 = tail call zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %13)
  br i1 %14, label %15, label %57

15:                                               ; preds = %11
  %16 = bitcast i8** %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %16) #6
  %17 = tail call i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception* nonnull %13)
  %18 = icmp eq i64 %17, 4849336966747728641
  br i1 %18, label %19, label %23

19:                                               ; preds = %15
  %20 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 0, i32 1
  %21 = bitcast i64* %20 to i8**
  %22 = load i8*, i8** %21, align 8, !tbaa !9
  br label %25

23:                                               ; preds = %15
  %24 = bitcast %"struct.__cxxabiv1::__cxa_exception"* %12 to i8*
  br label %25

25:                                               ; preds = %23, %19
  %26 = phi i8* [ %22, %19 ], [ %24, %23 ]
  store i8* %26, i8** %1, align 8, !tbaa !13
  %27 = getelementptr inbounds %"struct.__cxxabiv1::__cxa_exception", %"struct.__cxxabiv1::__cxa_exception"* %9, i64 0, i32 2
  %28 = load %"class.std::type_info"*, %"class.std::type_info"** %27, align 16, !tbaa !14
  %29 = bitcast %"class.std::type_info"* %28 to %"class.__cxxabiv1::__shim_type_info"*
  %30 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %30) #6
  %31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %31) #6
  %32 = bitcast i64* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32) #6
  store i64 1024, i64* %4, align 8, !tbaa !16
  %33 = getelementptr inbounds %"class.std::type_info", %"class.std::type_info"* %28, i64 0, i32 1
  %34 = load i8*, i8** %33, align 8, !tbaa !17
  %35 = call i8* @__cxa_demangle(i8* %34, i8* nonnull %31, i64* nonnull %4, i32* nonnull %2)
  %36 = load i32, i32* %2, align 4, !tbaa !19
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %40, label %38

38:                                               ; preds = %25
  %39 = load i8*, i8** %33, align 8, !tbaa !17
  br label %40

40:                                               ; preds = %25, %38
  %41 = phi i8* [ %39, %38 ], [ %35, %25 ]
  %42 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)**, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*** bitcast (i8** @_ZTISt9exception to i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)***), align 8, !tbaa !20
  %43 = getelementptr inbounds i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %42, i64 4
  %44 = load i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)*, i1 (%"class.__cxxabiv1::__shim_type_info"*, %"class.__cxxabiv1::__shim_type_info"*, i8**)** %43, align 8
  %45 = call zeroext i1 %44(%"class.__cxxabiv1::__shim_type_info"* bitcast (i8** @_ZTISt9exception to %"class.__cxxabiv1::__shim_type_info"*), %"class.__cxxabiv1::__shim_type_info"* %29, i8** nonnull align 8 dereferenceable(8) %1)
  br i1 %45, label %46, label %55

46:                                               ; preds = %40
  %47 = bitcast i8** %1 to %"class.std::exception"**
  %48 = load %"class.std::exception"*, %"class.std::exception"** %47, align 8, !tbaa !13
  %49 = load i8*, i8** @_ZL5cause, align 8, !tbaa !13
  %50 = bitcast %"class.std::exception"* %48 to i8* (%"class.std::exception"*)***
  %51 = load i8* (%"class.std::exception"*)**, i8* (%"class.std::exception"*)*** %50, align 8, !tbaa !20
  %52 = getelementptr inbounds i8* (%"class.std::exception"*)*, i8* (%"class.std::exception"*)** %51, i64 2
  %53 = load i8* (%"class.std::exception"*)*, i8* (%"class.std::exception"*)** %52, align 8
  %54 = call i8* %53(%"class.std::exception"* %48) #6
  call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i8* %49, i8* %41, i8* %54) #7
  unreachable

55:                                               ; preds = %40
  %56 = load i8*, i8** @_ZL5cause, align 8, !tbaa !13
  call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.1, i64 0, i64 0), i8* %56, i8* %41) #7
  unreachable

57:                                               ; preds = %11
  %58 = load i8*, i8** @_ZL5cause, align 8, !tbaa !13
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0), i8* %58) #7
  unreachable

59:                                               ; preds = %7, %0
  tail call void (i8*, ...) @abort_message(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0)) #7
  unreachable
}

; Function Attrs: noreturn nounwind uwtable
define internal void @_ZL29demangling_unexpected_handlerv() #1 {
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.5, i64 0, i64 0), i8** @_ZL5cause, align 8, !tbaa !13
  tail call void @_ZSt9terminatev() #8
  unreachable
}

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt14set_unexpectedPFvvE(void ()* %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = icmp eq void ()* %0, null
  %3 = select i1 %2, void ()* @_ZL29demangling_unexpected_handlerv, void ()* %0
  %4 = ptrtoint void ()* %3 to i64
  %5 = atomicrmw xchg i64* bitcast (void ()** @__cxa_unexpected_handler to i64*), i64 %4 acq_rel
  %6 = inttoptr i64 %5 to void ()*
  ret void ()* %6
}

declare i32 @__gxx_personality_v0(...)

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nofree norecurse nounwind uwtable
define void ()* @_ZSt13set_terminatePFvvE(void ()* %0) local_unnamed_addr #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = icmp eq void ()* %0, null
  %3 = select i1 %2, void ()* @_ZL28demangling_terminate_handlerv, void ()* %0
  %4 = ptrtoint void ()* %3 to i64
  %5 = atomicrmw xchg i64* bitcast (void ()** @__cxa_terminate_handler to i64*), i64 %4 acq_rel
  %6 = inttoptr i64 %5 to void ()*
  ret void ()* %6
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

declare %"struct.__cxxabiv1::__cxa_eh_globals"* @__cxa_get_globals_fast() local_unnamed_addr #4

declare hidden zeroext i1 @_ZN10__cxxabiv121__isOurExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception*) local_unnamed_addr #4

declare hidden i64 @_ZN10__cxxabiv119__getExceptionClassEPK17_Unwind_Exception(%struct._Unwind_Exception*) local_unnamed_addr #4

declare i8* @__cxa_demangle(i8*, i8*, i64*, i32*) local_unnamed_addr #4

; Function Attrs: noreturn
declare hidden void @abort_message(i8*, ...) local_unnamed_addr #5

attributes #0 = { noreturn uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn }
attributes #8 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_ZTSN10__cxxabiv116__cxa_eh_globalsE", !5, i64 0, !8, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!10, !5, i64 8}
!10 = !{!"_ZTSN10__cxxabiv125__cxa_dependent_exceptionE", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !8, i64 56, !8, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !11, i64 96}
!11 = !{!"_ZTS17_Unwind_Exception", !12, i64 0, !5, i64 8, !12, i64 16, !12, i64 24}
!12 = !{!"long", !6, i64 0}
!13 = !{!5, !5, i64 0}
!14 = !{!15, !5, i64 16}
!15 = !{!"_ZTSN10__cxxabiv115__cxa_exceptionE", !5, i64 0, !12, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !8, i64 56, !8, i64 60, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !11, i64 96}
!16 = !{!12, !12, i64 0}
!17 = !{!18, !5, i64 8}
!18 = !{!"_ZTSSt9type_info", !5, i64 8}
!19 = !{!8, !8, i64 0}
!20 = !{!21, !21, i64 0}
!21 = !{!"vtable pointer", !7, i64 0}

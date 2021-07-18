; ModuleID = 'll/.stdlib_new_delete.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxxabi/src/stdlib_new_delete.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::bad_alloc" = type { %"class.std::exception" }
%"class.std::exception" = type { i32 (...)** }
%"struct.std::nothrow_t" = type { i8 }

$__clang_call_terminate = comdat any

@_ZTISt9bad_alloc = external constant i8*

; Function Attrs: nobuiltin uwtable allocsize(0)
define weak nonnull i8* @_Znwm(i64 %0) local_unnamed_addr #0 {
  %2 = icmp eq i64 %0, 0
  %3 = select i1 %2, i64 1, i64 %0
  %4 = tail call noalias i8* @malloc(i64 %3) #9
  %5 = icmp eq i8* %4, null
  br i1 %5, label %6, label %15

6:                                                ; preds = %1, %9
  %7 = tail call void ()* @_ZSt15get_new_handlerv() #9
  %8 = icmp eq void ()* %7, null
  br i1 %8, label %12, label %9

9:                                                ; preds = %6
  tail call void %7()
  %10 = tail call noalias i8* @malloc(i64 %3) #9
  %11 = icmp eq i8* %10, null
  br i1 %11, label %6, label %15

12:                                               ; preds = %6
  %13 = tail call i8* @__cxa_allocate_exception(i64 8) #9
  %14 = bitcast i8* %13 to %"class.std::bad_alloc"*
  tail call void @_ZNSt9bad_allocC1Ev(%"class.std::bad_alloc"* %14) #9
  tail call void @__cxa_throw(i8* %13, i8* bitcast (i8** @_ZTISt9bad_alloc to i8*), i8* bitcast (void (%"class.std::bad_alloc"*)* @_ZNSt9bad_allocD1Ev to i8*)) #10
  unreachable

15:                                               ; preds = %9, %1
  %16 = phi i8* [ %4, %1 ], [ %10, %9 ]
  ret i8* %16
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nofree nounwind
declare noalias i8* @malloc(i64) local_unnamed_addr #2

; Function Attrs: nounwind
declare void ()* @_ZSt15get_new_handlerv() local_unnamed_addr #3

declare i8* @__cxa_allocate_exception(i64) local_unnamed_addr

; Function Attrs: nounwind
declare void @_ZNSt9bad_allocC1Ev(%"class.std::bad_alloc"*) unnamed_addr #3

; Function Attrs: nounwind
declare void @_ZNSt9bad_allocD1Ev(%"class.std::bad_alloc"*) unnamed_addr #3

declare void @__cxa_throw(i8*, i8*, i8*) local_unnamed_addr

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nobuiltin nounwind uwtable allocsize(0)
define weak noalias i8* @_ZnwmRKSt9nothrow_t(i64 %0, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = invoke noalias nonnull i8* @_Znwm(i64 %0) #11
          to label %8 unwind label %4

4:                                                ; preds = %2
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  %7 = tail call i8* @__cxa_begin_catch(i8* %6) #9
  invoke void @__cxa_end_catch()
          to label %8 unwind label %10

8:                                                ; preds = %2, %4
  %9 = phi i8* [ null, %4 ], [ %3, %2 ]
  ret i8* %9

10:                                               ; preds = %4
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  tail call void @__clang_call_terminate(i8* %12) #12
  unreachable
}

declare i32 @__gxx_personality_v0(...)

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @__cxa_end_catch() local_unnamed_addr

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #5 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #9
  tail call void @_ZSt9terminatev() #12
  unreachable
}

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nobuiltin uwtable allocsize(0)
define weak nonnull i8* @_Znam(i64 %0) local_unnamed_addr #0 {
  %2 = tail call noalias nonnull i8* @_Znwm(i64 %0) #11
  ret i8* %2
}

; Function Attrs: nobuiltin nounwind uwtable allocsize(0)
define weak noalias i8* @_ZnamRKSt9nothrow_t(i64 %0, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = invoke noalias nonnull i8* @_Znam(i64 %0) #11
          to label %8 unwind label %4

4:                                                ; preds = %2
  %5 = landingpad { i8*, i32 }
          catch i8* null
  %6 = extractvalue { i8*, i32 } %5, 0
  %7 = tail call i8* @__cxa_begin_catch(i8* %6) #9
  invoke void @__cxa_end_catch()
          to label %8 unwind label %10

8:                                                ; preds = %2, %4
  %9 = phi i8* [ null, %4 ], [ %3, %2 ]
  ret i8* %9

10:                                               ; preds = %4
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  tail call void @__clang_call_terminate(i8* %12) #12
  unreachable
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdlPv(i8* %0) local_unnamed_addr #6 {
  tail call void @free(i8* %0) #9
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdlPvRKSt9nothrow_t(i8* %0, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #6 {
  tail call void @_ZdlPv(i8* %0) #9
  ret void
}

; Function Attrs: nounwind uwtable
define weak void @_ZdlPvm(i8* %0, i64 %1) local_unnamed_addr #7 {
  tail call void @_ZdlPv(i8* %0) #9
  ret void
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdaPv(i8* %0) local_unnamed_addr #6 {
  tail call void @_ZdlPv(i8* %0) #9
  ret void
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdaPvRKSt9nothrow_t(i8* %0, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %1) local_unnamed_addr #6 {
  tail call void @_ZdaPv(i8* %0) #9
  ret void
}

; Function Attrs: nounwind uwtable
define weak void @_ZdaPvm(i8* %0, i64 %1) local_unnamed_addr #7 {
  tail call void @_ZdaPv(i8* %0) #9
  ret void
}

; Function Attrs: nobuiltin uwtable allocsize(0)
define weak nonnull i8* @_ZnwmSt11align_val_t(i64 %0, i64 %1) local_unnamed_addr #0 {
  %3 = alloca i8*, align 8
  %4 = icmp eq i64 %0, 0
  %5 = select i1 %4, i64 1, i64 %0
  %6 = icmp ugt i64 %1, 8
  %7 = select i1 %6, i64 %1, i64 8
  %8 = bitcast i8** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #9
  store i8* null, i8** %3, align 8, !tbaa !3
  %9 = call i32 @posix_memalign(i8** nonnull %3, i64 %7, i64 %5) #9
  %10 = load i8*, i8** %3, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #9
  %11 = icmp eq i8* %10, null
  br i1 %11, label %12, label %22

12:                                               ; preds = %2, %15
  %13 = call void ()* @_ZSt15get_new_handlerv() #9
  %14 = icmp eq void ()* %13, null
  br i1 %14, label %19, label %15

15:                                               ; preds = %12
  call void %13()
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %8) #9
  store i8* null, i8** %3, align 8, !tbaa !3
  %16 = call i32 @posix_memalign(i8** nonnull %3, i64 %7, i64 %5) #9
  %17 = load i8*, i8** %3, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %8) #9
  %18 = icmp eq i8* %17, null
  br i1 %18, label %12, label %22

19:                                               ; preds = %12
  %20 = call i8* @__cxa_allocate_exception(i64 8) #9
  %21 = bitcast i8* %20 to %"class.std::bad_alloc"*
  call void @_ZNSt9bad_allocC1Ev(%"class.std::bad_alloc"* %21) #9
  call void @__cxa_throw(i8* %20, i8* bitcast (i8** @_ZTISt9bad_alloc to i8*), i8* bitcast (void (%"class.std::bad_alloc"*)* @_ZNSt9bad_allocD1Ev to i8*)) #10
  unreachable

22:                                               ; preds = %15, %2
  %23 = phi i8* [ %10, %2 ], [ %17, %15 ]
  ret i8* %23
}

; Function Attrs: nobuiltin nounwind uwtable allocsize(0)
define weak noalias i8* @_ZnwmSt11align_val_tRKSt9nothrow_t(i64 %0, i64 %1, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = invoke noalias nonnull i8* @_ZnwmSt11align_val_t(i64 %0, i64 %1) #11
          to label %5 unwind label %10

5:                                                ; preds = %3
  %6 = add i64 %1, -1
  %7 = ptrtoint i8* %4 to i64
  %8 = and i64 %6, %7
  %9 = icmp eq i64 %8, 0
  tail call void @llvm.assume(i1 %9)
  br label %14

10:                                               ; preds = %3
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  %13 = tail call i8* @__cxa_begin_catch(i8* %12) #9
  invoke void @__cxa_end_catch()
          to label %14 unwind label %16

14:                                               ; preds = %10, %5
  %15 = phi i8* [ %4, %5 ], [ null, %10 ]
  ret i8* %15

16:                                               ; preds = %10
  %17 = landingpad { i8*, i32 }
          catch i8* null
  %18 = extractvalue { i8*, i32 } %17, 0
  tail call void @__clang_call_terminate(i8* %18) #12
  unreachable
}

; Function Attrs: nounwind willreturn
declare void @llvm.assume(i1) #8

; Function Attrs: nobuiltin uwtable allocsize(0)
define weak nonnull i8* @_ZnamSt11align_val_t(i64 %0, i64 %1) local_unnamed_addr #0 {
  %3 = tail call noalias nonnull i8* @_ZnwmSt11align_val_t(i64 %0, i64 %1) #11
  %4 = add i64 %1, -1
  %5 = ptrtoint i8* %3 to i64
  %6 = and i64 %4, %5
  %7 = icmp eq i64 %6, 0
  tail call void @llvm.assume(i1 %7)
  ret i8* %3
}

; Function Attrs: nobuiltin nounwind uwtable allocsize(0)
define weak noalias i8* @_ZnamSt11align_val_tRKSt9nothrow_t(i64 %0, i64 %1, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #4 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %4 = invoke noalias nonnull i8* @_ZnamSt11align_val_t(i64 %0, i64 %1) #11
          to label %5 unwind label %10

5:                                                ; preds = %3
  %6 = add i64 %1, -1
  %7 = ptrtoint i8* %4 to i64
  %8 = and i64 %6, %7
  %9 = icmp eq i64 %8, 0
  tail call void @llvm.assume(i1 %9)
  br label %14

10:                                               ; preds = %3
  %11 = landingpad { i8*, i32 }
          catch i8* null
  %12 = extractvalue { i8*, i32 } %11, 0
  %13 = tail call i8* @__cxa_begin_catch(i8* %12) #9
  invoke void @__cxa_end_catch()
          to label %14 unwind label %16

14:                                               ; preds = %10, %5
  %15 = phi i8* [ %4, %5 ], [ null, %10 ]
  ret i8* %15

16:                                               ; preds = %10
  %17 = landingpad { i8*, i32 }
          catch i8* null
  %18 = extractvalue { i8*, i32 } %17, 0
  tail call void @__clang_call_terminate(i8* %18) #12
  unreachable
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdlPvSt11align_val_t(i8* %0, i64 %1) local_unnamed_addr #6 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  tail call void @free(i8* %0) #9
  ret void
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdlPvSt11align_val_tRKSt9nothrow_t(i8* %0, i64 %1, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #6 {
  tail call void @_ZdlPvSt11align_val_t(i8* %0, i64 %1) #9
  ret void
}

; Function Attrs: nounwind uwtable
define weak void @_ZdlPvmSt11align_val_t(i8* %0, i64 %1, i64 %2) local_unnamed_addr #7 {
  tail call void @_ZdlPvSt11align_val_t(i8* %0, i64 %2) #9
  ret void
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdaPvSt11align_val_t(i8* %0, i64 %1) local_unnamed_addr #6 {
  tail call void @_ZdlPvSt11align_val_t(i8* %0, i64 %1) #9
  ret void
}

; Function Attrs: nobuiltin nounwind uwtable
define weak void @_ZdaPvSt11align_val_tRKSt9nothrow_t(i8* %0, i64 %1, %"struct.std::nothrow_t"* nonnull align 1 dereferenceable(1) %2) local_unnamed_addr #6 {
  tail call void @_ZdaPvSt11align_val_t(i8* %0, i64 %1) #9
  ret void
}

; Function Attrs: nounwind uwtable
define weak void @_ZdaPvmSt11align_val_t(i8* %0, i64 %1, i64 %2) local_unnamed_addr #7 {
  tail call void @_ZdaPvSt11align_val_t(i8* %0, i64 %2) #9
  ret void
}

; Function Attrs: nofree nounwind
declare i32 @posix_memalign(i8**, i64, i64) local_unnamed_addr #2

attributes #0 = { nobuiltin uwtable allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nobuiltin nounwind uwtable allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noinline noreturn nounwind }
attributes #6 = { nobuiltin nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { nounwind willreturn }
attributes #9 = { nounwind }
attributes #10 = { noreturn }
attributes #11 = { allocsize(0) }
attributes #12 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}

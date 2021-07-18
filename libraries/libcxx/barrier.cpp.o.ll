; ModuleID = 'll/.barrier.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/barrier.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::__barrier_algorithm_base" = type { i64*, %"class.std::__1::unique_ptr" }
%"class.std::__1::unique_ptr" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::__barrier_algorithm_base::__state_t"* }
%"struct.std::__1::__barrier_algorithm_base::__state_t" = type { [64 x %struct.anon] }
%struct.anon = type { %"struct.std::__1::__atomic_base" }
%"struct.std::__1::__atomic_base" = type { %"struct.std::__1::__atomic_base.0" }
%"struct.std::__1::__atomic_base.0" = type { %"struct.std::__1::__cxx_atomic_impl" }
%"struct.std::__1::__cxx_atomic_impl" = type { %"struct.std::__1::__cxx_atomic_base_impl" }
%"struct.std::__1::__cxx_atomic_base_impl" = type { i8 }

$_ZNSt3__124__barrier_algorithm_base8__arriveEh = comdat any

; Function Attrs: uwtable
define nonnull %"class.std::__1::__barrier_algorithm_base"* @_ZNSt3__134__construct_barrier_algorithm_baseERl(i64* nonnull align 8 dereferenceable(8) %0) local_unnamed_addr #0 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = tail call noalias nonnull dereferenceable(16) i8* @_Znwm(i64 16) #7
  %3 = bitcast i8* %2 to i64**
  store i64* %0, i64** %3, align 8, !tbaa !3
  %4 = getelementptr inbounds i8, i8* %2, i64 8
  %5 = bitcast i8* %4 to i64*
  store i64 0, i64* %5, align 8, !tbaa !7
  %6 = load i64, i64* %0, align 8, !tbaa !9
  %7 = add nsw i64 %6, 1
  %8 = ashr i64 %7, 1
  %9 = tail call { i64, i1 } @llvm.umul.with.overflow.i64(i64 %8, i64 64)
  %10 = extractvalue { i64, i1 } %9, 1
  %11 = extractvalue { i64, i1 } %9, 0
  %12 = select i1 %10, i64 -1, i64 %11
  %13 = invoke noalias nonnull align 64 i8* @_ZnamSt11align_val_t(i64 %12, i64 64) #7
          to label %14 unwind label %18

14:                                               ; preds = %1
  %15 = icmp eq i64 %8, 0
  br i1 %15, label %20, label %16

16:                                               ; preds = %14
  %17 = shl nsw i64 %8, 6
  tail call void @llvm.memset.p0i8.i64(i8* nonnull align 64 %13, i8 0, i64 %17, i1 false)
  br label %20

18:                                               ; preds = %1
  %19 = landingpad { i8*, i32 }
          cleanup
  tail call void @_ZdlPv(i8* nonnull %2) #8
  resume { i8*, i32 } %19

20:                                               ; preds = %16, %14
  %21 = bitcast i8* %2 to %"class.std::__1::__barrier_algorithm_base"*
  %22 = ptrtoint i8* %13 to i64
  store i64 %22, i64* %5, align 8, !tbaa !3
  ret %"class.std::__1::__barrier_algorithm_base"* %21
}

; Function Attrs: nobuiltin nofree allocsize(0)
declare noalias nonnull i8* @_Znwm(i64) local_unnamed_addr #1

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #2

; Function Attrs: uwtable
define zeroext i1 @_ZNSt3__131__arrive_barrier_algorithm_baseEPNS_24__barrier_algorithm_baseEh(%"class.std::__1::__barrier_algorithm_base"* %0, i8 zeroext %1) local_unnamed_addr #0 {
  %3 = tail call zeroext i1 @_ZNSt3__124__barrier_algorithm_base8__arriveEh(%"class.std::__1::__barrier_algorithm_base"* %0, i8 zeroext %1)
  ret i1 %3
}

; Function Attrs: uwtable
define linkonce_odr hidden zeroext i1 @_ZNSt3__124__barrier_algorithm_base8__arriveEh(%"class.std::__1::__barrier_algorithm_base"* %0, i8 zeroext %1) local_unnamed_addr #0 comdat align 2 personality i32 (...)* @__gxx_personality_v0 {
  %3 = add i8 %1, 1
  %4 = add i8 %1, 2
  %5 = getelementptr inbounds %"class.std::__1::__barrier_algorithm_base", %"class.std::__1::__barrier_algorithm_base"* %0, i64 0, i32 0
  %6 = load i64*, i64** %5, align 8, !tbaa !11
  %7 = load i64, i64* %6, align 8, !tbaa !9
  %8 = icmp ult i64 %7, 2
  br i1 %8, label %77, label %9

9:                                                ; preds = %2
  %10 = tail call i64 @pthread_self() #9
  %11 = add nsw i64 %7, 1
  %12 = ashr i64 %11, 1
  %13 = urem i64 %10, %12
  %14 = getelementptr inbounds %"class.std::__1::__barrier_algorithm_base", %"class.std::__1::__barrier_algorithm_base"* %0, i64 0, i32 1, i32 0, i32 0, i32 0
  br label %15

15:                                               ; preds = %9, %72
  %16 = phi i64 [ 0, %9 ], [ %75, %72 ]
  %17 = phi i64 [ %7, %9 ], [ %20, %72 ]
  %18 = phi i64 [ %13, %9 ], [ %74, %72 ]
  %19 = add i64 %17, 1
  %20 = lshr i64 %19, 1
  %21 = add nsw i64 %20, -1
  %22 = and i64 %17, 1
  %23 = icmp eq i64 %22, 0
  br i1 %23, label %24, label %49

24:                                               ; preds = %15
  %25 = icmp eq i64 %18, %20
  %26 = select i1 %25, i64 0, i64 %18
  %27 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %14, align 8, !tbaa !3
  %28 = getelementptr inbounds %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %27, i64 %26, i32 0, i64 %16, i32 0, i32 0, i32 0, i32 0, i32 0
  %29 = cmpxchg i8* %28, i8 %1, i8 %3 acq_rel acquire
  %30 = extractvalue { i8, i1 } %29, 1
  br i1 %30, label %77, label %31

31:                                               ; preds = %24, %41
  %32 = phi { i8, i1 } [ %47, %41 ], [ %29, %24 ]
  %33 = phi i64 [ %44, %41 ], [ %26, %24 ]
  %34 = extractvalue { i8, i1 } %32, 0
  %35 = icmp eq i8 %34, %3
  br i1 %35, label %36, label %41

36:                                               ; preds = %31
  %37 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %14, align 8, !tbaa !3
  %38 = getelementptr inbounds %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %37, i64 %33, i32 0, i64 %16, i32 0, i32 0, i32 0, i32 0, i32 0
  %39 = cmpxchg i8* %38, i8 %3, i8 %4 acq_rel acquire
  %40 = extractvalue { i8, i1 } %39, 1
  br i1 %40, label %72, label %41

41:                                               ; preds = %36, %31
  %42 = add i64 %33, 1
  %43 = icmp eq i64 %42, %20
  %44 = select i1 %43, i64 0, i64 %42
  %45 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %14, align 8, !tbaa !3
  %46 = getelementptr inbounds %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %45, i64 %44, i32 0, i64 %16, i32 0, i32 0, i32 0, i32 0, i32 0
  %47 = cmpxchg i8* %46, i8 %1, i8 %3 acq_rel acquire
  %48 = extractvalue { i8, i1 } %47, 1
  br i1 %48, label %77, label %31

49:                                               ; preds = %15, %70
  %50 = phi i64 [ %71, %70 ], [ %18, %15 ]
  %51 = icmp eq i64 %50, %20
  %52 = select i1 %51, i64 0, i64 %50
  %53 = icmp eq i64 %52, %21
  %54 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %14, align 8, !tbaa !3
  %55 = getelementptr inbounds %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %54, i64 %52, i32 0, i64 %16, i32 0, i32 0, i32 0, i32 0, i32 0
  br i1 %53, label %56, label %59

56:                                               ; preds = %49
  %57 = cmpxchg i8* %55, i8 %1, i8 %4 acq_rel acquire
  %58 = extractvalue { i8, i1 } %57, 1
  br i1 %58, label %72, label %70

59:                                               ; preds = %49
  %60 = cmpxchg i8* %55, i8 %1, i8 %3 acq_rel acquire
  %61 = extractvalue { i8, i1 } %60, 1
  br i1 %61, label %77, label %62

62:                                               ; preds = %59
  %63 = extractvalue { i8, i1 } %60, 0
  %64 = icmp eq i8 %63, %3
  br i1 %64, label %65, label %70

65:                                               ; preds = %62
  %66 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %14, align 8, !tbaa !3
  %67 = getelementptr inbounds %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %66, i64 %52, i32 0, i64 %16, i32 0, i32 0, i32 0, i32 0, i32 0
  %68 = cmpxchg i8* %67, i8 %3, i8 %4 acq_rel acquire
  %69 = extractvalue { i8, i1 } %68, 1
  br i1 %69, label %72, label %70

70:                                               ; preds = %65, %56, %62
  %71 = add i64 %52, 1
  br label %49

72:                                               ; preds = %65, %56, %36
  %73 = phi i64 [ %33, %36 ], [ %52, %65 ], [ %21, %56 ]
  %74 = lshr i64 %73, 1
  %75 = add nuw i64 %16, 1
  %76 = icmp ult i64 %19, 4
  br i1 %76, label %77, label %15

77:                                               ; preds = %72, %24, %59, %41, %2
  %78 = phi i1 [ true, %2 ], [ false, %41 ], [ false, %59 ], [ true, %72 ], [ false, %24 ]
  ret i1 %78
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__132__destroy_barrier_algorithm_baseEPNS_24__barrier_algorithm_baseE(%"class.std::__1::__barrier_algorithm_base"* %0) local_unnamed_addr #3 {
  %2 = icmp eq %"class.std::__1::__barrier_algorithm_base"* %0, null
  br i1 %2, label %11, label %3

3:                                                ; preds = %1
  %4 = getelementptr inbounds %"class.std::__1::__barrier_algorithm_base", %"class.std::__1::__barrier_algorithm_base"* %0, i64 0, i32 1, i32 0, i32 0, i32 0
  %5 = load %"struct.std::__1::__barrier_algorithm_base::__state_t"*, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %4, align 8, !tbaa !3
  store %"struct.std::__1::__barrier_algorithm_base::__state_t"* null, %"struct.std::__1::__barrier_algorithm_base::__state_t"** %4, align 8, !tbaa !3
  %6 = icmp eq %"struct.std::__1::__barrier_algorithm_base::__state_t"* %5, null
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = getelementptr %"struct.std::__1::__barrier_algorithm_base::__state_t", %"struct.std::__1::__barrier_algorithm_base::__state_t"* %5, i64 0, i32 0, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0
  tail call void @_ZdaPvSt11align_val_t(i8* %8, i64 64) #8
  br label %9

9:                                                ; preds = %3, %7
  %10 = bitcast %"class.std::__1::__barrier_algorithm_base"* %0 to i8*
  tail call void @_ZdlPv(i8* %10) #8
  br label %11

11:                                               ; preds = %9, %1
  ret void
}

; Function Attrs: nounwind readnone speculatable willreturn
declare { i64, i1 } @llvm.umul.with.overflow.i64(i64, i64) #4

; Function Attrs: nobuiltin nofree allocsize(0)
declare nonnull i8* @_ZnamSt11align_val_t(i64, i64) local_unnamed_addr #1

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPvSt11align_val_t(i8*, i64) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare i64 @pthread_self() local_unnamed_addr #5

; Function Attrs: argmemonly nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #6

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nobuiltin nofree allocsize(0) "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone speculatable willreturn }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { argmemonly nounwind willreturn writeonly }
attributes #7 = { builtin allocsize(0) }
attributes #8 = { builtin nounwind }
attributes #9 = { nounwind readnone }

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
!7 = !{!8, !4, i64 0}
!8 = !{!"_ZTSNSt3__122__compressed_pair_elemIPNS_24__barrier_algorithm_base9__state_tELi0ELb0EEE", !4, i64 0}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!12, !4, i64 0}
!12 = !{!"_ZTSNSt3__124__barrier_algorithm_baseE", !4, i64 0, !13, i64 8}
!13 = !{!"_ZTSNSt3__110unique_ptrIA_NS_24__barrier_algorithm_base9__state_tENS_14default_deleteIS3_EEEE", !14, i64 0}
!14 = !{!"_ZTSNSt3__117__compressed_pairIPNS_24__barrier_algorithm_base9__state_tENS_14default_deleteIA_S2_EEEE"}

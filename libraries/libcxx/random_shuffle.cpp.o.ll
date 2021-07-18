; ModuleID = 'll/.random_shuffle.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/random_shuffle.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.pthread_mutex_t = type { %struct.__pthread_mutex_s }
%struct.__pthread_mutex_s = type { i32, i32, i32, i32, i32, i16, i16, %struct.__pthread_internal_list }
%struct.__pthread_internal_list = type { %struct.__pthread_internal_list*, %struct.__pthread_internal_list* }
%"class.std::__1::mersenne_twister_engine" = type { [624 x i64], i64 }
%"class.std::__1::__rs_default" = type { i8 }

@_ZNSt3__112__rs_default4__c_E = local_unnamed_addr global i32 0, align 4
@_ZNSt3__1L8__rs_mutE = internal global %union.pthread_mutex_t zeroinitializer, align 8
@_ZZNSt3__112__rs_defaultclEvE6__rs_g = internal unnamed_addr global %"class.std::__1::mersenne_twister_engine" zeroinitializer, align 8
@_ZGVZNSt3__112__rs_defaultclEvE6__rs_g = internal global i64 0, align 8

@_ZNSt3__112__rs_defaultC1Ev = unnamed_addr alias void (%"class.std::__1::__rs_default"*), void (%"class.std::__1::__rs_default"*)* @_ZNSt3__112__rs_defaultC2Ev
@_ZNSt3__112__rs_defaultC1ERKS0_ = unnamed_addr alias void (%"class.std::__1::__rs_default"*, %"class.std::__1::__rs_default"*), void (%"class.std::__1::__rs_default"*, %"class.std::__1::__rs_default"*)* @_ZNSt3__112__rs_defaultC2ERKS0_
@_ZNSt3__112__rs_defaultD1Ev = unnamed_addr alias void (%"class.std::__1::__rs_default"*), void (%"class.std::__1::__rs_default"*)* @_ZNSt3__112__rs_defaultD2Ev

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112__rs_defaultC2Ev(%"class.std::__1::__rs_default"* nocapture readnone %0) unnamed_addr #0 align 2 {
  %2 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L8__rs_mutE) #5
  store i32 1, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable
define void @_ZNSt3__112__rs_defaultC2ERKS0_(%"class.std::__1::__rs_default"* nocapture readnone %0, %"class.std::__1::__rs_default"* nocapture nonnull readnone align 1 dereferenceable(1) %1) unnamed_addr #1 align 2 {
  %3 = load i32, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  %4 = add i32 %3, 1
  store i32 %4, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  ret void
}

; Function Attrs: nounwind uwtable
define void @_ZNSt3__112__rs_defaultD2Ev(%"class.std::__1::__rs_default"* nocapture readnone %0) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = load i32, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  %3 = add i32 %2, -1
  store i32 %3, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %7

5:                                                ; preds = %1
  %6 = tail call i32 @pthread_mutex_unlock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L8__rs_mutE) #5
  br label %7

7:                                                ; preds = %5, %1
  ret void
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nofree uwtable
define i64 @_ZNSt3__112__rs_defaultclEv(%"class.std::__1::__rs_default"* nocapture readnone %0) local_unnamed_addr #2 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = load atomic i8, i8* bitcast (i64* @_ZGVZNSt3__112__rs_defaultclEvE6__rs_g to i8*) acquire, align 8
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %4, label %20, !prof !8

4:                                                ; preds = %1
  %5 = tail call i32 @__cxa_guard_acquire(i64* nonnull @_ZGVZNSt3__112__rs_defaultclEvE6__rs_g) #5
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %20, label %7

7:                                                ; preds = %4
  store i64 5489, i64* getelementptr inbounds (%"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 0), align 8, !tbaa !9
  br label %8

8:                                                ; preds = %54, %7
  %9 = phi i64 [ 5489, %7 ], [ %59, %54 ]
  %10 = phi i64 [ 1, %7 ], [ %61, %54 ]
  %11 = lshr i64 %9, 30
  %12 = xor i64 %11, %9
  %13 = mul nuw nsw i64 %12, 1812433253
  %14 = add nuw i64 %13, %10
  %15 = and i64 %14, 4294967295
  %16 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %10
  store i64 %15, i64* %16, align 8, !tbaa !9
  %17 = add nuw nsw i64 %10, 1
  %18 = icmp eq i64 %17, 624
  br i1 %18, label %19, label %54

19:                                               ; preds = %8
  store i64 0, i64* getelementptr inbounds (%"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 1), align 8, !tbaa !11
  tail call void @__cxa_guard_release(i64* nonnull @_ZGVZNSt3__112__rs_defaultclEvE6__rs_g) #5
  br label %20

20:                                               ; preds = %4, %19, %1
  %21 = load i64, i64* getelementptr inbounds (%"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 1), align 8, !tbaa !11
  %22 = add i64 %21, 1
  %23 = urem i64 %22, 624
  %24 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %21
  %25 = load i64, i64* %24, align 8, !tbaa !9
  %26 = and i64 %25, -2147483648
  %27 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %23
  %28 = load i64, i64* %27, align 8, !tbaa !9
  %29 = and i64 %28, 2147483646
  %30 = or i64 %29, %26
  %31 = add i64 %21, 397
  %32 = urem i64 %31, 624
  %33 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %32
  %34 = load i64, i64* %33, align 8, !tbaa !9
  %35 = lshr exact i64 %30, 1
  %36 = and i64 %28, 1
  %37 = mul nuw nsw i64 %36, 2567483615
  %38 = xor i64 %37, %34
  %39 = xor i64 %38, %35
  store i64 %39, i64* %24, align 8, !tbaa !9
  %40 = load i64, i64* getelementptr inbounds (%"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 1), align 8, !tbaa !11
  %41 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %40
  %42 = load i64, i64* %41, align 8, !tbaa !9
  %43 = lshr i64 %42, 11
  %44 = and i64 %43, 4294967295
  %45 = xor i64 %44, %42
  store i64 %23, i64* getelementptr inbounds (%"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 1), align 8, !tbaa !11
  %46 = shl i64 %45, 7
  %47 = and i64 %46, 2636928640
  %48 = xor i64 %47, %45
  %49 = shl i64 %48, 15
  %50 = and i64 %49, 4022730752
  %51 = xor i64 %50, %48
  %52 = lshr i64 %51, 18
  %53 = xor i64 %52, %51
  ret i64 %53

54:                                               ; preds = %8
  %55 = lshr i64 %15, 30
  %56 = xor i64 %55, %15
  %57 = mul nuw nsw i64 %56, 1812433253
  %58 = add nuw i64 %57, %17
  %59 = and i64 %58, 4294967295
  %60 = getelementptr inbounds %"class.std::__1::mersenne_twister_engine", %"class.std::__1::mersenne_twister_engine"* @_ZZNSt3__112__rs_defaultclEvE6__rs_g, i64 0, i32 0, i64 %17
  store i64 %59, i64* %60, align 8, !tbaa !9
  %61 = add nuw nsw i64 %10, 2
  br label %8
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_guard_acquire(i64*) local_unnamed_addr #3

; Function Attrs: nofree nounwind
declare void @__cxa_guard_release(i64*) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define void @_ZNSt3__18__rs_getEv(%"class.std::__1::__rs_default"* noalias nocapture readnone sret align 1 %0) local_unnamed_addr #0 {
  %2 = tail call i32 @pthread_mutex_lock(%union.pthread_mutex_t* nonnull @_ZNSt3__1L8__rs_mutE) #5
  store i32 1, i32* @_ZNSt3__112__rs_default4__c_E, align 4, !tbaa !4
  ret void
}

; Function Attrs: nounwind
declare i32 @pthread_mutex_lock(%union.pthread_mutex_t*) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @pthread_mutex_unlock(%union.pthread_mutex_t*) local_unnamed_addr #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nofree uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"pthread"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!"branch_weights", i32 1, i32 1048575}
!9 = !{!10, !10, i64 0}
!10 = !{!"long", !6, i64 0}
!11 = !{!12, !10, i64 4992}
!12 = !{!"_ZTSNSt3__123mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEE", !6, i64 0, !10, i64 4992}

; ModuleID = 'll/.chrono.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/chrono.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timespec = type { i64, i64 }
%"class.std::__1::chrono::time_point" = type { %"class.std::__1::chrono::duration" }
%"class.std::__1::chrono::duration" = type { i64 }

$__clang_call_terminate = comdat any

$_ZNSt3__16chrono12system_clock9is_steadyE = comdat any

$_ZNSt3__16chrono12steady_clock9is_steadyE = comdat any

@_ZNSt3__16chrono12system_clock9is_steadyE = weak_odr local_unnamed_addr constant i8 0, comdat, align 1
@_ZNSt3__16chrono12steady_clock9is_steadyE = weak_odr local_unnamed_addr constant i8 1, comdat, align 1
@.str = private unnamed_addr constant [37 x i8] c"clock_gettime(CLOCK_REALTIME) failed\00", align 1
@.str.1 = private unnamed_addr constant [38 x i8] c"clock_gettime(CLOCK_MONOTONIC) failed\00", align 1

; Function Attrs: nounwind uwtable
define i64 @_ZNSt3__16chrono12system_clock3nowEv() local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %struct.timespec, align 8
  %2 = bitcast %struct.timespec* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #6
  %3 = call i32 @clock_gettime(i32 0, %struct.timespec* nonnull %1) #6
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %9, label %5

5:                                                ; preds = %0
  %6 = tail call i32* @__errno_location() #7
  %7 = load i32, i32* %6, align 4, !tbaa !4
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %7, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str, i64 0, i64 0)) #8
          to label %8 unwind label %17

8:                                                ; preds = %5
  unreachable

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !8
  %12 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !10
  %14 = sdiv i64 %13, 1000
  %15 = mul nsw i64 %11, 1000000
  %16 = add nsw i64 %14, %15
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #6
  ret i64 %16

17:                                               ; preds = %5
  %18 = landingpad { i8*, i32 }
          catch i8* null
  %19 = extractvalue { i8*, i32 } %18, 0
  call void @__clang_call_terminate(i8* %19) #9
  unreachable
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #1 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #6
  tail call void @_ZSt9terminatev() #9
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nounwind uwtable
define i64 @_ZNSt3__16chrono12system_clock9to_time_tERKNS0_10time_pointIS1_NS0_8durationIxNS_5ratioILl1ELl1000000EEEEEEE(%"class.std::__1::chrono::time_point"* nocapture nonnull readonly align 8 dereferenceable(8) %0) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::chrono::time_point", %"class.std::__1::chrono::time_point"* %0, i64 0, i32 0, i32 0
  %3 = load i64, i64* %2, align 8, !tbaa.struct !12
  %4 = sdiv i64 %3, 1000000
  ret i64 %4
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define i64 @_ZNSt3__16chrono12system_clock11from_time_tEl(i64 %0) local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = mul nsw i64 %0, 1000000
  ret i64 %2
}

; Function Attrs: nounwind uwtable
define i64 @_ZNSt3__16chrono12steady_clock3nowEv() local_unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %1 = alloca %struct.timespec, align 8
  %2 = bitcast %struct.timespec* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %2) #6
  %3 = call i32 @clock_gettime(i32 1, %struct.timespec* nonnull %1) #6
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %9, label %5

5:                                                ; preds = %0
  %6 = tail call i32* @__errno_location() #7
  %7 = load i32, i32* %6, align 4, !tbaa !4
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %7, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.1, i64 0, i64 0)) #8
          to label %8 unwind label %16

8:                                                ; preds = %5
  unreachable

9:                                                ; preds = %0
  %10 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 0
  %11 = load i64, i64* %10, align 8, !tbaa !8
  %12 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !8
  %14 = mul nsw i64 %11, 1000000000
  %15 = add nsw i64 %14, %13
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %2) #6
  ret i64 %15

16:                                               ; preds = %5
  %17 = landingpad { i8*, i32 }
          catch i8* null
  %18 = extractvalue { i8*, i32 } %17, 0
  call void @__clang_call_terminate(i8* %18) #9
  unreachable
}

; Function Attrs: nounwind
declare i32 @clock_gettime(i32, %struct.timespec*) local_unnamed_addr #3

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #4

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline noreturn nounwind }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn }
attributes #9 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.dependent-libraries = !{!0}
!llvm.module.flags = !{!1, !2}
!llvm.ident = !{!3}

!0 = !{!"rt"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!11, !9, i64 8}
!11 = !{!"_ZTS8timespec", !9, i64 0, !9, i64 8}
!12 = !{i64 0, i64 8, !13}
!13 = !{!14, !14, i64 0}
!14 = !{!"long long", !6, i64 0}

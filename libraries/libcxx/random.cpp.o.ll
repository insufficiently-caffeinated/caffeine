; ModuleID = 'll/.random.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/random.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%"class.std::__1::random_device" = type { i32 }
%"class.std::__1::basic_string" = type { %"class.std::__1::__compressed_pair" }
%"class.std::__1::__compressed_pair" = type { %"struct.std::__1::__compressed_pair_elem" }
%"struct.std::__1::__compressed_pair_elem" = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__rep" = type { %union.anon }
%union.anon = type { %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__long" = type { i64, i64, i8* }
%"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short" = type { %union.anon.0, [23 x i8] }
%union.anon.0 = type { i8 }

$__clang_call_terminate = comdat any

@.str = private unnamed_addr constant [30 x i8] c"random_device failed to open \00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"random_device got EOF\00", align 1
@.str.2 = private unnamed_addr constant [38 x i8] c"random_device got an unexpected error\00", align 1

@_ZNSt3__113random_deviceC1ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE = unnamed_addr alias void (%"class.std::__1::random_device"*, %"class.std::__1::basic_string"*), void (%"class.std::__1::random_device"*, %"class.std::__1::basic_string"*)* @_ZNSt3__113random_deviceC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE
@_ZNSt3__113random_deviceD1Ev = unnamed_addr alias void (%"class.std::__1::random_device"*), void (%"class.std::__1::random_device"*)* @_ZNSt3__113random_deviceD2Ev

; Function Attrs: uwtable
define void @_ZNSt3__113random_deviceC2ERKNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE(%"class.std::__1::random_device"* nocapture %0, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1) unnamed_addr #0 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %3 = alloca %"class.std::__1::basic_string", align 8
  %4 = getelementptr inbounds %"class.std::__1::random_device", %"class.std::__1::random_device"* %0, i64 0, i32 0
  %5 = bitcast %"class.std::__1::basic_string"* %1 to i8*
  %6 = load i8, i8* %5, align 8, !tbaa !3
  %7 = and i8 %6, 1
  %8 = icmp eq i8 %7, 0
  %9 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %1, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast %"class.std::__1::basic_string"* %1 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %12 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %11, i64 0, i32 1, i64 0
  %13 = select i1 %8, i8* %12, i8* %10
  %14 = tail call i32 (i8*, i32, ...) @open(i8* %13, i32 0)
  store i32 %14, i32* %4, align 4, !tbaa !6
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %37

16:                                               ; preds = %2
  %17 = tail call i32* @__errno_location() #10
  %18 = load i32, i32* %17, align 4, !tbaa !9
  %19 = bitcast %"class.std::__1::basic_string"* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %19) #11
  call void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(%"class.std::__1::basic_string"* nonnull sret align 8 %3, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str, i64 0, i64 0), %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24) %1)
  %20 = load i8, i8* %19, align 8, !tbaa !3
  %21 = and i8 %20, 1
  %22 = icmp eq i8 %21, 0
  %23 = getelementptr inbounds %"class.std::__1::basic_string", %"class.std::__1::basic_string"* %3, i64 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 2
  %24 = load i8*, i8** %23, align 8
  %25 = bitcast %"class.std::__1::basic_string"* %3 to %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"*
  %26 = getelementptr inbounds %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short", %"struct.std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char>>::__short"* %25, i64 0, i32 1, i64 0
  %27 = select i1 %22, i8* %26, i8* %24
  invoke void @_ZNSt3__120__throw_system_errorEiPKc(i32 %18, i8* %27) #12
          to label %28 unwind label %29

28:                                               ; preds = %16
  unreachable

29:                                               ; preds = %16
  %30 = landingpad { i8*, i32 }
          cleanup
  %31 = load i8, i8* %19, align 8, !tbaa !3
  %32 = and i8 %31, 1
  %33 = icmp eq i8 %32, 0
  br i1 %33, label %36, label %34

34:                                               ; preds = %29
  %35 = load i8*, i8** %23, align 8, !tbaa !3
  call void @_ZdlPv(i8* %35) #13
  br label %36

36:                                               ; preds = %29, %34
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %19) #11
  resume { i8*, i32 } %30

37:                                               ; preds = %2
  ret void
}

; Function Attrs: nofree
declare i32 @open(i8* nocapture readonly, i32, ...) local_unnamed_addr #1

; Function Attrs: noreturn
declare void @_ZNSt3__120__throw_system_errorEiPKc(i32, i8*) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare i32* @__errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #4

declare void @_ZNSt3__1plIcNS_11char_traitsIcEENS_9allocatorIcEEEENS_12basic_stringIT_T0_T1_EEPKS6_RKS9_(%"class.std::__1::basic_string"* sret align 8, i8*, %"class.std::__1::basic_string"* nonnull align 8 dereferenceable(24)) local_unnamed_addr #5

declare i32 @__gxx_personality_v0(...)

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #4

; Function Attrs: nounwind uwtable
define void @_ZNSt3__113random_deviceD2Ev(%"class.std::__1::random_device"* nocapture readonly %0) unnamed_addr #6 align 2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %2 = getelementptr inbounds %"class.std::__1::random_device", %"class.std::__1::random_device"* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 4, !tbaa !6
  %4 = invoke i32 @close(i32 %3)
          to label %5 unwind label %6

5:                                                ; preds = %1
  ret void

6:                                                ; preds = %1
  %7 = landingpad { i8*, i32 }
          catch i8* null
  %8 = extractvalue { i8*, i32 } %7, 0
  tail call void @__clang_call_terminate(i8* %8) #14
  unreachable
}

declare i32 @close(i32) local_unnamed_addr #5

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) local_unnamed_addr #7 comdat {
  %2 = tail call i8* @__cxa_begin_catch(i8* %0) #11
  tail call void @_ZSt9terminatev() #14
  unreachable
}

declare i8* @__cxa_begin_catch(i8*) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: uwtable
define i32 @_ZNSt3__113random_deviceclEv(%"class.std::__1::random_device"* nocapture readonly %0) local_unnamed_addr #0 align 2 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #11
  %4 = getelementptr inbounds %"class.std::__1::random_device", %"class.std::__1::random_device"* %0, i64 0, i32 0
  br label %5

5:                                                ; preds = %1, %19
  %6 = phi i64 [ 4, %1 ], [ %21, %19 ]
  %7 = phi i8* [ %3, %1 ], [ %20, %19 ]
  %8 = load i32, i32* %4, align 4, !tbaa !6
  %9 = call i64 @read(i32 %8, i8* %7, i64 %6)
  switch i64 %9, label %16 [
    i64 0, label %10
    i64 -1, label %11
  ]

10:                                               ; preds = %5
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 61, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i64 0, i64 0)) #12
  unreachable

11:                                               ; preds = %5
  %12 = tail call i32* @__errno_location() #10
  %13 = load i32, i32* %12, align 4, !tbaa !9
  %14 = icmp eq i32 %13, 4
  br i1 %14, label %19, label %15

15:                                               ; preds = %11
  tail call void @_ZNSt3__120__throw_system_errorEiPKc(i32 %13, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i64 0, i64 0)) #12
  unreachable

16:                                               ; preds = %5
  %17 = sub i64 %6, %9
  %18 = getelementptr inbounds i8, i8* %7, i64 %9
  br label %19

19:                                               ; preds = %11, %16
  %20 = phi i8* [ %18, %16 ], [ %7, %11 ]
  %21 = phi i64 [ %17, %16 ], [ %6, %11 ]
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %23, label %5

23:                                               ; preds = %19
  %24 = load i32, i32* %2, align 4, !tbaa !9
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #11
  ret i32 %24
}

; Function Attrs: nofree
declare i64 @read(i32, i8* nocapture, i64) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define double @_ZNKSt3__113random_device7entropyEv(%"class.std::__1::random_device"* nocapture readonly %0) local_unnamed_addr #6 align 2 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #11
  %4 = getelementptr inbounds %"class.std::__1::random_device", %"class.std::__1::random_device"* %0, i64 0, i32 0
  %5 = load i32, i32* %4, align 4, !tbaa !6
  %6 = call i32 (i32, i64, ...) @ioctl(i32 %5, i64 2147766784, i32* nonnull %2) #11
  %7 = icmp slt i32 %6, 0
  br i1 %7, label %15, label %8

8:                                                ; preds = %1
  %9 = load i32, i32* %2, align 4, !tbaa !9
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %15, label %11

11:                                               ; preds = %8
  %12 = icmp slt i32 %9, 32
  %13 = select i1 %12, i32 %9, i32 32
  %14 = sitofp i32 %13 to double
  br label %15

15:                                               ; preds = %11, %8, %1
  %16 = phi double [ 0.000000e+00, %1 ], [ 0.000000e+00, %8 ], [ %14, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #11
  ret double %16
}

; Function Attrs: nounwind
declare i32 @ioctl(i32, i64, ...) local_unnamed_addr #8

; Function Attrs: nobuiltin nounwind
declare void @_ZdlPv(i8*) local_unnamed_addr #9

attributes #0 = { uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind willreturn }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { noinline noreturn nounwind }
attributes #8 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nobuiltin nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind readnone }
attributes #11 = { nounwind }
attributes #12 = { noreturn }
attributes #13 = { builtin nounwind }
attributes #14 = { noreturn nounwind }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = !{!7, !8, i64 0}
!7 = !{!"_ZTSNSt3__113random_deviceE", !8, i64 0}
!8 = !{!"int", !4, i64 0}
!9 = !{!8, !8, i64 0}

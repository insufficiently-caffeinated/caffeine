; ModuleID = 'll/.int128_builtins.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/filesystem/int128_builtins.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define { i64, i64 } @__muloti4(i64 %0, i64 %1, i64 %2, i64 %3, i32* nocapture %4) local_unnamed_addr #0 {
  %6 = zext i64 %1 to i128
  %7 = shl nuw i128 %6, 64
  %8 = zext i64 %0 to i128
  %9 = or i128 %7, %8
  %10 = zext i64 %3 to i128
  %11 = shl nuw i128 %10, 64
  %12 = zext i64 %2 to i128
  %13 = or i128 %11, %12
  store i32 0, i32* %4, align 4, !tbaa !3
  %14 = mul nsw i128 %13, %9
  %15 = icmp eq i128 %9, -170141183460469231731687303715884105728
  br i1 %15, label %16, label %19

16:                                               ; preds = %5
  %17 = icmp ult i128 %13, 2
  br i1 %17, label %45, label %18

18:                                               ; preds = %16
  store i32 1, i32* %4, align 4, !tbaa !3
  br label %45

19:                                               ; preds = %5
  %20 = icmp eq i128 %13, -170141183460469231731687303715884105728
  br i1 %20, label %21, label %24

21:                                               ; preds = %19
  %22 = icmp ult i128 %9, 2
  br i1 %22, label %45, label %23

23:                                               ; preds = %21
  store i32 1, i32* %4, align 4, !tbaa !3
  br label %45

24:                                               ; preds = %19
  %25 = ashr i128 %7, 127
  %26 = xor i128 %9, %25
  %27 = sub nsw i128 %26, %25
  %28 = ashr i128 %11, 127
  %29 = xor i128 %13, %28
  %30 = sub nsw i128 %29, %28
  %31 = icmp slt i128 %27, 2
  %32 = icmp slt i128 %30, 2
  %33 = or i1 %31, %32
  br i1 %33, label %45, label %34

34:                                               ; preds = %24
  %35 = icmp eq i128 %25, %28
  br i1 %35, label %36, label %40

36:                                               ; preds = %34
  %37 = udiv i128 170141183460469231731687303715884105727, %30
  %38 = icmp sgt i128 %27, %37
  br i1 %38, label %39, label %45

39:                                               ; preds = %36
  store i32 1, i32* %4, align 4, !tbaa !3
  br label %45

40:                                               ; preds = %34
  %41 = sub nsw i128 0, %30
  %42 = sdiv i128 -170141183460469231731687303715884105728, %41
  %43 = icmp sgt i128 %27, %42
  br i1 %43, label %44, label %45

44:                                               ; preds = %40
  store i32 1, i32* %4, align 4, !tbaa !3
  br label %45

45:                                               ; preds = %39, %36, %44, %40, %24, %23, %21, %18, %16
  %46 = trunc i128 %14 to i64
  %47 = lshr i128 %14, 64
  %48 = trunc i128 %47 to i64
  %49 = insertvalue { i64, i64 } undef, i64 %46, 0
  %50 = insertvalue { i64, i64 } %49, i64 %48, 1
  ret { i64, i64 } %50
}

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}

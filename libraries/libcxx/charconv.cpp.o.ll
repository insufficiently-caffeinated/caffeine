; ModuleID = 'll/.charconv.cpp.o.bc'
source_filename = "/home/misha/sweet/repos/libcxx-llvm-ir/llvm-project/libcxx/src/charconv.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@_ZNSt3__16__itoaL10cDigitsLutE = internal unnamed_addr constant [200 x i8] c"00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899", align 16

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define nonnull i8* @_ZNSt3__16__itoa8__u32toaEjPc(i32 %0, i8* %1) local_unnamed_addr #0 {
  %3 = icmp ult i32 %0, 100000000
  br i1 %3, label %4, label %122

4:                                                ; preds = %2
  %5 = icmp ult i32 %0, 10000
  br i1 %5, label %6, label %54

6:                                                ; preds = %4
  %7 = icmp ult i32 %0, 100
  br i1 %7, label %8, label %22

8:                                                ; preds = %6
  %9 = icmp ult i32 %0, 10
  br i1 %9, label %10, label %14

10:                                               ; preds = %8
  %11 = trunc i32 %0 to i8
  %12 = add nuw nsw i8 %11, 48
  store i8 %12, i8* %1, align 1, !tbaa !3
  %13 = getelementptr inbounds i8, i8* %1, i64 1
  br label %175

14:                                               ; preds = %8
  %15 = shl nuw nsw i32 %0, 1
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %16
  %18 = bitcast i8* %17 to i16*
  %19 = bitcast i8* %1 to i16*
  %20 = load i16, i16* %18, align 2
  store i16 %20, i16* %19, align 1
  %21 = getelementptr inbounds i8, i8* %1, i64 2
  br label %175

22:                                               ; preds = %6
  %23 = icmp ult i32 %0, 1000
  %24 = trunc i32 %0 to i16
  %25 = udiv i16 %24, 100
  %26 = urem i16 %24, 100
  br i1 %23, label %27, label %39

27:                                               ; preds = %22
  %28 = trunc i16 %25 to i8
  %29 = add nuw nsw i8 %28, 48
  store i8 %29, i8* %1, align 1, !tbaa !3
  %30 = getelementptr inbounds i8, i8* %1, i64 1
  %31 = urem i16 %24, 100
  %32 = shl nuw nsw i16 %31, 1
  %33 = zext i16 %32 to i64
  %34 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %33
  %35 = bitcast i8* %34 to i16*
  %36 = bitcast i8* %30 to i16*
  %37 = load i16, i16* %35, align 2
  store i16 %37, i16* %36, align 1
  %38 = getelementptr inbounds i8, i8* %1, i64 3
  br label %175

39:                                               ; preds = %22
  %40 = shl nuw nsw i16 %25, 1
  %41 = zext i16 %40 to i64
  %42 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %41
  %43 = bitcast i8* %42 to i16*
  %44 = bitcast i8* %1 to i16*
  %45 = load i16, i16* %43, align 2
  store i16 %45, i16* %44, align 1
  %46 = getelementptr inbounds i8, i8* %1, i64 2
  %47 = shl nuw nsw i16 %26, 1
  %48 = zext i16 %47 to i64
  %49 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %48
  %50 = bitcast i8* %49 to i16*
  %51 = bitcast i8* %46 to i16*
  %52 = load i16, i16* %50, align 2
  store i16 %52, i16* %51, align 1
  %53 = getelementptr inbounds i8, i8* %1, i64 4
  br label %175

54:                                               ; preds = %4
  %55 = udiv i32 %0, 10000
  %56 = urem i32 %0, 10000
  %57 = icmp ult i32 %0, 1000000
  br i1 %57, label %58, label %70

58:                                               ; preds = %54
  %59 = icmp ult i32 %0, 100000
  br i1 %59, label %60, label %63

60:                                               ; preds = %58
  %61 = trunc i32 %55 to i8
  %62 = add nuw nsw i8 %61, 48
  store i8 %62, i8* %1, align 1, !tbaa !3
  br label %102

63:                                               ; preds = %58
  %64 = shl nuw nsw i32 %55, 1
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %65
  %67 = bitcast i8* %66 to i16*
  %68 = bitcast i8* %1 to i16*
  %69 = load i16, i16* %67, align 2
  store i16 %69, i16* %68, align 1
  br label %102

70:                                               ; preds = %54
  %71 = icmp ult i32 %0, 10000000
  br i1 %71, label %72, label %85

72:                                               ; preds = %70
  %73 = trunc i32 %55 to i16
  %74 = udiv i16 %73, 100
  %75 = trunc i16 %74 to i8
  %76 = add nuw nsw i8 %75, 48
  store i8 %76, i8* %1, align 1, !tbaa !3
  %77 = getelementptr inbounds i8, i8* %1, i64 1
  %78 = urem i16 %73, 100
  %79 = shl nuw nsw i16 %78, 1
  %80 = zext i16 %79 to i64
  %81 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %80
  %82 = bitcast i8* %81 to i16*
  %83 = bitcast i8* %77 to i16*
  %84 = load i16, i16* %82, align 2
  store i16 %84, i16* %83, align 1
  br label %102

85:                                               ; preds = %70
  %86 = udiv i32 %0, 1000000
  %87 = shl nuw nsw i32 %86, 1
  %88 = zext i32 %87 to i64
  %89 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %88
  %90 = bitcast i8* %89 to i16*
  %91 = bitcast i8* %1 to i16*
  %92 = load i16, i16* %90, align 2
  store i16 %92, i16* %91, align 1
  %93 = getelementptr inbounds i8, i8* %1, i64 2
  %94 = trunc i32 %55 to i16
  %95 = urem i16 %94, 100
  %96 = shl nuw nsw i16 %95, 1
  %97 = zext i16 %96 to i64
  %98 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %97
  %99 = bitcast i8* %98 to i16*
  %100 = bitcast i8* %93 to i16*
  %101 = load i16, i16* %99, align 2
  store i16 %101, i16* %100, align 1
  br label %102

102:                                              ; preds = %85, %72, %63, %60
  %103 = phi i64 [ 4, %85 ], [ 3, %72 ], [ 2, %63 ], [ 1, %60 ]
  %104 = getelementptr inbounds i8, i8* %1, i64 %103
  %105 = trunc i32 %56 to i16
  %106 = udiv i16 %105, 100
  %107 = shl nuw nsw i16 %106, 1
  %108 = zext i16 %107 to i64
  %109 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %108
  %110 = bitcast i8* %109 to i16*
  %111 = bitcast i8* %104 to i16*
  %112 = load i16, i16* %110, align 2
  store i16 %112, i16* %111, align 1
  %113 = getelementptr inbounds i8, i8* %104, i64 2
  %114 = urem i16 %105, 100
  %115 = shl nuw nsw i16 %114, 1
  %116 = zext i16 %115 to i64
  %117 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %116
  %118 = bitcast i8* %117 to i16*
  %119 = bitcast i8* %113 to i16*
  %120 = load i16, i16* %118, align 2
  store i16 %120, i16* %119, align 1
  %121 = getelementptr inbounds i8, i8* %104, i64 4
  br label %175

122:                                              ; preds = %2
  %123 = udiv i32 %0, 100000000
  %124 = urem i32 %0, 100000000
  %125 = icmp ult i32 %0, 1000000000
  br i1 %125, label %126, label %129

126:                                              ; preds = %122
  %127 = trunc i32 %123 to i8
  %128 = add nuw nsw i8 %127, 48
  store i8 %128, i8* %1, align 1, !tbaa !3
  br label %136

129:                                              ; preds = %122
  %130 = shl nuw nsw i32 %123, 1
  %131 = zext i32 %130 to i64
  %132 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %131
  %133 = bitcast i8* %132 to i16*
  %134 = bitcast i8* %1 to i16*
  %135 = load i16, i16* %133, align 2
  store i16 %135, i16* %134, align 1
  br label %136

136:                                              ; preds = %126, %129
  %137 = phi i64 [ 1, %126 ], [ 2, %129 ]
  %138 = getelementptr inbounds i8, i8* %1, i64 %137
  %139 = udiv i32 %124, 10000
  %140 = trunc i32 %139 to i16
  %141 = udiv i16 %140, 100
  %142 = shl nuw nsw i16 %141, 1
  %143 = zext i16 %142 to i64
  %144 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %143
  %145 = bitcast i8* %144 to i16*
  %146 = bitcast i8* %138 to i16*
  %147 = load i16, i16* %145, align 2
  store i16 %147, i16* %146, align 1
  %148 = getelementptr inbounds i8, i8* %138, i64 2
  %149 = urem i16 %140, 100
  %150 = shl nuw nsw i16 %149, 1
  %151 = zext i16 %150 to i64
  %152 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %151
  %153 = bitcast i8* %152 to i16*
  %154 = bitcast i8* %148 to i16*
  %155 = load i16, i16* %153, align 2
  store i16 %155, i16* %154, align 1
  %156 = getelementptr inbounds i8, i8* %138, i64 4
  %157 = urem i32 %124, 10000
  %158 = trunc i32 %157 to i16
  %159 = udiv i16 %158, 100
  %160 = shl nuw nsw i16 %159, 1
  %161 = zext i16 %160 to i64
  %162 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %161
  %163 = bitcast i8* %162 to i16*
  %164 = bitcast i8* %156 to i16*
  %165 = load i16, i16* %163, align 2
  store i16 %165, i16* %164, align 1
  %166 = getelementptr inbounds i8, i8* %138, i64 6
  %167 = urem i16 %158, 100
  %168 = shl nuw nsw i16 %167, 1
  %169 = zext i16 %168 to i64
  %170 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %169
  %171 = bitcast i8* %170 to i16*
  %172 = bitcast i8* %166 to i16*
  %173 = load i16, i16* %171, align 2
  store i16 %173, i16* %172, align 1
  %174 = getelementptr inbounds i8, i8* %138, i64 8
  br label %175

175:                                              ; preds = %102, %39, %27, %14, %10, %136
  %176 = phi i8* [ %174, %136 ], [ %121, %102 ], [ %38, %27 ], [ %53, %39 ], [ %13, %10 ], [ %21, %14 ]
  ret i8* %176
}

; Function Attrs: nofree norecurse nounwind uwtable writeonly
define nonnull i8* @_ZNSt3__16__itoa8__u64toaEmPc(i64 %0, i8* %1) local_unnamed_addr #0 {
  %3 = icmp ult i64 %0, 100000000
  br i1 %3, label %4, label %123

4:                                                ; preds = %2
  %5 = trunc i64 %0 to i32
  %6 = icmp ult i32 %5, 10000
  br i1 %6, label %7, label %55

7:                                                ; preds = %4
  %8 = icmp ult i32 %5, 100
  br i1 %8, label %9, label %23

9:                                                ; preds = %7
  %10 = icmp ult i32 %5, 10
  br i1 %10, label %11, label %15

11:                                               ; preds = %9
  %12 = trunc i64 %0 to i8
  %13 = add nuw nsw i8 %12, 48
  store i8 %13, i8* %1, align 1, !tbaa !3
  %14 = getelementptr inbounds i8, i8* %1, i64 1
  br label %410

15:                                               ; preds = %9
  %16 = shl nuw nsw i64 %0, 1
  %17 = and i64 %16, 4294967294
  %18 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %17
  %19 = bitcast i8* %18 to i16*
  %20 = bitcast i8* %1 to i16*
  %21 = load i16, i16* %19, align 2
  store i16 %21, i16* %20, align 1
  %22 = getelementptr inbounds i8, i8* %1, i64 2
  br label %410

23:                                               ; preds = %7
  %24 = icmp ult i32 %5, 1000
  %25 = trunc i64 %0 to i16
  %26 = udiv i16 %25, 100
  %27 = urem i16 %25, 100
  br i1 %24, label %28, label %40

28:                                               ; preds = %23
  %29 = trunc i16 %26 to i8
  %30 = add nuw nsw i8 %29, 48
  store i8 %30, i8* %1, align 1, !tbaa !3
  %31 = getelementptr inbounds i8, i8* %1, i64 1
  %32 = urem i16 %25, 100
  %33 = shl nuw nsw i16 %32, 1
  %34 = zext i16 %33 to i64
  %35 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %34
  %36 = bitcast i8* %35 to i16*
  %37 = bitcast i8* %31 to i16*
  %38 = load i16, i16* %36, align 2
  store i16 %38, i16* %37, align 1
  %39 = getelementptr inbounds i8, i8* %1, i64 3
  br label %410

40:                                               ; preds = %23
  %41 = shl nuw nsw i16 %26, 1
  %42 = zext i16 %41 to i64
  %43 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %42
  %44 = bitcast i8* %43 to i16*
  %45 = bitcast i8* %1 to i16*
  %46 = load i16, i16* %44, align 2
  store i16 %46, i16* %45, align 1
  %47 = getelementptr inbounds i8, i8* %1, i64 2
  %48 = shl nuw nsw i16 %27, 1
  %49 = zext i16 %48 to i64
  %50 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %49
  %51 = bitcast i8* %50 to i16*
  %52 = bitcast i8* %47 to i16*
  %53 = load i16, i16* %51, align 2
  store i16 %53, i16* %52, align 1
  %54 = getelementptr inbounds i8, i8* %1, i64 4
  br label %410

55:                                               ; preds = %4
  %56 = udiv i32 %5, 10000
  %57 = urem i32 %5, 10000
  %58 = icmp ult i32 %5, 1000000
  br i1 %58, label %59, label %71

59:                                               ; preds = %55
  %60 = icmp ult i32 %5, 100000
  br i1 %60, label %61, label %64

61:                                               ; preds = %59
  %62 = trunc i32 %56 to i8
  %63 = add nuw nsw i8 %62, 48
  store i8 %63, i8* %1, align 1, !tbaa !3
  br label %103

64:                                               ; preds = %59
  %65 = shl nuw nsw i32 %56, 1
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %66
  %68 = bitcast i8* %67 to i16*
  %69 = bitcast i8* %1 to i16*
  %70 = load i16, i16* %68, align 2
  store i16 %70, i16* %69, align 1
  br label %103

71:                                               ; preds = %55
  %72 = icmp ult i32 %5, 10000000
  br i1 %72, label %73, label %86

73:                                               ; preds = %71
  %74 = trunc i32 %56 to i16
  %75 = udiv i16 %74, 100
  %76 = trunc i16 %75 to i8
  %77 = add nuw nsw i8 %76, 48
  store i8 %77, i8* %1, align 1, !tbaa !3
  %78 = getelementptr inbounds i8, i8* %1, i64 1
  %79 = urem i16 %74, 100
  %80 = shl nuw nsw i16 %79, 1
  %81 = zext i16 %80 to i64
  %82 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %81
  %83 = bitcast i8* %82 to i16*
  %84 = bitcast i8* %78 to i16*
  %85 = load i16, i16* %83, align 2
  store i16 %85, i16* %84, align 1
  br label %103

86:                                               ; preds = %71
  %87 = udiv i32 %5, 1000000
  %88 = shl nuw nsw i32 %87, 1
  %89 = zext i32 %88 to i64
  %90 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %89
  %91 = bitcast i8* %90 to i16*
  %92 = bitcast i8* %1 to i16*
  %93 = load i16, i16* %91, align 2
  store i16 %93, i16* %92, align 1
  %94 = getelementptr inbounds i8, i8* %1, i64 2
  %95 = trunc i32 %56 to i16
  %96 = urem i16 %95, 100
  %97 = shl nuw nsw i16 %96, 1
  %98 = zext i16 %97 to i64
  %99 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %98
  %100 = bitcast i8* %99 to i16*
  %101 = bitcast i8* %94 to i16*
  %102 = load i16, i16* %100, align 2
  store i16 %102, i16* %101, align 1
  br label %103

103:                                              ; preds = %86, %73, %64, %61
  %104 = phi i64 [ 4, %86 ], [ 3, %73 ], [ 2, %64 ], [ 1, %61 ]
  %105 = getelementptr inbounds i8, i8* %1, i64 %104
  %106 = trunc i32 %57 to i16
  %107 = udiv i16 %106, 100
  %108 = shl nuw nsw i16 %107, 1
  %109 = zext i16 %108 to i64
  %110 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %109
  %111 = bitcast i8* %110 to i16*
  %112 = bitcast i8* %105 to i16*
  %113 = load i16, i16* %111, align 2
  store i16 %113, i16* %112, align 1
  %114 = getelementptr inbounds i8, i8* %105, i64 2
  %115 = urem i16 %106, 100
  %116 = shl nuw nsw i16 %115, 1
  %117 = zext i16 %116 to i64
  %118 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %117
  %119 = bitcast i8* %118 to i16*
  %120 = bitcast i8* %114 to i16*
  %121 = load i16, i16* %119, align 2
  store i16 %121, i16* %120, align 1
  %122 = getelementptr inbounds i8, i8* %105, i64 4
  br label %410

123:                                              ; preds = %2
  %124 = icmp ult i64 %0, 10000000000000000
  br i1 %124, label %125, label %285

125:                                              ; preds = %123
  %126 = udiv i64 %0, 100000000
  %127 = trunc i64 %126 to i32
  %128 = urem i64 %0, 100000000
  %129 = trunc i64 %128 to i32
  %130 = icmp ult i32 %127, 10000
  br i1 %130, label %131, label %179

131:                                              ; preds = %125
  %132 = icmp ult i32 %127, 100
  br i1 %132, label %133, label %147

133:                                              ; preds = %131
  %134 = icmp ult i32 %127, 10
  br i1 %134, label %135, label %139

135:                                              ; preds = %133
  %136 = trunc i64 %126 to i8
  %137 = add nuw nsw i8 %136, 48
  store i8 %137, i8* %1, align 1, !tbaa !3
  %138 = getelementptr inbounds i8, i8* %1, i64 1
  br label %247

139:                                              ; preds = %133
  %140 = shl nuw nsw i64 %126, 1
  %141 = and i64 %140, 4294967294
  %142 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %141
  %143 = bitcast i8* %142 to i16*
  %144 = bitcast i8* %1 to i16*
  %145 = load i16, i16* %143, align 2
  store i16 %145, i16* %144, align 1
  %146 = getelementptr inbounds i8, i8* %1, i64 2
  br label %247

147:                                              ; preds = %131
  %148 = icmp ult i32 %127, 1000
  %149 = trunc i64 %126 to i16
  %150 = udiv i16 %149, 100
  %151 = urem i16 %149, 100
  br i1 %148, label %152, label %164

152:                                              ; preds = %147
  %153 = trunc i16 %150 to i8
  %154 = add nuw nsw i8 %153, 48
  store i8 %154, i8* %1, align 1, !tbaa !3
  %155 = getelementptr inbounds i8, i8* %1, i64 1
  %156 = urem i16 %149, 100
  %157 = shl nuw nsw i16 %156, 1
  %158 = zext i16 %157 to i64
  %159 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %158
  %160 = bitcast i8* %159 to i16*
  %161 = bitcast i8* %155 to i16*
  %162 = load i16, i16* %160, align 2
  store i16 %162, i16* %161, align 1
  %163 = getelementptr inbounds i8, i8* %1, i64 3
  br label %247

164:                                              ; preds = %147
  %165 = shl nuw nsw i16 %150, 1
  %166 = zext i16 %165 to i64
  %167 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %166
  %168 = bitcast i8* %167 to i16*
  %169 = bitcast i8* %1 to i16*
  %170 = load i16, i16* %168, align 2
  store i16 %170, i16* %169, align 1
  %171 = getelementptr inbounds i8, i8* %1, i64 2
  %172 = shl nuw nsw i16 %151, 1
  %173 = zext i16 %172 to i64
  %174 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %173
  %175 = bitcast i8* %174 to i16*
  %176 = bitcast i8* %171 to i16*
  %177 = load i16, i16* %175, align 2
  store i16 %177, i16* %176, align 1
  %178 = getelementptr inbounds i8, i8* %1, i64 4
  br label %247

179:                                              ; preds = %125
  %180 = udiv i32 %127, 10000
  %181 = urem i32 %127, 10000
  %182 = icmp ult i32 %127, 1000000
  br i1 %182, label %183, label %195

183:                                              ; preds = %179
  %184 = icmp ult i32 %127, 100000
  br i1 %184, label %185, label %188

185:                                              ; preds = %183
  %186 = trunc i32 %180 to i8
  %187 = add nuw nsw i8 %186, 48
  store i8 %187, i8* %1, align 1, !tbaa !3
  br label %227

188:                                              ; preds = %183
  %189 = shl nuw nsw i32 %180, 1
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %190
  %192 = bitcast i8* %191 to i16*
  %193 = bitcast i8* %1 to i16*
  %194 = load i16, i16* %192, align 2
  store i16 %194, i16* %193, align 1
  br label %227

195:                                              ; preds = %179
  %196 = icmp ult i32 %127, 10000000
  br i1 %196, label %197, label %210

197:                                              ; preds = %195
  %198 = trunc i32 %180 to i16
  %199 = udiv i16 %198, 100
  %200 = trunc i16 %199 to i8
  %201 = add nuw nsw i8 %200, 48
  store i8 %201, i8* %1, align 1, !tbaa !3
  %202 = getelementptr inbounds i8, i8* %1, i64 1
  %203 = urem i16 %198, 100
  %204 = shl nuw nsw i16 %203, 1
  %205 = zext i16 %204 to i64
  %206 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %205
  %207 = bitcast i8* %206 to i16*
  %208 = bitcast i8* %202 to i16*
  %209 = load i16, i16* %207, align 2
  store i16 %209, i16* %208, align 1
  br label %227

210:                                              ; preds = %195
  %211 = udiv i32 %127, 1000000
  %212 = shl nuw nsw i32 %211, 1
  %213 = zext i32 %212 to i64
  %214 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %213
  %215 = bitcast i8* %214 to i16*
  %216 = bitcast i8* %1 to i16*
  %217 = load i16, i16* %215, align 2
  store i16 %217, i16* %216, align 1
  %218 = getelementptr inbounds i8, i8* %1, i64 2
  %219 = trunc i32 %180 to i16
  %220 = urem i16 %219, 100
  %221 = shl nuw nsw i16 %220, 1
  %222 = zext i16 %221 to i64
  %223 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %222
  %224 = bitcast i8* %223 to i16*
  %225 = bitcast i8* %218 to i16*
  %226 = load i16, i16* %224, align 2
  store i16 %226, i16* %225, align 1
  br label %227

227:                                              ; preds = %210, %197, %188, %185
  %228 = phi i64 [ 4, %210 ], [ 3, %197 ], [ 2, %188 ], [ 1, %185 ]
  %229 = getelementptr inbounds i8, i8* %1, i64 %228
  %230 = trunc i32 %181 to i16
  %231 = udiv i16 %230, 100
  %232 = shl nuw nsw i16 %231, 1
  %233 = zext i16 %232 to i64
  %234 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %233
  %235 = bitcast i8* %234 to i16*
  %236 = bitcast i8* %229 to i16*
  %237 = load i16, i16* %235, align 2
  store i16 %237, i16* %236, align 1
  %238 = getelementptr inbounds i8, i8* %229, i64 2
  %239 = urem i16 %230, 100
  %240 = shl nuw nsw i16 %239, 1
  %241 = zext i16 %240 to i64
  %242 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %241
  %243 = bitcast i8* %242 to i16*
  %244 = bitcast i8* %238 to i16*
  %245 = load i16, i16* %243, align 2
  store i16 %245, i16* %244, align 1
  %246 = getelementptr inbounds i8, i8* %229, i64 4
  br label %247

247:                                              ; preds = %135, %139, %152, %164, %227
  %248 = phi i8* [ %246, %227 ], [ %163, %152 ], [ %178, %164 ], [ %138, %135 ], [ %146, %139 ]
  %249 = udiv i32 %129, 10000
  %250 = trunc i32 %249 to i16
  %251 = udiv i16 %250, 100
  %252 = shl nuw nsw i16 %251, 1
  %253 = zext i16 %252 to i64
  %254 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %253
  %255 = bitcast i8* %254 to i16*
  %256 = bitcast i8* %248 to i16*
  %257 = load i16, i16* %255, align 2
  store i16 %257, i16* %256, align 1
  %258 = getelementptr inbounds i8, i8* %248, i64 2
  %259 = urem i16 %250, 100
  %260 = shl nuw nsw i16 %259, 1
  %261 = zext i16 %260 to i64
  %262 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %261
  %263 = bitcast i8* %262 to i16*
  %264 = bitcast i8* %258 to i16*
  %265 = load i16, i16* %263, align 2
  store i16 %265, i16* %264, align 1
  %266 = getelementptr inbounds i8, i8* %248, i64 4
  %267 = urem i32 %129, 10000
  %268 = trunc i32 %267 to i16
  %269 = udiv i16 %268, 100
  %270 = shl nuw nsw i16 %269, 1
  %271 = zext i16 %270 to i64
  %272 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %271
  %273 = bitcast i8* %272 to i16*
  %274 = bitcast i8* %266 to i16*
  %275 = load i16, i16* %273, align 2
  store i16 %275, i16* %274, align 1
  %276 = getelementptr inbounds i8, i8* %248, i64 6
  %277 = urem i16 %268, 100
  %278 = shl nuw nsw i16 %277, 1
  %279 = zext i16 %278 to i64
  %280 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %279
  %281 = bitcast i8* %280 to i16*
  %282 = bitcast i8* %276 to i16*
  %283 = load i16, i16* %281, align 2
  store i16 %283, i16* %282, align 1
  %284 = getelementptr inbounds i8, i8* %248, i64 8
  br label %410

285:                                              ; preds = %123
  %286 = udiv i64 %0, 10000000000000000
  %287 = trunc i64 %286 to i32
  %288 = urem i64 %0, 10000000000000000
  %289 = icmp ult i32 %287, 100
  br i1 %289, label %290, label %301

290:                                              ; preds = %285
  %291 = icmp ult i32 %287, 10
  br i1 %291, label %292, label %295

292:                                              ; preds = %290
  %293 = trunc i64 %286 to i8
  %294 = add nuw nsw i8 %293, 48
  store i8 %294, i8* %1, align 1, !tbaa !3
  br label %331

295:                                              ; preds = %290
  %296 = shl nuw nsw i64 %286, 1
  %297 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %296
  %298 = bitcast i8* %297 to i16*
  %299 = bitcast i8* %1 to i16*
  %300 = load i16, i16* %298, align 2
  store i16 %300, i16* %299, align 1
  br label %331

301:                                              ; preds = %285
  %302 = icmp ult i32 %287, 1000
  %303 = trunc i64 %286 to i16
  %304 = udiv i16 %303, 100
  %305 = urem i16 %303, 100
  br i1 %302, label %306, label %317

306:                                              ; preds = %301
  %307 = trunc i16 %304 to i8
  %308 = add nuw nsw i8 %307, 48
  store i8 %308, i8* %1, align 1, !tbaa !3
  %309 = getelementptr inbounds i8, i8* %1, i64 1
  %310 = urem i16 %303, 100
  %311 = shl nuw nsw i16 %310, 1
  %312 = zext i16 %311 to i64
  %313 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %312
  %314 = bitcast i8* %313 to i16*
  %315 = bitcast i8* %309 to i16*
  %316 = load i16, i16* %314, align 2
  store i16 %316, i16* %315, align 1
  br label %331

317:                                              ; preds = %301
  %318 = shl nuw nsw i16 %304, 1
  %319 = zext i16 %318 to i64
  %320 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %319
  %321 = bitcast i8* %320 to i16*
  %322 = bitcast i8* %1 to i16*
  %323 = load i16, i16* %321, align 2
  store i16 %323, i16* %322, align 1
  %324 = getelementptr inbounds i8, i8* %1, i64 2
  %325 = shl nuw nsw i16 %305, 1
  %326 = zext i16 %325 to i64
  %327 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %326
  %328 = bitcast i8* %327 to i16*
  %329 = bitcast i8* %324 to i16*
  %330 = load i16, i16* %328, align 2
  store i16 %330, i16* %329, align 1
  br label %331

331:                                              ; preds = %292, %295, %306, %317
  %332 = phi i64 [ 1, %292 ], [ 2, %295 ], [ 3, %306 ], [ 4, %317 ]
  %333 = getelementptr inbounds i8, i8* %1, i64 %332
  %334 = udiv i64 %288, 100000000
  %335 = trunc i64 %334 to i32
  %336 = urem i64 %288, 100000000
  %337 = trunc i64 %336 to i32
  %338 = udiv i32 %335, 10000
  %339 = trunc i32 %338 to i16
  %340 = udiv i16 %339, 100
  %341 = shl nuw nsw i16 %340, 1
  %342 = zext i16 %341 to i64
  %343 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %342
  %344 = bitcast i8* %343 to i16*
  %345 = bitcast i8* %333 to i16*
  %346 = load i16, i16* %344, align 2
  store i16 %346, i16* %345, align 1
  %347 = getelementptr inbounds i8, i8* %333, i64 2
  %348 = urem i16 %339, 100
  %349 = shl nuw nsw i16 %348, 1
  %350 = zext i16 %349 to i64
  %351 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %350
  %352 = bitcast i8* %351 to i16*
  %353 = bitcast i8* %347 to i16*
  %354 = load i16, i16* %352, align 2
  store i16 %354, i16* %353, align 1
  %355 = getelementptr inbounds i8, i8* %333, i64 4
  %356 = urem i32 %335, 10000
  %357 = trunc i32 %356 to i16
  %358 = udiv i16 %357, 100
  %359 = shl nuw nsw i16 %358, 1
  %360 = zext i16 %359 to i64
  %361 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %360
  %362 = bitcast i8* %361 to i16*
  %363 = bitcast i8* %355 to i16*
  %364 = load i16, i16* %362, align 2
  store i16 %364, i16* %363, align 1
  %365 = getelementptr inbounds i8, i8* %333, i64 6
  %366 = urem i16 %357, 100
  %367 = shl nuw nsw i16 %366, 1
  %368 = zext i16 %367 to i64
  %369 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %368
  %370 = bitcast i8* %369 to i16*
  %371 = bitcast i8* %365 to i16*
  %372 = load i16, i16* %370, align 2
  store i16 %372, i16* %371, align 1
  %373 = getelementptr inbounds i8, i8* %333, i64 8
  %374 = udiv i32 %337, 10000
  %375 = trunc i32 %374 to i16
  %376 = udiv i16 %375, 100
  %377 = shl nuw nsw i16 %376, 1
  %378 = zext i16 %377 to i64
  %379 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %378
  %380 = bitcast i8* %379 to i16*
  %381 = bitcast i8* %373 to i16*
  %382 = load i16, i16* %380, align 2
  store i16 %382, i16* %381, align 1
  %383 = getelementptr inbounds i8, i8* %333, i64 10
  %384 = urem i16 %375, 100
  %385 = shl nuw nsw i16 %384, 1
  %386 = zext i16 %385 to i64
  %387 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %386
  %388 = bitcast i8* %387 to i16*
  %389 = bitcast i8* %383 to i16*
  %390 = load i16, i16* %388, align 2
  store i16 %390, i16* %389, align 1
  %391 = getelementptr inbounds i8, i8* %333, i64 12
  %392 = urem i32 %337, 10000
  %393 = trunc i32 %392 to i16
  %394 = udiv i16 %393, 100
  %395 = shl nuw nsw i16 %394, 1
  %396 = zext i16 %395 to i64
  %397 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %396
  %398 = bitcast i8* %397 to i16*
  %399 = bitcast i8* %391 to i16*
  %400 = load i16, i16* %398, align 2
  store i16 %400, i16* %399, align 1
  %401 = getelementptr inbounds i8, i8* %333, i64 14
  %402 = urem i16 %393, 100
  %403 = shl nuw nsw i16 %402, 1
  %404 = zext i16 %403 to i64
  %405 = getelementptr inbounds [200 x i8], [200 x i8]* @_ZNSt3__16__itoaL10cDigitsLutE, i64 0, i64 %404
  %406 = bitcast i8* %405 to i16*
  %407 = bitcast i8* %401 to i16*
  %408 = load i16, i16* %406, align 2
  store i16 %408, i16* %407, align 1
  %409 = getelementptr inbounds i8, i8* %333, i64 16
  br label %410

410:                                              ; preds = %103, %40, %28, %15, %11, %247, %331
  %411 = phi i8* [ %284, %247 ], [ %409, %331 ], [ %122, %103 ], [ %39, %28 ], [ %54, %40 ], [ %14, %11 ], [ %22, %15 ]
  ret i8* %411
}

attributes #0 = { nofree norecurse nounwind uwtable writeonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.linker.options = !{}
!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 11.0.0-2~ubuntu20.04.1"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}

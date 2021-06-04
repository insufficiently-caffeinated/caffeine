source_filename = "manual test"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr #1
declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr #1

@data = internal global [32 x [4 x i32]] zeroinitializer, align 4
@data2 = internal global [32 x [4 x i32]] zeroinitializer, align 4

define internal void @assert_ptreq(i32* %0, i32* %1) #0 {
  %3 = ptrtoint i32* %0 to i64
  %4 = ptrtoint i32* %1 to i64
  %5 = icmp eq i64 %3, %4
  call void @caffeine_assert(i1 zeroext %5)
  ret void
}

; Indices in a GEP can be either vectors, scalars, or a mix of the two. This
; test case verifies that we properly support on all combinations.
define dso_local void @test() local_unnamed_addr #0 {
  ; Scalar pointer, scalar first/second index, vector last index
  %v1 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, i64 0, <2 x i64> <i64 0, i64 1>
  
  %v1.0 = extractelement <2 x i32*> %v1, i32 0
  %v1.1 = extractelement <2 x i32*> %v1, i32 1
  %e1.0 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, i64 0, i64 0
  %e1.1 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, i64 0, i64 1
  call void @assert_ptreq(i32* %e1.0, i32* %v1.0)
  call void @assert_ptreq(i32* %e1.1, i32* %v1.1)

  ; Scalar pointer, scalar first index, all other indices are vectors
  %v2 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, <2 x i64> <i64 0, i64 1>, <2 x i64> <i64 0, i64 1>

  %v2.0 = extractelement <2 x i32*> %v2, i32 0
  %v2.1 = extractelement <2 x i32*> %v2, i32 1
  %e2.0 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, i64 0, i64 0
  %e2.1 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data, i64 0, i64 1, i64 1
  call void @assert_ptreq(i32* %e2.0, i32* %v2.0)
  call void @assert_ptreq(i32* %e2.1, i32* %v2.1)

  ; Vector pointer, scalar first/second indices, vector last index
  %v3 = getelementptr inbounds [32 x [4 x i32]], 
      <2 x [32 x [4 x i32]]*> <[32 x [4 x i32]]* @data, [32 x [4 x i32]]* @data2>,
      i64 0,
      i64 2,
      <2 x i64> <i64 0, i64 1>

  %v3.0 = extractelement <2 x i32*> %v3, i32 0
  %v3.1 = extractelement <2 x i32*> %v3, i32 1
  %e3.0 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data,  i64 0, i64 2, i64 0
  %e3.1 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data2, i64 0, i64 2, i64 1
  call void @assert_ptreq(i32* %e3.0, i32* %v3.0)
  call void @assert_ptreq(i32* %e3.1, i32* %v3.1)

  ; Vector pointer, scalar indices
  %v4 = getelementptr inbounds [32 x [4 x i32]], 
      <2 x [32 x [4 x i32]]*> <[32 x [4 x i32]]* @data, [32 x [4 x i32]]* @data2>,
      i64 0, i64 2, i64 1
  %v4.0 = extractelement <2 x i32*> %v4, i32 0
  %v4.1 = extractelement <2 x i32*> %v4, i32 1
  %e4.0 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data,  i64 0, i64 2, i64 1
  %e4.1 = getelementptr inbounds [32 x [4 x i32]], [32 x [4 x i32]]* @data2, i64 0, i64 2, i64 1
  call void @assert_ptreq(i32* %e4.0, i32* %v4.0)
  call void @assert_ptreq(i32* %e4.1, i32* %v4.1)
  
  ret void
}

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

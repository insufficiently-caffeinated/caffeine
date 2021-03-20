; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Mark caffeine_builtin_memset as used
@llvm.used = appending global [1 x i8*] [i8* bitcast (void (i8*, i8, i64, i1)* @caffeine_builtin_memset to i8*)], section "llvm.metadata"

define dso_local void @caffeine_builtin_memset(
  i8* %0,
  i8 signext %byte,
  i64 %size,
  i1 %isvolatile
) local_unnamed_addr  #0 {
  %dst = tail call i8* @caffeine_builtin_resolve(i8* %0, i64 %size) #1
  br label %loopstart

loopstart:
  %ctr = phi i64 [ %size, %1 ], [ %i, %loopbody ]
  %cond = icmp ne i64 %ctr, 0
  br i1 %cond, label %loopend, label %loopbody

loopbody:
  %i = sub i64 %ctr, 1
  %ptr = getelementptr i8, i8* %dst, i64 %i
  store i8 %byte, i8* %ptr, align 1
  br label %loopstart

loopend:
  ret void
}

declare dso_local i8* @caffeine_builtin_resolve(i8*, i64) local_unnamed_addr #1

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }

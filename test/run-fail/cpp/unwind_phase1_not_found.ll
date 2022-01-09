target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::type_info" = type { i32 (...)**, i8* }
%struct._Unwind_Exception = type { i64, void (i32, %struct._Unwind_Exception*)*, i64, i64 }
%struct._Unwind_Context = type opaque

; dummy definitions of type infos
@_ZTIi0 = internal constant i64 0, align 8
@_ZTIi1 = internal constant i64 1, align 8

; Here we sign extend an i8 to an i16
define dso_local void @test(i8 %x) personality i8* bitcast (i32 (i32, i32, i64, %struct._Unwind_Exception*, %struct._Unwind_Context*)* @__gxx_personality_v0 to i8*) {
  %type_info = alloca %"class.std::type_info"*, align 8
  store %"class.std::type_info"* bitcast (i64* @_ZTIi0 to %"class.std::type_info"*), %"class.std::type_info"** %type_info, align 8
  %load_res = load %"class.std::type_info"*, %"class.std::type_info"** %type_info, align 8
  %unwind_res = invoke i32 @caffeine_unwind_phase1(%"class.std::type_info"* %load_res)
          to label %regular_return unwind label %unwind_return

regular_return:
  %cmp_res = icmp eq i32 %unwind_res, 0
  call void @caffeine_assert(i1 zeroext %cmp_res)

  ret void

unwind_return:
  %lpad_ret = landingpad { i8*, i32 }
          catch i8* bitcast (i64* @_ZTIi1 to i8*)
  unreachable
}

declare dso_local void @caffeine_assume(i1 zeroext) local_unnamed_addr

declare dso_local void @caffeine_assert(i1 zeroext) local_unnamed_addr

declare dso_local i32 @caffeine_unwind_phase1(%"class.std::type_info"*)

declare i32 @__gxx_personality_v0(i32 %0, i32 %1, i64 %2, %struct._Unwind_Exception* %3, %struct._Unwind_Context* %4)

attributes #0 = { nounwind uwtable optnone noinline }
attributes #1 = { nounwind }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}

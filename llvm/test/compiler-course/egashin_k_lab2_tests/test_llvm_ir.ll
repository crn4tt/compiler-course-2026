; RUN: opt -load-pass-plugin %llvmshlibdir/egashin_k_lab2_LLVM_IR%pluginext \
; RUN:   -passes=replace-icmp-gt-ge -S %s | FileCheck %s

; CHECK-LABEL: @test_sgt(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp sle i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   ret i1 %cmp.not
define i1 @test_sgt(i32 %a, i32 %b) {
entry:
  %cmp = icmp sgt i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_sge(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp slt i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   ret i1 %cmp.not
define i1 @test_sge(i32 %a, i32 %b) {
entry:
  %cmp = icmp sge i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_ugt(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp ule i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   ret i1 %cmp.not
define i1 @test_ugt(i32 %a, i32 %b) {
entry:
  %cmp = icmp ugt i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_uge(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp ult i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   ret i1 %cmp.not
define i1 @test_uge(i32 %a, i32 %b) {
entry:
  %cmp = icmp uge i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_samesign_sgt(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp samesign sle i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   ret i1 %cmp.not
define i1 @test_samesign_sgt(i32 %a, i32 %b) {
entry:
  %cmp = icmp samesign sgt i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_slt(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp = icmp slt i32 %a, %b
; CHECK-NEXT:   ret i1 %cmp
define i1 @test_slt(i32 %a, i32 %b) {
entry:
  %cmp = icmp slt i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_eq(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp = icmp eq i32 %a, %b
; CHECK-NEXT:   ret i1 %cmp
define i1 @test_eq(i32 %a, i32 %b) {
entry:
  %cmp = icmp eq i32 %a, %b
  ret i1 %cmp
}

; CHECK-LABEL: @test_branch(
; CHECK-NEXT: entry:
; CHECK-NEXT:   %cmp.rev = icmp sle i32 %a, %b
; CHECK-NEXT:   %cmp.not = xor i1 %cmp.rev, true
; CHECK-NEXT:   br i1 %cmp.not, label %then, label %else
define void @test_branch(i32 %a, i32 %b) {
entry:
  %cmp = icmp sgt i32 %a, %b
  br i1 %cmp, label %then, label %else

then:
  ret void

else:
  ret void
}

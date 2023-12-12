# Note: This file's target compiler is gcc.
#PROBLEM:
# unsigned int n=7;
# xmm0=a0; xmm2=d;
# for(ecx=1; ecx<=n; ecx++){
# 	xmm0*=xmm2;
# }
# Expected: a0 = 0.5, d = 1.5 -> xmm0 = 8.54296875
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:

#BOILERPLATE: STORE RESULT TO PRINTING VARIABLE
  # mov variable, result
#BOILERPLATE: PRINT RESULT
  pushq %rbp
  movq %rsp, %rbp
  movl result, %eax
  movl $print_format, %edi
  movl %eax, %esi
  xorl %eax, %eax
  call printf
  movl $0, %eax
  leave
  ret

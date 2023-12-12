# Note: This file's target compiler is gcc.
#PROBLEM:
# unsigned int n=7;
# xmm0=a0; xmm2=d;
# for(ecx=1; ecx<=n; ecx++){
# 	xmm0*=xmm2;
# }
# Expected: a0 = 0.5, d = 1.5 -> xmm0 = 8.54296875
.section .data
  print_format: .string "%lf\n"
  result: .double 1.5
#DATA:
n: .int 7
a0: .double 0.5
d: .double 1.5
.section .text
.globl main
main:
#SOLUTION:
movsd a0, %xmm0
movsd d, %xmm2

mov n, %ecx
for:
  mulsd %xmm2, %xmm0
  loop for

movsd %xmm0, result
#BOILERPLATE: STORE RESULT TO PRINTING VARIABLE
  # mov variable, result
#BOILERPLATE: PRINT RESULT
pushq %rbp
movq %rsp, %rbp
movsd result, %xmm0
mov $print_format, %edi
mov $1, %eax
call printf
mov $0, %eax
leave
ret


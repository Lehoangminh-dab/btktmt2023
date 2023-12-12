# Note: This file's target compiler is gcc.
#PROBLEM:
# float a[5]={1.1, 2.2, 3.3, 4.4, 5.5}
# unsigned int n=5;
# xmm0=0;
# for(ecx=0; exc<n; ecx++)xmm0+=a[ecx];

.section .data
  print_format: .string "%lf\n"
  result: .double 1.5
#DATA:
a: .float 1.1, 2.2, 3.3, 4.4, 5.5
n: .int 5

.section .text
.globl main
main:
#SOLUTION:
xorps %xmm0, %xmm0
mov $0, %ecx
while:
  cmp %ecx, n
  jna endwhile
do:
  addss a(, %ecx, 4), %xmm0
  inc %ecx
endwhile:
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


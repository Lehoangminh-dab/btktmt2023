# Note: This file's target compiler is gcc.
#PROBLEM:
# void calculate(float *pf, double d, int scale) 
# { 
#  *pf=d*(scale+4); 
# } 
# Expected result: 12.0
.section .data
  print_format: .string "%lf\n"
  result: .double 1.5
#DATA:
pf: .float 1.2
d: .double 2.0
scale: .int 2

.section .text
.globl main
main:
#SOLUTION:
mov $pf, %rdi
movsd d, %xmm1
mov scale, %edx
call calculate
#BOILERPLATE: STORE RESULT TO PRINTING VARIABLE
  # mov variable, result
  movsd pf, %xmm0
  movsd %xmm0, result
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

# void calculate(float *pf, double d, int scale) 
# { 
#  *pf=d*(scale+4); 
# } 
calculate: 
  # *pf is a long pointer in rdi
  # d is xmm1
  # scale is edx

  # Convert all data to float.
  cvtsd2ss %xmm1, %xmm1 # d = (float) d
  cvtsi2ss %edx, %xmm2 # scale = (float) scale

  # scale = scale + 4
  mov $4, %eax
  cvtsi2ss %eax, %xmm3
  addss %xmm3, %xmm2

  # d = d * (scale + 4)
  mulss %xmm2, %xmm1

  # *pf = d
  movss %xmm1, (%rdi)
  ret

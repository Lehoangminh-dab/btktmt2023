# Note: This file's target compiler is gcc.
#PROBLEM:
# double calculate(float pf, double d, int scale) 
# { 
#  return pf+d*(scale+4); 
# } 

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
movss pf, %xmm0
movsd d, %xmm1
mov scale, %edx
call calculate
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

# double calculate(float pf, double d, int scale) 
# { 
#  return pf+d*(scale+4); 
# } 
calculate:
  # float pf is xmm0.
  # double d is xmm1.
  # int scale is edx

  # Step 1: Convert all data to double.
  cvtss2sd %xmm0, %xmm0 # pf
  cvtsi2sd %edx, %xmm2 # scale
  # Step 2: Perform the operation on xmm0.
  # Initialize a 4.0
  mov $4, %eax
  cvtsi2sd %eax, %xmm3
  # Calculate scale + 4, stored in scale.
  addsd %xmm3, %xmm2
  # d * (scale + 4), stored in d (xmm1)
  mulsd %xmm2, %xmm1
  # add pf, stored in xmm0
  addsd %xmm1, %xmm0
  ret

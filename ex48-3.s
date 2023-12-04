#PROBLEM:
# if(eax>ebx && eax>ecx) eax=ebx+ecx; else ebx=eax+ecx;
# Expected result: eax = 10, ebx = 3, ecx = 4
# -> eax = 7, ebx = 3, ecx = 4
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
mov $10, %eax
mov $3, %ebx
mov $4, %ecx

if:
  cmp %eax, %ebx
  jae else

  cmp %eax, %ecx
  jae else
then:
  xor %eax, %eax
  add %ebx, %eax
  add %ecx, %eax
  jmp endif
else:
  xor %ebx, %ebx
  add %eax, %ebx
  add %ecx, %ebx
  jmp endif
endif:
  mov %ecx, result
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

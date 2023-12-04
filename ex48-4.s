#PROBLEM:
# if(eax>ebx || eax>ecx) eax=ebx+ecx; else ebx=eax+ecx; 
# Expected result: eax = 1, ebx = 2, ecx = 12
# -> ebx = 13
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
  mov $1, %eax
  mov $2, %ebx
  mov $12, %ecx

if:
  cmp %eax, %ebx
  jb then

  cmp %eax, %ecx
  jb then

  jmp else
then:
  xor %eax, %eax
  add %ebx, %eax
  add %ecx, %eax
  jmp endif
else:
  xor %ebx, %ebx
  add %eax, %ebx
  add %ecx, %ebx
endif:
  mov %ebx, result
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

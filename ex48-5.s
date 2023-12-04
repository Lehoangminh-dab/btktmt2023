#PROBLEM:
# if(eax==1) eax=ebx+1; 
# else if (eax==2) ebx=eax+ecx+2; 
# else if (eax==3) ebx=eax+ecx+3; 
# Expected result: ebx = 2, ecx = 2, eax = 1 -> eax = 3, eax = 2 -> ebx = 6, eax = 3 -> ebx = 8
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
mov $3, %eax
mov $2, %ebx
mov $2, %ecx

if:
  cmp $1, %eax
  je then
  cmp $2, %eax
  je else1
  cmp $3, %eax
  je else2
then:
  xor %eax, %eax
  add %ebx, %eax
  add $1, %eax
  jmp endif
else1:
  xor %ebx, %ebx
  add %eax, %ebx
  add %ecx, %ebx
  add $2, %ebx
  jmp endif
else2:
  xor %ebx, %ebx
  add %eax, %ebx
  add %ecx, %ebx
  add $3, %ebx
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

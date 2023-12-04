#PROBLEM:
# if (eax>ebx) { eax-=ebx; ebx=10; } else ebx-=eax; 
# Expected result: eax = 7, ebx = 4 -> eax = 3, ebx = 10
# Type: Unsigned
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
mov $4, %eax
mov $7, %ebx
if:
  cmp %eax, %ebx
  jae else
then:
  sub %ebx, %eax
  mov $10, %ebx
  jmp endif
else:
  sub %eax, %ebx
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

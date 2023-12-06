#PROBLEM:
# while (eax != ebx) if (eax>ebx) eax-=ebx; else ebx-=eax;
# Expected result: eax = 7, ebx = 4 -> eax, ebx = 1
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
mov $7, %eax
mov $4, %ebx

while:
  cmp %eax, %ebx
  je endwhile
if:
  ja else
  sub %ebx, %eax
  jmp while
else:
  sub %eax, %ebx
  jmp while
endwhile:
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

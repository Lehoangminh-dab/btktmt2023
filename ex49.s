#PROBLEM:
# switch(eax){ 
# case 1: edx=ebx*r8d+34; break; 
# case 2: edx= ebx/r8d+34; break; 
# case 3: edx= ebx +34; break; 
# default: edx=12; 
# }
# Expected result: edx = 1, ebx = 4, r8d = 2; eax = 1 -> edx = 42; eax = 2 -> edx = 36; eax = 3 -> edx = 38 
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:

.section .text
.globl main
main:
#SOLUTION:
mov $4, %eax
mov $1, %edx
mov $4, %ebx
mov $2, %r8d
switch:
  cmp $1, %eax
    je case1
  cmp $2, %eax
    je case2
  cmp $3, %eax
    je case3
default:
  mov $12, %edx
  jmp endswitch
case1: 
  xor %edx, %edx
  mov %ebx, %eax
  mul %r8d
  add $34, %eax
  mov %eax, %edx
  jmp endswitch
case2:
  xor %edx, %edx
  mov %ebx, %eax
  div %r8d
  add $34, %eax
  mov %eax, %edx
  jmp endswitch
case3:
  xor %edx, %edx
  add $34, %edx
  add %ebx, %edx
endswitch:
  mov %edx, result
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

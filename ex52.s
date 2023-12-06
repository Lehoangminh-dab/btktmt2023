#PROBLEM:
# ecx=1; 
# ebx=1; 
# for(eax=1; eax<n-2; eax++) { 
# edx=ecx+ebx; 
# ecx=ebx; 
# ebx=edx; 
# } 

# Expected result: edx = 0, n = 5 -> edx = 3, ecx = 2, ebx =3  
.section .data
  print_format: .string "%d\n"
  result: .int 30
#DATA:
n: .int 5
.section .text
.globl main
main:
#SOLUTION:
mov $1, %ecx
mov $1, %ebx
mov $1, %eax
xor %edx, %edx

mov $5, %r8d # The loop counter: edx = n - 2
sub $2, %r8d
while:
  cmp %eax, %r8d
  jbe endwhile
then:
  xor %edx, %edx
  add %ecx, %edx
  add %ebx, %edx
  mov %ebx, %ecx
  mov %edx, %ebx
  inc %eax
  jmp while
endwhile:
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

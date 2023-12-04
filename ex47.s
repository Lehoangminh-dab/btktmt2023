#PROBLEM:
# int c, a[4]={1,2,3,4}; c=10-(a[3]+a[2]+a[1]); 
# Expected result: 1

.section .data
  print_format: .string "%d\n"
  result: .int 
#DATA:
  a: .int 1, 2, 3, 4
  c: .int 

.section .text
.globl main
main:
#SOLUTION:
  # eax = 0; ebx = 1
  xor %eax, %eax
  xor %ebx, %ebx
  inc %ebx

  add $10, %eax

  sub a(, %ebx, 4), %eax # eax = eax - a[ebx]
  inc %ebx # ebx++

  sub a(, %ebx, 4), %eax # eax = eax - a[ebx]
  inc %ebx # ebx++
  
  sub a(, %ebx, 4), %eax # eax = eax - a[ebx]
  inc %ebx # ebx++
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

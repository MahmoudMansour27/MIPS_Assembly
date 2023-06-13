.data
    input: .space 9
    inputsize: .word 9
    mess: .asciiz "enter a string: "
    output: .asciiz "hiiii, "

.text
.globl main
main:
    li $v0, 4
    la $a0, mess
    syscall

    li $v0, 8
    la $a0, input
    lw $a1, inputsize
    syscall

    li $v0, 4
    la $a0, output
    syscall

    li $v0, 4
    la $a0, input
    syscall

end:

    li $v0, 10
    syscall
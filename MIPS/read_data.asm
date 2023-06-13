.data
    mess1: .asciiz "enter a number: "
    mess2: .asciiz "the square of the number: "

.text
.globl main
main:
    li $v0, 4
    la $a0, mess1
    syscall

    li $v0, 5
    syscall

    move $t0, $v0
    mul $t0, $t0, $t0

    li $v0, 4
    la $a0, mess2
    syscall

    li $v0, 1
    move $a0, $t0
    syscall
end:

    li $v0, 10
    syscall
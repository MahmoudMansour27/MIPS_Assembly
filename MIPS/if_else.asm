.data
    msg1: .asciiz "equal to zero"
    msg2: .asciiz "not equal to zero"

.text 
.globl main
main:
    li $s0, 1
    li $v0, 4

    # check if it equal to zero
    beq $s0, $0, go

    # not equal
    la $a0,  msg2
    syscall
    #b termination


go:     
    la $a0, msg1
    syscall

termination:
    li $v0, 10
    syscall

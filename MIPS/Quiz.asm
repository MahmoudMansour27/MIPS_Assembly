.data
    msg: .asciiz "Enter an integer: "
    equal: .asciiz " equal to 0"
    not_equal: .asciiz " not equal to zero"

.text
.globl main
main:

    # input msg
    li $v0, 4
    la $a0, msg
    syscall

    # input
    li $v0, 5
    syscall
    move $t0, $v0

    # check equal to zero 
    beq $t0, $0, true
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, not_equal
    syscall
    j end


true:   
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, equal
    syscall

end:
    li $v0, 10
    syscall
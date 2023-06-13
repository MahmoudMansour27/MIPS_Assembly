.data
    enter: .asciiz "Enter an Integer: "
    biggest: .asciiz "The Biggest Number is: "
    counter: .asciiz "How many numbers you need? "
    array_entered: .word 0

.text
.globl main
main:

    la $s1, array_entered       # entered integers array

    # get counter
    li $v0, 4
    la $a0, counter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0       # v0 counter
    add $s3, $s0, $0

enter_start:
    # read integer
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # store into array
    sw $t0, 0($s1)
    addi $s1, $s1, 4

    # loop condition
    addi $s0, $s0, -1
    bne $s0, $0, enter_start

arr_t:
    la $s1, array_entered
    lw $t2, 4($s1)
    addi $s1, $s1, 4
    li $v0, 1
    move $a0, $t2
    syscall
    addi $s3, $s3, -1
    bne $s0, $0, arr_t



end:
    li $v0, 10
    syscall


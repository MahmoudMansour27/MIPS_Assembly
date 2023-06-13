.data 
    msg: .asciiz " "
    array: .word 1, 2, 3, 4
    num: .word 4

.text
.globl main
main:
    la $t0, array
    lw $s0, num

add_loop:
    lw $t1, 0($t0)
    addi $t1, $t1, 5
    sw $t1, 0($t0)
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, msg
    syscall
    addi $s0, $s0, -1
    addi $t0, $t0, 4
    bne $0, $s0, add_loop

.end main
    li $v0, 10
    syscall

.data
    mes: .asciiz " sum of arrya elements: "
    array: .word 2, 4, 6, 8, 10, 12
    no_ele: .word 0
    sum: .word 0

.text
.globl main
main:
    lw $s0, no_ele
    la $t0, array   # load address
    and $s1, $s1, $zero

sum_loop:
    lw $t0, 0($t0)
    and $s1, $s1, $t0
    addi $t0, $t0, 4
    addi $s0, $s0, 1
    #li $s3, 6
    #bne $s3, $s0, sum_loop
    bne $0, $s0, sum_loop
    sw $s1, sum

    li $v0, 1
    lw $a0, sum
    syscall

end:

    li $v0, 10
    syscall
    




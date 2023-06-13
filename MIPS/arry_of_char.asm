.data
    ary: .asciiz "I am characters"

.text
.globl main
main:
    la $s0, ary
    li $t0, 0   #counter
    li $t1, 15 #limit
loop:
    lb $s1, 0($s0)
    addi $s0 , $s0 , 1
    li $v0, 11
    move $a0, $s1
    syscall
    li $a0, '\n'
    syscall
    addi $t0, $t0, 1
    bne $t0, $t1 , loop

end:
    li $v0,  10
    syscall

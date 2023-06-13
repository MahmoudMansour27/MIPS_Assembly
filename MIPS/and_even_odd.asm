.data 
    msg: .asciiz "odddd"
    msg1: .asciiz "even"
.text
.globl main
main:
    li $t0, 2
    li $v0, 4

    andi $t1, $t0, 1
    beq $t1, $0, even
    la $a0, msg
    syscall
    j end

even:
    la $a0, msg1
    syscall
    
end:
    li $v0, 10
    syscall

    
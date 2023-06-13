.data 
    num1: .word 8
    num2: .word 9
    msg: .asciiz " less than "

.text
.globl main
main:
    lw $t0, num1
    lw $t1, num2

    blt $t0, $t1, fir_le_sec #lable

# sec less than first
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

# termination  
    j end

fir_le_sec:
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, ,msg
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

end:
    li $v0, 10
    syscall


    
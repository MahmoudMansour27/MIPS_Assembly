.data 
    msg: .asciiz "sum is equal: "
.text
.globl main
main:
    # load variables
    # move variables to a0 - a3
    # function argument
    li $a0, 5
    li $a1, 6
    jal sum
    move $t0, $v0

    li $v0, 4
    la $a0, msg
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall

end:    
    li $v0, 10
    syscall

sum:   
    add $v0, $a0, $a1
    jr $ra

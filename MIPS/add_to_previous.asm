.data
    msg: .asciiz "enter an integer: "
    result: .asciiz "result is: "

.text
.globl main
main:

    # print input msg
    li $v0, 4
    la $a0, msg
    syscall
    
    # get a number
    li $v0, 5
    syscall
    move $s1, $v0

    # adding loop
    li $t0, 0   # sum
    li $t1, 0   # pointer

start_loop: 
    add $t0, $t0, $t1
    addi $t1, $t1, 1
    ble $t1, $s1, start_loop

    # print result
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

end:
    li $v0, 10
    syscall
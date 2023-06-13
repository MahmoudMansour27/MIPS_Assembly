.data
    enter: .asciiz "enter a number: "
    even: .asciiz "even"
    odd: .asciiz "odd"

.text
.globl main 
main:

    # get the number
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0

    # reminder
    li $s1, 2
    div $s0, $s1
    mfhi $t1
li $v0, 4
    # check even or odd
    beq $t1, $0, even_l
    bne $t1, $0, odd_l
    

even_l:
    la $a0, even
    syscall
    b end

odd_l:
    la $a0, odd
    syscall
    b end

end:
    li $v0, 10
    syscall

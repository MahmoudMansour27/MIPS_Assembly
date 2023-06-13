.data  
    enter: .asciiz "enter an integer: "
    operations: .asciiz "\n1.add\n2.sub\n3.mul\n4.div\n"
    enter_op: .asciiz "enter operation code: "
    wel: .asciiz "welcome in Eng Mahmoud CALCULATOR\nenter integers only pls mtbaz4 el program :("
    result: .asciiz "operation result: "
    msg: .asciiz "\nneed any other operations?\n1.Yes\n2.No\n> "
    else_op: .asciiz "pls enter valid operation :("
    thx: .asciiz "\nThank you for using Eng Mahmoud CALCULATOR :)"

.text
.globl main
main:

    # welcome
    li $v0, 4
    la $a0, wel
    syscall

    # cal start:
cal:
    # print operations
    li $v0, 4
    la $a0, operations
    syscall

    # enter operation code
    la $a0, enter_op
    syscall
    li $v0, 5
    syscall

    # branching
    beq $v0, 1, sum_j
    beq $v0, 2, sub_j
    beq $v0, 3, multp_j
    beq $v0, 4, divis_j
else:  
    li $v0, 4
    la $a0, else_op
    syscall
    j cal

    # jumping
sum_j:
    jal sum
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    beq $v0, 1, cal
    j end

sub_j:
    jal subt
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    beq $v0, 1, cal
    j end

multp_j:
    jal multp
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    beq $v0, 1, cal
    j end

divis_j:
    jal divis
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    beq $v0, 1, cal
    j end


    # functions
sum: 
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    add $s2, $s0, $s1
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    jr $ra
    # return sum in s2

subt: 
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    sub $s2, $s0, $s1
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    jr $ra
    # return sum in s2

multp: 
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    mul $s2, $s0, $s1
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    jr $ra
    # return sum in s2

divis: 
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s0, $v0
    li $v0, 4
    la $a0, enter
    syscall
    li $v0, 5
    syscall
    move $s1, $v0
    div $s2, $s0, $s1
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $s2
    syscall
    jr $ra
    # return sum in s2

end:
    li $v0, 4
    la $a0, thx
    syscall
    li $v0, 10
    syscall    
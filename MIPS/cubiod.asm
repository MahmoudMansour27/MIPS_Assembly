.data
    len_mss: .asciiz "Enter Length: "
    wid_mss: .asciiz "Enter Width: "
    hei_mss: .asciiz "Enter Hieght: "
    result_vol: .asciiz "Volume = " 
    result_area: .asciiz "\nSurface Area = "

.text
.globl main
main:
    
    # get length $t0
    li $v0, 4
    la $a0, len_mss
    syscall

    li $v0, 5
    syscall

    move $t0, $v0

    # get width $t1
    li $v0, 4
    la $a0, wid_mss
    syscall

    li $v0, 5
    syscall

    move $t1, $v0

    # get height $t2
    li $v0, 4
    la $a0, hei_mss
    syscall

    li $v0, 5
    syscall

    move $t2, $v0

    # cal volume
    mul $t3, $t0, $t1
    mul $t3, $t3, $t2

    # print volume
    li $v0, 4
    la $a0, result_vol
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # cal surface area
    mul $t3, $t0, $t1
    mul $t4, $t0, $t2
    mul $t5, $t1, $t2

    add $t6, $t3, $t4
    add $t6, $t6, $t5
    
    mul $t6, $t6, 2

    # print surface area
    li $v0, 4
    la $a0, result_area
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

end:

    li $v0, 10
    syscall








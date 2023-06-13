.data
    arrA: .word 1, 2, 3, 4, 5, 6, 7
    arrB: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.text
.globl main
main:
    li $s0, 6   # i
    li $s1, 5   # j
    li $t0, 4   # 4
    la $s2, arrA
    la $s3, arrB

    # index of array A
    sub $t1, $s0, $s1       # i - j 
    mul $t1, $t1, $t0       # result of(i-j) * 4
    add $s2, $s2, $t1       # add result to arr A

    lw $t3, 0($s2)          # load word 

    #----------------
    li $v0, 1
    move $a0, $t3
    syscall                 # print A[i-j] value
    #----------------

    sw $t3, 32($s3)

    #---------------
    lw $t4, 32($s3)
    move $a0, $t4
    syscall                 # print B[8]
    #---------------


end:
    li $v0, 10
    syscall
.data
    msg: .asciiz "result = "

.text
.globl main
main:
    li $t0, 2
    li $t1, 4

    add $s0, $t0, $t1

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1
    move $a0, $s0
    syscall
end:
    li $v0, 10
    syscall



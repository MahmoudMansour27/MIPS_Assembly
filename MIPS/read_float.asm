.data
    enter: .asciiz "enter a float number: "
    outpt: .asciiz "ur number: "

.text
.globl main
main:
    # input msg
    li $v0, 4
    la $a0, enter
    syscall

    # input float
    li $v0, 6
    syscall
    mov.s $f12, $f0 

    # print float
    li $v0, 4 
    la $a0, outpt
    syscall
    li $v0, 2
    syscall

end:
    li $v0, 10
    syscall

.data
    enter: .asciiz "Enter ur name: "
    input: .space 9
    input_size: .word 9
    output: .asciiz "hiiii: "

.text 
.globl main
main:
    # input msg
    li $v0, 4
    la $a0, enter
    syscall

    # input
    li $v0, 8
    la $a0, input
    lw $a1, input_size
    syscall
    
    # output
    li $v0, 4
    la $a0, output
    syscall
    la $a0, input
    syscall

end:
    li $v0, 10
    syscall
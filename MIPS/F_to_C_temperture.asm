.data
    msg: .asciiz "Enter Temperture in Celsius: "
    msgF: .asciiz "Temperture in Fahrenheit: "
    nine: .float 9.0
    five: .float 5.0
    num: .float 32.0
    zeroAsfloat: .float 0.0

.text
.globl main
main:

    lwc1 $f1, nine
    lwc1 $f4, five
    lwc1 $f10, num
    lwc1 $f5, zeroAsfloat

    # print msg
    li $v0, 4
    la $a0, msg
    syscall

    # input temperture integer
    li $v0, 6           # enter into $f0
    syscall
    add.s $f3, $f0, $f5

    # calculation
    div.s $f6, $f1, $f4
    mul.s $f8, $f6, $f3
    add.s $f12, $f8, $f10 
    
    # print result
    li $v0, 4
    la $a0, msgF
    syscall
    li $v0, 2
    syscall

end:
    li $v0, 10
    syscall
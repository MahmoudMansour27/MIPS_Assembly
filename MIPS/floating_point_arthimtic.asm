.data 
    f1: .float 3.14
    f2: .float 2.24

    d1: .double 3.14
    d2: .double 2.24

.text
.globl main
main:
    lwc1 $f1, f1            # load word coprocessor one
    lwc1 $f4, f2            # load word coprocessor one
    add.s $f6, $f1, $f4     # float addition

    ldc1 $f8, d1            # load double coprocessor one
    ldc1 $f10, d2           # load double coprocessor one
    add.d $f12, $f8, $f10   # double addition

end:
    li $v0, 10
    syscall


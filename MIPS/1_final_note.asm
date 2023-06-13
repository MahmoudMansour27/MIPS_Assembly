.data
    # write down all required data which should be stored in memory
    # data types
    #   data_name: .dataType  value
    # dataType: .byte   .half   .word   .ascii  .asciiz   .float    .double     .space
    #Ex;
    msg: .asciiz "this is a string variable with termination character"
    num: .word 4
    Float: .float 3.14
    Double: .double 4.00

.text
.globl main
main:
    # in text section write instruction to be done
    # comman arithmetic operations:
    # add des, s1, s2
    # addu des, s1, s2
    # sub des, s1, s2
    # subu des, s1, s2
    # mul des, s1, s2
    # mulo des, s1, s2  signed multiply with overflow
    # mulou des, s1, s2 unsigned multiply with overflow
    # mult s1, s2       hi --> reminder, lo --> multiplication
    # multu s1, s2      hi --> reminder, lo --> multiplication
    # div des, s1, s2   prefered integers
    # divu des, s1, s2  predered unsigned integers
    # div s1, s2        hi --> reminder, lo --> division
    # divu s1, s2       unsigned hi, lo
    # abs des, s1       absolute  value of s1 

    # floats and double
    # add.s des, s1, s2 float addition with f registers
    # add.d des, s1, s2 double addition with f registers each operand take 2 registers
    # mul.s des, s1, s2 float multipication with f  registers
    # mul.d des, s1, s2 double multiplication with f registers each operand take 2 registers
    # div.s des, s1, s2 float division with f registers
    # dvi.d des, s1, s2 double division with f registers each operand take 2 registers
    # sub.s des, s1, s2 float subtraction with f registers

    # data transfer
    # lw des, word_memory                       load word
    # sw sourc_memory, off_set( mem_address )   store word
    # li des, value                             load immediate
    # move des, sour                            move from source to des
    # mfhi  des                                 move from hi  --> reminder
    # mflo  des                                 move from low --> result   

    # system calls
    # print integer     1
    # print float       2
    # print double      3
    # print string      4
    # read integer      5   --> in $v0
    # read float        6   --> in $f0, and $f12 instead $a0
    # read double       7
    # read string       8
    # sbrk              9
    # exit              10
    # print char        11
    # read char         12
    # open              13
    # read              14
    # write             15
    # close             16
    # exit2             17

    # conditional branching and looping
    # beq s1, s2, label     branch equal
    # bne s1, s2, label     branch not equal
    # blt s1, s2, label     branch less than
    # ble s1, s2, label     branch less than or equal
    # bgt s1, s2, label     branch greater than
    # bge s1, s2, label     branch greater than or equal
    # bltu s1, s2, label    branch unsigned less than
    # bleu s1, s2, label    branch unsigned less than or equal
    # bgtu s1, s2, label    branch unsigned greater than
    # bgeu s1, s2, label    branch unsigned greater than or equal

    # unconditional jumbing
    # j label           you can use b instead
    # jal lable         jump and link, jump to lable and store the next instruction address into $ra
    # jr $s             jump to the address stored into the register

    # comparison instructions "sets"
    # set one if the condition is true and zero if false
    # seq des, s1, s2       set equal
    # sge des, s1, s2       set greater than or equal
    # sgt des, s1, s2       set greater than
    # slt des, s1, s2       set less than
    # sle des, s1, s2       set less than or equal
    # sne des, s1, s2       set not equal

    # important operations:

    # 1) read string
    #   1. create data  .space input space to recieve an input 
    #   2. create data  .word input size
    #   3. la into $a0 --> .space which will hold an input
    #   4. lw into $a1 --> .word which till the operating system size of an input
    #   5. syscall with 8 at $v0
    #   6. if you to use to the input string, you can use the .space variable name
    
    # 2) read integer
    #   1. load immediate 5 at $v0
    #   2. entered integer stored into $v0
    #   3. move entered integer into another register
    #   5. preform operations

    # 3) read float
    #   1. load immediate 6 at $v0
    #   2. syscall
    #   3. entered float stored into $f0
    #   4. if you wanna to print entered float, move it into $f12 instead of $a0

    # 4) access array elements
    #   1. create an array in .data section with
    #   2. load array address in a register
    #   3. you can access an array element using lw des, offset(array_address_register) Ex: lw $t1, 4($t0)
    #   4. note that increment offset by 4, because integer (word) is stored into 4 bytes
    #   5. in case you want to store into an array, sw source, offset (array_address_register) Ex: sw $t5, 12($t0)

    # MIPS function calls:
    # function: is a block of instructions that can be called at several different points in the program
    # caller --> function that initiate that call:
    #   - puts the parameters in the place that can be accessed by the callee --> agrument registers ($a0 - $a3)
    #   - transfer control to the callee function
    # callee --> function that reveives the call:
    #   - puts the results in a place that can be accessed by the caller --> return registers ($v0 - $v1)
    #   - return control to the caller
    # $ra --> return address register to return back to the caller
    # when the callee finishes execution, control is transferred back to the caller function
    # two categories of procedures:
    #   1. leaf (don't have nested functions)
    #   2. non-leaf (has nested functions)
    
    # 5) Even or odd using andi
    #   1. get input from the user
    #   2. andi des, s1, 1 --> andi return one if the two source register are even or odd
    #   3. branch comparing to zero register
    #   4. if andi result is zeros then even
    #   5. if andi result is one then odd <-- eles
    #   6. load address and print the msg to the user

    # 6) print string characcters
    #   1. create .asciiz string
    #   2. load address of the string into a register
    #   3. load immediate counter starts from zero to increase in every loop
    #   4. load immediate the limit number of loops
    #   5. type loop lable in the start
    #   6. in each loop:
    #       6.1 load byte from the string address with offset zero
    #       6.2 increase the array address by one
    #       6.3 print the byte with 11 in $v0
    #       6.4 increase the loops counter by one
    #       6.5 compare the loops counter with loop limit
    #       6.6 repeate the loop until the loops counter is not equal to the loop limit 

    

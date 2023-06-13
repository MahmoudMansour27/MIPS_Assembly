.data
    msg: .ascii "hello, world\n"
         .ascii "hiiiiiii\n"
         .asciiz "see u"

.text
    li $v0, 4
    la $a0, msg
    syscall
    li $v0, 10
    syscall
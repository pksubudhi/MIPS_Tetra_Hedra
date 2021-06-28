main:
    la   $a0, prompt1    # printf("Enter a number: ");
    li   $v0, 4
    syscall

    li   $v0, 5          # scanf("%d", x);
    syscall

    move $t0, $v0

    li   $t1, 1

    li   $t3, 0		#previous of previous
    li   $t4, 0		#previous
    li   $t5, 0		#To keep square
    li   $t6, 0		#to keep current result
loop:
    
    mul  $t5, $t1, $t1
    add  $t6, $t5, $t3

    move $a0, $t6
    li   $v0, 1		#printing element
    syscall

    li   $a0, '\n'      # printf("%c", '\n');
    li   $v0, 11
    syscall

    move $t3, $t4
    move $t4, $t6

    addi $t1, $t1, 1
    ble  $t1, $t0, loop

end:
    li   $v0, 0
    jr   $ra

    .data

prompt1:
    .asciiz "Enter a number: "
.text

main:
	# put address of test string (in memory) into argument register
	la $a0, teststring

	# call strlen function
	jal strlen

	# move strlen return value to $a0 to be printed
	move $a0, $v0

	# make syscall to print an integer to the screen
	li $v0, 1
	syscall

	# exit simulator (not the right way to exit main, but ok for now)
	li $v0, 10
	syscall


    strlen:
    
    # if first char is null, go to basecase
    lbu $t0, 0($a0)

    beqz $t0, strlen_basecase


    # otherwise, recurse
    
    addi $sp, $sp, -4  # alloc word on stack
    sw   $ra, 0($sp)   # save contents of $ra to stack
    
    addi $a0, $a0, 1   # advance string pointer
    
    jal strlen         # make recursive call
    
    addi $v0, $v0, 1   # add 1 to length
    
    lw $ra, 0($sp)     # restore contents of $ra from stack
    addi $sp, $sp, 4   # free stack space
    
    jr $ra             # return to caller
    
    strlen_basecase:
            # return zero
            li $v0, 0
            jr $ra
	

.data

teststring:	 .asciiz "Hello, world!"
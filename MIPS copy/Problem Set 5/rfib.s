# a0 is fibonacci's argument
rfib:	

	#if the argument is less than 1, go to basecase
	ble $a0, 1, rfib_basecase

	#otherwise, recurse

	addi $sp, $sp, -4  # alloc word on stack
    sw $ra, 0($sp)   # save contents of $ra to stack

    addi $a0, $a0, -1 # decrease the argument by 1
	jal rfib # this is gonna call fib(a0-1)
	addi $a0, $a0, 1 # increase it back by 1

	lw $ra, 0($sp)     # restore contents of $ra from stack
    addi $sp, $sp, 4   # free stack space


	addi $sp, $sp, -8  # alloc word on stack
    sw $ra, 0($sp)   # save contents of $ra to stack
    sw $v0, 4($sp)   # save contents of $v0 to stack
	
	addi $a0 $a0 -2 # decrease the argument by 2
    jal rfib # this is gonna call fib(a0-2)
	addi $a0, $a0, 2 # increase it back by 2
	
	lw $ra, 0($sp)     # restore contents of $ra from stack
	lw $t0, 4($sp)     # restore contents of $v0 from stack
    addi $sp, $sp, 8   # free stack space

	add $v0, $v0, $t0

    jr $ra             # return to caller

rfib_basecase: #if n less than 1, return n
	move $v0, $a0
	jr $ra


#### Do not remove this separator. Place all of your code above this line. ####


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# rfib(0) = 0
	li $a0, 0
	jal rfib
	move $a0, $v0
	jal print_int

	# rfib(4) = 3
	li $a0, 4
	jal rfib
	move $a0, $v0
	jal print_int

	# rfib(5) = 5
	li $a0, 5
	jal rfib
	move $a0, $v0
	jal print_int

	# rfib(10) = 55
	li $a0, 10
	jal rfib
	move $a0, $v0
	jal print_int
	
	# return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_int:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	li $v0, 1
	syscall
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_newline:
 	li $v0, 11
 	li $a0, 10
 	syscall
	jr $ra
	

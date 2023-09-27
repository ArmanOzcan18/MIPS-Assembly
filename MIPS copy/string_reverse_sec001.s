string_reverse:
	# save ra and s0 to stack
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)

	# save pointer to string in s0
	move $s0, $a0
	
	# get string length
	jal strlen

	# call worker
	# a0: point to string
	# a1: length of string
	move $a0, $s0
	move $a1, $v0
	jal worker
	
	# restore ra, and return
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra

worker:
	# if len < 2
	slti $t0, $a1, 2
	bnez $t0, worker_basecase

	# else, swap first and last chars, and recurse
	# a0: addr of first char
	# t0: addr of last char
	add $t0, $a0, $a1
	addi $t0, $t0, -1

	# do the swap
	lbu $t1, 0($a0)
	lbu $t2, 0($t0)
	sb  $t1, 0($t0)
	sb  $t2, 0($a0)

	# save ra
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# recurse on inner string
	addi $a0, $a0, 1
	addi $a1, $a1, -2
	jal worker

	# restore ra and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
worker_basecase:
	jr $ra


	
strlen:
	li $v0, 0
strlen_top:
	lbu $t0, 0($a0)
	beqz $t0, strlen_return
	addi $v0, $v0, 1
	addi $a0, $a0, 1
	b strlen_top
strlen_return:	
	jr $ra

print_string:
	# save ra to stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# print string
	li $v0, 4
	syscall

	# print newline
	li $a0, 10
	li $v0, 11
	syscall
	
	# restore ra from stack, and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	

main:
	# save ra to stack
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# print string before
	la $a0, test_string
	jal print_string

	# reverse string
	la $a0, test_string
	jal string_reverse

	# print string after
	la $a0, test_string
	jal print_string

	# restore ra from stack, and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

.data

test_string:	 .asciiz "Hello, world!"

	

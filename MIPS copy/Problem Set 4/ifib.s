ifib:	
    # At the start of fibonacci, the argument can be found in $a0.

    # Replace the line below with your code
    
	li $v0, 0
	li $t1, 1
	li $t2, 0

	move $t0, $a0
	
loop:
	beqz $t0, return

	add $t2, $v0, $t1
	move $v0, $t1
	move $t1, $t2
	addi $t0, $t0, -1

	b loop

return:	
    # Your return value should be in $v0 prior to returning
    jr $ra


#### Do not remove this separator. Place all of your code above this line. ####


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# ifib(0) = 0
	li $a0, 0
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(4) = 3
	li $a0, 4
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(5) = 5
	li $a0, 5
	jal ifib
	move $a0, $v0
	jal print_int

	# ifib(44) = 701408733 
	li $a0, 44
	jal ifib
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
	

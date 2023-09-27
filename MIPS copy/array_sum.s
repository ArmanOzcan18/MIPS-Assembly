.text

# a0: pointer to the array
# a1: length of the array
# v0: return sum of integers in the array	
array_sum:
	# if length = 0, return 0
	beqz $a1, array_sum_basecase
 
	# else, save ra and s0 to stack
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $s0, 4($sp)
 
	# read first int into s0
	lw $s0, 0($a0)
 
	# recurse on remainder of array
	addi $a0, $a0, 4  # advance pointer
	addi $a1, $a1, -1 # decrement length
	jal array_sum
 
	# add sum of remainder to first int
	add $v0, $v0, $s0
 
	# restore ra and s0 from stack
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
array_sum_basecase:
	li $v0, 0
	jr $ra
	
main:
	# save return address
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# call array sum
	la $a0, test_array
	li $a1, 4
	jal array_sum

	# print return value
	move $a0, $v0
 	li $v0, 1
 	syscall

	# restore stack and return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

	
.data

test_array:	.word 1 2 3 4

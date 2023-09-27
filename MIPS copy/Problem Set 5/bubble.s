# $a0 is the a pointer to an array of integers in memory
# $a1 is the number of integers in the array to be sorted
swap:
	sw $t2, 0($a0)
	sw $t1, 4($a0)
	li $t0, 0
	b continue


bubble:
    ble $a1, 2, bubble_return

	
outer_loop:
	li $t0, 1 # a bool to check if any swaps are made; 1 if there is no swaps, 0 if there has been any swaps
	move $t4, $a1 # $t4 stores the number of integers

	addi $sp, $sp, -4  # alloc word on stack
    sw $a0, 0($sp)   # save contents of $a0 to stack

inner_loop:
	lw $t1, 0($a0) # $t1 stores integer no1
	lw $t2, 4($a0) # $t2 stores integer no2
    bgt $t1, $t2, swap
	continue:
	addi $a0, $a0, 4
	addi $t4, $t4, -1

	bgt $t4, 1, inner_loop

	lw $a0, 0($sp)     # restore contents of $a0 from stack
    addi $sp, $sp, 4   # free stack space
	
	beqz $t0, outer_loop

bubble_return:
	jr $ra



#### Do not remove this separator. Place all of your code above this line. ####



main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# bubble(arrayA) = 2 3 6 8
	la $a0, arrayA	
	li $a1, 4
	jal bubble
	la $a0, arrayA	
	li $a1, 4
	jal print_array

	# bubble(arrayB) = -846 -791 -704 -674 -578 -486 -422 36 82 119 138 284 346 513 631 720 794 920 956 976
	la $a0, arrayB	
	li $a1, 20
	jal bubble
	la $a0, arrayB
	li $a1, 20
	jal print_array
	
	# bubble(arrayC) = -993 -988 -975 -945 -940 -902 -899 -874 -854 -853 -853 -832 -795 -794 -775 -774 -753 -750 -737 -717 -706 -694 -658 -655 -651 -607 -606 -577 -569 -567 -538 -522 -467 -461 -453 -406 -357 -355 -333 -314 -291 -232 -225 -216 -164 -135 -107 -99 -98 -98 -82 -79 -10 48 65 115 181 190 202 211 265 346 350 352 360 381 412 417 420 448 472 485 514 551 613 629 650 658 681 681 683 685 698 708 713 743 751 755 782 784 827 882 903 905 906 929 947 959 970 1000
	la $a0, arrayC	
	li $a1, 100
	jal bubble
	la $a0, arrayC
	li $a1, 100
	jal print_array
	
	# return
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_array:
	# save regs to stack
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)

	# save base and bound pointers
	move $s0, $a0
	sll $s1, $a1, 2
	add $s1, $s0, $s1

print_array_top:	
	# if at bound, return
	beq $s0, $s1, print_array_return

	# else print entry and space
	lw $a0, 0($s0)
	jal print_int
	jal print_space
 
	# increment pointer and continue
	addi $s0, $s0, 4
	b print_array_top
	
print_array_return:
	# print newline
	jal print_newline

	# restore regs and return
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
print_int:
	li $v0, 1 
	syscall
	jr $ra
	
print_newline:
	li $v0, 11
	li $a0, 10
	syscall
	jr $ra

print_space:
	li $v0, 11
	li $a0, 32
	syscall
	jr $ra
	

.data
	
arrayA:	.word 3, 6, 2, 8
arrayB:	.word 631, 794, 920, -846, 720, -674, 346, 82, 976, -486, -791, 36, 513, 119, -704, 138, -422, 956, 284, -578
arrayC:	.word 751, -753, -567, -853, 551, 417, 265, 906, 905, 713, 448, 181, -79, 658, 882, -658, -607, 472, -899, 650, -577, -225, -357, 485, 708, -314, 929, 1000, -10, -355, -795, -453, -717, -975, -606, -522, 412, -737, 629, 681, 350, 115, 381, 360, -774, -461, 827, 681, -107, 65, 202, -694, 683, -99, -945, -164, -940, -98, -82, 352, 959, 613, 970, -988, -655, 782, -832, 685, -569, -406, -706, -874, 698, 346, -467, -853, 755, 190, -216, -98, 514, 947, 48, -750, 211, -775, -538, 743, -651, -232, -135, 784, -333, -794, -291, -902, 903, -993, 420, -854

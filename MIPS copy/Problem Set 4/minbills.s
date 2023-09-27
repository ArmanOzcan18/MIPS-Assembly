
minbills:	
    # At the start of minbills the argument can be found in $a0.

# int minbills(int totalvalue) {
#     int count = 0;
#     int currvalue = totalvalue;
#     while (currvalue >= 10) {
# count += 1;
#         currvalue -= 10;
#     }
#     while (currvalue >= 5) {
#         count += 1;
#         currvalue -= 5;
#     }
#     while (currvalue >= 1) {
#         count += 1;
#         currvalue -= 1;
#     }
#     return count;
# }

    # Replace the line below with your code
    move $t0, $a0 # t0 = totalvalue
	li $v0, 0 # v0 = count
	move $t1, $t0 # t1 = currvalue

loop1:
	blt $t1, 10, loop2

	addi $v0, $v0, 1
	addi $t1, $t1, -10
	b loop1

loop2:
	blt $t1, 5, loop3

	addi $v0, $v0, 1
	addi $t1, $t1, -5
	b loop2

loop3:
	blt $t1, 1, return

	addi $v0, $v0, 1
	addi $t1, $t1, -1
	b loop3

return:
    # Your return value should be in $v0 prior to returning.
    jr $ra

#### Do not remove this separator. Place all of your code above this line. ####


main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# minbills(10) = 1
	li $a0, 10
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(40) = 4
	li $a0, 40
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(57) = 8
	li $a0, 57
	jal minbills
	move $a0, $v0
	jal print_int

	# minbills(156) = 17
	li $a0, 156
	jal minbills
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

print_string:
	li $v0, 4
	syscall
	jr $ra

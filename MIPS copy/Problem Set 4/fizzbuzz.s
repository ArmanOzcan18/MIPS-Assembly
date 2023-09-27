
fizzbuzz:
    # Do not remove this code.  It is necessary for the subcalls to the print functions.
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    # Put your code here.
    # To print an integer, put the integer in $a0 call the helper:
    #    jal print_int
    # To print a string, make the appropriate function call:
    #    jal print_fizz
    #    jal print_buzz
    #    jal print_fizzbuzz

move $t0, $a0 # t0 = max integer to print
li $t1, 1 # t1 = counter that starts at 1
li $t2, 3 # t2 = counter for multiples of three
li $t3, 5 # t3 = counter for multiples of five

main_loop:
	bgt	$t1, $t0, return_from_fizzbuzz

	
	addi $t2, $t2, -1
	addi $t3, $t3, -1
	add $t4, $t2, $t3 # t4 = 0 iff both multiples of three and five
	
	beqz $t4, both
	beqz $t2, fizz
	beqz $t3, buzz

	move $a0, $t1
	jal print_int

	continue:

	addi $t1, $t1, 1

	b main_loop

return_from_fizzbuzz:	
	# return to calling function
	lw   $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra	


both:
jal print_fizzbuzz
li $t3, 5
li $t2, 3
b continue

fizz:
jal print_fizz
li $t2, 3
b continue

buzz:
jal print_buzz
li $t3, 5
b continue

#### Do not remove this separator. Place all of your code above this line. ####

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	# fizzbuzz(10) 
	li $a0, 10
	jal fizzbuzz
	jal print_newline

	# fizzbuzz(20) 
	li $a0, 20
	jal fizzbuzz
	jal print_newline

	# fizzbuzz(100) 
	li $a0, 100
	jal fizzbuzz
	
	# return
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
	
print_fizz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, fizz_string
	jal print_string
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_buzz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, buzz_string
	jal print_string
	jal print_newline
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

print_fizzbuzz:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, fizzbuzz_string
	jal print_string
	jal print_newline
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
	

.data

fizz_string: .asciiz "fizz"
buzz_string: .asciiz "buzz"
fizzbuzz_string: .asciiz "fizzbuzz"

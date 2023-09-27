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
	# initialize length (which we'll keep in v0) to 0
	li $v0, 0

strlen_top:
	# load first character from string into t0
	lbu $t0, 0($a0)

	# if null character, string done, return
	beqz $t0, strlen_return

	# else, it's a character, increment length count
	addi $v0, $v0, 1

	# move the pointer to the next character in string
	addi $a0, $a0, 1

	# go back to top and repeat
	b strlen_top
	
strlen_return:	
	jr $ra
	
.data

teststring:	 .asciiz "Hello, world!"

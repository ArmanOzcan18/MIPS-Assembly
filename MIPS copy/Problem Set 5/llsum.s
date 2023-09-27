llsum:
	
	lw $t0, 0($a0)
	lw $t1, 4($a0)

	beqz $t1, llsum_basecase 

	move $a0, $t1

	addi $sp, $sp, -4  # alloc word on stack
    sw $ra, 0($sp)   # save contents of $ra to stack

	addi $sp, $sp, -4  # alloc word on stack
    sw $t0, 0($sp)   # save contents of $t0 to stack
	
	jal llsum

	lw $t1, 0($sp)     # restore contents of $t0 from stack
    addi $sp, $sp, 4   # free stack space

	lw $ra, 0($sp)     # restore contents of $ra from stack
    addi $sp, $sp, 4   # free stack space

	add $v0, $v0, $t1
	jr $ra

	
llsum_basecase:
	move $v0, $t0
	jr $ra

#### Do not remove this separator. Place all of your code above this line. ####

main:
	addi $sp, $sp, -4
	sw $ra, 0($sp)

	# llsum(listA) = -680
	la $a0, listA0
	jal llsum
	move $a0, $v0
	jal print_int

	# llsum(listB) = 2779
	la $a0, listB0
	jal llsum
	move $a0, $v0
	jal print_int

	# llsum(listC) = 7402
	la $a0, listC0
	jal llsum
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
	
.data
	
listA0: .word -267 listA1
listA1: .word 514 listA2
listA2: .word -927 0

listB0: .word 388 listB1
listB1: .word 563 listB2
listB2: .word 351 listB3
listB3: .word -41 listB4
listB4: .word 412 listB5
listB5: .word 270 listB6
listB6: .word -741 listB7
listB7: .word 272 listB8
listB8: .word 881 listB9
listB9: .word 424 0

listC0: .word 27 listC1
listC1: .word -643 listC2
listC2: .word 634 listC3
listC3: .word 330 listC4
listC4: .word -947 listC5
listC5: .word -904 listC6
listC6: .word 787 listC7
listC7: .word 391 listC8
listC8: .word 143 listC9
listC9: .word -867 listC10
listC10: .word -523 listC11
listC11: .word -385 listC12
listC12: .word 928 listC13
listC13: .word 220 listC14
listC14: .word 256 listC15
listC15: .word 453 listC16
listC16: .word -650 listC17
listC17: .word -460 listC18
listC18: .word 423 listC19
listC19: .word 757 listC20
listC20: .word 838 listC21
listC21: .word 366 listC22
listC22: .word 341 listC23
listC23: .word 330 listC24
listC24: .word 219 listC25
listC25: .word -245 listC26
listC26: .word -939 listC27
listC27: .word 85 listC28
listC28: .word 928 listC29
listC29: .word 301 listC30
listC30: .word 183 listC31
listC31: .word 689 listC32
listC32: .word 85 listC33
listC33: .word 610 listC34
listC34: .word 526 listC35
listC35: .word -433 listC36
listC36: .word 183 listC37
listC37: .word 214 listC38
listC38: .word 138 listC39
listC39: .word 736 listC40
listC40: .word -633 listC41
listC41: .word 612 listC42
listC42: .word 418 listC43
listC43: .word 248 listC44
listC44: .word -77 listC45
listC45: .word 606 listC46
listC46: .word -680 listC47
listC47: .word -87 listC48
listC48: .word -261 listC49
listC49: .word 860 listC50
listC50: .word 913 listC51
listC51: .word 159 listC52
listC52: .word -241 listC53
listC53: .word 416 listC54
listC54: .word -271 listC55
listC55: .word 276 listC56
listC56: .word -504 listC57
listC57: .word -281 listC58
listC58: .word 327 listC59
listC59: .word -430 listC60
listC60: .word -889 listC61
listC61: .word -439 listC62
listC62: .word 677 listC63
listC63: .word -210 listC64
listC64: .word 406 listC65
listC65: .word -650 listC66
listC66: .word -884 listC67
listC67: .word -27 listC68
listC68: .word 479 listC69
listC69: .word 681 listC70
listC70: .word 222 listC71
listC71: .word -189 listC72
listC72: .word -435 listC73
listC73: .word -368 listC74
listC74: .word 863 listC75
listC75: .word 798 listC76
listC76: .word 867 listC77
listC77: .word -310 listC78
listC78: .word 447 listC79
listC79: .word 775 listC80
listC80: .word -609 listC81
listC81: .word 160 listC82
listC82: .word -173 listC83
listC83: .word -587 listC84
listC84: .word 424 listC85
listC85: .word -553 listC86
listC86: .word 875 listC87
listC87: .word 746 listC88
listC88: .word -399 listC89
listC89: .word -299 listC90
listC90: .word -407 listC91
listC91: .word 195 listC92
listC92: .word -722 listC93
listC93: .word -715 listC94
listC94: .word 116 listC95
listC95: .word 969 listC96
listC96: .word 448 listC97
listC97: .word -138 listC98
listC98: .word 36 listC99
listC99: .word -274 0
	

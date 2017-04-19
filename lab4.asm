.text
main:
	addi $s0, $zero, 0		#set initial value to 7
	sw	$s0,($sp)			#push first argument onto the stack
	addi	$sp,$sp,-4		#move stack pointer
	jal	fibonacci					#jump to fibonnaci function
	addi	$sp,$sp,4		#move stack pointer back
	lw	$s1,($sp)			#put result in $s1


fibonacci:
	sw	$ra,($sp)			#push return address on stack
	addi	$sp,$sp,-4		#move stack pointer
	sw	$fp,($sp)			#push frame pointer onto stack
	addi	$sp,$sp,-4		#move stack pointer
	add	$fp,$sp,12			#move frame pointer
	lw	$t0,($fp)			#$t0 <- arguement
	li	$t1, 2				#$t1 <- 2
	bgt	$t0,$t1,recursive	#branch to recursion if the argument is greater than 2
	li	$t0, 1				#base case
	b	end					#branch to end

recursive:	
	addi	$t0,$t0,-1		#$t0 <- n-1
	sw	$t0,($sp)			#push argument onto the stack
	addi	$sp,$sp,-4		#move stack pointer
	jal	fibonacci					#jump to fibonacci
	lw	$t0,($fp)			#$t0 <- n
	addi	$t0,$t0,-2		#$t0 <- n-2
	sw	$t0,($sp)			#push argument onto the stack
	addi	$sp,$sp,-4		#move stack pointer
	jal	fibonacci					#jump to fibonacci
	addi $sp, $sp, 4		#move stack pointer back
	lw	$t0, ($sp)			#$t0 <- fib(n-2)
	addi $sp, $sp, 4		#move stack pointer back
	lw $t1, ($sp)			#$t1 <- fib(n-1)
	add	$t0, $t0, $t1		#$t0 <- fib(n-2) + fib(n-1)

end:
	addi $sp, $sp, 4		#move stack pointer
	lw $fp, ($sp)			#$fp <- frame pointer
	addi $sp, $sp, 4		#move stack pointer
	lw $ra, ($sp)			#$ra <- return address
	addi $sp, $sp, 4		#move stack pointer
	sw $t0, ($sp)			#save result onto stack
	addi $sp, $sp, -4		#move stack pointer back
	jr $ra					#jump back to caller




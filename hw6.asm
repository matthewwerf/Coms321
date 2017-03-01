# question 10
loop:
add $t0, $s3, $s3 # $t0 <- 2i
add $t0, $t0, $t0 # $t0 <- 4i
add $t1, $t1, $s5 # $t1 <- addr of A[i]
lw $t2, 0($t1) # $t2 <- value of A[i]
add $s1, $s1, $t2 # g = g + A[i]
add $s3, $s3, $s4 # i = i + j
bne $s3, $s2, loop # if(i != h) go to loop

# question 11 uses $a0, $a1, $t0, $s0

addi $s1, $zero, 100 # loop needs 101 iterations

loop:
add $t1, $t0, $t0 # $t1 <- 2i
add $t1, $t1, $t1 # $t1 <- 4i
add $t2, $t1, $a0 # $t2 <= addr of a[i]
add $t3, $t1, $a1 # $t3 <- addr of b[i]
lw $t5, 0($t3) # $t5 <- value of b[i]
add $t6, $t5, $s0 # $t6 <- b[i] + c
sw $t6, 0($t2) # $t6 -> a[i]
beq $t0, $s1, finish # exit loop after 101 iterations
addi $t0, $t0, 1 # i++
j loop # jump to loop
finish:

#question 12
loop:
sll $t1, $s3, 2
add $t1, $t1, $s6		
lw $t0, 0($t1)			#has to be there
bne $t0, $s5, exit
add $s3, $s3, $s4		#has to be there
j loop
exit:

#other question 12 option
j main
loop:
add $s3, $s3, $s4		#has to be there

main:
sll $t1, $s3, 2			#has to be there
add $t1, $t1, $s6		
lw $t0, 0($t1)			#has to be there
beq $t0, $s5, loop		#has to be there

exit:

#other question 12 option assuming a[] != k when m=10



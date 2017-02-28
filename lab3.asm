
#Lab 3: Copy the elements of an array into another.

#Assembler Directives
.data
.word 7
.word 3
.word 1
.word 12
.word 10
.word 2
.word 5
.word 9
.word 16
.word 11
.text
.globl main

main:
add $s0, $zero, $zero
add $t0, $zero, $zero

lui $s0, 0x1001
ori $s0,$s0,0
#$s0 contains the address of the first element of the first array

lui $t0, 0x1001
ori $t0, $t0, 0x0040
#$t0 contains the address of the first element of the second array

#############################################
# Put your code here:


addi $t2, $s0, 0 # $t2 <- address of array[0]
addi $t3, $t0, 0 # $t3 <- address of arrayCopy[0]
addi $t4, $zero, 10

loop:
lw $t1, 0($t2) # $t1 <- array[0]
sw $t1, 0($t3) # $t1 -> arrayCopy[0]
addi $t2, $t2, 4 # i++
addi $t3, $t3, 4 # i++

addi $t4, $t4, -1 # i--
bne $t4, $zero, loop # if i!=0 continue loop

end:


#
#############################################

jr $ra

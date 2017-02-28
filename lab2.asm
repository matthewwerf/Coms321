
#Lab 2: Finding the minimum of a set of elements

#Assembler Directives
.data
.word 7
.word 3
.word 17
.word 12
.word 30
.word 2
.word 5
.word 1
.word 16
.word 11
.text
.globl main

#$s0 contains the address of the first
#of the data
main:
lui $s0, 0x1001
ori $s0,$s0,0

#############################################
# Put your code here:
addi $t4, $t4, 9 # i=8
lw $t0, 0($s0) # max <- array[0]
addi $t1, $s0, 4 # i+1

loop:
lw $t2, 0($t1) # $t2 <- array[i]

sub $t3, $t0, $t2 # $t3 <- max-array[i]
bgtz $t3, skip # if $t3 <=0 do not update max number
max:
addi $t0, $t2, 0 # update max number

skip:
addi $t1, $t1, 4 # i++
addi $t4, $t4, -1
bne $t4, $zero, loop # if i!=0 continue loop

end:

#
#############################################

jr $ra

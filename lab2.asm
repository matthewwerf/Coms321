
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
addi $t0, $t0, 8 # i=8
lw $s1, 0($s0) # max <- array[0]
addi $t1, $s0, 4 # i+1

loop:
lw $t2, 0($t1) # $t2 <- array[i]

sub $t2, $s1, $t2
blez $t2, skip
max:

skip:

beq $t0, $zero, end # if i==0 end loop
end:

#
#############################################

jr $ra

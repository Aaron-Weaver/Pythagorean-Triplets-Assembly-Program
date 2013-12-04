#Pythagorean Triplets program

.data

input: .asciiz "Please enter a positive integer: "
A: .asciiz "a: "
B: .asciiz "b: "
C: .asciiz "c: "
space: .asciiz "  "
newLine: .asciiz "\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $s4, $v0      #v0 is the input that the user passed.
	
	addi $t0, $zero, 3
	addi $s1, $zero, 1
	div $s4, $t0
	mflo $t0
	
	for:
		bgt $s1, $t0, forEnd
		addi $s2, $s1, 1
		addi $t2, $zero, 2
		div $s4, $t2
		mflo $t1
		
		for2:
			bgt $s2, $t1, for2End
			sub $s3, $s4, $s1
			sub $s3, $s3, $s2
			
			mult $s1, $s1
			mflo $t3
			
			mult $s2, $s2
			mflo $t4
			
			mult $s3, $s3
			mflo $t5
			
			add $t6, $t3, $t4
			if:
				bne $t6, $t5, ifEnd
				blt $s3, $zero, ifEnd
				
				li $v0, 4
				la $a0, A
				syscall
				
				li $v0, 1
				add $a0, $zero, $s1
				syscall
				
				li $v0, 4
				la $a0, space
				syscall
				
				li $v0, 4
				la $a0, B
				syscall
				
				li $v0, 1
				add $a0, $zero, $s2
				syscall
				
				li $v0, 4
				la $a0, space
				syscall
				
				li $v0, 4
				la $a0, C
				syscall
				
				li $v0, 1
				add $a0, $zero, $s3
				syscall
				
				li $v0, 4
				la $a0, newLine
				syscall
			
			ifEnd:
				addi $s2, $s2, 1
				j for2
				
		for2End:
			addi $s1, $s1, 1
			j for
			
	forEnd:
	
	li $v0, 10
	syscall
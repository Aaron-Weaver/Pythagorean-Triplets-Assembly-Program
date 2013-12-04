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
		bgt $s1, $t0, forEnd		#for($s1 = 1; $s1 < $s4/3; $s1++)
		addi $s2, $s1, 1
		addi $t2, $zero, 2
		div $s4, $t2
		mflo $t1
		
		for2:
			bgt $s2, $t1, for2End	#for($s2 = $s1 + 1; $s2 < $s4/2; $s2++)
			sub $s3, $s4, $s1
			sub $s3, $s3, $s2
			
			mult $s1, $s1			#(a^2)
			mflo $t3
			
			mult $s2, $s2			#(b^2)
			mflo $t4
			
			mult $s3, $s3			#(c^2)
			mflo $t5
			
			add $t6, $t3, $t4		#(a + b = $t6)
			if:
				bne $t6, $t5, ifEnd		#if($t6 == $t5 || $s3 > 0)
				blt $s3, $zero, ifEnd	
				
				#Print out answers if above is true
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
				addi $s2, $s2, 1 #increment loop
				j for2
				
		for2End:
			addi $s1, $s1, 1	#increment loop
			j for
			
	forEnd:
	
	li $v0, 10					#exit program
	syscall
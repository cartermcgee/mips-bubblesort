####################
## MIPS BUBBLESORT # 
####################

.data
arr: .word 5, 3, 8, 1, 4, 2, 7, 6		# initialize unsorted array of size 8

.text
	li   $t1, 0
	la   $t9, arr				# load address of array in $t9
	li   $t8, 8				# array length n
	
topofExteriorLoop:
	beq  $t1, $t8, endofExteriorLoop	#if exterior index == 8, break loop
	li   $t0, 8
 
topofLoop:
	beq  $t0, $zero, endofloop
	add  $t3, $t1, $zero			# store index $t1 into $t3
	sll  $t3, $t3, 2			# quadruple index
	add  $t3, $t3, $t9
	lw   $t5, 0($t3)			# $t5 = arr[$t1]
	sub  $t2, $t8, $t0			# store n - $t1 in $t2
	sll  $t2, $t2, 2			# quadruple index
	add  $t2, $t2, $t9			
	lw   $t4, 0($t2)			# $t4 = arr[$t0]
	bgt  $t5, $t4, skipSwap	
	sw   $t4, 0($t3)			# swap arr[$t1] and arr[$t0]
	sw   $t5, 0($t2)
																					
skipSwap:
	addi $t0, $t0, -1			# deccrement interior loop index
	j topofLoop
 
endofloop:
	addi $t1, $t1, 1			# increment exterior loop index
	j topofExteriorLoop
endofExteriorLoop:				# address 0x10010000 now stores sorted array
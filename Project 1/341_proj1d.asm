# ***************************** 341 Top Level Module **********************************************************
#
# File name: 		341_proj1d.asm
# Verson:		1.0
# Date:			October 13, 2018
# Programmer:		Brian Nguyen
# Description: 		the pentium ISA has an instruction "rep movsw" that will copy a contiguous area of up to 64 K memory words from one array (i.e. a "string") to another -- only one instruction does the
#			 entire "move string." The inplicit operands involved with this one instruction are "si" (source index register), "di" (destination index register) and "cx" (counter register). Both index
#			registers are automatically incremented appropriatelyt for each word moved, and cx is automatically decremented for every word moved. The memory move is completed when cx is 0
#		
#			Using a sequence of MIPS instructions, create a "new instruction" that implements the "rep movs" where the syntax is 
#
# 				movs $t1, $t0, $t2
#
#
# Register Usage:	$t1, $t0, $v0, $t2
#
# Notes: 		beside $t1, $t0, $t2, and $v0, no other registers are to change

	# *********************************************************
	#			MAIN CODESEGMENT
	# *********************************************************
	
	.text		# main (must be global)
	.globl main


main:
	la $t1, array1 		# initialize $t1 to point to memory location with label "array1"
	la $t0, array2 		# initialize $t0 to point to memory location with label "array2"

	li $t2, 0x20		# the counter register (cx). 0x10 moves 16 words

loop:
	beq $t2, $zero, exit	# the memory move completes when cx = 0
	lw $v0, 0($t0)		# load element from $t0 and store into $v0
	sw $v0, 0($t1)		# store element from $v0 into other array
	addi $t0, $t0, 4	# auto increment on both arrays
	addi $t1, $t1, 4
	addi $t2, $t2, -4	# counter register decrements
	j loop
	
	# -----------------------------------------------
	# "Due dilligence" to return control to kernel
	# -----------------------------------------------

exit:	ori $v0, $zero, 10 	# $v0 <-- function code for "exit"
	syscall			# Syscall to exit
	
	# *******************************************************************
	#	PROJECT		RELATED		DATA		SECTION		
	# *******************************************************************
	
	
	
.data	#		array[0]	array[1]	array[2]	array[3]	array[4]	array[5]
	array1:	.word	0xABCDEF01,	0x55AACC55,	0x01234567,	0x89ABCDEF,	0xFFFFFFF,	0x76543210
	array2:	.word	0x55AACC55,	0x0,		0x5F2C,		0x76543210,	0x0,		0x1F2E

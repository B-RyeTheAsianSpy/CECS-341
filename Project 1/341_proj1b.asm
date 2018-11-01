# ***************************** 341 Top Level Module **********************************************************
#
# File name: 		341_proj1b.asm
# Verson:		1.0
# Date:			October 13, 2018
# Programmer:		Brian Nguyen
# Description: 		Using a sequence of MIPS instructions, create a new "addressing mode" that implements a load-word (sw) or store-word (sw) with auto-increment (by 4) of the address register
#			AFTER the memory access, where the syntax is:
# 
# 				lw $t1, imm16($t0)+	and	sw  $t1, imm16($t0)+
#
#
# Register Usage:	$t1, $t0, $v0
#
# Notes: 		beside $t1, $t0, and $v0, no other registers are to change

	# *********************************************************
	#			MAIN CODESEGMENT
	# *********************************************************
	
	.text		# main (must be global)
	.globl main

main:

	la $t1, num_1		# initialize $t1 to point to memory location with label "num_1"
	la $t0, array1		# initialize $t0 to point to memory location with label "array1"

	lw $t1, 0($t0) 		# an element from $t0 in index 0 gets loaded into $t1
	addi $t0, $t0, 4	# post-increment

	sw $t1, 0($t0)		# the element that was retrieved from index 0 now gets stroed into index 1
	addi $t0, $t0, 4	

	# -----------------------------------------------
	# "Due dilligence" to return control to kernel
	# -----------------------------------------------
	
exit:	ori $v0, $zero, 10	# $v0 <-- function code for "exit"
	syscall			# Syscall to exit

	# *******************************************************************
	#	PROJECT		RELATED		SUBROUTINES		
	# *******************************************************************
	
proc1:	j proc1		# placeholder stub
	
	# *******************************************************************
	#	PROJECT		RELATED		DATA		SECTION		
	# *******************************************************************
	.data	#		array[0]	array[1]	array[2]	array[3]	array[4]	array[5]
		array1:	.word	0xABCDEF01,	0x55AACC55,	0x01234567,	0x89ABCDEF,	0xFFFFFFF,	0x76543210
		num_1:	.word	0x55AACC55

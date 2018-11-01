# ***************************** 341 Top Level Module **********************************************************
#
# File name: 		341_proj1c.asm
# Verson:		1.0
# Date:			October 13, 2018
# Programmer:		Brian Nguyen
# Description: 		Using a sequence of MIPS instructions, "new instruction" that implements a memory memory move with auto-increment addressing mode (by 4) where the syntax is
#			
# 				mov ($t1)+, ($t0)+
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
	la $t1, array1 		# initialize $t1 to point to memory location with label "array1"
	la $t0, array2 		# initialize $t0 to point to memory location with label "array2"


	
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
	array2:	.word	0x55AACC55,	0x0,		0x5F2C,		0x76543210,	0x0,		0x1F2E


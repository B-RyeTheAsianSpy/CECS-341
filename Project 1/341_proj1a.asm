# ***************************** 341 Top Level Module **********************************************************
#
# File name: 		341_proj1a.asm
# Verson:		1.0
# Date:			October 13, 2018
# Programmer:		Brian Nguyen
# Description: 		Using a sequence of MIPS instructions, "new instruction" that implements a memory memory move where the syntax is
#			
# 				mov ($t1), ($t0)
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

	la $t1, num_1		# initialize $t1 to point to memory location with label "num_1"	(0xABCDEF01)
	la $t0, num_2		# initialize $t0 to point to memory location with label "num_2" (0x55AACC55)

	lw $v0, ($t0)		# load data from address $t0
	sw $v0, ($t1)		# save the same data to address $t1
	
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

	.data
		num_1:	.word 0xABCDEF01
		num_2:	.word 0x55AACC55

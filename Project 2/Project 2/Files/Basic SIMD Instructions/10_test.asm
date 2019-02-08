
#***************** 341 Module **********************************
#
# File name: vec_pack.asm
# Version: 1
# Date: 12-2-09
# Programmer: Eric Sites
#
# Description: This code segment implements a new
# SIMD instruction which copies the lower half
# sections of two vectors into a third.
#
# Syntax: vec_pack d, a, b
# Where d, a, b are any valid vector registers
#
# Register usage: s0, s1, s2, s3 are assumed to be the
# parameter registers.
# s6, s7 are assumed to be the destination
# registers.
# t0, t1, t2, t3 are used but are restored
# before exit.
#
#***************************************************************
#***************************************************************
# I N I T I A L I Z A T I O N
#***************************************************************
.text
.globl main
main:
li $s0, 0x5AFB6C1D #load a
li $s1, 0xAE5FC041
li $s2, 0x52F3A415 #load b
li $s3, 0xA657C849
add $s6, $zero, $zero #clear d
add $s7, $zero, $zero
#***************************************************************
# C O D E S E G M E N T
#***************************************************************
addi $sp, $sp, -16 #save t0, t1, t2, t3
sw $t0, 0($sp)
sw $t1, 4($sp)
sw $t2, 8($sp)
sw $t3, 12($sp)
li $t2, 0x0F000000 #initialize isolator
li $t3, 4 #initialize shift amount

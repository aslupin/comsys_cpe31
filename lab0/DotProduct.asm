
.data
arr1: .word 24, 13, 9, -16
arr2: .word 8, 7, -11, 3

.text

.globl main

main:
la $8, arr1
la $9, arr2

lw $10, 0($8)   # arr1[0]
lw $11, 0($9)   # arr2[0]
mult $10, $11
mflo $2

lw $10, 4($8)
lw $11, 4($9)
mult $10, $11
mflo $12
add $2, $2, $12

lw $10, 8($8)
lw $11, 8($9)
mult $10, $11
mflo $12
add $2, $2, $12

lw $10, 12($8)
lw $11, 12($9)
mult $10, $11
mflo $12
add $2, $2, $12

li $v0, 10
syscall
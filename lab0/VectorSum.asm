
.data
arr1: .word 100, 200, 300, 400
arr2: .word 10, 20, 30, 40
result: .word 0, 0, 0, 0
 
.text

.globl main
 
main:
la $8, arr1
la $9, arr2
la $10, result
lw $11, 0($8) # index 0
lw $12, 0($9)
add $13, $11, $12
sw $13, 0($10)
lw $11, 4($8) # index 1
lw $12, 4($9)
add $13, $11, $12
sw $13, 4($10) 
lw $11, 8($8) # index 2
lw $12, 8($9)
add $13, $11, $12
sw $13, 8($10)
lw $11, 12($8) # index 3
lw $12, 12($9)
add $13, $11, $12
sw $13, 12($10)

li	$v0, 10
syscall






 
.data           # DataSection
varA: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19  # int a[20] = {...} 
varB: .word 0x7fffffff, 0x7ffffffe, 0x7ffffffd, 0x7ffffffc, 0x7ffffffb, 0x7ffffffa, 0x7ffffff9, 0x7ffffff8, 0x7ffffff7, 0x7ffffff6 # int b[10] = { ... }
strSum: .asciiz "Sum a = "
strSumB: .asciiz "Sum b = "
newline: .asciiz "\n"

.text           # TextSection
.globl main     # call main by SPIM
main: # Main Statement
addu $15, $15, $0 # int i = 0
addu $16, $16, $0 # int  sum = 0
la $7, varA     # load addr varA[20]

loop_entry1:
sll $9, $15, 2       # i = i * 4
slti $10, $15, 20    # if(i < 20) $10 = 1
beq $10, $0, loop_break1
addu $11, $7, $9    # get addr varA[i]
lw $12, 0($11)      # load  varA[i]
addu $16, $16, $12  # sum += varA[i]
addiu $15, $15, 1     # i++
j loop_entry1
loop_break1:
# printf("Sum a = %d\n", sum); 
li $v0, 4           # set inst v0
la  $a0, strSum     # load operand
syscall             # exe sys
li $v0, 1           # set inst v0
add $a0, $16, $0     # load operand
syscall             # exe sys
li $v0, 4           # set inst v0
la  $a0, newline     # load operand
syscall             # exe sys

# FOR2
addu $15, $0, $0 #  i = 0
addu $16, $0, $0 #  sum = 0
la $7, varB     # load addr varB[10]

loop_entry2:
sll $9, $15, 2       # i = i * 4
slti $10, $15, 10    # if(i < 10) $10 = 1
beq $10, $0, loop_break2
addu $11, $7, $9    # get addr varB[i]
lw $12, 0($11)      # load  varB[i]
addu $16, $16, $12  # sum += varB[i]
addiu $15, $15, 1     # i++
j loop_entry2
loop_break2:
# printf("Sum a = %d\n", sum); 
li $v0, 4           # set inst v0
la  $a0, strSumB     # load operand
syscall             # exe sys
li $v0, 1           # set inst v0
add $a0, $16, $0     # load operand
syscall             # exe sys
li $v0, 4           # set inst v0
la  $a0, newline     # load operand
syscall             # exe sys

li $v0, 10          # return 0 inst
syscall             # ex v0
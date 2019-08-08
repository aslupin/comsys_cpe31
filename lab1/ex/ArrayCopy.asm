.data               # DataSection
source: .word 3, 1, 4, 1, 5, 9, 0 # source[] = {3, 1, 4, 1, 5, 9, 0}
dest: .space 40     # dest[10]
.text               # TextSection
.globl main        # call main by SPIM
main:

addu $10, $10, $0   # k = 0
la $13, source      # source[] = {3, 1, 4, 1, 5, 9, 0};
la $14, dest        # dest[10]

loop_entry:         # Loop statement
sll $11, $10, 2     # k = k * 4
addu $15, $13, $11  # get addr source[k]
lw $17, 0($15)      # load source[k]
beq $17, $0, break_loop # if source[k] == 0 goto break_loop
addu $16, $14, $11  # get addr dest[k]
sw $17, 0($16)      # desk[k] = source[k]
addiu $10, $10, 1   # k++
j loop_entry        # continue loop
break_loop:         # OutLoop statement
li $v0, 10          # return 0 inst
syscall             # ex v0
    
    

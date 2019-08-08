.data               # Data Section
    varA: .word 0, 2, 1, 6, 4, 3, 5, 3 # int A[8] = {0, 2, 1, 6, 4, 3, 5, 3};
    varB: .word 0, 0, 0, 0, 0, 0, 0, 0 # int B[8] = {0, 0, 0, 0, 0, 0, 0, 0}; 
    varC: .word 0, 0, 0, 0, 0, 0, 0    # int C[7] = {0, 0, 0, 0, 0, 0, 0};
.text               # Text Section
.globl main         # call main by SPIM
main :              # Main statement
    
    la $5, varA         # get addr A
    la $6, varB         # get addr B
    la $7, varC         # get addr C
    li $8, 1            # int i = 1
    li $9, 8            # int n = 8
    li $10, 9           # int k = 7
    
    
    # FOR1
    loop1 :
        sll $11, $8, 2              # i = i * 4
        slt $12, $8, $9             # if(i < n) $12 = 1
        beq $12, $0, break_loop1    # $12 == 0 ? break : continue
        addu $13, $5, $11           # get current A's addr 
        lw $14, ($13)               # load A[i]
        sll $14, $14, 2             # a[i] = a[i] * 4
        addu $15, $7, $14           # get current C[A[i]]
        lw $16, ($15)               # load C[A[i]]
        addiu $17, $16, 1           # C[A[i]] + 1
        sw $17, ($15)               # store C[A[i]] = C[A[i]] + 1
        addiu $8, $8, 1             # i++
        j loop1                     # continue
    break_loop1:

    # FOR2
    li $8, 2                        # int i = 2
    loop2 :
        sll $11, $8, 2              # i = i * 4
        slt $12, $8, $10             # if(i < k) $12 = 1
        beq $12, $0, break_loop2    # $12 == 0 ? break : continue
        addu $13, $7, $11           # get current C's addr 
        lw $14, ($13)               # load C[i]
        addiu $15, $13, -4          # get i - 1 ( temp = i - 4 )
        lw $17, ($15)               # load C[i-1]
        addu $18, $14, $17          # C[i] = C[i] + C[i-1];
        sw $18, ($13)               # store C[A[i]] = C[A[i]] + 1
        addiu $8, $8, 1             # i++
        j loop2                     # continue
    break_loop2:

    # FOR3
    addu $11, $9, -1                # tmp = n - 1
    addu $8, $0, $11                # int i = n - 1
    loop3 :
        sll $11, $8, 2              # i = i * 4
        slt $12, $8, $10            # if(i < k) $12 = 1
        beq $12, $0, break_loop3    # $12 == 0 ? break : continue
        addu $13, $7, $11           # get current C's addr 
        lw $14, ($13)               # load C[i]
        addiu $15, $13, -4          # get i - 1 ( temp = i - 4 )
        lw $17, ($15)               # load C[i-1]
        addu $18, $14, $17          # C[i] = C[i] + C[i-1];
        sw $18, ($13)               # store C[A[i]] = C[A[i]] + 1
        addiu $8, $8, 1             # i++
        j loop3                     # continue
    break_loop3:


    li $v0, 10          # return 0 inst
    syscall             # ex v0
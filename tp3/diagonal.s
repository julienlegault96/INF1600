.data
    r:
            .int 0
    c:
            .int 0

.global matrix_diagonal_asm

matrix_diagonal_asm:
    push %ebp      			/* Save old base pointer */
    mov %esp, %ebp 			/* Set ebp to current esp */
    push %ebx;
    push %ecx;
    push %edx;
     /* 8(%ebp) = pointeur premier element mat */
    /* 12(%ebp) =  pointeur matrice de retour*/
    /* 16(%ebp) = grandeur matrice */
		BOUCLE:
		mov r, %eax; // on met r dans eax
		mov c, %ebx; // on met c dans ebx
    cmp %eax, %ebx;
    je IF;
    mov 16(%ebp),%edx
    mul %edx;
    add %ebx,%eax; //on obtient row*matorder+column
    mov 12(%ebp),%edx; // outmatdata dans edx
    mov $0,%ebx;
    mov %ebx,(%edx,%eax,4); // outmatdata[c + r * matorder ] dans edx
    jmp INC_COL;
    IF:
    mov 16(%ebp),%edx
    mul %edx;
    add %ebx,%eax; //on obtient row*matorder+column
    mov 8(%ebp),%ecx;
    mov (%ecx,%eax,4),%ecx;
    mov 12(%ebp),%edx;
    mov %ecx,(%edx,%eax,4);
    INC_COL:
    mov c,%eax; // ebx = c
    add $1,%eax; // ebx = c+1
    mov %eax,c; // c = c+1
    mov c,%eax; // ebx = c
    cmp %eax,16(%ebp); //ebx = matorder
    ja BOUCLE; // c-matorder < 0;
    /*   Inc row           */
    mov $0,%eax;
    mov %eax,c;
    mov r,%eax; // eax = r
    add $1,%eax; // eax = r+1
    mov %eax,r; // r = r+1
    mov r,%eax; // eax = r
    cmp %eax,16(%ebp); //matorder - r
    ja BOUCLE; // r-matorder < 0;
    pop %edx;
    pop %ecx;
    pop %ebx;
    leave          			/* Restore ebp and esp */
    ret            			/* Return to the caller */

.data
    r: 
        .int 0
    c: 
        .int 0
    mat1:
        .int 0
    mat2:
        .int 0

.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp      /* Save old base pointer */
        mov %esp, %ebp /* Set ebp to current esp */
        /* Write your solution here */
        push %ebx;
        push %ecx;
        push %edx;
        /* 8(%ebp) = pointeur premier element mat */
        /* 12(%ebp) =  pointeur matrice de retour*/
        /* 16(%ebp) = grandeur matrice */   
        BOUCLE:
        mov r,%eax; // eax = r
        mov c,%ebx; // ebx = c
        mov 16(%ebp),%edx; //on obtient row*matorder
        mul %edx; // effectue multiplication entre edx et eax et le met dans eax
        add %ebx,%eax; //on obtient row*matorder+column
        mov 8(%ebp),%ecx;
        mov (%ecx,%eax,4),%ecx;
        mov 12(%ebp),%edx;
        mov (%edx,%eax,4),%edx
        cmp %edx,%ecx;
        je END2;
        mov $0,%eax;
        jmp END;     
        END1:
        mov $0, %eax;
        mov %eax, c;
        mov r,%eax; // eax = r
        add $1,%eax; // eax = r+1
        mov %eax,r; // r = r+1
        mov r,%eax; // eax = r      
        cmp 16(%ebp),%eax; //matorder - r
        jnae BOUCLE; // r-matorder < 0
        mov $1, %eax;
        jmp END;
        END2:
        mov c,%eax; // eax = c
        add $1,%eax; // eax = c+1
        mov %eax,c; // c = c+1
        mov c,%eax; // eax = c
        cmp 16(%ebp),%eax; //ebx = matorder
        jnae BOUCLE; // c-matorder < 0 
        jmp END1;
        END:
        pop %edx;
        pop %ecx;
        pop %ebx;
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */

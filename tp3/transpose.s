.data
    r:
        .int 0
    c:
        .int 0

.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        push %ebx;
        push %ecx;
        push %edx;
        /* 8(%ebp) = pointeur premier element mat */
        /* 12(%ebp) =  pointeur matrice de retour*/
        /* 16(%ebp) = grandeur matrice */
        BOUCLE:
        mov r,%eax;
        mov c,%ebx;
        mov 16(%ebp),%edx
        mul %edx; // effectue multiplication entre edx et eax et le met dans eax
        add %ebx,%eax; //on obtient row*matorder+column
        mov 8(%ebp),%ecx; //dans ecx on a la valeur de l'objet a row,column // on repete la manoeuvre en inversant row/column
        mov (%ecx,%eax,4), %ecx
        mov r,%ebx;
        mov c,%eax;
        mov 16(%ebp),%edx;
        mul %edx
        add %ebx,%eax;
        mov 12(%ebp),%edx; // on ajoute la valeur de la matrice un a la row column inversre de la matrice de retour il manque seulement les condition de boucle
        mov %ecx,(%edx,%eax,4);
        mov c,%eax;
        add $1,%eax;
        mov %eax,c;
        mov c,%eax;
        cmp %eax,16(%ebp);
        ja BOUCLE
        mov $0,%eax;
        mov %eax, c;
        mov r,%eax;
        add $1,%eax;
        mov %eax,r;
        mov r,%eax;
        cmp %eax,16(%ebp);
        ja BOUCLE
        pop %edx;
        pop %ecx;
        pop %ebx;
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

.data
    r:
            .int 0
    c:
            .int 0
    i:
            .int 0
.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        push %ebx;
        push %ecx;
        push %edx;
        /* Write your solution here */
        ;// 8(ebp) = mat 1
        ;// 12(ebp) = mat 2
        ;// 16(ebp) = out mat
        ;// 20(ebp) = mat size
        mov $0,%ecx
        BOUCLE:
        ;// matrice 1
        mov r,%eax;
        mov i,%ebx;
        mov 20(%ebp),%edx
        mul %edx; //
        add %ebx,%eax;// eax = r* matorder + i
        mov 8(%ebp),%ebx;
        mov (%ebx,%eax,4),%eax;// eax =element de la mat
        push %eax;

        ;// Matrice 2
        mov i,%eax;
        mov c,%ebx;
        mov 20(%ebp),%edx
        mul %edx
        add %ebx,%eax; // eax = i*matorder + c
        mov 12(%ebp),%ebx;
        mov (%ebx,%eax,4),%eax; //eax = element de la mat
        pop %ebx; // element de l'autre mat
        mul %ebx
        add %eax,%ecx; // ajoute a la multiplication a la somme

        ;//Inc de i
        mov i,%eax
        add $1,%eax
        mov %eax,i
        mov i,%eax;
        cmp %eax,20(%ebp);
        ja BOUCLE

        ;//Ajout dans la mat out
        mov r,%eax;
        mov c,%ebx;
        mov 20(%ebp),%edx
        mul %edx;
        add %ebx,%eax;
        mov 16(%ebp),%ebx;
        mov %ecx,(%ebx,%eax,4);
        mov $0,%ecx;

        ;// Inc de c
        mov $0,%eax;
        mov %eax,i;
        mov c,%eax;
        add $1,%eax;
        mov %eax,c;
        mov c,%eax
        cmp %eax,20(%ebp);
        ja BOUCLE

        ;// Inc de r
        mov $0,%eax;
        mov %eax,c;
        mov r,%eax;
        add $1,%eax;
        mov %eax,r;
        mov r,%eax
        cmp %eax,20(%ebp);
        ja BOUCLE

        pop %edx
        pop %ecx
        pop %ebx
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

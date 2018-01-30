.data
	factor:
		.float 2.0
	perimeter:
		.float 0
	mul1:
		.float 0
	mul2:
		.float 0

.globl _ZNK9CTriangle7AreaAsmEv

_ZNK9CTriangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        push %ecx
        push %ebx


        /* Write your solution here */

        ;// push le pointeur de la classe pour le perimeter
        push 8(%ebp)
        call _ZNK9CTriangle12PerimeterAsmEv
        ;// le perimeter est dans st[0]
        fld factor
        fdivrp
        ;// On store Perimetre/2
        fstp perimeter
        mov 8(%ebp),%ecx
        fld 4(%ecx) ;// contient le pointeur classe
        fld perimeter; // contient le perimetre/2
        fsubp
        fstp mul1; // On store la soustraction dans une var temp
        fld 8(%ecx)
        fld perimeter
        fsubp
        fstp mul2; // Meme chose que plus haut
        fld 12(%ecx)
        // Il nous reste juste a multiplier le tout
        // perimeter * (p-cote[1]) * (p-cote[2]) * (p-cote[3])
        fld perimeter
        fsubp
        fld mul2
        fmulp
        fld mul1
        fmulp
        fld perimeter
        fmulp
        fsqrt

        pop %ebx
        pop %ecx
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

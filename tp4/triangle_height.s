.data
		 factor: .float 2.0 

.globl	_ZNK9CTriangle9HeightAsmEv

_ZNK9CTriangle9HeightAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        /* Write your solution here */
        
   		push 8(%ebp);
        call _ZNK9CTriangle7AreaAsmEv;	// st[0] = TriangleArea
        fld factor;						// st[0] = 2, st[1] = a
        fmulp; 							// st[0] = st[1] = 2*Area
        mov 8(%ebp), %eax;					
        fld 12(%eax);					// st[0] = mSides[2], st[1] = 2*Area
        fdivrp;							// st[0] = st[1] = 2*Area/msides[2]
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

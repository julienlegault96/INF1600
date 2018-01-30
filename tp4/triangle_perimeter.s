.globl _ZNK9CTriangle12PerimeterAsmEv

_ZNK9CTriangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %eax; // objet C dans eax
        fld 4(%eax); 	   // st[0] = mSides[0]
        fld 8(%eax);	   // st[0] = mSides[1], st[1] = mSides[0]
        faddp; 			   // st[0] = st[1] = mSides[0] + mSides[1]
        fld 12(%eax);	   // st[0] = mSides[2] , st[1] = mSides[0] + mSides[1]
        faddp; 		   // st[0] = st[1] = mSides[0] + mSides[1] + mSides[2]
        
        /* Write your solution here */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */

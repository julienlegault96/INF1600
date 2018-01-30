.data
        factor: .float 2.0 /* use this to multiply by two */

.text
.globl _ZNK7CCircle12PerimeterAsmEv

_ZNK7CCircle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        /* Write your solution here */
        mov 8(%ebp),%eax; 	//objet C dans eax
        fld 4(%eax);    	//st[0] = mRadius
        fldpi; 				//st[0] = pi, st[1] = mRadius
        fmulp;				//st[0] = st[1] = pi*mRadius
        fld factor;			//st[0] = factor, st[1] = pi*mRadius
        fmulp;				//st[0] =st[1] = 2*pi*mRadius       
            
		leave          /* restore ebp and esp */
        ret            /* return to the caller */

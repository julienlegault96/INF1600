.data
	/* Votre programme assembleur ici... */
	i: .int 0

.global func_s

func_s:
	/* Votre programme assembleur ici... */
	jmp END;
	BOUCLE:
	mov e,%eax;
	mov b,%ebx;
	sub %ebx,%eax; //%eax = e-b
	mov d,%ebx; //%ebx = d
	add %ebx,%eax; // %eax = (e-b)+d
	mov %eax,a; // a = (e-b)+d

	mov c,%eax; //eax = c
	mov b,%ebx; // ebx = b
	add $500,%eax; // eax = c+500
	sub $1000,%ebx; // ebx = b-1000
	cmp %eax,%ebx; // ebx-eax 
	jnae IF; // ebx-eax < 0
	jmp ELSE;

	IF:
	mov c,%eax;// eax = c
	sub $500,%eax; // eax = c-500
	mov %eax,c; // c = c-500
	mov b,%ebx; // ebx = b
	mov c,%eax; // eax = c
	cmp %eax,%ebx; // eax-ebx
	ja IF2; // eax-ebx > 0
	jmp END
	
	IF2:
	mov b,%ebx; // ebx = b
	sub $500,%ebx; // ebx = b-500
	mov %ebx,b; // b= b - 500
	jmp END

	ELSE:
	mov b,%eax; //eax = b
	mov e,%ebx; //ebx = e
	sub %ebx,%eax; // eax = b-e
	mov %eax,b; // b = b-e
	mov d,%eax; // eax = d
	add $500,%eax; //eax = d+500
	mov %eax,d; // d = d +500

	END:
	mov i,%eax; // eax = i
	add $1,%eax; // eax = i+1
	mov %eax,i; // i = i+i
	mov i,%eax; // eax = i
	mov $10, %ebx; //ebx = 10
	cmp %ebx,%eax; //10 - i
	jna BOUCLE; // i-10 <=0

	ret

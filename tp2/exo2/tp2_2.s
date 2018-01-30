.global func_s

func_s:
	/* Votre programme assembleur ici... */
	flds d; // st[0] = d 
	flds b; // st[0] = b, st[1] = d
	fmulp; // st[0] = st[1] = b*d
	flds c; // st[0] = c;
	fsubrp; // st[1] = st[0] = (b*d)-c
	fstps a; // a =  st[0],  st[0] -> st[1]
	flds f; // st[0] =f
	flds g; // st[1] =f, st[0] = g
	fsubrp; // st[1] =st[0]= f-g
	flds a; // st[1] = f-g, st[0] = a
	fdivp; // st[0] = st[1] = a/(f-g) ou a = (b*d) -c
	flds e; // st[0] = e;
	faddp;  // st[0] = st[1] = e + (b*d) -c)/(f-g)
	fstps a; // a = st[0] 
	flds e; // st[1] = st[0] = e
	flds g; // st[1] = e, st[0] =g
	fsubp; //  st[0] = st[1] = g-e
	flds f; // st[0] =f
	fdivrp; st[0] = st[1] = (g-e)/f
	flds a; st[0] = a 
	fmulp; st[0] = st[1] = ((g-e)/f) * (e + (b*d) -c)/(f-g))
	fstps a; a = st[0] = st[1] = ((g-e)/f) * (e + (b*d) -c)/(f-g))
	ret

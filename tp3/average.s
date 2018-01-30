
.data
r:
   .int 0
c: 
   .int 0
elem:
   .int 0

.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */
        push %esi
        push %ebx
        push %edi
        push %ecx
        push %edx

        mov 8(%ebp), %esi        	# inmatdata dans esi
        mov 12(%ebp), %ebx       	# outmatdata dans ebx
        mov 16(%ebp), %ecx      	# matorder dans ecx
        
        BOUCLE1:
        mov r,%edi
        cmp %edi, %ecx          # comparer r avec matorder
        je  END					# si egal aller a END
        mov c,%edx
        mov $0, %edx           # c = 0 pour deuxieme boucle
        mov %edx, c
        mov $0, %eax           # retourner 0
        jmp BOUCLE2
        
        BOUCLE1_SUITE:
        mov $0, %edx		# mettre edx, le registre de la retenue a 0		
        div %ecx			# eax/ecx = elem/matorder mis dans eax
        mov r,%edi
        mov %eax, (%ebx,%edi,4)    # Ajouter le resultat a la position r
        jmp INCREMENT_ROW   

        BOUCLE2:
        mov c,%edx
        cmp %edx,%ecx     # comparer c avec matorder
        je BOUCLE1_SUITE  # si egal aller BOUCLE1_SUITE
        mov r,%edi
        imul %ecx, %edi    # r*matorder
        add %edi, %edx     # r*matorder + c
        add (%esi,%edx,4),%eax # elem = inmatdata[c + r * matorder]
        jmp INCREMENT_COLUMN

        INCREMENT_COLUMN: 
        mov c,%edx
        inc %edx
        mov %edx, c
        jmp BOUCLE2

        INCREMENT_ROW:
        mov r, %edi
        inc %edi
        mov %edi, r
        jmp BOUCLE1      
   
		END:	
        pop %esi
        pop %ebx
        pop %edi
        pop %ecx
        pop %edx	
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller *

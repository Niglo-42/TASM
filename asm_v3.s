
const goto eq+R1+_r1+jmp
const init imov+im+0
const next add+r3+R3+im+1
const end_str add+r3+R3+im+2
#####"
#arbre de débug
#####
imov+r3+im+0xf000

# --- "add"
ecrire+R3+im+0x61  
next
ecrire+R3+im+0x64   
next
ecrire+R3+im+0x64  
end_str
ecrire+R3+im+0x56   
next
ecrire+R3+im+0x01   
next

# --- "adc" 
#(racine commune avec "add")
ecrire+R3+im+0x61   
next
ecrire+R3+im+0x64   
next
ecrire+R3+im+0x63   
end_str
ecrire+R3+im+0x56
next
ecrire+R3+im+0x02
next

# --- "ad" 
#(préfixe de "add", testé à part)
ecrire+R3+im+0x61
next
ecrire+R3+im+0x64
end_str
ecrire+R3+im+0x56
next
ecrire+R3+im+0x03
next

# --- "ecrire"
ecrire+R3+im+0x65
next
ecrire+R3+im+0x63
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x65
end_str
ecrire+R3+im+0x57
next
ecrire+R3+im+0x04
next

# --- "xor"
ecrire+R3+im+0x78
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x72
end_str
ecrire+R3+im+0x58
next
ecrire+R3+im+0x05
next

# --- Fin du dico (terminateur)
ecrire+R3+im+0x00
next
ecrire+R3+im+0x00
next
ecrire+R3+im+0x00

#####
#injection table
#####
#r3 = BASE ← 0x7000
imov+r3+im+0x7000


ecrire+R3+im+97
next
ecrire+R3+im+100
next
ecrire+R3+im+100
end_str
ecrire+R3+im+56 #type 0 = ALU
next
ecrire+R3+im+1 #traduction bin

next
#pour 'ecrire'
ecrire+R3+im+0x65 
next
ecrire+R3+im+0x63
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x65#ram[12302]
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+16#ram[12305]
next
#addr = 12306 pour 'sub'
ecrire+R3+im+0x73
next
ecrire+R3+im+0x75
next
ecrire+R3+im+0x62
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+2
#ram[12314]
next
#addr = 12315 pour 'mul'
ecrire+R3+im+0x6d 
next
ecrire+R3+im+0x75
next
ecrire+R3+im+0x6c
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+3#ram[12323]

next

#addr = 12324 pour 'div'
ecrire+R3+im+0x64 
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x76
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+4#ram[12332]

next

#addr = 12333 pour 'mod'
ecrire+R3+im+0x6d 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x64
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+5#ram[12341]

next

#addr = 12342 pour 'and'
ecrire+R3+im+0x61 
next
ecrire+R3+im+0x6e
next
ecrire+R3+im+0x64
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+6#ram[12350]

next

#addr = 12351 pour 'or'
ecrire+R3+im+0x6f 
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+7#ram[12359]

next
#addr = 12360 pour 'xor'
ecrire+R3+im+0x78 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x72
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+8#ram[12368]

next

#addr = 12369 pour 'not'
ecrire+R3+im+0x6e 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x74
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+9#ram[12377]

next

#addr = 12378 pour 'shl'
ecrire+R3+im+0x73 
next
ecrire+R3+im+0x68
next
ecrire+R3+im+0x6c
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+10#ram[12386]

next

#addr = 12387 pour 'shr'
ecrire+R3+im+0x73 
next
ecrire+R3+im+0x68
next
ecrire+R3+im+0x72
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+11#ram[12395]

next

#addr = 12396 pour 'rol'
ecrire+R3+im+0x72 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x6c
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+12#ram[12404]

next

#addr = 12405 pour 'ror'
ecrire+R3+im+0x72 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x72
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+13#ram[12413]

next

#addr = 12414 pour 'min'
ecrire+R3+im+0x6d 
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x6e
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+14#ram[12422]

next

#addr = 12423 pour 'max'
ecrire+R3+im+0x6d 
next
ecrire+R3+im+0x61
next
ecrire+R3+im+0x78
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+15#ram[12431]

next

#addr = 12432 pour 'eq'
ecrire+R3+im+0x65 
next
ecrire+R3+im+0x71
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+17#ram[12440]

next

#addr = 12441 pour 'ne'
ecrire+R3+im+0x6e 
next
ecrire+R3+im+0x65
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+18#ram[12449]

next

#addr = 12450 pour 'gt'
ecrire+R3+im+0x67 
next
ecrire+R3+im+0x74
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+19#ram[12458]

next

#addr = 12459 pour 'lt'
ecrire+R3+im+0x6c 
next
ecrire+R3+im+0x74
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+20#ram[12467]

next

#addr = 12468 pour 'ge'
ecrire+R3+im+0x67 
next
ecrire+R3+im+0x65
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+21#ram[12476]

next

#addr = 12477 pour 'le'
ecrire+R3+im+0x6c 
next
ecrire+R3+im+0x65
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+22#ram[12485]


next
#[12486]rand
ecrire+R3+im+0x72
next
ecrire+R3+im+0x61
next
ecrire+R3+im+0x6e
next
ecrire+R3+im+0x64
end_str
ecrire+R3+im+56 
next
ecrire+R3+im+38
#[12494]
next
#12495 'mov'
ecrire+R3+im+0x6d 
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x76
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+68#ram[12503]

next
#addr = 12504 pour 'imov'
ecrire+R3+im+0x69 
next
ecrire+R3+im+0x6d
next
ecrire+R3+im+0x6f
next
ecrire+R3+im+0x76
end_str
ecrire+R3+im+56 #type 0
next
ecrire+R3+im+69#ram[12512]

#alu ok

#crtl ram
next
#addr = 12513 pour 'in'
ecrire+R3+im+0x69 
next
ecrire+R3+im+0x6e
end_str
ecrire+R3+im+32 #type crtl
next
ecrire+R3+im+1#ram[12521]

next
#12522 #imax
ecrire+R3+im+0x69 
next
ecrire+R3+im+0x6d
next
ecrire+R3+im+0x61
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+2#ram[12530]

next

#12531 #lire1
ecrire+R3+im+0x6c 
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x65
next
ecrire+R3+im+0x31
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+4#ram[12539]

next

#12540 #lire2
ecrire+R3+im+0x6c 
next
ecrire+R3+im+0x69
next
ecrire+R3+im+0x72
next
ecrire+R3+im+0x65
next
ecrire+R3+im+0x32
end_str
ecrire+R3+im+32
#type 1 = ctrl ram
next
ecrire+R3+im+8#ram[12548]

next

#12549 #ret
ecrire+R3+im+0x72 
next
ecrire+R3+im+0x65
next
ecrire+R3+im+0x74
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+32#ram[12557]

next

#12558 #call
ecrire+R3+im+0x63 
next
ecrire+R3+im+0x61
next
ecrire+R3+im+0x6c
next
ecrire+R3+im+0x6c
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+64#ram[12566]

next
#12567 #jmp
ecrire+R3+im+0x6a 
next
ecrire+R3+im+0x6d
next
ecrire+R3+im+0x70
end_str
ecrire+R3+im+32 
#type 1 = ctrl ram
next
ecrire+R3+im+128#ram[12575]
######

const i r5
#eq+R1+_r1 (pour faire des goto)

not+r1 #pos final de la rom
mov2+r1+in+R1# r1 = lenght
mov2+r2+im+0x020 #adress début


label for_lenght

mov2+r31+in+R5 #R3=in[i]
ecrire+R2+_r31 #ram(c+i)=newChar
add+r2+R2+im+1 #r2++ #ram(c)
add+i+R5+im+1 #i++
ne+R5+_r1 #if i < lenght
jmp|im+for_lenght

#############################

init+r3

ecrire+_r1 #ram0 = lenght
add+r3+R3+im+1
ecrire+R3+im+0x20#[file.start]
add+r3+R3+im+1
ecrire+R3+im+0x40#[label]
#4000 = 0010.1000/oct vide
#ou 40 + 00

add+r3+R3+im+1
ecrire+R3+im+0x50#[var]

add+r3+R3+im+1
ecrire+R3+im+0x60#[var_alloc]

add+r3+R3+im+1
ecrire+R3+im+0x070#[t_cores]

add+r3+R3+im+1
ecrire+R3+im+0x80#[asm]
add+r3+R3+im+1
ecrire+R3+im+0x1#[inc] pos7
add+r3+R3+im+1
ecrire+R3+im+0x33#[shift dest]
add+r3+R3+im+1
ecrire+R3+im+0x2e#[shift src1]
add+r3+R3+im+1
ecrire+R3+im+0x29#[shift src2]
add+r3+R3+im+1
ecrire+R3+im+0x12#[dest.char]
imov+r17+im+0 #y++ [var y]
imov+r18+im+0 #x++ [label x]
imov+r19+im+0 #z++ [asm z]
imov+r20+im+0 #w++ [pc w]
imov+r27+im+255 #255 range
imov+r28+im+16 #pc counter
imov+r29+im+0 #v++ [var_alloc v]
imov+r4+im+0x20 #f.start
not+r30# nb_var =-1
ecrire+R28+im+0
imov+r3+im+0 #i = 0
##############

const goto eq+R1+_r1+jmp
const init imov+im+0
const i_pp add+r3+R3+im+1

######init

init+r2 # nb_var
init+r3 # i 
init+r4 #char_buffer[j]
init+r5 #curseur A
imov+im+16+r6 #pointeur sur pc
init+r7 #var[y]
init+r8 #label[x]
init+r9 #curseur B
init+r10 #buffer A
init+r11 #buffer B
init+r12 #buffer C
#######end init

label passe1
ge+R3+_r1
jmp+end_passe1

add+r5+lire2+R3+im+1
eq+lire1+R5+im+32
jmp+next_iter

call+detect_comment
eq+R11+im+1
jmp+next_iter

call+detect_var
eq+R11+im+1
jmp+next_iter

call+detect_label
eq+R11+im+1
jmp+next_iter
call+skip_instru



label next_iter
i_pp
goto+passe1

##########################
#fonctions passe1
##########################
label skip_instru

call+pc_inc

label skip_instru_loop
add+r5+lire2+R3+im+1
eq+lire1+R5+im+10
jmp+end_skip_instru_loop
i_pp
goto+skip_instru_loop
label end_skip_instru_loop
ret
###########
#pc inc 2ieme oct
###########
label pc_inc
lire1+R6+ne+im+255 #c o max ?
jmp+pas_au_max
ecrire+R6+im+0
add+r10+R6+im+1
add+lire1+lire2+ecrire+R10+im+7
init+r10
label pas_au_max
add+lire1+lire2+ecrire+R6+im+7
#pc++
ret
######
label detect_comment

add+r9+lire2+R4+im+11
 #buf.char[j]
ecrire+R9+im+47
add+r9+R9+im+1
ecrire+R9+im+47
call+string_match
call+clean_buffer
#si r11 est toujours = 1
#alors match réussi
eq+R11+im+1
jmp+remove_comment
ret
##########
label detect_var

add+r9+lire2+R4+im+11
 #buf.char[j]
ecrire+R9+im+118
add+r9+R9+im+1
ecrire+R9+im+97
add+r9+R9+im+1
ecrire+R9+im+114
add+r9+R9+im+1
ecrire+R9+im+32
call+string_match
call+clean_buffer
#si r11 est toujours = 1
#alors match réussi
eq+R11+im+1
jmp+add_var
ret
label detect_label

add+r9+lire2+R4+im+11
 #buf.char[j]
ecrire+R9+im+108
add+r9+R9+im+1
ecrire+R9+im+97
add+r9+R9+im+1
ecrire+R9+im+98
add+r9+R9+im+1
ecrire+R9+im+101
add+r9+R9+im+1
ecrire+R9+im+108
add+r9+R9+im+1
ecrire+R9+im+32
call+string_match
call+clean_buffer
#si r11 est toujours = 1
#alors match réussi
eq+R11+im+1
jmp+add_label
ret

label remove_comment
add+r5+lire2+R3+im+1
eq+lire1+R5+im+10#fin de ligne? 
jmp+remove_com_end
#else
ecrire+R5+im+32
i_pp
goto+remove_comment
label remove_com_end
ecrire+R5+im+32
ret
######### end comment section
########variables
label add_var
imov+lire2+im+3+r10
shl+r10+R10+im+8
add+r5+R10+_r7

########
#mémorise la val de r3
mov+r12+R3 
#r12 = index de départ
#recup les char de la var a +4
add+r3+R3+im+4

call+recup_char
#imov+r9+lire2+im+11

init+r11
label assign_char_var
add+r5+R10+_r7
lire1+R9+eq+im+0
jmp+fin_assign
imov+lire2+_r9+ecrire+R5
add+r7+R7+im+1 #cur table
add+r9+R9+im+1 #cur buf.char

goto+assign_char_var
label fin_assign
add+r7+R7+im+1 #laisse le \0
add+r5+R10+_r7

imov+r10+lire2+im+4

#recup var.alloc
ecrire+R5+_r10 #poids fort

imov+r10+lire2+im+3
shl+r10+R10+im+8
add+r7+R7+im+1
add+r5+R10+_r7

ecrire+R5+_r2 #poids faible
########
imov+lire2+r9+im+11
call+clean_buffer
call+clean_declaration
imov+r11+im+1#remet à 1
#pour next_iter car var bien
#detecté
i_pp#car on ct arrêté sur 13
#et pas 10 !
add+r2+R2+im+1 #nb_var++
add+r7+R7+im+1 #var[y]++
ret
###### end variable
###### clean déclarations
label clean_declaration
add+r5+lire2+R12+im+1
lire1+R5+eq+im+10
jmp+stop_clean_declaration
ecrire+R5+im+32
add+r12+R12+im+1
goto+clean_declaration
label stop_clean_declaration
ecrire+R5+im+32
ret
###### end clean déclarations
label add_label
mov+r12+R3 #se souvient de i
add+r3+R3+im+6
call+recup_char

imov+r10+lire2+im+2#recup var
shl+r10+R10+im+8
add+r5+R10+_r8 #index X (label)
#init avant loop

imov+r9+lire2+im+11
init+r11
label assign_char_label
add+r5+R10+_r8
lire1+R9+eq+im+0
jmp+fin_assign2
imov+lire2+_r9+ecrire+R5
add+r8+R8+im+1 #cur table
add+r9+R9+im+1 #cur buf.char

goto+assign_char_label
label fin_assign2
add+r8+R8+im+1 #for the 0
add+r5+R10+_r8

imov+lire2+ecrire+R5+im+16 
#poids fort
add+r8+R8+im+1
add+r5+R10+_r8
imov+lire2+ecrire+R5+im+17 
#poids faible
add+r8+R8+im+1
########
imov+lire2+r9+im+11
call+clean_buffer
call+clean_declaration
imov+r11+im+1#remet à 1
#pour next_iter car var bien
#detecté
i_pp#car on ct arrêté sur 13
#et pas 10 !
ret
#####
label clean_buffer

eq+lire1+R9+im+0
jmp+clean_buf_end
ecrire+R9+im+0

add+r9+R9+im+1
goto+clean_buffer
label clean_buf_end
imov+lire2+r9+im+11

ret
####### recup char du buf
label recup_char

add+r5+lire2+R3+im+1
eq+lire1+R5+im+13 #plus de char
jmp+fin_char
add+r9+lire2+R4+im+11
imov+lire2+_r5+ecrire+R9
i_pp
add+r4+R4+im+1
goto+recup_char
label fin_char
init+r4 #r4 = nb_char
imov+lire2+im+11+r9
#réinit de r9
ret
########### end recup char
label string_match
add+r5+lire2+R3+im+1
 #file[i]
add+r9+lire2+R4+im+11
 #buf.char[j]
call+str_len

imov+r11+im+1 
#match = true
#pour le moment
eq+R10+im+0
jmp+fail
label match_str
ne+lire1+lire2+R5+_r9
jmp+fail
#else
add+r5+R5+im+1
add+r9+R9+im+1
sub+r10+R10+im+1
ne+R10+im+0
jmp+match_str
#else
imov+lire2+r9+im+11
 #réinit curz
ret
label fail
imov+r11+im+0
ret
#########################
label str_len
init+r10
#
label while_comparaison_not_null
eq+lire1+R9+im+0 
jmp+end_str_len
#while buf.char != 0
add+r10+R10+im+1 #len++
add+r9+R9+im+1   #cur2++
goto+while_comparaison_not_null
label end_str_len
imov+lire2+r9+im+11 
#réinit curseur
ret
############## end fonction
label end_passe1
#############
label end_pass1
###test débug pass1
#  r1+imov+im+0
 #  r2+imov+im+0x5000
#
label debug1
#
  # imov+lire2+_r2+ecrire+R1
   #add+r1+R1+im+1
 #  r2+add+R2+im+1
  # goto+debug1
####################
#arbre de trie
####################
#docu:

#le décalage se fera de 13bits
# (* 8192) soit (0xff -> 0xff000)
#ce qui ne limite plus à 0xffff 
#mais à 0xfffff 

#slot = {char, ptr enfant*2,
#prt_end*2} dernier slot =
#overflow *2
#soit 8*5+2=42 oct par chunk

#@ 3 trie
const trie.instru 0xc000
const trie.label 0xd000
const trie.var 0xe000

############

#@ 3 dictionnaires
const string.instru 0x7000
const string.label 0x4000
const string.var 0x6000
const string.debugg 0xf000
############
#autre
const @trie.dest r1
const @bloc_actuel.dest r5
const @trie1 R1
const @bloc_actuel1 R5
const inc lire2+im+7+add
 
############

imov+r1+im+trie.instru
#root de l'arbre
imov+r2+im+string.debugg 
init+r3#[i] pour str
init+r4#char_act
init+r5#curseur 1
init+r6#curseur 2
init+r7
#add+r7+R7+im+1# W
init+r8#buf
init+r9#buf_1
init+r10#buf_2
init+r11#
init+r12#
init+r13#y pour trie
mov+r14+R1 #Copie de root
init+r15#ptr de la mère
init+r16#ptr opcode /apres le 0
init+r17#bloc courant in trie
#dsl ça crée pas de bon block
# a,d
# e
#joue ticpar tick et tkt tu vas
#trouver

####################

label insertion
imov+r1+im+trie.instru 
call+insere_char
###################
add+r3+R3+im+2 #saute les op
add+r10+R2+_r3
mov+lire1+R10+r11
add+r10+R10+im+1
#vérif si fin dico
mov+lire1+R10+r12
eq+R11
jmp_read+r11
eq+R12
jmp_read+r12
and+r11+R12+_r11
eq+R11+im+1
jmp+insertion_var
init+r10
init+r11
init+r12
###################
goto+insertion
label insertion_var
init+r10
init+r11
init+r12
imov+r1+im+trie.var 
#root de l'arbre
imov+r2+im+string.var
call+insere_char
imov+r1+im+trie.label 
#root de l'arbre
imov+r2+im+string.label
call+insere_char
jmp+done
label insere_char
imov+r8+im+0 # for i = 8:


label for_eight
ge+R8+im+8
jmp+end_for
##########
add+r5+R2+_r3 #cur sur dico
mov+r4+lire1+R5 #Charge le char
eq+R4 #fin de str
jmp+end_string
###########"
#check si match jusquau 0 or OV
add+r6+R1+_r13 #cur2 sur trie
add+r6+R6+_r17 #root+y+b.cour
mov+lire1+R6+r10 #char2 récup
eq+R10+_r4
jmp+follow_child

eq+R10+im+0 # 0 ?
jmp+creer_bloc
add+r8+R8+im+1

add+r13+R13+im+5 #y+5
goto+for_eight

label end_for
label end_string

#r15 a l@ de la mère
add+r15+R15+im+3 #sur end?
add+r3+R3+im+1#0->opcode
mov+r16+R3#ptr index.opcode
unpack+r10+R16 #P.faible
ecrire+R15+_r10
add+r15+R15+im+1 #sur end.2
oct2+r10+R16
ecrire+R15+_r10
init+r17
init+r7 #w réinit
ret
label creer_bloc
mov+r15+R6
##############
ecrire+R6+_r4
add+r13+R13+im+1 #y+1
add+r7+R7+im+1 #w+1

add+r6+R1+_r13
add+r6+R6+_r17

#root + (w*42)
unpack+r10+R7 #oct1 de w in r10
 #ptr_child #juste w !
ecrire+R6+_r10 #poids faible w
add+r13+R13+im+1 #y+1
add+r6+R1+_r13
add+r6+R6+_r17
oct2+r10+R7
ecrire+R6+_r10#poids fort w

add+r3+R3+im+1 
#parametre dico+1

mul+r17+R7+im+42
#avance le cur.trie
init+r13 #y = 0  


call+insere_char
ret
#poids faible toujours en 1er
label follow_child
mov+r15+R6 #mem la mère
add+r13+R13+im+1 #y+1
add+r6+R1+_r13
add+r6+R6+_r17 #bloc courant
mov+lire1+R6+r9 #ptr_child
add+r13+R13+im+1 #y+1
add+r6+R1+_r13
or+r9+lire1+R6+_r9 #ptr_child.fort
init+r13 #réinit de y
add+r6+R1+_r13

mul+r17+R9+im+42 # w*42
add+r3+R3+im+1 
add+r7+R7+im+1 #car tu descends
#parametre dico+1
call+insere_char
ret

label done


####################
#arbre de trie end
####################
####################
#passe2
####################
init+r1
imov+r2+im+0#v
imov+r3+im+0#i 
imov+r4+im+0#buf1
imov+r5+im+0 #curseur 
imov+r6+im+0 #c(valeur)
imov+r7+im+0 #c(valeur2)
#pour comparaison
imov+r8+im+0 #buffer2
imov+r9+im+0 #curseur2
imov+r10+im+0 #buf nb char
imov+r11+im+0 #buf instru
imov+r12+im+0 #w(t.asm)
imov+r13+im+0 #buf3
imov+r16+im+0#addr.start
#toutes tables+dest.char
imov+r17+im+0 #y(tables)
imov+r18+im+0 #binaire 64 bits
imov+r19+im+8 #pos.token
init+r25 #flag.write

label loop_pass2

lire2+ge+R3+im+0
#r3 = file[i]
jmp+end_pass2

lire2+add+r5+R3+im+1
mov+lire1+r6+R5
eq+R6+im+0x0d #fin de ligne?
eq+R6+im+0x0a #fin de ligne?
imov+r25+im+1 #flag fin d'instru
jmp+end_line
imov+r25+im+0 #réinit si !13
eq+R6+im+0x20 #espace? 
eq+R6+im+0x2c #espace? 
jmp+skip_espace
eq+R6+im+0x52 #r?#maj avec 
#majuscule car sinon
#ret peut être prit pour un reg
jmp+trans_nb_reg
eq+R6+im+0x23 #?
jmp+trans_nb_im
#else c une instru ou var/lab
#parse les 3 tables de corres

#ici boucle parsing des 3 tables
#while != 13 or 32 recup char
####
#réinit du r17 &r2 table[y]
#dest_char[v]
imov+r17+im+0 #y
imov+r2+im+0 #v


####

label read_token

mov+lire1+r6+R5 #c=ram[x]

eq+R6+im+0x0d #fin de ligne?
imov+r25+im+1 #flag fin d'instru
#pour décider si on write ou pa
jmp+compare
imov+r25+im+0 #réinit si !13
eq+R6+im+0x20 #espace? 
eq+R6+im+0x2c #virgule? 
jmp+compare
lire2+add+r9+R2+im+11
 #curz2=dest_char + v
ecrire+R9+_r6
#RAM[dest + v] ← char
add+r2+R2+im+1 #v++
lire2+add+r9+R2+im+11
 #dest_char + v
add+r3+R3+im+1 #i++
lire2+add+r5+R3+im+1

goto+read_token
#27

label compare
#############

imov+lire2+r16+im+5
shl+r16+R16+im+8
add+r5+R17+_r16 #table.start+y
imov+r2+im+0 #rénit de v
#il été à la fin du mot
# call match()
call+match

#else
add+r19+R19+im+1#pos.tok++
imov+r17+im+0 #rénit de y(tables)
imov+r2+im+0 #rénit de v(dest.c)
imov+lire2+r16+im+2
shl+r16+R16+im+8
add+r5+R17+_r16 #label.start+y

call+match

imov+r17+im+0 #rénit de y
imov+r2+im+0 #rénit de v
imov+lire2+r16+im+3
shl+r16+R16+im+8
add+r5+R17+_r16 #var.start+i

call+match

#

###########
goto+loop_pass2
###########


label end_pass2
###test débug pass2
r1+imov+im+0
r2+imov+im+0x8000
r3+imov+im+0x50
#
label debug
#
eq+R1+_r3
jmp+fin_debug
imov+lire2+_r2+ecrire+R1
r1+add+R1+im+1
r2+add+R2+im+1
eq+R1+_r1
jmp+debug
label fin_debug
halt

#######
#fonctions
######
label then_match
#z == v ? if true all char match
ne+R8+_r2
eq+R8+im+0
jmp+skip3#c pas dans cette table
#else c dans cette table :)
call+reinit_char_dest
label ret_skip3
#f(then_match)
#v=8-v
im_fil1+sub+r2+im+8+_r2
#curz=nb_char+v
add+r8+R17+_r2


#r16 != 0x7000
ne+R16+im+0x7000
#if true goto take_pointer
jmp+take_pointer
#else
#r24 = shl ram[i] par ram[i+1](y)
#curz1 = shift de l'instru
add+r5+R16+_r8 
#curz2 = instru à shift
add+r9+R5+im+1

lire1+lire2+shl+r11+R9+_r5
#lit à l'addr des 2curz
goto+suite_instru
label take_pointer

imov+r11+im+1
shl+r11+R11+im+32
#add l'immédiat
add+r5+R16+_r8 #cur.table
add+r9+R5+im+1#curz2
lire1+R9+shl+im+8+r8
#buf=adress p.fort traduite
or+R8+_r11+r11#p.fort
lire1+R5+or+_r11+r11#p.faible

label suite_instru
#add+r3+R3+im+1 #i++
#buffer instru ->reg instru
or+r18+R11+_r18
#r25 == 0 ? flag write
eq+R25+im+0
jmp+loop_pass2
#else ct une fin de ligne
#donc goto write_asm
goto+write_asm
ret
label skip3
ret
######

label match
#while t_corres[y] !=0
add+r5+R16+_r17
mov+r7+lire1+R5 #r7 = c2(table)
lire2+add+r5+R2+im+11
mov+lire1+R5+r6 # r6 = c(dest)
#c2=t.corres(c)
#  while table[y] != 0
ne+R7+im+0
jmp+continue
#else 
goto+then_match
label continue
#  if c1 == c2
eq+R6+_r7
jmp+ça_correspond

# //if unmatch
# v = 10-v
im_fil1+sub+r2+im+10+_r2
#y = y+v /pour next_chunk, case0
add+r17+R17+_r2
# v = 10-v
im_fil1+sub+r2+im+10+_r2
# on récup sa val
imov+r8+im+0 #flag match
init+r2
goto+match
#   else
label ça_correspond
# v++, y++, z = z+1
add+r2+R2+im+1
add+r17+R17+im+1
add+r8+R8+im+1
# goto match
goto+match
label write_asm
#ici fonction finale où on 
#envoi les 8 oct 1 par 1 
imov+r8+im+0 #réinit buf2
lire2+add+r16+im+6 
shl+r16+R16+im+8
add+r5+R16+_r12
#curz1=asm.start+w
#table_trad.bin
lire1+ecrire+R5+unpack+_r18
add+r12+R12+im+1 #w++
add+r5+R16+_r12

lire1+ecrire+R5+oct2+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct3+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct4+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct5+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct6+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct7+_r18
add+r12+R12+im+1
add+r5+R16+_r12

lire1+ecrire+R5+oct8+_r18
add+r12+R12+im+1
add+r5+R16+_r12
init+r18
imov+r19+im+8#pos.tok = 0
goto+loop_pass2
########
#fonction vide buffer char
label reinit_char_dest

lire2+ecrire+im_fil1+18
lire2+ecrire+im_fil1+19
lire2+ecrire+im_fil1+20
lire2+ecrire+im_fil1+21
lire2+ecrire+im_fil1+22
lire2+ecrire+im_fil1+23
lire2+ecrire+im_fil1+24
lire2+ecrire+im_fil1+25

ret
##########


##########
#TRANS NOMBRE
label trans_nb_reg
init+r11
#car reg detecté
call+trans_nb

#or linstru final avec r11
#décalé de shift*pos.tok
lire2+shl+r11+R11+_r19 
#nb>>pos.tok
or+r18+R18+_r11#r18=instru
init+r11
add+r19+R19+im+1 #pos.tok++
goto+loop_pass2
#### vaux ret main loop

label trans_nb_im
init+r11
call+trans_nb
r8+imov+im+1
shl+r8+R8+im+32 #flag imédiat
r11+or+R11+_r8
or+r18+R18+_r11#r18=instru
add+r19+R19+im+1 #pos.tok++
goto+loop_pass2

label trans_nb
#####

imov+r6+im+0
#c1
imov+r4+im+0
#buffer1 
#y = 0
#i = index(-1) car sur "#"
add+r3+R3+im+1
#i = index(0)
lire2+add+r5+R3+im+1 
#cuz sur index(0)
#while c_actuel != "0x20" | 0xd
label while_c_act
mov+lire1+r7+R5 #c2=char.file
eq+R7+im+0x20 #space
eq+R7+im+0x0d #saut de ligne
eq+R7+im+0x2c #virgule 
jmp+fin_parse_nb

#r recup les char(chiffres)
shl+r6+R6+im+8 #c1 = c>>8
sub+r7+R7+im+48 #ret vrai nb
or+r6+R6+_r7 #r6 = c(n)
#y++
add+r4+R4+im+1
#i++
add+r3+R3+im+1
lire2+add+r5+R3+im+1
goto+while_c_act
#else jmp fin_number
label fin_parse_nb
#à ce moment i est après le nb
#sur "13" donc à 2 cases
#de la prochaine instru

# y -1
sub+r4+R4+im+1
#z = y //nb de chiffres
#en partant de index(0)
mov+r25+R4

##########
label recup_nb
mov+r8+R4 #x = y
mul+r10+R4+im+8
#r10 = y*8 //nb oct
shr+r13+R6+_r10#r9=c_act
and+r13+R13+im+0xff

eq+R8+im+0
jmp+return_nombre
#while x> 0
label while_x
mul+r13+R13+im+10 #c-act*10
#x--
sub+r8+R8+im+1
ne+R8+im+0
jmp+while_x
add+r11+R11+_r13 #Recup le nb
sub+r4+R4+im+1
#y--
goto+recup_nb

label return_nombre
add+r11+R13+_r11 
#recup mm si 1 chiffre
label skip_chiffre
#r11 = le nb traduit
#####
ret

#######################


label skip_espace
add+r3+R3+im+1 #skip le char
goto+loop_pass2
label end_line

add+r3+R3+im+2 #skip 13&10
imov+r19+im+8 #réinit pos.tok
eq+R18+im+0 #pas d'instru ?
jmp+skip_write
call+write_asm
label skip_write
goto+loop_pass2

#####

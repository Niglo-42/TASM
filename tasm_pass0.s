#Version 0.0 tasm 19-10-2025
#implementation of the const seeker, trim, and shuting yard algorith
# const ten 2 * (8 - 3) #exec first parenthesis then mul.

#################define
const goto eq+R1+_r1+jmp
const init imov+im+0
const table_instru 0x80
const cache 0x100
const const_tab 0x2000
const label_tab 0x3000
const str_pool 0x5000
const token_buf 0x7000
const PP_OUT 0x9000
const asm_emit 0xd000
const INT_MAX 2147483647
const INT_MIN 2147483648
const char mov2+ebx+im
const low2hi shl+im+32
const ipp add+ecx+ecx1+im+1
const putc ecrire+im_fil1+table_instru+ebx2
##########################

#table instruction minimal
'a'+char # char buf = 'a'
putc
'd'+char
putc+1 #tab_instru[i] = buf
'd'+char
putc+2 #i = 2
1+char
putc+0xf
's'+char
putc+0x10
'u'+char
putc+0x11
'b'+char
putc+0x12
2+char
putc+0x1f
'm'+char
putc+0x20
'u'+char
putc+0x21
'l'+char
putc+0x22
3+char
putc+0x2f
'd'+char
putc+0x30
'i'+char
putc+0x31
'v'+char
putc+0x32
4+char
putc+0x3f
'e'+char
putc+0x40
'q'+char
putc+0x41
17+char
putc+0x4f
'j'+char
putc+0x50
'm'+char
putc+0x51
'p'+char
putc+0x52
128+char
putc+0x5c
'r'+char
putc+0x60
'e'+char
putc+0x61
't'+char
putc+0x62
0x20+char
putc+0x6c

####table min end

#insert file in section.text
ebx# lenght
ecx#[i]
edx# val[char]
ecx+not2 #not2 to avoid reg0[val]
in+mov2+ebx+ecx1
ecx
label insert
mov2+in+edx+ecx1
ecrire+ecx1+edx2
add+ecx+ecx1+im+1
ne+ecx1+ebx2
jmp+insert
##############


#################
#extraire les const et résoudre
ecx# for k
edx#hold the char
r5#hold the token
###insert de "const " in r6
mov2+r6+im+0x636f6e73#val comp
shl+r6+R6+im+16
or+r6+R6+im+0x7420
#####end insertion
label while_const
mov+lire1+ecx1+edx
eq+edx1+im+13
jmp+skip_char
';'+eq+edx1+im
jmp+skip_line
eq+edx1+im+32
eq+edx1+im+10
jmp+end_token_const
########shl du token & i++
or+r5+edx1+_r5
shl+r5+R5+im+8
ipp
########
goto+while_const
label end_token_const
or+r5+edx1+_r5
vcmp+ebx+R5+_r6
ne+ebx1+im+0xff
r5#init
jmp+while_const

label skip_trim
ipp
mov+lire1+ecx1+edx
' '+eq+edx1
eq+edx1+im+9
jmp+skip_trim
call+strncpy

halt
##################fonctions
label skip_char
sp+mov+eax
add+sp+sp1+im+1
ipp
return+mov+sp1


label skip_line
sp+mov+eax
add+sp+sp1+im+1

label while_com
ipp
mov+lire1+ecx1+edx
ne+edx1+im+10
jmp+while_com
ipp
mov+lire1+ecx1+edx
return+mov+sp1

#strncpy(char *strn int size)
label strncpy
sp+mov+eax
add+sp+sp1+im+1
r6+im+const_tab+mov2
label strncpy1
lire1+mov+ebx+ecx1
eq+ebx1+im+32
jmp+end_copy
ecrire+R6+ebx2
add+r6+R6+im+1
ipp
goto+strncpy1
label end_copy
return+mov+sp1

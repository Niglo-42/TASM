# code en TCASM pour processeur custom 64bits/imm32
# implémentation d'une pile logiciel et des fonctions de la lib C string.h (putchar, putstr et putnbr)
const goto eq+R1+_r1+jmp
const init mov2+im+0
const initx mov2+im
const stack 0#0x15000
const MAX_INT 4294967295
##########################
#read me
#r0 = pc
#r27 = curseur terminal
#arg are r28-31
#stack range = 0xff00-0xffff (256oct
##########################

#macro call(ra)
#add+ra+R0+im+1
#ecrire+sp1+ra2
#add+sp+sp1+im+4 

##########################

initx+r27+65535

mov2+sp+stack+im
imov+r28+2147483647

call+ft_putnbr
imov+r28+32
call+ft_putchar
'$'+imov+r28
call+ft_putchar
imov+r28+0x1000
'H'+ecrire+R28+im
add+r28+R28+im+1
'e'+ecrire+R28+im
add+r28+R28+im+1
'l'+ecrire+R28+im
add+r28+R28+im+1
'l'+ecrire+R28+im
add+r28+R28+im+1
'o'+ecrire+R28+im
add+r28+R28+im+1
' '+ecrire+R28+im
add+r28+R28+im+1
'N'+ecrire+R28+im
add+r28+R28+im+1
'e'+ecrire+R28+im
add+r28+R28+im+1
'm'+ecrire+R28+im
add+r28+R28+im+1
'e'+ecrire+R28+im
add+r28+R28+im+1
'r'+ecrire+R28+im
add+r28+R28+im+1
'o'+ecrire+R28+im
add+r28+R28+im+1
'd'+ecrire+R28+im
add+r28+R28+im+1
imov+r28+0x1000
call+ft_putstr
label end
halt
###################################

#4 arg max
#r28, r29, r30, r31
############## Personal Library

#######ft_putchar(char c)
#28 = c; 27 = position actuelle
label ft_putchar
add+ra+R0+im+1
ecrire+sp1+ra2
add+sp+sp1+im+4

ecrire+sp1+_r28 #oct 1
add+sp+sp1+im+4

ecrire+R27+_r28
add+r27+R27+im+1

sub+sp+sp1+im+8
ret+sp1
########ft_putstr(char *str)
#28 = str; 29 pos.actuelle
label ft_putstr
add+ra+R0+im+1
ecrire+sp1+ra2
add+sp+sp1+im+4

ecrire+sp1+_r28 #oct 1

add+sp+sp1+im+1
oct2+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1
oct3+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1
oct4+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1 
imov+im+r24 #i = 0
add+r24+R24+_r28 #str[i]
label ft_putstr_while
lire1+eq+R24+im+0 # ? \0
jmp+end
mov+lire1+r25+R24 #char c = str[i]
ecrire+R27+_r25
add+r27+R27+im+1
add+r24+R24+im+1
goto+ft_putstr_while
label end
sub+sp+sp1+im+8
ret+sp1

#putnbr(int n)
#28 = int n;
label ft_putnbr
add+ra+R0+im+1
ecrire+sp1+ra2
add+sp+sp1+im+4

ecrire+sp1+_r28 #oct 1

add+sp+sp1+im+1
oct2+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1
oct3+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1
oct4+r26+R28
ecrire+sp1+_r26

add+sp+sp1+im+1 
ge+R28+im
#si n < 0
jmp+positif
not+r28+R28
#not n
label positif
#recur 
ge+R28+im+10
jmp+else
#si n < 10
add+r28+R28+im+48

call+ft_putchar
#afficher N + 48
sub+sp+sp1+im+4
lire1+r28+mov+sp1
sub+sp+sp1+im+4
ret+sp1
label else
div+r28+R28+im+10

call+ft_putnbr
#sinon call ft_putnbr avec n / 10
sub+sp+sp1+im+4
lire1+r28+mov+sp1
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+8
r28+or+R26+_r28
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+16
r28+or+R26+_r28
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+24
r28+or+R26+_r28
add+sp+sp1+im+1
mod+r28+R28+im+10
add+r28+R28+im+48
call+ft_putchar
#afficher n % 10 + 48
sub+sp+sp1+im+4
lire1+r28+mov+sp1
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+8
r28+or+R26+_r28
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+16
r28+or+R26+_r28
add+sp+sp1+im+1
lire1+r26+shl+sp1+im+24
r28+or+R26+_r28
sub+sp+sp1+im+7
ret+sp1
call+ft_putnbr
label end_putnbr

sub+sp+sp1+im+4
lire1+r28+mov+sp1
sub+sp+sp1+im+4

ret+sp1


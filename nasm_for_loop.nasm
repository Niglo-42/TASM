;for loop qui print les char '0' à '9' sur la sortie standard (eax = 1)
;language NASM pour proc intel x86 distrib linux en 32bits
section .data
data db 0

section .text
global _start

_start:
mov esi, 0
mov edx, 1 ;
loop:

;affichage
mov eax, 4
mov ebx, 1
mov ecx, esi
mov [data], cl ; la byte faible
add byte [data], 48
mov ecx, data
int 0x80
;end affichage

add esi, 1
cmp esi, 10
jl loop

mov eax, 4
mov byte [data], 10
mov ecx, data
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80

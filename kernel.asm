[org 0x7e00]
[bits 32]

xor ax, ax
mov ds, ax
mov es, ax
mov gs, ax

mov esi, 0xb8000                 ; Set GS to point to video memory
mov bx, 0x12               ; Set BX to point to the first character
mov byte [esi], 'Y'      ; Write 'a'
mov esi, 0xb8001                     ; Set BX to point to the first attribute byte
mov byte [esi], 0x0f     ; Write the attribute byte

hang:
jmp hang

[bits 16]
[org 0x7c00]

;start:
jmp 0:start

start:

xor ax, ax
mov ds, ax
mov es, ax

mov ax, 0x2401 ; set A20 line
int 0x15

cmp al, 1 ; if 
je load ; jump to loaded code

hang:
mov al, '!'
mov ah, 0x0e
int 0x10  
end:
jmp end

load:

mov ah, 2	 ; load from disk
mov bx, 0x7e00   ; copy destination is es:bx
mov al, 1	 ; num sectors to read
mov ch, 0	 ; track
mov cl, 1	 ; sector
mov dh, 0	 ; head
;mov dl, 0x80	 ; drive
int 0x13	 ; perform load

cmp al, 1 ; if loaded 1 sector
je loadGDT ; jump to loaded code
jmp hang   ; else stop

loadGDT:

mov ax, 0xb800
mov gs, ax               ; Set GS to point to video memory
mov bx, 0x0              ; Set BX to point to the first character
mov byte [gs:bx], 'a'    ; Write 'a'
inc bx                   ; Set BX to point to the first attribute byte
mov byte [gs:bx], 0x0f   ; Write the attribute byte

cli
lgdt [GDTR]

mov eax, cr0
or al, 1
mov cr0, eax
jmp code - GDT:GDT_end

GDTR:
size     dw GDT_end - GDT - 1
location dd GDT


GDT:
.null:
.limit1 db 0
.limit2 db 0
.base1  db 0
.base2  db 0
.base3  db 0
.access db 0
.f_limit3 db 0
.base4  db 0

code:
db 0xff
db 0xff
db 0
db 0
db 0
db 10011010b
db 11001111b
db 0

data:
db 0xff
db 0xff
db 0
db 0
db 0
db 10010010b
db 11001111b
db 0

;.tss:
;db 0x68
;db 0
;db 0
;db 0x7e
;db 0
;db 0x89
;db 10000000b
;db 0

GDT_end:
[bits 32]
mov ax, data - GDT
mov ds, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ss, ax

mov esi, 0xb8000         ; Set esi to point to video memory
mov byte [esi], 'Y'      ; Write 'Y'
inc esi        
mov byte [esi], 0x0f     ; Write the attribute byte
inc esi
stop:
jmp stop

times 510-($-$$) db 0
db 0x55
db 0xAA

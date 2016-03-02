[bits 32]
TSS:
link dw 0
dw 0
esp0 dd 0
ss0  dw 0x10
dw 0
esp1 dd
ss1  dw
dw 0
esp2 dd
ss2  dw
dw 0
cr3  dd
eip  dd
eflags dd
eax  dd
ecx  dd
edx  dd
ebx  dd
esp  dd
ebp  dd
esi  dd
edi  dd
es   dw
dw 0
cs   dw
dw 0
ss   dw
dw 0
ds   dw
dw 0
fs   dw
dw 0
gs   dw
dw 0
ldtr dw
dd 0
iopb dw


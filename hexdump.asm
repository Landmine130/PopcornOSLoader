;mov ah, 0
;mov si, 0x7e00

;loop1:
;mov al, [si]
;shr al, 4
;cmp al, 10
;jae letter1
;number1:
;add al, 48
;jmp next1
;letter1:
;add al, 55
;next1:
;push ax
;mov ah, 0x0e
;int 0x10  ; else
;pop ax
;add ah, 1
;add si, 1
;cmp ah, 0xFF
;jne loop1




;mov ah, 0
;mov si, 0x7e00
;
;loop:
;mov al, [si]
;shr al, 4
;cmp al, 10
;jae letter
;number:
;add al, 48
;jmp next
;letter:
;add al, 55
;next:
;push ax
;mov ah, 0x0e
;int 0x10  ; else
;pop ax
;add ah, 1
;add si, 1
;cmp ah, 0xFF
;jne loop
;jmp hang

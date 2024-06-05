BITS 16
org 0x7C00      ; start address

start:
    mov ax, 0x0003      ; Text mode
    int 0x10            ; Interrupt which calls BIOS video services

    mov si, os_title
    call print_string

    mov si, thanks
    call print_string

    ; construct process stack
    ; clear registers (set to 0)
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00      ; set stack pointer to top memory address

    ; Load kernel from second disk sector
    mov ax, 0x1000
    mov es, ax
    mov bx, 0x0000      ; internal offset
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2           ; start on line 1
    mov dh, 0
    int 0x13

    ; goto kernel
    jmp 0x1000:0x0000


print_string:           ; print string of characters
    lodsb               ; Load next character into al
    or al, al           ; Check if the char is the end of the string (zero)
    jz .end             ; end on null terminated string
    mov ah, 0x0E        ; BIOS teletype function for character printing
    int 0x10            ; call BIOS print
    jmp print_string
.end:
    ret

display_character:      ; print a single character in al
    mov ah, 0x0E        ; BIOS teletype function
    int 0x10            ; Print character in AL
    ret

hang:
    cli
    hlt
    jmp hang

; strings:
os_title db 'CouscousOS Alpha Testing', 0
thanks db 13, 10, 13, 10, 'Thank you for using Couscous! :)', 0


times 510-($-$$) db 0   ; Make total bootloader size equal to 510 bytes
dw 0xAA55               ; Boot signature

BITS 16
org 0x7C00

start:
    mov ax, 0x0003      ; Text mode
    int 0x10            ; Interrupt which calls BIOS video services

    ; Print "Hello, World!"
    mov si, hello_msg   ; Move address of the message into si

print_chars:            ; print string of characters
    lodsb               ; Load next character into al
    or al, al           ; Check if the char is the end of the string (zero)
    jz wait_for_key     ; if zero, it's the end of the string, so we can wait for the next character
    mov ah, 0x0E        ; BIOS teletype function for character printing
    int 0x10            ; call BIOS print
    jmp print_chars     ; loop (repeat for next character input)

wait_for_key:
    ; infinite loop to allow characters to be entered
    call read_character
    call display_character
    jmp wait_for_key

read_character:
    mov ah, 0
    int 0x16            ; get next character using BIOS keyboard service
    ret                 ; go back to "wait_for_key"

display_character:      ; print a single character in al
    mov ah, 0x0E        ; BIOS teletype function
    int 0x10            ; Print character in AL
    ret                 ; go back to "wait_for_key"

hello_msg db 'Hello, World! :)', 0

times 510-($-$$) db 0
dw 0xAA55

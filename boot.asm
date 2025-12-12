; boot.asm — BIOS загрузчик
; Компиляция:   nasm -f bin boot.asm -o boot.bin
org 0x7C00

start:
    xor ax, ax
    mov ds, ax
    mov es, ax

    ; Установка стека
    mov ss, ax
    mov sp, 0x7C00

    ; Вывод строки
    mov si, message

.print_loop:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    mov bh, 0x00
    mov bl, 0x07
    int 0x10
    jmp .print_loop

halt:
    cli
    hlt

message db "Init MBR", 0

times 510-($-$$) db 0
dw 0xAA55

.model small
.stack 100h
.data
    num db 5     ; numeric value to display

.code
main proc
    mov ax, @data
    mov ds, ax

    mov al, num      ; Load number
    add al, '0'      ; Convert to ASCII
    mov dl, al       ; Move to DL for printing
    mov ah, 02h      ; DOS function: print character
    int 21h

    mov ax, 4c00h    ; Exit
    int 21h
main endp
end main


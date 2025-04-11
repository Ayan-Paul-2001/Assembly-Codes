.model small
.stack 100h
.data
    msg db 'Hello Ayan Paul!$', 0

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dx, offset msg   ; Load address of the string
    mov ah, 09h          ; DOS function: display string
    int 21h

    mov ax, 4c00h
    int 21h
main endp
end main


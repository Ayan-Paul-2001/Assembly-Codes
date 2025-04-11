.model small
.stack 100h
.data
    char db 'A'

.code
main proc
    mov ax, @data
    mov ds, ax

    mov dl, char     ; Load character into DL
    mov ah, 02h      ; DOS interrupt to display single character
    int 21h

    mov ax, 4c00h    ; Exit
    int 21h
main endp
end main

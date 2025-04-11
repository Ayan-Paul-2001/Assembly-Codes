.model small
.stack 100h
.data
    msg db 'Hello Ayan$', 0     ; Original string with `$` terminator
    len dw 0                    ; To store string length

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Step 1: Find length of string (up to $)
    mov si, offset msg
find_length:
    cmp byte ptr [si], '$'
    je reverse_print
    inc si
    inc len
    jmp find_length

reverse_print:
    dec si                      ; SI now points to last character
print_loop:
    mov dl, [si]                ; Get character
    mov ah, 02h
    int 21h

    dec si
    dec len
    jnz print_loop              ; Loop until len becomes 0

    ; Exit program
    mov ax, 4c00h
    int 21h
main endp
end main






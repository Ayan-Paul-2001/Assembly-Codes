.model small
.stack 100h
.data
    inputMsg db 'Enter your name: $'
    outputMsg db 13,10,'Hello, $'
    userInput db 20 dup('$')  ; Reserve 20 bytes for input

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Show input message
    mov dx, offset inputMsg
    mov ah, 09h
    int 21h

    ; Take input string
    lea dx, userInput
    mov ah, 0Ah         ; DOS function to take buffered input
    mov userInput, 20   ; Max characters to read
    int 21h

    ; New line before output
    mov dl, 13
    mov ah, 02h
    int 21h
    mov dl, 10
    int 21h

    ; Show output message
    mov dx, offset outputMsg
    mov ah, 09h
    int 21h

    ; Print user input (skip first two bytes of DOS input format)
    lea si, userInput + 2
print_loop:
    lodsb               ; Load byte from SI into AL
    cmp al, 13          ; Check for Enter key (carriage return)
    je done
    mov dl, al
    mov ah, 02h
    int 21h
    jmp print_loop

done:
    ; Exit program
    mov ax, 4c00h
    int 21h
main endp
end main

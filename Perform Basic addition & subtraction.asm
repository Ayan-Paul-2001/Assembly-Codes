.model small
.stack 100h

.data
    num1    db 10
    num2    db 5
    result  db ?

    msgAdd  db 13,10,'Addition: $'
    msgSub  db 13,10,'Subtraction: $'
.code
main proc
    mov ax, @data
    mov ds, ax

    ; ==== ADDITION ====
    mov al, num1
    add al, num2
    mov result, al

    mov dx, offset msgAdd
    mov ah, 09h
    int 21h
    call PrintResult

    ; ==== SUBTRACTION ====
    mov al, num1
    sub al, num2
    mov result, al
     
    mov dx, offset msgSub
    mov ah, 09h
    int 21h
    call PrintResult

 
    ; ==== EXIT ====
    mov ax, 4c00h
    int 21h
main endp

; ==============================
; Procedure: PrintResult
; Prints the 'result' variable in decimal
; ==============================
PrintResult proc
    mov ax, 0
    mov al, result
    call PrintDecimal
    ret
PrintResult endp

; ==============================
; Procedure: PrintDecimal
; Converts value in AL to decimal and prints it
; ==============================
PrintDecimal proc
    xor cx, cx
    mov bx, 10
convert_loop:
    xor dx, dx
    div bx            ; AX / 10 ? quotient in AL, remainder in DL
    push dx
    inc cx
    test ax, ax
    jnz convert_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop
    ret
PrintDecimal endp

end main

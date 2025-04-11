.model small
.stack 100h
.data
message db 'Hellow Ayan Paul...'$,0
.code
main proc
    mov ax,@data
    mov bs,ax
    mov bx,offset message
    mov ah,09h
    int 21h
    mov ax,4c00h
    int 21h
    main endpp
    end main
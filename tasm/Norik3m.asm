public min
code segment public
assume cs: code, ds: data
min proc near
pop bx
pop ax
pop cx
sub ax, cx
jns bg2
js bg1
ret
bg1:
    mov dx, offset min1
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
bg2:
    mov dx, offset min2
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
min  endp
code ends

data Segment public
min1       db 'The first number bigger then two', 13,10,'$'
min2       db 'The second number bigger then one', 13,10,'$'
Result dw
data ends
end

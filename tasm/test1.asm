public InputInt, OutputInt
code segment public
assume cs:code, ds:data
InputInt proc near
push bx
push cx
push dx
push si
mov dx,offset strdsc
mov ah,0Ah
int 21h
mov dl,0Ah
mov ah,2
int 21h
xor ax,ax
xor cx,cx
mov cl,[strdsc+1]
mov si,offset strbuf
mov bx,10
s1:
mul bx
mov dl,[si]
inc si
sub dl,30h
add ax,dx
loop s1
pop si
pop dx
pop cx
pop bx
ret
InputInt endp
; Подпрограмма ввода числа
; в десятичной системе счисления
; в диапазоне 0-65535 с консоли(клавиатуры). ; На выходе в регистре ax
; находится введенное число.
OutputInt proc near
push ax
push bx
push cx
push dx
mov bx,10
xor cx,cx
n1:
xor dx,dx
div bx
inc cx
push dx
or ax,ax
jnz n1
mov bx,offset strbuf
n2:
pop dx
add dl,30h
mov [bx],dl
inc bx
loop n2
mov byte ptr [bx],'$'
mov dx,offset strbuf
mov ah,9
int 21h
pop dx
pop cx
pop bx
pop ax
ret
endp OutputInt
code ends
; Подпрограмма вывода десятичного числа ; в десятичной системе счисления
; в диапазоне 0-65535 на экран.
; На входе в регистре ax должно
; находится выводимое число.
data segment public
strdsc db 6,0
strbuf db 6 dup (?)
data ends
end

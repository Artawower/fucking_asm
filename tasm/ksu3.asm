public InputInt, Output, Eq
code segment
assume cs: code, ds:data, ss: stek

InputInt proc near
  ;вывод в ax
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
InputInt  endp

Output proc near
; поместить строку в dx
mov ah, 9
int 21h
ret
Output endp

Eq proc near
; число 1 - ax
; число 2 - dx

mov dx, offset const_thousend
sub ax, 1000d
jns bg1
js bg2
ret
Eq  endp

start:
  mov ax, data
  mov ds, ax
  mov dx, offset Msg
  call Output
  call InputInt
  call Eq


bg1:
    mov dx, offset da
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
bg2:
    mov dx, offset net
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h


code ends

data Segment
  str_number     dq
  x              dw 100d
  y              dw 110d
  z              dd 230d
  strdsc         db 6, 0
  strbuf         db 6 dup (?)
  const_thousend dw 3E8h
  Msg           db 'Vvedite 4islo: ', 13,10,'$'
  da        db 'bolshe 1000 ', 13,10,'$'
  net       db 'menshe 1000', 13,10,'$'
Result dw
data ends

stek segment stack
  dw 128 dup (?)
stek ends
end Start

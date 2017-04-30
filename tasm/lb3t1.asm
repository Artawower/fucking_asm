public InputInt, OutputMsg, Eq_2_numbers
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

OutputMsg proc near
; поместить строку в dx
mov ah, 9
int 21h
ret
OutputMsg endp

Eq_2_numbers proc near
; число 1 - ax
; число 2 - dx

sub ax, cx
mov ax, 0
jns bg2
js bg1
ret
Eq_2_numbers  endp

start:
  mov ax, data
  mov ds, ax
  mov dx, offset Msg1
  call OutputMsg
  call InputInt
  mov cx, ax
  mov dx, offset Msg2
  call OutputMsg
  call InputInt
  call Eq_2_numbers


bg1:
    mov dx, offset Bigger1
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h
bg2:
    mov dx, offset Bigger2
    mov ah, 9
    int 21h
    mov ax, 4c00h
    int 21h


code ends

data Segment
  str_number dq
  x          dw 100d
  y          dw 110d
  z          dd 230d
  strdsc     db 6, 0
  strbuf     db 6 dup (?)
  Msg1       db 'Pls input the first(1) number: ', 13,10,'$'
  Msg2       db 'Pls input the second(2) number: ', 13,10,'$'
  bigger1    db 'The first number is bigger the second ', 13,10,'$'
  bigger2    db 'The second number is bigger then first', 13,10,'$'
Result dw
data ends

stek segment stack
  dw 128 dup (?)
stek ends
end Start
